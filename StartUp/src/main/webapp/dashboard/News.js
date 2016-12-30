/**
 * 
 */

$(function(){
	
	$.ajax({
		url : "CommunityNews_1.do",
		dataType : "json",
		success : function(data){
			$.each(data.Goyoung.channel.item,function(index, value){
					
				//한줄 리스트 있는것
				//console.log("index : " + index + "hi : "+value);
				if(index == 0){
					var title = value.title;
					var link = value.link;
					var date = value["dc:date"]["#text"];
					$('#mainNews').html("<a href="+value.link+">"+title+"</a>"+date);
				}else if(index >= 1 && index <= 4){
					console.log("엘스 이프 : "+index);
					var title = value.title;
					var link = value.link;
					var date = value["dc:date"]["#text"];
					$('#goUl').append("<li><a href="+value.link+">"+title+"</a><span>"+date+"</span></li>");
				}
				//제목 - 링크 뽑음 - console.log(value.title + " / link : "+value.link);
				console.log(value.title + " / link : "+value.link+"/ "+value["dc:date"]["#text"]);
				
			});
			
			//var length = data.Goyoung.item.length;

			
			
		}
	});
	
});