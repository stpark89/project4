<!--  
	자유게시판--
	작성일 : 2016-12-22
	작성자 : 박성준
	목  적 : 자유게시판 리스트페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div class="col-sm-8 text-center">
	<h3>자유 게시판</h3>
	<hr/>
	
	<div class="form-group col-sm-offset-8 col-sm-4">
		<select class="form-control">
			<option>선택</option>
			<option>10개</option>
			<option>20개</option>
			<option>50개</option>
		</select>
	</div>
	
	<table class="table">
		<tr>
			<th class="text-center">No</th>
			<th class="text-center">제목</th>
			<th class="text-center">글쓴이</th>
			<th class="text-center">작성일</th>
			<th class="text-center">조회수</th>
		</tr>
		<c:forEach var="list" items="${list}">
		<tr>
			<td>${list.bno}</td>
			<td>${list.title}</td>
			<td>${list.writer}</td>
			<td>${list.regdate}</td>
			<td>${list.viewcnt}</td>
		</tr>
		</c:forEach>
	</table>	
	
	<div class="form-group col-sm-offset-11 col-sm-1">
		<input type="button" id="WriteFreeBoardBtn" class="btn btn-primary" value="글쓰기">
	</div>
	
	
</div>

