$(function(){
	
	var div = '<table class="table"><tr><th class="text-center">No</th><th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">작성일</th><th class="text-center">조회수</th></tr>';
	div += "</table>";
	div +='<div class="col-sm-offset-11 col-sm-1">';
	div +="<input type='button' class='btn btn-primary' value='글쓰기'>";
	div +='</div>';
	$("#tabContent").html(div);
	
	//탭 클릭시 사용됨
	$("#tabMenu").find("li").click(function(e) {
        
		var tSts = $(this).index();
		
		console.log(tSts);
		
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
		
		if(tSts == 0){
			
			statue();
			
		}else if(tSts == 1){
			
			parliament();
			
		}else if(tSts == 2){
			freeBoard();
		}
		
    });
	
});


//자유게시판
function freeBoard(){
	var div = '<table class="table"><tr><th class="text-center">No</th><th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">작성일</th><th class="text-center">조회수</th></tr>';		
	$.ajax({
		url:"FreeBoard.do",
		success : function(data){
			$("#tabContent").empty();
			var obj = data.list;
			
			for(var i = 0; i < obj.length; i++){
				
				div += "<tr class='text-center'>";
				div += "<td>"+obj[i].bno+"</td>";
				div += "<td><a href=FreeBoardDetail.do?bno="+obj[i].bno+">"+obj[i].title+"</a></td>";
				div += "<td>"+obj[i].writer+"</td>";
				div += "<td>"+obj[i].regdate+"</td>";
				div += "<td>"+obj[i].viewcnt+"</td>";
				div += "</tr>";
			}
			div += "</table>";
			div +='<div class="col-sm-offset-11 col-sm-1">';
			div +="<input type='button' class='btn btn-primary' onclick='writeFree();' value='글쓰기'>";
			div +='</div>';
			$("#tabContent").html(div);
		}
	});
}

//국회의원
function parliament(){
	$("#tabContent").empty();
	var div = '<table class="table"><tr><th class="text-center">No</th><th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">작성일</th><th class="text-center">조회수</th></tr>';
	div += "</table>";
	div +='<div class="col-sm-offset-11 col-sm-1">';
	div +="<input type='button' class='btn btn-primary' value='글쓰기'>";
	div +='</div>';
	
	
	$("#tabContent").html(div);
}

//법
function statue(){
	$("#tabContent").empty();
	var div = '<table class="table"><tr><th class="text-center">No</th><th class="text-center">제목</th><th class="text-center">글쓴이</th><th class="text-center">작성일</th><th class="text-center">조회수</th></tr>';
	div += "</table>";
	div +='<div class="col-sm-offset-11 col-sm-1">';
	div +="<input type='button' class='btn btn-primary' value='글쓰기'>";
	div +='</div>';
	
	
	$("#tabContent").html(div);
}

//자유게시판 글쓰기 버튼 클릭시
function writeFree(){
	location.href="FreeBoardWrite.do";
}

