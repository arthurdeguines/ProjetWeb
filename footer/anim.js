$(function () {
	$('.logoOverFacebook').hide();
	$('.logoOverTwitter').hide();
	$('.logoOverYoutube').hide();
	$('footer').hide();
	$('.footerOverBefore').hide();

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

	$('.footerBefore').mouseover(function(){

		$('.footerOverBefore').show();
		$('.footerBefore').hide();
	});
	$('.footerOverBefore').mouseout(function(){
		$('.footerBefore').show();
		$('.footerOverBefore').hide();
	});

	$('.footerOverBefore').click(function(){
		$('footer').show('slow');
		$('.footerBefore').hide();

	});

	$('footer').mouseover(function(){
		$('.footerBefore').hide();
	});

	$('.footerAfter').click(function(){
		$('footer').hide('slow');
		$('.footerBefore').show();

		$('footer').mouseout(function(){
			$('.footerBefore').show();
		})
	})
});