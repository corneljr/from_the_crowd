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
	 if ($('.pagination').length) {
    $(window).scroll(function() {
      var url = $('.pagination span.next').children().attr('href');
      if (url && $(window).scrollTop() > $(document).height() - $(window).height() - 50) {
        $('.pagination').text("Fetching more products...");
        return $.getScript(url);
      }
    });
  }
  $('#top-rated').fadeOut();
  $('#most-discussed').fadeOut();
	 
});