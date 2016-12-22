<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<br />
<br />
<div class="container text-center">
	<div class="row">
		<div class="page-header">
			<h2>Login</h2>
		</div>
		<div class="col-md-offset-4 col-md-4">
			<div class="login-box well" style="opacity: 0.8; background-color: white;">
				<form role="form" method="post" action="">
					
					<div class="form-group">
						<label for="username-email">이메일</label> <input
							name="id" value='' id="id"
							placeholder="E-mail or Username" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">비밀번호</label> <input name="pw"
							id="pw" value='' placeholder="Password" type="password"
							class="form-control" />
					</div>
					<div class="form-group">
						<input type="submit"
							class="btn btn-default btn-login-submit btn-block m-t-md"
							value="Login" />
					</div>
					<span class='text-center'><a
						href="/bbs/index.php?mid=index&act=dispMemberFindAccount"
						class="text-sm">비밀번호 찾기</a></span>
					<hr />
					<div class="form-group">
						<a href="AddMember.do" class="btn btn-default btn-block m-t-md"> 회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>