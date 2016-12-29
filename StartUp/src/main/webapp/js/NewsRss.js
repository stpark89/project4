/**
 * 
 */

$(function(){
	
	$.ajax({
		url : "CommunityNews_1.do",
		dataType : "json",
		success : function(data){
			//console.log(data.Goyoung);
			$.each(data.Goyoung.channel,function(index, value){
				//var date = new Date(value['date']);
				//var m = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
				if(index == 'item'){
					var test = value[0];
					////씨발     test 찍어봡
					var date = new Date(test["date"]);
					console.log(date);
					var m = date.getFullYear() + "-" +(date.getMonth())+"-"+date.getDate();
					console.log(m);
				}
				 
			});
			
			$.each(data.Goyoung.channel.item,function(index, value){
					
				//한줄 리스트 있는것
				//console.log("index : " + index + "hi : "+value);
				if(index == 0){
					var title = value.title;
					var link = value.link;
					$('#mainNews').html("<a href="+value.link+">"+title+"</a>");
				}
				//제목 - 링크 뽑음 - console.log(value.title + " / link : "+value.link);
			});
			
			//var length = data.Goyoung.item.length;

			
			
		}
	});
	
});