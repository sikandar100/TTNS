<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 1){
	die('Forbidden Access');
}
include('PhpScripts/connection.php');

if($_SESSION['login_type'] != 1){
	header("Location: ".$dir."/welcome.php");
}
if(isset($_POST['courses']) && is_array($_POST['courses']) && isset($_GET['edit'])){
	$user = (int)$_GET['edit'];
	$sql = "DELETE FROM `enrolled_courses` WHERE `User_Id` = ". $user;
	mysqli_query($conn,$sql);
	
	foreach($_POST['courses'] as $course){
		$course = (int)$course;
		$sql = 'INSERT INTO `enrolled_courses`(`Course_Id`, `User_Id`) VALUES ('.$course.','.$user.')';
		mysqli_query($conn,$sql);
	}
	$msg = '<div class="alert alert-success" role="alert"> <strong>Done.</strong> You Successfully Assigned Courses.</div>';
}
?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="CSS/bootstrap.min.css" rel="stylesheet">
<link href="CSS/homestyle.css" rel="stylesheet" type="text/css">
<link href="CSS/multi-select.css" rel="stylesheet" type="text/css">
<title>Time Table Notification System</title>
<style>
.divide2
{ 
	margin-top:120px;
	
}
.footer{
	margin-top:30px;
}
#status
{
	text-align: center;
	 color: red;
	 font-size: 40px;
	
}
.search-input {
	margin-bottom: 5px;
}
.ms-container{
	width:75%;
}
.ms-selected{
	display:block;
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
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="teacherNotification.php">Send Notification</a></li>
			';
	}
	else if ($_SESSION['login_type']==1) //Admin Menu
	{
    	echo '
			  <li><a href="uploadTimeTable.php">Upload TimeTable</a></li>
			  <li><a href="adminReports.php">Time Table Report</a></li>
			  <li><a href="registerUsers.php">Register Users</a></li>
			  <li><a href="adminTeacher.php">Course Allocation</a></li>
			';
	}
		?>
			<li><a href="contactUs.php">Contact Us</a></li>
			<li><a href="aboutUs.php">About Us</a></li>
			<li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>
		<div class="col-md-10">
			<br>
			<?php if(isset($_GET['edit'])){
				$sql = "SELECT * FROM `users` WHERE `User_Id` = ". (int)$_GET['edit'] . " AND `Type` = 2";
				$result = mysqli_query($conn,$sql);
				$result = mysqli_fetch_assoc($result);
				if(isset($result['Username']) && !empty($result['Username'])){
					$sql = "SELECT `Course_Id` FROM `enrolled_courses` WHERE `User_Id` = ". $result['User_Id'];
					$result2 = mysqli_query($conn,$sql);
					$assigned = array();
					while($row = mysqli_fetch_assoc($result2)){
						array_push($assigned,$row['Course_Id']);
					}
					$sql = "SELECT * FROM `courses` WHERE 1 ORDER BY `Course_Title` ASC";
					$result2 = mysqli_query($conn,$sql);
					$opt = "";
					while($row = mysqli_fetch_assoc($result2)){
						if(in_array($row['Course_Id'],$assigned)){
							$opt .= '<option value="'.$row['Course_Id'].'" selected>'. $row['Course_Title'] .'('.$row['Course_Code'].')</option>'; 
						} else {
							$opt .= '<option value="'.$row['Course_Id'].'">'. $row['Course_Title'] .'('.$row['Course_Code'].')</option>'; 
						}
					}
			?>
			<h3>Assign / Re-assign Courses to <?php echo $result['Username']; ?></h3>
			<div class="col-md-12">
			<?php if( isset($msg) ) echo $msg; ?>
				<form action="" method="post">
					<select id='searchable' multiple='multiple' name="courses[]">
						<?php echo $opt; ?>
					</select>
					<br>
					<button type="submit" class="btn btn-primary btn-lg" name="submit" value="C">Assign</button>
				</form>
			</div>
			<?php
				} else {
					echo "<h3>No such Teacher Exist.</h3>";
				}
			?>
				
			<?php } else { ?>
			<h3>Teachers</h3>
			<div class="col-md-12">
				<table id="TeacherTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Username</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
					</thead>
					<tfoot>
						<tr>
							<th>Username</th>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
					</tfoot>
					<tbody>
					<?php 
						$sql = "SELECT * FROM `users` WHERE `Type` = 2";
						$result = mysqli_query($conn,$sql);
						while($row = mysqli_fetch_assoc($result)){
							$str = "<tr>";
							$str .= "<td>". $row['Username'] ."</td>";
							$sql = "SELECT * FROM `profile` WHERE `User_Id` = '". $row['User_Id'] ."'";
							$result2 = mysqli_query($conn,$sql);
							$row2 = mysqli_fetch_assoc($result2);
							if(isset($row2['Profile_Id'])){
								$str .= "<td>". ($row2['Fname'] ? $row2['Fname'] : 'Not Given') ."</td>";
								$str .= "<td>". ($row2['Lname'] ? $row2['Lname'] : 'Not Given') ."</td>";
								$str .= "<td>". ($row2['Email'] ? $row2['Email'] : 'Not Given') ."</td>";
							} else {
								$str .= "<td>Not Given</td>";
								$str .= "<td>Not Given</td>";
								$str .= "<td>Not Given</td>";
							}
							$str .= '<td><a href="adminTeacher.php?edit='. $row['User_Id'] .'" class="btn btn-info">Assign / Re-assign Courses</a></td>';
							$str .= "</tr>";
							
							echo $str;
						}
					
					?>
					</tbody>
				</table>
			</div>
			<?php } ?>
			
		</div>
    </div>
    
    <div class="footer col-md-12">
   	 <p id="foot">Copy Rights Reserved &copy; Sikandar Waheed</p>
    </div>
</div>
<script src="./JavaScripts/js/jquery.min.js"></script>
<script src="./JavaScripts/js/jquery.quicksearch.js"></script>
<script src="./JavaScripts/js/bootstrap.min.js"></script>
<script src="./JavaScripts/js/jquery.dataTables.min.js"></script>
<script src="./JavaScripts/js/dataTables.bootstrap.min.js"></script>
<script src="./JavaScripts/Chart.bundle.js"></script>
<script src="./JavaScripts/js/jquery.multi-select.js"></script>
<script>
	$(document).ready(function() {
		$('#TeacherTable').DataTable();
		$('#searchable').multiSelect({
		  selectableHeader: '<input type="text" class="form-control search-input" autocomplete="off" placeholder="Search">',
		  selectionHeader: '<input type="text" class="form-control search-input" autocomplete="off" placeholder="Search">',
		  afterInit: function(ms){
			var that = this,
				$selectableSearch = that.$selectableUl.prev(),
				$selectionSearch = that.$selectionUl.prev(),
				selectableSearchString = '#'+that.$container.attr('id')+' .ms-elem-selectable:not(.ms-selected)',
				selectionSearchString = '#'+that.$container.attr('id')+' .ms-elem-selection.ms-selected';

			that.qs1 = $selectableSearch.quicksearch(selectableSearchString)
			.on('keydown', function(e){
			  if (e.which === 40){
				that.$selectableUl.focus();
				return false;
			  }
			});
			that.qs2 = $selectionSearch.quicksearch(selectionSearchString)
			.on('keydown', function(e){
			  if (e.which == 40){
				that.$selectionUl.focus();
				return false;
			  }
			});
		  },
		  afterSelect: function(){
			this.qs1.cache();
			this.qs2.cache();
		  },
		  afterDeselect: function(){
			this.qs1.cache();
			this.qs2.cache();
		  }
		});
	});
</script>
</body>
</html>