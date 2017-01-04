/**
 * 작성자 : 하재현
 * 작성일 : 2016-12-26
 * 목 적 : 의안 관련 스크립트
 */

  $(function(){
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
	 
	 //의안 리스트 출력
	 $.ajax({
		 url:"statuteList.do",
		 success:function(data){
			 $('#statuteTable').empty();
			 var table="";
			
			//$.each(data.statutelist.body.items, function(index, obj){
				//console.log("인덱스 확인 : "+obj.billName);
			
			//});
			//console.log("--"+data.statutelist.item.billName);
			
			 table+="<tr class='text-center'><th>제안일</th><th>의안명</th><th>발의자</th><th>상임위원회</th><th>진행상황</th></tr>";
				$.each(data.statutelist.body.items, function(index, obj){
					console.log("인덱스 확인 : "+obj.billName);
					table+="<tr class='text-center'><th>"+obj.billName+"</th><th>의안명</th><th>발의자</th><th>상임위원회</th><th>진행상황</th></tr>";
					//console.log("뭐나오까"+obj[0].billName);
				});
			
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
  
