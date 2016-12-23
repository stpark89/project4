$(function() {
	

	$('.detailBtn').on("click", function() {
		//정당
		var jung = $(this).prev().children().text();

		//이름
		var name = $(this).prev().prev().children().text();
		alert("뭔데 : " +jung + " ////  " + name);

	});

});
