/**
 * 작성자 : 하재현
 * 작성일 : 2016-12-26
 * 목 적 : 의안 관련 스크립트
 */

  $(function(){
	  
		//탭 클릭시 사용됨
		$("#tabMenu").find("li").click(function(e) {
	       
			var tSts = $(this).index();
			
			console.log(tSts);
			
			$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
			 
			  //최근 통과의안
		      if(tSts==0){
		    	  getRecentPasageList();
		      //최근 접수의안	  
		      }else if(tSts==1){
		    	  getRecentRceptList();		
		      //처리의안	  
		      }else if(tSts==2){
		    	  getJsictionComiteProcessList();
		      //계류의안	 	  
		      }else{
		    	  getRecentMoorList();
		      }
			
	    });
	  
	  //검색버튼 클릭시
	 $('#searchStatuteBtn').click(function(){
		    var statuteName = $('#statuteName').val();
			var statutePeople=$('#statutePeople').val();
			var committee =$('#committee').val();
			var statuteIng =$('#statuteIng option:selected').val();
			
		alert(statuteName+ " / "+statutePeople +" / "+committee + " / "+statuteIng);
		$.ajax({
			   url: "http://apis.data.go.kr/9710000/BillInfoService/getBillInfoList?&ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D",
			   type:"GET",
			   dataType:"xml",
			   success:function(data){
				   alert("성공");
				   console.log(data);
				},
				      error:function(data){
				    	  console.log(data);
				    	  alert('실패');
				      }
			   
		});
	 });
	 
	 //의안 페이지 클릭시 최근통과의안 목록
	 $.ajax({
		 url:"statuteList.do",
		 success:function(data){
			
			
			 $('#statuteTable').empty();
			 var table="";	
			 table+="<table class='table table-hover'>";
			 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th><th>진행상황</th></tr>";
			 if(data.statutelist.length>0){
				 
				 $.each(data.statutelist, function(index, obj){
					 var billName = obj.billName;
					 if(billName.length>30){
						 billName= billName.substring(0,50)+"...";
					 }
					 var committeeName = obj.committeeName;
					 if(committeeName.length>15){
						 committeeName= committeeName.substring(0,15)+"...";
					 }
					table+="<tr><td>"+obj.proposeDt+"</td><td>"+billName+"</td><td>"+committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
				});
				 
			 }else{
			    	table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
				}
			table+="</table>";
		/*	if(data.statutelist.length>0){
				table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>발의자</th><th>상임위원회</th><th>진행상황</th></tr>";
				$.each(data.statutelist.body.items, function(index, obj){
					console.log("인덱스 확인 : "+obj.billName);
					table+="<tr class='text-center'><th>"+obj.billName+"</th><th>의안명</th><th>발의자</th><th>상임위원회</th><th>진행상황</th></tr>";
					//console.log("뭐나오까"+obj[0].billName);
				});
			}else{
				table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>발의자</th><th>상임위원회</th><th>진행상황</th></tr>";
				table+"<tr><td colspan='5'>의안이 없습니다.</td></tr>"
			}
		*/	$('#statuteTable').html(table);
		 }
	 });
	  
  });
  
  
  //최근 통과 의안탭 클릭시
  function getRecentPasageList(){
	  $.ajax({
			 url:"statuteList.do",
			 success:function(data){
				 $('#statuteTable').empty();
				 var table="";	
				 table+="<table class='table table-hover'>";
				 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th><th>진행상황</th></tr>";
				 if(data.statutelist.length>0){
					 
					 $.each(data.statutelist, function(index, obj){
						 var billName = obj.billName;
						 if(billName.length>30){
							 billName= billName.substring(0,50)+"...";
						 }
						 var committeeName = obj.committeeName;
						 if(committeeName.length>15){
							 committeeName= committeeName.substring(0,15)+"...";
						 }
						table+="<tr><td>"+obj.proposeDt+"</td><td>"+billName+"</td><td>"+committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
					});
					 
				 }else{
				    	table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
					}
				table+="</table>";
			$('#statuteTable').html(table);
			 }
		 });
  }
  
  //최근 접수 의안 탭 클릭시
function getRecentRceptList(){
	$.ajax({
		url:"getRecentRceptList.do",
		success:function(data){
			$('#statuteTable').empty();
			 var table="";	
			 table+="<table class='table table-hover'>";
			 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th></tr>";
			 if(data.statutelist.length>0){
				 
				 $.each(data.statutelist, function(index, obj){
					 var billName = obj.billName;
					 if(billName.length>100){
						 billName= billName.substring(0,70)+"...";
					 }
					 var committeeName = obj.committeeName;
					 if(committeeName.length>15){
						 committeeName= committeeName.substring(0,15)+"...";
					 }
					table+="<tr><td>"+obj.proposeDt+"</td><td>"+billName+"</td><td>"+committeeName+"</td></tr>";
				});
				 
			 }else{
			    	table+"<tr><td colspan='3'>의안이 없습니다.</td></tr>"
				}
			table+="</table>";
		$('#statuteTable').html(table);
		}
	});
}

//처리의안 목록
function getJsictionComiteProcessList(){
	$.ajax({
		 url:"getJsictionComiteProcessList.do",
		 success:function(data){
			 $('#statuteTable').empty();
			 var table="";	
			 table+="<table class='table table-hover'>";
			 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th><th>진행상황</th></tr>";
			 if(data.statutelist.length>0){
				 
				 $.each(data.statutelist, function(index, obj){
					 var billName = obj.billName;
					 if(billName.length>30){
						 billName= billName.substring(0,50)+"...";
					 }
					 var committeeName = obj.committeeName;
					 if(committeeName.length>15){
						 committeeName= committeeName.substring(0,15)+"...";
					 }
					table+="<tr><td>"+obj.proposeDt+"</td><td>"+billName+"</td><td>"+committeeName+"</td><td>"+obj.generalResult+"</td></tr>";
				});
				 
			 }else{
			    	table+"<tr><td colspan='4'>의안이 없습니다.</td></tr>"
				}
			table+="</table>";
		$('#statuteTable').html(table);
		 }
	 });
}

//계류의안 목록

function getRecentMoorList(){
	$.ajax({
		 url:"getRecentMoorList.do",
		 success:function(data){
			 $('#statuteTable').empty();
			 var table="";	
			 table+="<table class='table table-hover'>";
			 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>상임위원회</th></tr>";
			 if(data.statutelist.length>0){
				 
				 $.each(data.statutelist, function(index, obj){
					 var billName = obj.billName;
					 if(billName.length>50){
						 billName= billName.substring(0,80)+"...";
					 }
					 var committeeName = obj.committeeName;
					 if(committeeName.length>15){
						 committeeName= committeeName.substring(0,15)+"...";
					 }
					table+="<tr><td>"+obj.proposeDt+"</td><td>"+billName+"</td><td>"+committeeName+"</td></tr>";
				});
				 
			 }else{
			    	table+"<tr><td colspan='3'>의안이 없습니다.</td></tr>"
				}
			table+="</table>";
		$('#statuteTable').html(table);
		 }
	 });
}