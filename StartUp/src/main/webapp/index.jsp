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
<link rel="stylesheet" href="css/layout.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>StartUp</title>

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
					<li><a href="statute.do" style="color:#34495e;">의안</a></li>
					<li><a href="Member_Parliament.do" style="color:#34495e;">의원</a></li>
					<li><a href="board.do" style="color:#34495e;">게시판</a></li>
					<li><a href="#" style="color:#34495e;">채팅</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="Login.do" style="color:#34495e;"><span class="glyphicon glyphicon-log-in"></span>
							Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
<!-- 		<div class="jumbotron text-center" align="center"
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
 -->		
 		 <div class="jumbotron text-center" style="width: 100%; height: 300px; background-image:url('img/gom.png'); background-color: white; opacity: 0.6; position: relative; padding: 20px;">
			  <h1>깨어있는 대한민국</h1> 
			  <form class="form-inline">
			    <div class="input-group">
			      <input type="email" class="form-control" size="50" placeholder="Email Address" required>
			      <div class="input-group-btn">
			        <button type="button" class="btn btn-danger">Subscribe</button>
			      </div>
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
		<p>풋터</p>
	</footer>



</body>
</html>