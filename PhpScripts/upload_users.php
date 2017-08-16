<?php
$dir = isset($dir) ? $dir : '../';
define('INCLUDE_CHECK', 'hmm');
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
      
     
      if($file_ext != "xls"){
         $errors[]="extension not allowed, please choose a .xls file.";
      }
      
      if(2097152 < $file_size){
         $errors[]='File size must be less than or equal to 2 MB';
      }
      
      if(empty($errors)==true){
         move_uploaded_file($file_tmp,$dir."uploaded/temp/".$file_name);
         header('Location: ../registerUsers.php?error=1');
      }else{
         header('Location: ../registerUsers.php?error='.urlencode(implode('<br>',$errors)));
		 exit;
      }
   } else {
		die('forbiden access');
   }
   //----------------------------------File Reading And Parsing------------------------------
   $html = file_get_contents($dir."uploaded/temp/".$file_name);
   $dom = new DOMDocument;
   @$dom->loadHTML($html);
   $domNode = $dom->getElementsByTagName('body');
   $overTable = "";
		$domNode = $domNode->item(0);
		foreach($domNode->childNodes as $childNode)
		{
			if( strtolower($childNode->nodeName) == 'table')
			{
				$overTable = $childNode;
				break;
			}
		}
		$countTr = 0;
		$countTd = 0;
		foreach($overTable->childNodes as $childTR )
		{
			if( strtolower($childTR->nodeName) == 'tr')
				{
					if($countTr > 0)
					{
						$Data = array('course' => array()); 
						foreach ($childTR->childNodes as $childTD)
						{
							if( strtolower($childTD->nodeName) == 'td')
							{
								if( $countTd > 0)
								{
									if(!empty($childTD->nodeValue))
									{
										$table = $childTD->getElementsByTagName('table');
										if($table->length != 0)
										{
											$table = $table->item(0);
											$counter = 0;
											foreach($table->childNodes as $TR )
											{
												$Data['course'][$counter] = [];
												foreach ($TR->childNodes as $TD)
												{
													if(!empty($TD->nodeValue) && strtolower($TD->nodeName) == 'td')
													{
														$Data["course"][$counter][] = trim($TD->nodeValue);
													}
												}
												$counter++;
											}
											
											
										} 
										else 
										{
											$Data[] = trim($childTD->nodeValue);
										}
									
									}
									
									
								}
								else
								{ 
									$countTd++;
								}
								
								
							}
							
						}
						$countTd = 0;
						registeruser($Data);
					}
					else
					{ 
						$countTr++;
					}
					
				}
			
		}
		
//------------------------------------------------------------------------------------------

//------------------------------Logic to store users and there enrolled courses----------------------

function registeruser($data)
{
	global $conn;
	
	$semester = mysqli_real_escape_string($conn,$_POST['semester']);
	$dept = mysqli_real_escape_string($conn,$_POST['dept']);
	$query = mysqli_query($conn,"SELECT `Semester_Id` FROM `semester` WHERE `Semester_Name` = '".$semester."' AND `Dept_Id` = '".$dept."'");
	$semId = mysqli_fetch_assoc($query);
	$semId = $semId['Semester_Id']; 

	$regId = substr($data[0], 1);
	$query = mysqli_query($conn,"SELECT * FROM users WHERE Reg_Id = '$regId'");
	$row = mysqli_num_rows($query);
	if($row == 0)
	{
		$name=$data[1];
		
		$chk = true;
		while($chk)
		{
			$uname = substr($name,0,-(strlen($name)-6)).mt_rand(10,1000);
			$uname = preg_replace('/\s+/', '_', $uname);
			$query = mysqli_query($conn,"SELECT Username FROM users WHERE Username = '$uname'");
			$u = mysqli_num_rows($query);
			if(!($u > 0))
			{
				$chk = false;
			}
			
		}
		$pass = md5($uname);
		$type = 3;
		
		$sql = "INSERT INTO users (Username,Password,Type,Reg_Id,Semester_Id) VALUES ('$uname','$pass','$type','$regId','$semId')";
		mysqli_query($conn, $sql);
		$userId = mysqli_insert_id($conn);
		
		
	} else {
		$user = mysqli_fetch_assoc($query);
		$sql = "UPDATE `users` SET `Semester_Id`= '".$semId."' WHERE `User_Id` = ".$user['User_Id'];
		mysqli_query($conn, $sql);
		$sql = "DELETE FROM `enrolled_courses` WHERE `User_Id` = ".$user['User_Id'];
		mysqli_query($conn, $sql);
		$sql = "DELETE FROM `notification` WHERE `User_Id` = ".$user['User_Id'];
		mysqli_query($conn, $sql);
		$userId = $user['User_Id'];
	}
	
	foreach ($data['course'] as $cours)
	{
		$ccode = $cours[0];
		$ccode = substr($ccode,0,-4);
		$ccode = preg_replace('/\s+/', '', $ccode);
		$enr_status=$cours[2];
		$enr_status = preg_replace('/\s+/', '', $enr_status);
		
		if($enr_status == "E")
		{
		$query = mysqli_query($conn,"SELECT Course_Id FROM courses WHERE Course_Code = '$ccode'");
		$ccid = mysqli_fetch_assoc($query);
		$cid = isset($ccid['Course_Id']) ? $ccid['Course_Id'] : 'NULL'; 
		
		$sql = "INSERT INTO `enrolled_courses`(`Course_Id`, `User_Id`) VALUES ({$cid}, {$userId})";
		$s = mysqli_query($conn, $sql);
			echo mysqli_error($conn);
		}
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
   
?>