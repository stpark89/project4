<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

