$(function(){

	$("#news>ul").find("li").click(function(e) {
        $(this).css({backgroundColor:"#333",color:"#fff"}).siblings().css({backgroundColor:"#fff",color:"#000"});
    });
	
});	