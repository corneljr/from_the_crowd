$(document).ready( function(){
	$('.from-the-crowd').on('hover', function(){
		console.log(this);
		$(this).css({'backgroundColor':'black','color':'white'});
	});
});