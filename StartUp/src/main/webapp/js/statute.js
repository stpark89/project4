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
			   url: "http://apis.data.go.kr/9710000/BillInfoService/getBillInfoList?ServiceKey=cuzCdknQ8EpFjg0Rw%2Fgd%2Br2TesHVExB8p3Pa5Rr0kgJUAhEyxcf9egVBUX29QGWrcq9ofcWuxOsECDRwsJXiSg%3D%3D",
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
	  
  });
  
  function load($xml){
	  // console.log($($xml).find("body").find("items").find("item").find());
	   //console.log($(data).find("response").find("body").find("items").length());
	  console.log($($xml).find("response").find("body").length);
  }