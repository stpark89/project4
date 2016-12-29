// JavaScript Document
$(document).ready(function(e) {
    
	var didsub = 0;
	var pNum = 0;
	var psts = 0;
	var mwEvt = (/Firefox/i.test(navigator.userAgent)?"DOMMouseScroll":"mousewheel");	
	
	text_slide();
	setInterval("text_slide()",8000);
	
	
	var address = location.href.split("/");
	var leng = address.length;	
	address = address[leng-1].split(".")[0];
	
	if(address == "index" || address == "header") {
		didsub = 0;
	} else {
		didsub = 1;	
	}
	
	if(didsub == 1) {
		$("#nav").css({position:"relative"});
	}
	
	
	var mo_sts = 0;
	$("#more").click(function(e) {
        
		if(mo_sts == 0) {
			$("#dashboard").animate({height:"1000px"});
			$("#more").html('<i class="fa fa-angle-double-up" aria-hidden="true"></i>');
			$(".hidden_box").animate({opacity:1});
			mo_sts = 1;
		} else if(mo_sts == 1) {
			$("#dashboard").animate({height:"600px"});
			$("#more").html('<i class="fa fa-angle-double-down" aria-hidden="true"></i>');
			$(".hidden_box").animate({opacity:0});
			mo_sts = 0;
		}
    });
	
	var bot_sts = 0;
	$("#bott_menu").click(function(e) {
        
		if(bot_sts == 0) {
			$("#banner>div").eq(1).animate({bottom:"0px"});
			$("#bott_menu").html('<i class="fa fa-angle-double-down" aria-hidden="true"></i>');
			bot_sts = 1;
		} else if(bot_sts == 1) {
			$("#banner>div").eq(1).animate({bottom:"-200px"});
			$("#bott_menu").html('<i class="fa fa-angle-double-up" aria-hidden="true"></i>');
			bot_sts = 0;
		}
    });
	
	$("#mainMenu").find("li").eq(2).hover(function(){
		
		$("#menu_bg").stop().animate({height:"50px"},300);
	}, function(){
		
		$("#menu_bg").stop().animate({height:"0px"},300);
	});
	
	
	//의안 상세보기 클릭시
	$("#statuteBtn").click(function(){
		location.href="statute.do";
	});
	
	//국회의원 상세보기 버튼 클릭시
	$('#ParliamentBtn').click(function(){
		location.href="Member_Parliament.do";
	});
	
	//커뮤니티 페이지
	$('#boardIndexBtn').click(function(){
		location.href="CommunityIndex.do";
	});
	
	$('#noticeIndexBtn').click(function(){
		location.href="NoticeIndex.do";
	});
	
});

var tSts = 0;
function text_slide() {
	
	console.log(tSts);
	
	if(tSts == 0) {
		$("#banner>div").eq(0).find("h2").animate({top:"0",opacity:"1"},1000);	
		$("#banner>div").eq(0).find("p").delay(200).animate({top:"0",opacity:"1"},1000);
		
		$("#banner>div").eq(0).find("h2").delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국 헌법 1조 2항");
			$("#banner>div").eq(0).find("h2").css({top:"50px",opacity:"0"});
		});	
		$("#banner>div").eq(0).find("p") .delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국의 주권은 국민에게 있고, 모든 권력은 국민으로부터 나온다.");
			$("#banner>div").eq(0).find("p").css({top:"50px",opacity:"0"});
		});
		
		tSts = 1;
		
	} else if (tSts == 1) {
		$("#banner>div").eq(0).find("h2").animate({top:"0",opacity:"1"},1000);	
		$("#banner>div").eq(0).find("p").delay(200).animate({top:"0",opacity:"1"},1000);
		
		$("#banner>div").eq(0).find("h2").delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국 헌법 1조 1항");
			$("#banner>div").eq(0).find("h2").css({top:"50px",opacity:"0"});
		});	
		$("#banner>div").eq(0).find("p").delay(5000).animate({top:"-50px",opacity:"0"},1000,function() {
			$(this).text("대한민국은 민주공화국이다.");
			$("#banner>div").eq(0).find("p").css({top:"50px",opacity:"0"});
		});
		
		tSts = 0;
	}
}