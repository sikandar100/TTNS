<?php
$dir = "./";
include ('PhpScripts/session.php');
include('PhpScripts/connection.php');

if(isset($_GET['static'])){
	$id = (int) $_GET['static'];
	$sql = "SELECT * FROM `notification` WHERE `Checkpoint` = 1 AND `p_id` = ".$id;
	$unread = mysqli_query($conn,$sql);
	$unread = mysqli_num_rows($unread);

	$sql = "SELECT * FROM `notification` WHERE `Checkpoint` = 0 AND `p_id` = ".$id;
	$query = mysqli_query($conn,$sql);
	$read = mysqli_num_rows($query);
	
} else {
	header("Location: ./teacherNotification.php");
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
</style>
</head>
<body>
<div class="container col-md-12">

	<div class="header col-md-12">
    	<p id="webtitle">Time Table Notification System</p>
    </div>
    
    <div class="content">
    	<?php
		if($_SESSION['login_type']==3)
	{
    	echo '<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			  <li><a href="timeTable.php">Time Table</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="userProfile.php">User Profile</a></li>
			  <li><a href="editProfile.php">Edit Profile</a></li>
			  <li><a href="#news">News</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>';
	}
	else if ($_SESSION['login_type']==2)
	{
    	echo '<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			  <li><a href="timeTable.php">Time Table</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="#">Send Notification</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>';
	}
	else if ($_SESSION['login_type']==1)
	{
    	echo '<ul class="menu col-md-3">
			 <li><a class="active" href="welcome.php">Home</a></li>
			  <li><a href="timeTable.php">Time Table</a></li>
			  <li><a href="uploadTimeTable.php">upload TimeTable</a></li>
			  <li><a href="changePassword.php">Change Password</a></li>
			  <li><a href="registerUsers.php">Register Users</a></li>
			  <li><a href="contactUs.php">Contact Us</a></li>
			  <li><a href="aboutUs.php">About Us</a></li>
			  <li><a href="PhpScripts/logout.php">Logout</a></li>
		</ul>';
	}
		?>
		<div class = "col-md-10">
			<br>
			<div class="row border-between">
				<div class="col-md-4">
					<div id="canvas-holder">
						<canvas id="chart-area" />
					</div>
				</div>
				<div class="col-md-8">
					<h3>Seen By:</h3>
					<table id="TimeTable" class="table table-striped table-bordered" cellspacing="0" width="100%">
						<thead>
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Depastment</th>
								<th>Semester</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>First Name</th>
								<th>Last Name</th>
								<th>Depastment</th>
								<th>Semester</th>
							</tr>
						</tfoot>
						<tbody>
						<?php
							$str = "";
							while($row = mysqli_fetch_assoc($query)){
								
								$sql = "SELECT u.User_Id, u.Semester_Id, p.Fname, p.Lname, s.Semester_Name, d.Dept_Name FROM `users` u JOIN `profile` p JOIN `semester` s JOIN `department` d ON u.User_Id = ".$row['User_Id'];
										
								$query2 = mysqli_query($conn,$sql);
								$reuslt = mysqli_fetch_assoc($query2);
								
								$str .= "<tr>";
								$str .= "<td>".$reuslt['Fname']."</td>";
								$str .= "<td>".$reuslt['Lname']."</td>";
								$str .= "<td>".$reuslt['Dept_Name']."</td>";
								$str .= "<td>".$reuslt['Semester_Name']."</td>";
								$str .= "</tr>";
							}
							echo $str;
						?>
						</tbody>
					</table>
				</div>
			</div>
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
<script src="./JavaScripts/Chart.bundle.js"></script>
<script>
	var config = {
        type: 'pie',
        data: {
            datasets: [{
                data: [
                    <?php echo $read?>,
                    <?php echo $unread?>,
                ],
                backgroundColor: [
                    'rgb(54, 162, 235)',
                    'rgb(255, 99, 132)',
                ],
                label: 'Dataset 1'
            }],
            labels: [
                "Read",
                "Unread"
            ]
        },
        options: {
            responsive: true
        }
    };
	$(document).ready(function() {
		$('#TimeTable').DataTable();
		var ctx = document.getElementById("chart-area").getContext("2d");
        window.myPie = new Chart(ctx, config);
	} );
</script>
</body>
</html>