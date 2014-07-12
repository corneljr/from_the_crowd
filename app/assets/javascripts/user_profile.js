$(document).ready(function() {
	$('.user-stats-link').on('click', function(){
		$(this).css({'backgroundColor':'black', 'color':'white'})
		$('.user-about-link').css({'backgroundColor':'white','color':'black'})
		$('.user-description').hide();
		$('.user-stats').fadeIn();
	});

	$('.user-about-link').on('click', function(){
		$(this).css({'backgroundColor':'black', 'color':'white'})
		$('.user-stats-link').css({'backgroundColor':'white','color':'black'})
		$('.user-stats').hide();
		$('.user-description').fadeIn();
	});
	
});	
