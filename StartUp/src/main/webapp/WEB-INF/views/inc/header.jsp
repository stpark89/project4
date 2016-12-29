<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<nav id="nav">
  		<h1><a href="index.do">Title</a></h1>
        <ul id="mainMenu">
            <li><a href="#" class="fdMenu">의안</a></li>
			<li><a href="#" class="fdMenu">의원</a></li>
			<li><a href="#">커뮤니티</a>
            	<ul id="b_menu">
                	<li><a href="#">오늘의 이슈</a></li>
                	<li><a href="#">자유게시판</a></li>
                    <li><a href="#">정치게시판</a></li>
                    <li><a href="#">이미지 갤러리</a></li>
                </ul>
            </li>
            <li><a href="NoticeIndex.do">공지사항</a></li>
            <li><a href="#">채팅</a></li>
   		</ul>
        <div id="logDiv">
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
    <aside id="menu_bg"></aside>
	</nav>
