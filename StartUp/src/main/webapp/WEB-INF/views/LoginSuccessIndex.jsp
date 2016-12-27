<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="css/index.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css_loginSuccess/LoginResultheader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<title>StartUp</title>
</head>
<body>
	
<nav id="nav">
	<h1><a href="/com/index.jsp">Title</a></h1>
	<ul id="mainMenu">
		<li><a href="statute.do">의안</a></li>
		<li><a href="Member_Parliament.do">의원</a></li>
		<li><a href="board.do">게시판</a></li>
		<li><a href="NoticeIndex.do">공지사항/QNA</a></li>
		<li><a href="#">채팅</a></li>
	</ul>
	<div>
		<c:choose>
			<c:when test="${id == null}">
				<a href="Login.do"><i
						class="fa fa-sign-in" aria-hidden="true"></i> 로그인</a>
			</c:when>
			<c:otherwise>
				<a href="LogOut.do">${id}님환영합니다</a>
			</c:otherwise>
		</c:choose>
	</div>
</nav>
<section id="banner">
    			<div class="mainDaish">
    					
    					<div class="well">
    						<h4>테스트</h4>	
    						<table>
    							<tr>
    								<th>첫번째</th>
    								<th>첫번째</th>
    							</tr>
    							<tr>
    								<td>첫번째</td>
    								<td>첫번째</td>
    							</tr>
    						</table>
    					</div>
    			</div>
				<div class="mainDaish">
    					<h4>테스트</h4>
    			</div>
    			<div class="mainDaish">
    					<h4>테스트</h4>
    			</div>
    			<div class="mainDaish">
    					<h4>테스트</h4>
    			</div>
</section>

<footer class="container-fluid text-center">
	<p>풋터</p>
</footer>



</body>
</html>