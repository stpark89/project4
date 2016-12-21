/**
 * 
 */


$(function(){

	//검색 폼 서브밋 -  실행
	$("#searchForm").submit(function(){
		
		
		
	});
	
	
	$('.detailBtn').on("click",function(){
		alert("클릭");
		//정당
		var jung = $(this).prev().children().text();
		
		//이름
		var name = $(this).prev().prev().children().text();
		console.log(jung + " ////  "+name);
		
	});
	
});