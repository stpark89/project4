/**
 * 
 */


$(function(){

	//검색 폼 서브밋 -  실행
	$("#searchBtn").click(function(){
		alert("버튼 클릭");
		$.ajax({
			
			url : "http://apis.data.go.kr/9710000/NationalAssemblyInfoService/getMemberCurrStateList?ServiceKey=WYSOTWAG2cCqt46F8PGTAtesljwJ86qcBYTBnqYLi1BcJVgT9lq2d1uAdiFFwMJ4cpRvZB2r4625aaTt6r%2BGtQ%3D%3D",
			success : function(data){
				alert("성공");
				console.log(data);
			},
			error : function(data){
				alert("실패");
			}
			
		});
		
		
	});
	
	$('.detailBtn').on("click",function(){
		alert("클릭");
		//정당
		var jung = $(this).prev().children().text();
		
		//이름
		var name = $(this).prev().prev().children().text();
		console.log(jung + " ////  "+name);
		alert("이건뭐지");
	});
	
});