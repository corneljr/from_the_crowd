var container = $('#articles');
container.imagesLoaded(function(){
  container.masonry({
    itemSelector : '.article-card',
    isFitWidth: true,
  }).imagesLoaded(function() {
    $(this).masonry('reload');
  });
});

$(document).ready(function(){
	
	$('#vote_quality').change( function() {
		var value = $('#vote_quality').val();
		$('.form-value').html('<p>' + value + '</p>');
	});
	
});