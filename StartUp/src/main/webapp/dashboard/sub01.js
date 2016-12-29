// JavaScript Document
$(document).ready(function(e) {
    
	$("#tabMenu").find("li").click(function(e) {
        
		var tSts = $(this).index();
		
		console.log(tSts);
		
		$(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
		
		$("#tabContent").find("div").eq(tSts).css({display:"block"}).siblings().css({display:"none"});
    });
});