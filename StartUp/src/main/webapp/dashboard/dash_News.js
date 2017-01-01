/**
 * 
 */

$(function(){
	
	$.ajax({
		url : "CommunityNews_1.do",
		dataType : "json",
		success : function(data){
			$('#mainNews').empty();
			$('#goUl').empty();
			
			$.each(data.Goyoung.channel.item,function(index, value){

				//한줄 리스트 있는것
				//console.log("index : " + index + "hi : "+value);
				if(index == 0){
					var title = value.title;
					var link = value.link;
					var date = value["dc:date"]["#text"];
					$('#mainNews').append("<a href="+value.link+"><span style='text-overflow:ellipsis'>"+title+"</span></a><br/><span>"+date+"</span>");
					
				}else if(index >= 1 && index < 4){
					var title = value.title;
					var link = value.link;
					var date = value["dc:date"]["#text"];
					$('#goUl').append("<li><a href="+value.link+">"+title+"</a><span>"+date+"</span></li>");
				}
				//제목 - 링크 뽑음 - console.log(value.title + " / link : "+value.link);
				//console.log(value.title + " / link : "+value.link+"/ "+value["dc:date"]["#text"]);
				
			});
		
		}
	});
	
	$.ajax({
		
	    url:"CommunityNews_2.do",
		dataType:"json",
		success:function(data){
			$('#mainNews2').empty();
			$.each(data.joinsmsn.channel.item, function(index,obj){
				//console.log(obj.title+"////"+obj.link+"////"+obj.pubDate);
				var title = obj.title;
				var link = obj.link;
				var date = obj.pubDate;
				console.log(date);
				if(index==0){
					$('#mainNews2').html("<a href="+link+"><span>"+title+"</span></a><br><span>"+date+"</span></li>");
				}else if(index>=1 && index<4){
					$('#goUl2').append("<li><a href="+link+">"+title+"</a><span>"+date+"</span></li>");
				}
			});
		}
		
	});
	
	
});


