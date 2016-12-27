<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="wrap">
	<h1>공지사항/Q&A</h1>
	<hr />
	<ul id="tabMenu">
		<li>공지사항</li>
		<li>Q&A</li>
	</ul>
	<input type="hidden" value="${id}" id="hiddenId">
       
	<div id="NoticeContentDiv">
	   <table class="table">
		<tr>
			<th class="text-center">No.</th>
			<th class="text-center">제목</th>
			<th class="text-center">작성자</th>
			<th class="text-center">작성일</th>
		</tr>
		<c:choose>
			<c:when test="${fn:length(list) > 0}">
				<c:forEach var="list" items="${list}">
					<tr class="text-center">
						<td>${list.noticeBno}</td>
						<td>${list.title}</td>
						<td>${list.writer}</td>
						<td>${list.regdate}</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr class="text-center">
					<td colspan="4">공지사항이 없습니다.</td>
				</tr>
			</c:otherwise>
		</c:choose>	
		</table>
		<c:choose>
			<c:when test="${id == 'admin'}">
				<div class="col-sm-offset-11 col-sm-1">
					<input type="button" class="btn btn-primary" value="글쓰기">
				</div>
			</c:when>
		</c:choose>
	</div>	       
</div>    