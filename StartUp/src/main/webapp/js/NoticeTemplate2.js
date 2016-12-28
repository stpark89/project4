/**
 * 공지사항/Q&A 스크립트
 */

//공지사항
function notice(){
	
	var div = '<table class="table"><tr><th class="text-center">No</th><th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">작성일</th></tr>';		
	$.ajax({
		url:"Noticelist.do",
		success: function(data){
			$('#NoticeContentDiv').empty();
			if(data.list.length==0){
		      div+='<tr class="text-center"><td colspan="4">공지사항이 없습니다</td></tr>';	   	
			}else{
				for(var i=0; i<data.list.length; i++){
					div+='<tr class="text-center">';
					div+='<td>'+data.list[i].noticeBno+'</td>';
					div+='<td>'+data.list[i].title+'</td>';
					div+='<td>'+data.list[i].content+'</td>';
					div+='<td>'+data.list[i].regdate+'</td>';
					div+='</tr>';
				}
			}
			
			div+='</table>';
			if($('#hiddenId').val()=='admin'){
				div+='<div class="col-sm-offset-11 col-sm-1">';
				div+='<input type="button" class="btn btn-primary" id="writeNotice" value="글쓰기">';
				div+='</div>';
			}
		
			$('#NoticeContentDiv').html(div);
		}
	});
}

//qna
function qna(){
	
	var div = '<table class="table"><tr><th class="text-center">No</th><th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">작성일</th><th class="text-center">조회수</th></tr>';		
	$.ajax({
		url:"QnaIndex.do",
		success:function(data){
			$('#NoticeContentDiv').empty();
			if(data.qnalist.length==0){
				div+='<tr class="text-center"><td colspan="5">Q&A가 없습니다.</td></tr>'
			}else{
				for(var i=0; i<data.qnalist.length; i++){
					div+='<tr class="text-center"><td>'+data.qnalist[i].qnaBno+'</td>';
					div+='<td>'+data.qnalist[i].title+'</td>';
					div+='<td>'+data.qnalist[i].writer+'</td>';
					div+='<td>'+data.qnalist[i].regdate+'</td>';
					div+='<td>'+data.qnalist[i].viewcnt+'</td>';
					div+='</tr>';
				}
				
			}
			
			div+='</table>';
			div+='<div class="col-sm-offset-11 col-sm-1"><input type="button" class="btn btn-primary" value="글쓰기" onclick="qnaWriteFun()"></div>'
			$('#NoticeContentDiv').html(div);
		}
	});
}

//Qna 글쓰기
function qnaWriteFun(){
	location.href="WriteQna.do";
}


$(function(){
	//탭 클릭시 사용됨
	$("#tabMenu").find("li").click(function(e) {
        
		var tSts = $(this).index();
		
		console.log(tSts);
		
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
		
		if(tSts == 0){
			notice();
		}else if(tSts == 1){
			qna();
		}
		
    });
	
	//공지사항 글쓰기버튼 클릭시
	$('#writeNotice').click(function(){
		location.href="WriteNotice.do";
	});
	
	
	
});