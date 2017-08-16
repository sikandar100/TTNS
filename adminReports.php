<?php
$dir = "./";
define('INCLUDE_CHECK', 'hmm');
include ('PhpScripts/session.php');

if($_SESSION['login_type'] != 1){
	die('Forbidden Access');
}
include('PhpScripts/connection.php');

if($_SESSION['login_type'] == 1){
	$sql = "SELECT * FROM `reports` WHERE 1";
	$report = mysqli_query($conn,$sql);
	$report = mysqli_fetch_assoc($report);
} else {
	header("Location: ".$dir."/welcome.php");
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
		<div class = "col-md-10">
			<br>
			<div class="row border-between">
				<div class="col-md-12">
					<div id="canvas-holder">
						<canvas id="chart-area" />
					</div>
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
        labels: ["Updated"],
            datasets: [{
                type: 'bar',
                label: 'Teacher',
                backgroundColor: 'rgb(54, 162, 235)',
                data: [
                    <?php echo $report['teacher']?>
                ],
				borderColor: 'white',
                borderWidth: 2,
            }, {
                type: 'bar',
                label: 'Student',
                backgroundColor: 'rgb(255, 159, 64)',
                data: [
                    <?php echo $report['student']?>
                ],
                borderColor: 'white',
                borderWidth: 2
            }, {
                type: 'bar',
                label: 'Department',
                backgroundColor: 'rgb(75, 192, 192)',
                data: [
                    <?php echo $report['department']?>
                ]
            }]
    };
	$(document).ready(function() {
		$('#TimeTable').DataTable();
		var ctx = document.getElementById("chart-area").getContext("2d");
		window.myMixedChart = new Chart(ctx, {
			type: 'bar',
			data: config,
			options: {
				responsive: true,
				title: {
					display: true,
					text: 'Time Table updated total <?php echo $report['all_time']?> number of time.'
				},
				tooltips: {
					mode: 'index',
					intersect: true
				},
				"scales": {
					"yAxes": [{
						"ticks": {
							"beginAtZero": true
						}
					}]
				}
			}
		});
	});
</script>
</body>
</html>