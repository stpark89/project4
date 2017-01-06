
//시간 바꿔주는 함수
function TimeFormatFuc(obj){
	var test = new Date(Date.parse(obj));
	
	var day = test.getDay()+1;
	var year = test.getFullYear();
	var month = test.getMonth()+1;
	if(month < 10){
		month = String("0"+month);
	}
	var day = test.getDay()+1;
	
	if(day < 10){
		day = String("0"+day);
	}
	var result = year+"."+month+"."+day;
	return result;
}

$(function(){
	
	//고용 노동부 
	$.ajax({
		url : "CommunityNews_1.do",
		dataType : "json",
		success : function(data){
			$('#mainNews').empty();
			$('#goUl').empty();
			
			$.each(data.Goyoung.channel.item,function(index, value){
				var dateResult = TimeFormatFuc(value["dc:date"]["#text"]);
				//한줄 리스트 있는것
				//console.log("index : " + index + "hi : "+value);
				if(index == 0){
					var title = value.title;
					var link = value.link;
					
					$('#GoverMenthGoyoung').append("<a href="+value.link+"><span>"+title+"</span></a><br/><span>"+dateResult+"</span>");
					
				}else if(index >= 1 && index < 4){
					var title = value.title;
					var link = value.link;
					$('#goUl').append("<li><a href="+value.link+">"+title+"</a><br/><span>"+dateResult+"</span></li>");
				}
			});
		
		}
	});

	
	//정부 RSS
	$.ajax({
		url:"education.do",
		success : function(data){
			$('#educationHtag').empty();
			$('#eduli').empty();
			
			var link = "http://www.korea.go.kr/";
			
			$.each(data.education, function(index, obj){
				var please = TimeFormatFuc(obj.date);
				var subLink = obj.link.substring(2);
				if(index == 0){
					
					
					$('#educationHtag').html("<a href="+(link+subLink)+">"+obj.title+"</a><span>"+please+"</span>");
					
				}else if(index >= 6 && index < 9){
					$('#eduli').append("<li><a href="+(link+subLink)+">"+obj.title+"</a><span>"+please+"</span>");
					
				}
			});
			//education
		}
	});
	
	
	//MBC 속보
	chooseSock_MBC();
	//매일 경제 속보
	chooseSock_Mail();
	//조선 속보
	chooseSock_Josun();
	//JTBC 속보
	chooseSock_JTBC();
	

	
	$("#news>ul").find("li").click(function(e) {
		
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
		
		var tabMenu = $(this).attr("id");
		chooseMenu(tabMenu);
    });
	
});	

//글짜르기 함수
function substringTitle(obj){
	var title = obj.substring(0,29);
	title += ".....";
	return title;
}

//탭메뉴 클릭시
function chooseMenu(value){
	console.log("함수 호출 넘어온 값 : "+value);
	
	switch (value) {
		case 'sock':
			$('#MbcUl').empty();
			chooseSock_MBC();
			
			$('#mail').empty();
			chooseSock_Mail();
			
			$('#josun').empty();
			chooseSock_Josun();
			
			$('#jtbc').empty();
			chooseSock_JTBC();
			break;
	
			
			
		case 'jung':
			//MBC 선택
			$('#MbcUl').empty();
			chooseJung_MBC();	
			//매일
			$('#mail').empty();
			chooseJung_Mail();
			//조선
			$('#josun').empty();
			chooseJung_Josun();
			//jtcb
			$('#jtbc').empty();
			chooseJung_JTBC();
			 break;
		
			 //경제 부분
		case 'gyung':
			//MBC
			$('#MbcUl').empty();
			chooseGyung_MBC();

			//매일
			$('#mail').empty();
			chooseGyung_Mail();
			
			//조선
			$('#josun').empty();
			chooseGyung_Josun();
			
			//경제
			$('#jtbc').empty();
			chooseGyung_JTBC();
			break;
		
		case 'sa':
			
			break;
		
		case 'love':
			
			break;
			
		case 'gitar':
			
			break;
			
	default:
		alert("메뉴를 다시 선택해주세요");
		break;
	}
	
}

//뉴스 - MBC 부분 - 속보
function chooseSock_MBC(){
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
				if(index >= 1 && index <= 4){
					var changeDate=String(date);
					$('#MbcUl').append("<li><a href="+link+">"+title+"</a><span>"+changeDate+"</span></li>");
				}
			});
		}
		
	});
}

//MBC 정치 뉴스 탭 선택시
function chooseJung_MBC(){
	$.ajax({
		url:"JungChi.do",
		dataType : "json",
		success : function(data){
			$.each(data.mbcJung.channel.item, function(index, obj){
				if(index >= 0 && index <= 3){
					$('#MbcUl').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+obj.pubDate+"</span></li>");
				}
			});
			
		}
	});
}

//MBC 정치 부분
function chooseGyung_MBC(){
	
	$.ajax({
		url : "GyungJae.do",
		success : function(data){
			$.each(data.mbcGyung.channel.item, function(index, obj){
				
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
						$('#MbcUl').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+obj.pubDate+"</span></li>");
					}else{
						var title = obj.title.substring(0,29);
						title += ".....";
						$('#MbcUl').append("<li><a href="+obj.link+">"+title+"</a><span>"+obj.pubDate+"</span></li>");
					}
				}
			});
		}
	});
	
}

//매일 경재 속보 뉴스 탭 선택시
function chooseSock_Mail(){
	//뉴스 - 매일경재 - 속보
	$.ajax({
		url:"MailNews.do",
		dataType:"json",
		success : function(data){
			console.log("매일 속보");
			$.each(data.mail_news.channel.item, function(index, obj){
				var result = TimeFormatFuc(obj.pubDate);
				//console.log("매일 경재 확인 : " +obj["dc:date"]["#text"]);
				if(index >=0 && index <= 3){
					
					console.log("날짜 결과 : "+result);
					if(obj.title.length <= 30){
						$('#mail').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+result+"</span></li>");
					}else{
						var title = substringTitle(obj.title);
						$('#mail').append("<li><a href="+obj.link+">"+title+"</a><span>"+result+"</span></li>");
					}
				}
			});
		}
	});
}


//매일경재 정치 뉴스 탭 선택 시
function chooseJung_Mail(){
	$.ajax({
		url:"MailJung.do",
		dataType : "json",
		success : function(data){
			$.each(data.mail_jung.channel.item, function(index, obj){
				var result = TimeFormatFuc(obj.pubDate);
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
					$('#mail').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+result+"</span></li>");
					}else{
						var title = substringTitle(obj.title);
						$('#mail').append("<li><a href="+obj.link+">"+title+"</a><span>"+result+"</span></li>");
					}
				}
			});
		}
	});
}
//매일경제 경제 뉴스 탭 선택 시
function chooseGyung_Mail(){
	$.ajax({
		url:"MailGyung.do",
		dataType : "json",
		success : function(data){
			$.each(data.mail_gyung.channel.item, function(index, obj){
				var result = TimeFormatFuc(obj.pubDate);
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
					$('#mail').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+result+"</span></li>");
					}else{
					var title = substringTitle(obj.title);
					$('#mail').append("<li><a href="+obj.link+">"+title+"</a><span>"+result+"</span></li>");
					}
				}
			});
		}
	});
}


//뉴스 - 조선 - 속보
function chooseSock_Josun(){
	$.ajax({
		url:"JoSun.do",
		dataType : "json",
		success : function(data){
			$.each(data.josun.channel.item, function(index, obj){
				var result = TimeFormatFuc(obj.pubDate);
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
						$('#josun').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+result+"</span></li>");
					}else{
						var title = substringTitle(obj.title);
						$('#josun').append("<li><a href="+obj.link+">"+title+"</a><span>"+result+"</span></li>");
					}
				}
			});
			
		}
	});
}

//조선 정치 뉴스 탭 선택시
function chooseJung_Josun(){
	$.ajax({
		url:"JosunJung.do",
		dataType : "json",
		success : function(data){
			$.each(data.josun_jung.channel.item, function(index, obj){
				var result = TimeFormatFuc(obj.pubDate);
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
						$('#josun').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+result+"</span></li>");
					}else{
						var title = substringTitle(obj.title);
						$('#josun').append("<li><a href="+obj.link+">"+title+"</a><span>"+result+"</span></li>");
					}
				}
			});
		}
	});
}

//조선 경제 뉴스 탭 선택 시
function chooseGyung_Josun(){
	$.ajax({
		url:"JosunGyung.do",
		dataType : "json",
		success : function(data){
			$.each(data.josun_Gyung.channel.item, function(index, obj){
				var result = TimeFormatFuc(obj.pubDate);
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
						$('#josun').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+result+"</span></li>");
					}else{
						var title = substringTitle(obj.title);
						$('#josun').append("<li><a href="+obj.link+">"+title+"</a><span>"+result+"</span></li>");
					}
				}
			});
		}
	});
}


//JTBC 속보 뉴스 탭 선택시
function chooseSock_JTBC(){
	//뉴스 - JTBC - 속보
	$.ajax({
		url:"jtbc_News1.do",
		success : function(data){
			$(data.jtbc).each(function(index,obj){
				console.log("jtbc 속보 : " +obj);
				if(index >= 0 && index <= 3){
					if(obj.title.length <= 30){
						$('#jtbc').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+obj.date+"</span></li>");
					}else{
						var sub_title=substringTitle(obj.title);
						$('#jtbc').append("<li><a href="+obj.link+">"+sub_title+"</a><span>"+obj.date+"</span></li>");
					
					}
				}
			});
		}
	});
	
}

//JTBC 정치 뉴스 탭 선택시
function chooseJung_JTBC(){
	
	$.ajax({
		url:"Jtbc_Jung.do",
		success : function(data){
			$(data.jtbc_jung).each(function(index,obj){
				
				if(index >= 0 && index <= 3){
					
					if(obj.title.length <= 30){
						$('#jtbc').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+obj.date+"</span></li>");
					}else{
						var sub_title=substringTitle(obj.title);
						$('#jtbc').append("<li><a href="+obj.link+">"+sub_title+"</a><span>"+obj.date+"</span></li>");
					
					}
				}
				
			});
		}	
	});
} 

//JTBC 경제 뉴스 탭 선택시
function chooseGyung_JTBC(){
	$.ajax({
		url:"Jtbc_Gyung.do",
		success : function(data){

			$(data.jtbc_Gyung).each(function(index, obj){
				if(index >= 0 && index <= 3){
					
					if(obj.title.length <= 30){
						$('#jtbc').append("<li><a href="+obj.link+">"+obj.title+"</a><span>"+obj.date+"</span></li>");
					}else{
						var sub_title=substringTitle(obj.title);
						$('#jtbc').append("<li><a href="+obj.link+">"+sub_title+"</a><span>"+obj.date+"</span></li>");
					
					}
				}
				
			});
		}
	});
} 


