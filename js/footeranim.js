$(function () {
	$('.logoOverFacebook').hide();
	$('.logoOverTwitter').hide();
	$('.logoOverYoutube').hide();
	$('footer').hide();
	$('.footerOverBefore').hide();
	$('.footerBefore').show();

	$('.logoFacebook').mouseover(function(){

		$('.logoOverFacebook').show();
		$('.logoFacebook').hide();
	});
	$('.logoOverFacebook').mouseout(function(){
		$('.logoFacebook').show();
		$('.logoOverFacebook').hide();
	});


	$('.logoTwitter').mouseover(function(){

		$('.logoOverTwitter').show();
		$('.logoTwitter').hide();
	});
	$('.logoOverTwitter').mouseout(function(){
		$('.logoTwitter').show();
		$('.logoOverTwitter').hide();
	});


	$('.logoYoutube').mouseover(function(){

		$('.logoOverYoutube').show();
		$('.logoYoutube').hide();
	});
	$('.logoOverYoutube').mouseout(function(){
		$('.logoYoutube').show();
		$('.logoOverYoutube').hide();
	});

	



	$('.footerBefore').click(function(){
			$('footer').show('slow');
			$('.footerBefore').hide();
			
	});

	

	$('.footerAfter').click(function(){
		$('footer').hide('slow');
		$('.footerBefore').show();
		

	});


});