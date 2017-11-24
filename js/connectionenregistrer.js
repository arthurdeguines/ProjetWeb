$(function() {
	$('#inscription').hide();
    $('#connectionbtn').click(function(){
        $('#connection').show();
        $('#inscription').hide();
    });
    $('#creerbtn').click(function(){
        $('#connection').show();
        $('#inscription').hide();
    });
    $('#enregistrerbtn').click(function(){
        $('#inscription').show();
         $('#connection').hide();
    });
});
