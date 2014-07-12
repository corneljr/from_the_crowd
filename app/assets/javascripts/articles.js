
// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$('.article-card').find('h3').hide();
$('.article-card').find('p').hide();
$('.article-card').on('mouseenter', function() {
		$(this).find('h3').fadeIn(500);
		$(this).find('h3').css({'color': 'white', 'opacity':'1', 'background-color':'black'});
		$(this).find('p').fadeIn(500);
});
$('.article-card').on('mouseleave', function() {
		$(this).find('h3').fadeOut(200);
		$(this).find('p').fadeOut(200);
});

