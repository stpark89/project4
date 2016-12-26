<!--  
	작성자 : 박성준
	작성일 : 2016-12-19
	목  적 : 국회의원 정보 보는 페이지
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/subHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="js/Cross.js"></script>
<script src="js/Parliament2.js"></script> 
<title>의원정보</title>
</head>
<body>
<div class="container-fluid">
  <div class="row content">
	<!-- Header -->
	<tiles:insertAttribute name="header" />
	
	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content" />
	
	</div>
</div>
<!--풋터-->
	<tiles:insertAttribute name="footer" />
	
	<a id="a" href="http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberNameInfoList?ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D">보러가기</a>
	
<script>
	
	$(function(){
		   
		//var g = "https://ajax.googleapis.com/ajax/services/feed/load?v=2.0&num=10&callback=?&q=";		
		//console.log(g+"http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberNameInfoList?ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D");
		$('#searchBtn').click(function(){
			$.ajax({
				url: "XmlParse.do",
				dataType:"json",
				success : function(data){
					alert("성공");
				}
			});
		});
		
/* 		$("#searchBtn").click(function() {
							alert("xml버튼 클릭vv!!");
							$.ajax({		  
										url : "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberNameInfoList?ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D",
										type: "GET",
										success : function(data) {
										 console.log(data);
										console.log( $(data).find("body").find("items").find("item").find("engNm"));
										 	
										  $(data).find("body").find("items").find("item").each(function(){
											  alert("안도니?"+$(this).find("engNm").text());
											  
										  });
										},
										error : function(data){
											alert("실패"+data);
										}
										
									});

						});  */
	});
</script>
</body>
</html>