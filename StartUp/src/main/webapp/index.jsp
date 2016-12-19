<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>StartUp</title>
<style>
/* Remove the navbar's default margin-bottom and rounded borders */
.navbar {
	background-color:white;
	font: #fff0f5;
	border: 0;
}

.row.content {
	height: 450px
}

/* Add a gray background color and some padding to the footer */
footer {
	background-color: #f2f2f2;
	padding: 25px;
}

/* Hide the carousel text when the screen is less than 600 pixels wide */
@media ( max-width : 600px) {
	.carousel-caption {
		display: none;
	}
}

.center-block {
	display: block;
	margin-right: auto;
	margin-left: auto;
}
</style>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#" style="color:#34495e;">Home</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="#" style="color:#34495e;">법률안</a></li>
					<li><a href="#" style="color:#34495e;">국회의원</a></li>
					<li><a href="#" style="color:#34495e;">게시판</a></li>
					<li><a href="#" style="color:#34495e;">채팅</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" style="color:#34495e;"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<div class="jumbotron text-center" align="center"
			style="width: 100%; height: 300px; background-image:url('img/gom.png'); background-color: white; opacity: 0.6; position: relative; padding: 20px;">
			<form class="form-horizontal" method="post"
				action="AutoCompleteController">
				<div class="form-group">
					<div class="col-sm-4"></div>
					<div class="col-sm-4">
					<br/><br/><br/><br/><br/><br/>
					<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control">
									<span class="input-group-btn">
										 <a href="#" class="btn btn-primary btn-md">
								          <span class="glyphicon glyphicon-zoom-in"></span>
								        </a>
									</span>
							</div>
						</div>
					</div>
					<div class="col-sm-4"></div>
				</div>
			</form>
		</div>
	</div>


	<div class="container-fluid text-center">
		<br>
		<div class="row">
			<div class="col-sm-3" >
				<i class="material-icons" style="font-size:250px;color:#34495e;text-shadow:2px 2px 4px #000000;">cloud</i>
			</div>
			<div class="col-sm-3">
				<i class="material-icons" style="font-size:250px;color:#34495e;text-shadow:2px 2px 4px #000000;">cloud</i>
			</div>
			<div class="col-sm-3">
				<i class="material-icons" style="font-size:250px;color:#34495e;text-shadow:2px 2px 4px #000000;">computer</i>
			</div>
			<div class="col-sm-3">
				<i class="material-icons" style="font-size:250px;color:#34495e;text-shadow:2px 2px 4px #000000;">cloud</i>
			</div>
		</div>
	</div>
	<br>

	<footer class="container-fluid text-center">
		<p>Footer Text</p>
	</footer>



</body>
</html>