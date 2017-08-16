<?php
include('./connection.php');

$user = mysqli_real_escape_string($conn,$_POST['user']);

$query = mysqli_query($conn,"SELECT * FROM users WHERE Username = '".$user."'");
$user = mysqli_fetch_assoc($query);

$sql = "SELECT s.Dept_Id, d.short_name FROM `semester` s JOIN `department` d ON d.Dept_Id = s.Dept_Id WHERE Semester_Id = ".$user['Semester_Id'];
$query = mysqli_query($conn,$sql);
$department = mysqli_fetch_assoc($query);

$sql = "SELECT e.Course_Id, c.Course_Code FROM `enrolled_courses` e JOIN `courses` c ON e.Course_Id = c.Course_Id WHERE `User_Id`=".$user['User_Id'];
$result = mysqli_query($conn,$sql);;
$TRs = "";
while($row = mysqli_fetch_assoc($result)){
	$sql = "SELECT * FROM timetable WHERE `course` LIKE '%".$row['Course_Code']."%' AND `course` LIKE '%(".$department['short_name']."%'";
	$result2 = mysqli_query($conn,$sql);
	while($row2 = mysqli_fetch_assoc($result2)){
		$TRs .= "<tr>";
		$TRs .= "<td>".$row2['day']."</td>";
		$TRs .= "<td>".$row2['semester']."</td>";
		$TRs .= "<td>".$row2['course']."</td>";
		$TRs .= "<td>".$row2['room']."</td>";
		$TRs .= "<td>".$row2['time']."</td>";
		$TRs .= "</tr>";
	}
}
if(empty($TRs)){
	$TRs = "<tr><td><h2>You have no enrolled courses.</h2></td></tr>";
} else {
	$TRs = "<thead>
				<tr>
					<th>Day</th>
					<th>Semester</th>
					<th>Subject</th>
					<th>Room</th>
					<th>Time</th>
				</tr>
			</thead>".$TRs;
}

echo json_encode(array( 'data' => $TRs ));

?>