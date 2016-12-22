<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<br />
<br />
<div class="container text-center">
	<div class="row">
		<div class="page-header">
			<h2>회원 가입</h2>
		</div>
		<div class="col-md-offset-3 col-md-6">
			<div class="login-box well" style="opacity: 0.8; background-color: white;">
				<form role="form" class="form-horizontal" method="post" action="">
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="username-email">이메일</label> 
						<div class="col-sm-9">
							<input name="user_id" value='' id="username-email" placeholder="E-mail or Username" type="text" class="form-control" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-3" for="password">비밀번호</label> 
						<div class="col-sm-9">
							<input name="password" id="password" value='' placeholder="Password" type="password" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="repassword">비밀번호 재입력</label> 
						<div class="col-sm-9">
							<input name="password" id="repassword" value='' placeholder="Password" type="password" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3">생년월일</label> 
						<div class="col-sm-9">
							<select class="form-control">
								<option>1</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<label class="control-label col-sm-3" for="repassword">성별</label> 
						<div class="row">
								<div class="col-sm-4">
									<input type="radio" class="form-control" value="1" name="gender">남자
								</div>
								<div class="col-sm-4">
									<input type="radio" class="form-control" value="2" name="gender">여자			
								</div>
						</div>
						
					</div>

					<div class="form-group">
						<div class="row">
							<div class="col-sm-offset-3 col-sm-4">
								<a href="AddMember.do" class="btn btn-primary btn-block m-t-md"> 회원가입</a>
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
