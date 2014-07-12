$(document).ready(function() {
	$('.user-stats-link').on('click', function(){
		$('.user-description').hide();
		$('.user-stats').fadeIn();
	});

	$('.user-about-link').on('click', function(){
		$('.user-stats').hide();
		$('.user-description').fadeIn();
	});
	
});	
