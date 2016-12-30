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
<script src="js/Palia.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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

	var guck = 0,
	  sae = 0,
	  doub = 0,
	  muso = 0,
	  jung = 0;
	// 당별 카운트 새기 위한 것
	
	
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
					var div = "<div class='row'><p class='text-center' style='font-size : 32px;'>이름 : "+data.detail.body.item.empNm+"</p><div class='well col-sm-12'>";
					div += '<img class="img-thumbnail" style="width:300px; height:300px;" src='+data.detailImg+' ><br/>';
					div += "</div></div>";
					div += "<div class='row'><div class='col-sm-12'>";
					div += "<span>정당 : </span><span>"+data.detail.body.item.polyNm+"</span><br/><hr/>";
					div += "<span>당선 횟수 : </span><span>"+data.detail.body.item.electionNum+"</span><br/><hr/>";
					div += "<span>소속 위원회 : </span><span>"+data.detail.body.item.shrtNm+"</span><br/><hr/>";
					if(data.detail.body.item.memTitle != null || data.detail.body.item.memTitle !== undefined){
						div += "<span>학력 : </span><span>"+data.detail.body.item.memTitle.replace(/\r-/gi,"<br/>○")+"</span><br/><hr/>";
					}
					div += "<span>전화번호 : </span><span>"+data.detail.body.item.assemTel+"</span><br/><hr/>";
					if(data.detail.body.item.assemEmail != null || data.detail.body.item.assemEmail !== undefined){
					div += "<span>이메일 : </span><span>"+data.detail.body.item.assemEmail+"</span><br/><hr/>";
					}else{
						div += "<span>이메일 : </span><br/><hr/>";
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
				
				var PaliamentDiv = '';
				
				//xml 데이터 담겨져있음\
				$(data.xml).find("item").each(function(){
					
					//well 테두리 색상
					var wellColor = '';
					//정당이름 뽑아옴
					var resultJung = jungDang($(this).find("deptCd").text(),$(this).find("num").text());
				
					if(resultJung == '' || resultJung == ""){
						resultJung = "무소속";
					}
					
					switch(resultJung){
						case '국민의당': 
										wellColor = 'green';
										guck += 1;
										break;	
						case '더불어민주당': 
										wellColor = 'blue';
										doub += 1;
										break;
						case '새누리당': 
										wellColor = 'red';
										sae += 1;
										break;
						case '정의당': 
										wellColor = 'yellow';
										jung += 1;
										break;
										
						case '무소속': 
										wellColor = 'gray';
										muso += 1;
										break;
					}
				
					PaliamentDiv += '<div class="col-sm-3">';
					PaliamentDiv += '<div class="well text-center" style="background-color:white; border:1px solid '+wellColor+'">';
					PaliamentDiv += '<input type="hidden" id='+$(this).find("deptCd").text()+'>';
					PaliamentDiv += '<input type="hidden" id='+$(this).find("num").text()+'>';
					PaliamentDiv += '<span><img style="width:100px; height:100px;" src='+$(this).find("jpgLink").text()+'></span><br/><br/>';
					PaliamentDiv += '<span>이름 : '+$(this).find("empnm").text()+'</span><br/>';
					PaliamentDiv += '<span>정당 : '+resultJung+'</span><br/>';
					PaliamentDiv += '<span>지역구 : '+$(this).find("orignm").text()+'</span><br/>';
					PaliamentDiv += '<span>당선 회수 : '+$(this).find("reelegbnnm").text()+'</span><br/><br/>';
					PaliamentDiv += '<input type="button" class="btn" style="color:white; background-color:'+wellColor+'" onclick="detailPaliament(this)" value=상세보기>';
					PaliamentDiv += '</div>';
					PaliamentDiv += '</div>';
					
					resultJung = '';
					
				});
				
				$('#resultDiv').html(PaliamentDiv);
				google.charts.load('current', {'packages':['corechart']});
			 	google.charts.setOnLoadCallback(drawChart);
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
 	

	
 	function drawChart() {
 	  var data = google.visualization.arrayToDataTable([
 	    ['Task', 'Hours per Day'],
 	    ['국민의당',     guck],
 	    ['더불어 민주당',      doub],
 	    ['새누리당',  sae],
 	    ['정의당', jung],
 	    ['무소속',    muso]
 	  ]);

 	  var options = {
 	    title: '국회의원 현황',
 	    is3D: true,
 	   	slices: {
           0: { color: 'green' },
           1: { color: 'blue' },
           2: { color: 'red' },
           3: { color: 'yellow' },
           4: { color: 'gray' }
         }
 	  };

 	  var chart = new google.visualization.PieChart(document.getElementById('piechart'));

 	  chart.draw(data, options);
 	}	
	
</script>	
</body>
</html>