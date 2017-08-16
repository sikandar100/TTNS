<?php
$dir = isset($dir) ? $dir : '../';
include('connection.php');
include ('session.php');
//----------------------File Upload Logic-----------------------
   if(isset($_FILES['fileToUpload']))
   {
      $errors= array();
      $file_name = $_FILES['fileToUpload']['name'];
      $file_size =$_FILES['fileToUpload']['size'];
      $file_tmp =$_FILES['fileToUpload']['tmp_name'];
      $file_type=$_FILES['fileToUpload']['type'];
      $file_ext= explode('.',$_FILES['fileToUpload']['name']);
      $file_ext=strtolower(end($file_ext));
      
     
      if($file_ext != "docx"){
         $errors[]="extension not allowed, please choose a .docx file.";
      }
      
      if(2097152 < $file_size){
         $errors[]='File size must be less than to 2 MB';
      }
      
      if(empty($errors)==true){
        move_uploaded_file($file_tmp,$dir."uploaded/temp/".$file_name);
		
        $data = parse_docx_timetable($dir."uploaded/temp/".$file_name);
		if($_POST['type'] == 1){
			store_timetable($data);
			generate_notifications();
		} elseif($_POST['type'] == 2){
			update_timetable($data);
			generate_notifications(false);
		}
		if (isset($_SERVER["HTTP_REFERER"])) {
			//header("Location: " . $_SERVER["HTTP_REFERER"]);
		}
      }else{
         print_r($errors);
		 exit;
      }
   }

/*
* This function is for parse the docx file to get timetable
*
* Parameter:	$path
*
* Return: Array
*/
 
function parse_docx_timetable($path){
	
	/*----------------------------------File Reading------------------------------*/
	$content = '';
	$zip = zip_open($path);
    if (!$zip || is_numeric($zip))
	{
		echo "Failed :P";
	}

    while ($zip_entry = zip_read($zip)) {

        if (zip_entry_open($zip, $zip_entry) == FALSE)
		{			
			continue;
		}

        if (zip_entry_name($zip_entry) != "word/document.xml") 
		{
			continue;
		}

        $content .= zip_entry_read($zip_entry, zip_entry_filesize($zip_entry));

        zip_entry_close($zip_entry);
    }
    zip_close($zip);      
 
	/*----------------------------------Parsing------------------------------*/
	$dom = new DOMDocument();
	@$dom->loadXML($content);
	$Tables = array();
	foreach($dom->firstChild->firstChild->childNodes as $node)
	{
		if($node->nodeName == "w:tbl"){
			array_push($Tables,$node);
		}
	}
	$rowcount=0;
	$data = array();	/* this var will be returned. */
	foreach($Tables as $node)
	{
		$Times = array();
		$rowCount2 = 0;
		$day = "";
		$semester = "";
		foreach ($node->childNodes as $TR)
		{
			if( strtolower($TR->nodeName) == 'w:tr')
			{
				if($rowcount++ > 0){
					
					$tcCount = 0;
					if($rowCount2 == 0){
						$semester = trim($TR->nextSibling->nextSibling->childNodes->item(0)->nodeValue);
					}
					
					$rowCount2++;
					$tcCount = 0;

					foreach ($TR->childNodes as $TC)
					{
						if( strtolower($TC->nodeName) == 'w:tc')
						{
							if($tcCount == 0){
								if($rowCount2 == 1){
									$day = trim($TC->nodeValue);
								}
							} elseif($tcCount == 1 || $tcCount == 3 || $tcCount == 5 || $tcCount == 7) {
								
								$subjects = trim(preg_replace('!\s+!', ' ', $TC->nodeValue));
								$rooms = trim(preg_replace('!\s+!', ' ', $TC->nextSibling->nodeValue));;
								
								if(!empty($subjects) && $subjects != 'x' && !empty($rooms)){
									
									$subjects = explode('/',$subjects);
									$rooms = explode('/',$rooms);
									if(count($rooms) > 1){
										foreach($subjects as $key => $subject){
											$temp = array('day'=> $day, 'semester'=> $semester, 'subject' => $subject, 'room' => $rooms[$key], 'time' => '', 'cstring' => '');
											$tempT = floor($tcCount / 2);
											$temp['time'] = $Times[$tempT];
											$temp['cstring'] = strtolower(preg_replace('!\s+!', '', $subject));
											$temp['cstring'] = preg_replace('/[^a-z0-9]/', '', $temp['cstring']);
											$temp['cstring'] = $temp['cstring'].$temp['day'].$temp['semester'].$temp['room'].$temp['time'];
											array_push($data,$temp);
										}
									} else {
										$room = $rooms[0];
										foreach($subjects as $subject){
											$temp = array('day'=> $day, 'semester'=> $semester, 'subject' => $subject, 'room' => $room, 'time' => '', 'cstring' => '');
											$tempT = floor($tcCount / 2);
											$temp['time'] = $Times[$tempT];
											$temp['cstring'] = strtolower(preg_replace('!\s+!', '', $subject));
											$temp['cstring'] = preg_replace('/[^a-z0-9]/', '', $temp['cstring']);
											$temp['cstring'] = $temp['cstring'].$temp['day'].$temp['semester'].$temp['room'].$temp['time'];
											array_push($data,$temp);
										}
									}
								}
							}
							$tcCount++;
						}
					}
				} else {
					$tcCount = 0;
					foreach ($TR->childNodes as $TC)
					{
						if( strtolower($TC->nodeName) == 'w:tc' && $tcCount++ > 0)
						{
							$time = strtolower(trim($TC->nodeValue));
							$time = str_replace("to","-",$time);
							$time = str_replace(array(" ", "\n", "\r", "\t"),"",$time);
							array_push($Times,$time);
						}
					}
				}
			}
			if($rowCount2 >= 8)
				$rowCount2 = 0;
		}
		$rowcount = $rowCount2 = 0;
	}
	return $data;
}

/*
* This function is for storing timetable parsed by parse_docx_timetable function
*
* Parameter:	$timetable
*/

function store_timetable($timetable){
	global $conn;
	$sql = "DELETE FROM `timetable` WHERE 1";
	mysqli_query($conn, $sql);
	foreach($timetable as $slot){
		$sql = "INSERT INTO `timetable`(`course`, `room`, `day`, `semester`, `time`, `cstring`) VALUES ('". mysqli_real_escape_string($conn,$slot['subject'])."','".mysqli_real_escape_string($conn,$slot['room'])."','".mysqli_real_escape_string($conn,$slot['day'])."','".mysqli_real_escape_string($conn,$slot['semester'])."','".mysqli_real_escape_string($conn,$slot['time'])."','".mysqli_real_escape_string($conn,$slot['cstring'])."')";
		mysqli_query($conn, $sql);
		//echo mysqli_error($conn);
	}
}

/*
* This function is for Updating timetable parsed by parse_docx_timetable function
*
* Parameter:	$timetable
*/
function update_timetable($timetable){
	global $conn;
	
	$sql = "UPDATE `timetable` SET `notification`= 0,`status`=2 WHERE 1";
	mysqli_query($conn, $sql);
	
	foreach($timetable as $slot){
		$slot['subject'] = mysqli_real_escape_string($conn,$slot['subject']);
		$slot['room'] = mysqli_real_escape_string($conn,$slot['room']);
		$slot['day'] = mysqli_real_escape_string($conn,$slot['day']);
		$slot['semester'] = mysqli_real_escape_string($conn,$slot['semester']);
		$slot['time'] = mysqli_real_escape_string($conn,$slot['time']);
		$slot['cstring'] = mysqli_real_escape_string($conn,$slot['cstring']);
		
		$sql = "SELECT * FROM `timetable` WHERE `cstring` = '".$slot['cstring']."'";
		$result = mysqli_query($conn, $sql);
		if(mysqli_num_rows($result) > 0){
			$result = mysqli_fetch_assoc($result);
			$sql = "UPDATE `timetable` SET `notification`= 0,`status`=1 WHERE id = ".$result['id'];
			mysqli_query($conn, $sql);
		} else {
			$sql = "INSERT INTO `timetable`(`course`, `room`, `day`, `semester`, `time`, `cstring`, `notification`, `status`) VALUES ('". mysqli_real_escape_string($conn,$slot['subject'])."','".mysqli_real_escape_string($conn,$slot['room'])."','".mysqli_real_escape_string($conn,$slot['day'])."','".mysqli_real_escape_string($conn,$slot['semester'])."','".mysqli_real_escape_string($conn,$slot['time'])."','".mysqli_real_escape_string($conn,$slot['cstring'])."',1,1)";
			mysqli_query($conn, $sql);
		}
		//echo mysqli_error($conn);
	}
	
	$sql = "DELETE FROM `timetable` WHERE `status`=2";
	mysqli_query($conn, $sql);
}

/*
* This function is for Generating Notifications. Accept status of time table as argument
*
* Parameter:	$new
*/

function generate_notifications($new = true){
	global $conn;
	if($new){
		$sql = "SELECT * FROM `users` WHERE `Type` = 3";
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_assoc($result)){
			$sql = "INSERT INTO `notification`(`Msg`, `Checkpoint`, `User_Id`) VALUES ('A New Time Table is uploaded', 1, ".$row['User_Id'].")";
			mysqli_query($conn, $sql);
			mysqli_error($conn);
		}
	} else {
		$sql = "SELECT * FROM `courses` WHERE 1";
		$result = mysqli_query($conn, $sql);
		while($row = mysqli_fetch_assoc($result)){
			$sql = "SELECT * FROM `timetable` WHERE `course` LIKE '%".$row['Course_Code']."%' AND `notification` = 1";
			$result2 = mysqli_query($conn, $sql);
			if(mysqli_num_rows($result2)>0){
				$sql = "SELECT * FROM `enrolled_courses` WHERE `Course_Id` = ".$row['Course_Id'];
				$result2 = mysqli_query($conn, $sql);
				while($row2 = mysqli_fetch_assoc($result2)){
					$sql = "INSERT INTO `notification`(`Msg`, `Checkpoint`, `User_Id`) VALUES ('Course \'".$row['Course_Code']."\' is updated. Check the time table.', 1, ".$row2['User_Id'].")";
					mysqli_query($conn, $sql);
				}
			}
		}
		$sql = "UPDATE `timetable` SET `notification`= 0 WHERE 1";
		mysqli_query($conn, $sql);
	}
}
   
?>