$(function(){
	
	//자유 게시판 글쓰기 버튼 클릭시
	$('#WriteFreeBoardBtn').click(function(){
		
		location.href="FreeBoardWrite.do";
		
	});
	
	
	//자유게시판 서브밋 이벤트 발생
	$('#FreeBoardForm').submit(function(){
		
		alert("서브밋 호출");
		if($('#title').val() == ''){
			alert("제목을 입력해주세요 !");
			$('#title').focus();
			return false;
		}else if($('#content').val() == ''){
			alert("내용을 입력해주세요!");
			$('#content').focus();
			return false;
		}else{
			
			var date = new Date();
			var month = date.getMonth()+1;
			var day = date.getDate();
			var year = date.getFullYear();
			
			$('#regdate').val(year+"-"+month+"-"+day);
			alert("글쓰기 성공!!");
			return true;
		}
		
	});
	
});