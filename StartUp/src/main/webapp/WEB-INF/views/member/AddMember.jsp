<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<br />
<br />
<div class="container text-center">
	<div class="row">
		<div class="page-header">
			<h2>회원 가입</h2>
		</div>
		<div class="col-md-offset-3 col-md-6">
			<div class="login-box well" style="opacity: 0.8; background-color: white;">
				<form role="form" class="form-horizontal" method="post" action="addMemberResult.do">
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="id">이메일</label> 
					    <div class="col-sm-6">
							<input name="id" value='' id="id" placeholder="E-mail or Username" type="text" class="form-control" />
						</div>
						<div class="col-sm-offset-1">
					   		<input type="button" class="btn btn-default" id="checkIdBtn" value="중복확인">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="pw">비밀번호</label> 
						<div class="col-sm-9">
							<input name="pw" id="pw" value='' placeholder="Password" type="password" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="repassword">비밀번호 재입력</label> 
						<div class="col-sm-9">
							<input name="repassword" id="repassword" value='' placeholder="Password" type="password" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="name">닉네임</label> 
						<div class="col-sm-9">
							<input name="name" id="name" value='' placeholder="nickname" type="text" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3">생년월일</label> 
						<div class="col-sm-3">
							<select class="form-control" name="birth">
							  <c:forEach begin="1940" end="2017" var="y">
							    	<option value="${y}">${y}년</option>
							  </c:forEach>
							</select>
						</div>
						
						<div class="col-sm-3">
							<select class="form-control" name="birth">
							  <c:forEach begin="1" end="12" var="m">
							    	<option value="${m}">${m}월</option>
							  </c:forEach>
							</select>
						</div>
						
						<div class="col-sm-3">
							<select class="form-control" name="birth">
							  <c:forEach begin="1" end="31" var="d">
							    	<option value="${d}">${d}일</option>
							  </c:forEach>
							</select>
						</div>
						
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="gender">성별</label> 
						<div class="row">
								<div class="col-sm-4">
									<input type="radio" class="form-control" value="1" id="gender" name="gender">남자
								</div>
								<div class="col-sm-4">
									<input type="radio" class="form-control" value="2" id="gender" name="gender">여자			
								</div>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="interest">관심사</label> 
						<div class="row">
								<div class="col-sm-2">
									<input type="checkbox" value="정치" id="interest" name="interest">정치
								</div>
								<div class="col-sm-2">
									<input type="checkbox" value="경제" id="interest" name="interest">경제
								</div>
								<div class="col-sm-2">
									<input type="checkbox" value="사회" id="interest" name="interest">사회
								</div>
								<div class="col-sm-2">
									<input type="checkbox" value="기타" id="interest" name="interest">기타
								</div>
						</div>
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-sm-offset-3 col-sm-4">
								<input type="submit" class="btn btn-primary btn-block m-t-md" id="addMemberBtn" value="회원가입">
							</div>
							<div class="col-sm-4">
								<a href="/com/index.jsp" class="btn btn-danger btn-block m-t-md"> 취소</a>
							</div>
						</div>
					</div>
					
				</form>
			</div>
		</div>
	</div>
</div>
