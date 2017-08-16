<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');
include ('PhpScripts/connection.php');
?>
<!doctype html>
<html>
<head>
 <meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="CSS/bootstrap.min.css" rel="stylesheet">
<link href="CSS/dataTables.bootstrap.min.css" rel="stylesheet">
<link href="CSS/homestyle.css" rel="stylesheet" type="text/css">
<title>Time Table Notification System</title>
<style>
.welcomenote
{ 
	margin-top:8%;
	margin-bottom:8%;
}
h1
{
	margin-left:40%;
}
h2
{
	margin-left:30%;
}
h3
{
	margin-left:15%;
}
</style>
</head>
<body>
<div class="container col-md-12">

	<div class="header col-md-12">
    	<p id="webtitle">Time Table Notification System</p>
    </div>
    
    <div class="content">
	<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			 <li><a href="timeTable.php">Time Table</a></li>
			 <li><a href="changePassword.php">Change Password</a></li>
	<?php
	if($_SESSION['login_type']==3) //Student Menu
	{
    	echo '
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="Notifications.php">Notifications</a></li>
			';
	}
	else if ($_SESSION['login_type']==2) //Teacher Menu
	{
    	echo '
			  <li><a href="teacherNotification.php">Send Notification</a></li>
			';
	}
	else if ($_SESSION['login_type']==1) //Admin Menu
	{
    	echo '
			  <li><a href="uploadTimeTable.php">Upload TimeTable</a></li>
			  <li><a href="adminReports.php">Time Table Report</a></li>
			  <li><a href="registerUsers.php">Register Users</a></li>
			';
	}
		?>
			<li><a href="contactUs.php">Contact Us</a></li>
			<li><a href="aboutUs.php">About Us</a></li>
			<li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>
	<div class="col-md-9">
	<br>
	<?php if($_SESSION['login_type']<3): ?>
		<form class="form-inline col-md-12" action="" method="post">
			<div class="form-group">
				<label for="dept">Department:</label>
				<select class="form-control" name="dept" id="dept">
				<?php
				$str="";
				$query = mysqli_query($conn,"SELECT * FROM department WHERE 1");
				$str .= '<option value="all">All</option>'; 
				while($row=mysqli_fetch_assoc($query))
				{
					$str .= '<option value="'.$row['short_name'].'">'.$row['Dept_Name'].'</option>';
				}
				echo $str;
				?>
				</select>
			</div>
			<div class="form-group">
				<label for="course">Courses:</label>
				<select class="form-control" name="course" id="course">
					<?php
						$str="";
						$query = mysqli_query($conn,"SELECT * FROM `courses` WHERE 1");
						$str .= '<option value="all">All</option>'; 
						while($row=mysqli_fetch_assoc($query))
						{
							$str .= '<option value="'.$row['Course_Code'].'">'.$row['Course_Title'].' ('. $row['Course_Code'] .')'.'</option>';
						}
						echo $str;
					?>
				</select>
			</div>
			<div class="form-group">
				  <button type="submit" class="btn btn-primary" value="Fetch Time Table" name="timetable">Fetch Time Table</button>
			</div>
		</form>
		<br><br><hr>
		<?php endif; ?>
		<table id="TimeTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
			<thead>
				<tr>
					<th>Day</th>
					<th>Semester</th>
					<th>Subject</th>
					<th>Room</th>
					<th>Time</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<th>Day</th>
					<th>Semester</th>
					<th>Subject</th>
					<th>Room</th>
					<th>Time</th>
				</tr>
			</tfoot>
			<tbody>
				<?php
					$TRs = "";
					if($_SESSION['login_type'] == 3){
						$query = mysqli_query($conn,"SELECT * FROM users WHERE User_Id = '".$_SESSION['user_id']."'");
						$user = mysqli_fetch_assoc($query);
						
						$sql = "SELECT s.Dept_Id, d.short_name FROM `semester` s JOIN `department` d ON d.Dept_Id = s.Dept_Id WHERE Semester_Id = ".$user['Semester_Id'];
						$query = mysqli_query($conn,$sql);
						$department = mysqli_fetch_assoc($query);
						
						$sql = "SELECT e.Course_Id, c.Course_Code FROM `enrolled_courses` e JOIN `courses` c ON e.Course_Id = c.Course_Id WHERE `User_Id`=".$user['User_Id'];
						$result = mysqli_query($conn,$sql);;
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
					} elseif($_SESSION['login_type'] == 2 || $_SESSION['login_type'] == 1) {
						$sql = "SELECT * FROM timetable WHERE ";
						if(isset($_POST['timetable'])){
							$_POST['dept'] = mysqli_real_escape_string($conn,$_POST['dept']);
							$_POST['course'] = mysqli_real_escape_string($conn,$_POST['course']);
							$and = '';
							if(!empty($_POST['course']) && $_POST['course'] != 'all'){
								$sql .= "`course` LIKE '%".$_POST['course']."%'";
								$and = 'AND ';
							}
							
							if(!empty($_POST['dept']) && $_POST['dept'] != 'all'){
								$sql .= $and."`course` LIKE '%(".$_POST['dept']."%'";
							}
							
							if($_POST['dept'] == 'all' && $_POST['course'] == 'all'){
								$sql .= "1";
							}
						} else {
							$sql .= "1";
						}
						$result = mysqli_query($conn,$sql);
						while($row = mysqli_fetch_assoc($result)){
							$TRs .= "<tr>";
							$TRs .= "<td>".$row['day']."</td>";
							$TRs .= "<td>".$row['semester']."</td>";
							$TRs .= "<td>".$row['course']."</td>";
							$TRs .= "<td>".$row['room']."</td>";
							$TRs .= "<td>".$row['time']."</td>";
							$TRs .= "</tr>";
						}
					}
					echo $TRs;
				?>
			</tbody>
		</table>
		<br>
	</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
<script src="./JavaScripts/js/jquery.min.js"></script>
<script src="./JavaScripts/js/bootstrap.min.js"></script>
<script src="./JavaScripts/js/jquery.dataTables.min.js"></script>
<script src="./JavaScripts/js/dataTables.bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$('#TimeTable').DataTable();
	} );
</script>
</body>
</html>
