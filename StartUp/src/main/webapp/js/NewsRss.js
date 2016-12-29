/**
 * 
 */

$(function(){
	
	$.ajax({
		url : "CommunityNews_1.do",
		success : function(data){
			
			
			var text = "";
			$(data.Goyoung).find("item").each(function(){
				console.log("DDDD: " + $(this).find("link"));
				text += $(this).find("title").text();
				text += $(this).find("link").text();
				text += $(this).find("date").text();
				
				$('#GoDiv').append("제목 : <a href="+$(this).find("link").text()+">"+$(this).find("title").text()+ "</a> 날짜 : "+$(this).find("date").text()+"<br/><br/>");
			});
			
			
			
		}
	});
	
});