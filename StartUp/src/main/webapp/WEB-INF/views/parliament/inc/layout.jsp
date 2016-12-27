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

	//정당 전역변수
	var jungdangName = '';
 	//정당 뽑아오는 함수
 	function jungDang(deptcd,num){
 		
 		jungdangName = '';
		$.ajax({
			url : "PaliamentJungDang.do",
			data : {
				dept_cd : deptcd,
				num : num
			},
			async:false,
			success : function(data){
				
				jungdangName = $(data.jungDang).find("item").find("polyNm").text();
				
			}
		}); 
		return jungdangName;
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
					var div = "<div class='row'><div class='well col-sm-4'>";
					div += '<img style="width:100px; height:100px;" src='+data.detailImg+'><br/>';
					div += "</div>";
					div += "<div class='col-sm-8'><table class='table'>";
					div += "<tr><td>정당 </td><td><span>"+data.detail.body.item.polyNm+"</span></td></tr>";
					div += "<tr><td>당선 횟수</td><td><span>"+data.detail.body.item.electionNum+"</span></td></tr>";
					div += "<tr><td>소속 위원회</td><td><span>"+data.detail.body.item.shrtNm+"</span></td></tr>";
					if(data.detail.body.item.memTitle != null || data.detail.body.item.memTitle !== undefined){
						div += "<tr><td>학력 </td><td><span>"+data.detail.body.item.memTitle.replace(/\r-/gi,"<br/>○")+"</span></td></tr>";
					}
					div += "<tr><td>전화번호 </td><td><span>"+data.detail.body.item.assemTel+"</span></td></tr>";
					if(data.detail.body.item.assemEmail != null || data.detail.body.item.assemEmail !== undefined){
					div += "<tr><td>이메일 </td><td><span>"+data.detail.body.item.assemEmail+"</span></td></tr></table>";
					}else{
						div += "<tr><td>이메일 </td></tr></table>";
					}
					
					div +="</div></div>";
					$('#detailPaliamentDiv').html(div);
				}
			});
		}
		
		//국회의원 리스트 뿌릴때
		$.ajax({
			url:"XmlParse.do",
			
			success : function(data){
				
				//xml item 크기
				var length = $(data.xml).find("item").length;
				var PaliamentDiv = '';
				//xml 데이터 담겨져있음\
				
				$(data.xml).find("item").each(function(){
					
					//well 테두리 색상
					var wellColor = '';
					//정당이름 뽑아옴
					var resultJung = jungDang($(this).find("deptCd").text(),$(this).find("num").text());
					console.log("정당 이름 : " +resultJung);
					if(resultJung == '' || resultJung == ""){
						resultJung = "무소속";
					}
					
					switch(resultJung){
						case '국민의당': 
										wellColor = 'green';	
										break;	
						case '더불어민주당': 
										wellColor = 'blue';
										break;
						case '새누리당': 
										wellColor = 'red';
										break;
						case '정의당': 
										wellColor = 'yellow';
										break;
										
						case '무소속': 
										wellColor = 'gray';
										break;
					}
					
					console.log("색상d : " +wellColor);
					PaliamentDiv += '<div class="col-sm-3">';
					PaliamentDiv += '<div class="well text-center">';
					PaliamentDiv += '<input type="hidden" id='+$(this).find("deptCd").text()+'>';
					PaliamentDiv += '<input type="hidden" id='+$(this).find("num").text()+'>';
					PaliamentDiv += '<span><img style="width:100px; height:100px;" src='+$(this).find("jpgLink").text()+'></span><br/><br/>';
					PaliamentDiv += '<span>이름 : '+$(this).find("empnm").text()+'</span><br/>';
					PaliamentDiv += '<span>정당 : '+resultJung+'</span><br/>';
					PaliamentDiv += '<span>지역구 : '+$(this).find("orignm").text()+'</span><br/>';
					PaliamentDiv += '<span>당선 회수 : '+$(this).find("reelegbnnm").text()+'</span><br/><br/>';
					PaliamentDiv += '<input type="button" class="btn btn-primary" onclick="detailPaliament(this)" value=상세보기>';
					PaliamentDiv += '</div>';
					PaliamentDiv += '</div>';
					
					resultJung = '';
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