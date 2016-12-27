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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/subHeader.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="js/Cross.js"></script>
<title>의원정보</title>
</head>
<body>

	<!-- Header -->
	<tiles:insertAttribute name="header" />
	
	<!-- Main Wrapper -->
	<tiles:insertAttribute name="content" />

<!--풋터-->
	<tiles:insertAttribute name="footer" />
<script>
	
	//국회의원 상세보기
 	function detailPaliament($obj){
		var img = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().children().attr("src");
		var num = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().attr("id");
		var deptCd = $($obj).prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().prev().attr("id");
		location.href="PaliamentDetail.do?num="+num+"&dept_cd="+deptCd+"&img="+img;
	}
	

	
	$(function(){
		//상세보기 실질적 데이터 받아옴
		if($('#tid').val() == '1'){
			alert("1일때입니다");
			$.ajax({
				url:"PaliamentDetailView.do",
				data : {
					num : $('#detailHiden_num').val(),
					dept_cd : $('#detailHiden_dept_cd').val(),
					img : $('#detail_img').val()
				},
				success : function(data){
					$('#detailPaliamentDiv').empty();
					
					
					
					var div = "<div class='well'>";
					div += '<img style="width:100px; height:100px;" src='+data.detailImg+'><br/><br/>';
					div += "이름 : <span>"+data.detail.body.item.empNm+"</span><br/><br/>";
					div += "정당 : <span>"+data.detail.body.item.polyNm+"</span><br/><br/>";
					div += "당선 횟수 : <span>"+data.detail.body.item.electionNum+"</span><br/><br/>";
					div += "소속 위원회 : <span>"+data.detail.body.item.shrtNm+"</span><br/><br/>";
					
					div += "학력 <span>"+data.detail.body.item.memTitle.replace(/\r-/gi,"<br/>○")+"</span><br/><br/>";
					div += "이메일 : <span>"+data.detail.body.item.assemEmail+"</span><br/><br/>";
					div += "전화번호 : <span>"+data.detail.body.item.assemTel+"</span><br/><br/>";
					
					
					$('#detailPaliamentDiv').html(div);
				}
			});
		}
		
		$.ajax({
			
			url:"XmlParse.do",
			
			success : function(data){
				
				//xml item 크기
				var length = $(data.xml).find("item").length;
				var PaliamentDiv = '';
				//xml 데이터 담겨져있음\
				$(data.xml).find("item").each(function(){
					
					PaliamentDiv += '<div class="col-sm-3">';
					PaliamentDiv += '<div class="well text-center">';
					PaliamentDiv += '<input type="hidden" id='+$(this).find("deptCd").text()+'>';
					PaliamentDiv += '<input type="hidden" id='+$(this).find("num").text()+'>';
					PaliamentDiv += '<span><img style="width:100px; height:100px;" src='+$(this).find("jpgLink").text()+'></span><br/><br/>';
					PaliamentDiv += '<span>이름 : '+$(this).find("empnm").text()+'</span><br/>';
					PaliamentDiv += '<span>영문이름 : '+$(this).find("engnm").text()+'</span><br/>';
					PaliamentDiv += '<span>지역구 : '+$(this).find("orignm").text()+'</span><br/>';
					PaliamentDiv += '<span>당선 회수 : '+$(this).find("reelegbnnm").text()+'</span><br/><br/>';
					PaliamentDiv += '<input type="button" class="btn btn-primary" onclick="detailPaliament(this)" value=상세보기>';
					PaliamentDiv += '</div>';
					PaliamentDiv += '</div>';
				});
				
				$('#resultDiv').html(PaliamentDiv);
			}
			
		});
		
		
		$("#searchBtn").click(function() {
			alert("xml버튼 클릭vv!!");
			var empNm = $('#empNm').val();
			var polyNm =$('#polyNm').val();
			var sharNm =$('#sharNm').val();
			var reeleGbnNm=$('#reeleGbnNm').val();
			var origNm =$('#origNm').val();
			alert(empNm +" / "+polyNm +" / "+sharNm+" / "+reeleGbnNm+" / "+origNm);
			
			
			
			
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

		}); 
	});
</script>
</body>
</html>