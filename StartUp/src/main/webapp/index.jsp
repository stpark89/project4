<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/main2.js"></script>
<link rel="stylesheet" type="text/css" href="css/header.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">	
<title>StartUp</title>
</head>
<body>

<nav id="nav">
	<h1><a href="/com/index.jsp">Title</a></h1>
	<ul id="mainMenu">
		<li><a href="#" class="fdMenu">의안</a></li>
		<li><a href="#" class="fdMenu">의원</a></li>
		<li><a href="board.do">게시판</a></li>
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
    	<div>
            <h2>대한민국 헌법 1조 1항</h2>
            <p>대한민국은 민주공화국이다.</p>
        </div>
        <div>
            <input type="text" /><!--
            --><button>검색</button>
        </div>
    </section>
	
	 <section id="statute">
    	<div>
            <h2 class="hTitle">의안이란?</h2>
            <p class="pContent">국회는 법률안·예산안·동의안 등의 심의를 통하여 헌법이 요구하는 국회의 기능을 수행하고<br/>  
            국민의 의사를 국정에 반영하게 된다.<br/> 
            이와 같이 국회에서 심의하는 법률안·예산안·동의안 등과 같은 안건을 의안이라고 부른다.</p> 
            <button class="btn" id="statuteBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 상세보기</button>
        </div>
    </section>
    
    <section id="parliament">
    	<img src="img/main01.png" alt="국회마크" />
        <div>
            <h2 class="hTitle">20대 국회의원 총 300명 현황</h2>
            <p class="pContent">의회에서 일하는 의원들.<br>
            					민주공화제 및 입헌군주제를 택한 여러 나라에서 입법부를 구성하고 일하는 사람들을 일컫는다</p> 
            <button class="btn" id="ParliamentBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 상세보기</button>
        </div>
    </section>
    
    <section id="comment">
    	<h1>COMMENT</h1>
        <p>관리자에서 건의하고 싶은 사항을 적어주세요.</p>
        
	        <div>
	        	<input type="hidden" id="masterHidden" value="admin">
	        	<input type="text" placeholder="title" name="title" id="title"/>
	            <textarea  placeholder="Comment" name="comment" id="comment"></textarea>
	            <button class="btn" id="sendCommentBtn">보내기</button>
	        </div>
        
    </section>
    
    <footer id="footer">
    	<p>02-725-1111</p>
    </footer>
	
	
</body>
</html>