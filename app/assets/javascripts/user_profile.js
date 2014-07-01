$(document).ready(function() {
	
	$(".user_stats").hide();

	$("#bio_stats").on("click", function() {

		if ($(this).html() == "stats") {
				$(this).html("bio");
				$(".user_stats").show(2000);
				$(".user_bio").hide(1000);
		} else {
				$(this).html("stats");
				$(".user_stats").hide(1000);
				$(".user_bio").show(2000);
		}
			
	});	


});	