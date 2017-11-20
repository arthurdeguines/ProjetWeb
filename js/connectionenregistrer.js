$(function() {
    
	$('#inscription').hide();
    $('#connectionbtn').click(function(){
    	console.log("coucou");
        $('#connection').show();
        $('#inscription').hide();
    });
    $('#enregistrerbtn').click(function(){
        $('#inscription').show();
         $('#connection').hide();

    });
});
