<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="css/changeheader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/changeMain.js"></script>	
<title>StartUp</title>
</head>
<body>

<nav id="nav">
	<h1><a href="index.do">Title</a></h1>
	<ul id="mainMenu">
		<li><a href="#" class="fdMenu">의안</a></li>
		<li><a href="#" class="fdMenu">의원</a></li>
		<li><a href="board.do">게시판</a></li>
		<li><a href="NoticeIndex.do">공지사항/QNA</a></li>
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


  <section id="category">
    	<article class="statute">
        	<img src="img/category00.png" alt="의안" width="150" />
        	<h2 class="hTitle">의안</h2>
            <p class="pContent">
            	국회에서 심의하는 법률안·예산안·동의안 등과 같은 안건을<br>의안이라고 부른다.
            </p> 
            <button class="btn" id="statuteBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
        </article>
        <article class="parliament">
        	<img src="img/category01.png" alt="의원" width="150" />
        	<h2 class="hTitle">의원</h2>
            <p class="pContent">
            	민주공화제 및 입헌군주제를 택한 여러 나라에서<br>입법부를 구성하고 일하는 사람들.
            </p> 
            <button class="btn" id="ParliamentBtn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
        </article>
        <article class="board">
      		<img src="img/category02.png" alt="의안" width="150" />
        	<h2 class="hTitle">게시판</h2>
            <p class="pContent">
            	설명 설명 설명
            </p> 
            <button class="btn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
        </article>
        <article class="notice">
        	<img src="img/category03.png" alt="의안" width="150" />
        	<h2 class="hTitle">공지사항/Q&amp;A</h2>
            <p class="pContent">
            	설명 설명 설명
            </p> 
            <button class="btn"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i> 자세히보기</button>
        </article>
    </section>
    
  <!--   <section id="dashboard">
    	<h1>게시판</h1>
        <p>설명 설명 설명</p>
    	<article>
        	<div></div>
            <div></div>
            <div></div>
            <div></div>
            <div class="hidden_box"></div>
            <div class="hidden_box"></div>
            <div class="hidden_box"></div>
            <div class="hidden_box"></div>
        </article>
        <div id="more"><i class="fa fa-angle-double-down" aria-hidden="true"></i></div>
    </section> -->

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