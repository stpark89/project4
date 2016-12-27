<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	

<div class="container">	
	<br/><br/><br/>
	<div class="well">
    	
    	<h4 class="col-sm-offset-1">자유게시판 글쓰기</h4>
    	<hr/>
    	<form method="POST" class="form-horizontal" id="FreeBoardForm">
    		<input type="hidden" name="writer" value="${id}">
    		<input type="hidden" name="regdate" id="regdate">
    		<div class="form-group">
    			<label class="control-label col-sm-2" for="title">제목 :</label>
    			
    			<div class="col-sm-8">
    				<input type="text" name="title" id="title" class="form-control">
    			</div>
    		</div>
    		
    		<div class="form-group">
    			<label class="control-label col-sm-2" for="content">내용 :</label>
    			
    			<div class="col-sm-8">
    				<textarea rows="10" cols="30" id="content" name="content" class="form-control"></textarea>
    			</div>
    		</div>
    		
    		<div class="form-group">
    			<div class="col-sm-offset-2">
    				&nbsp;&nbsp;&nbsp;<input type="submit" class="btn btn-primary" value="글쓰기">
    				<input type="reset" class="btn btn-danger" value="취소">
    			</div>
    		</div>
    		
    	</form>
    
    </div>
    
</div>