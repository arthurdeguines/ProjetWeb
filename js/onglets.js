$(function() {
	$('#creer').hide();
    $('#categorie').hide();
    $('#contact').hide();
    $('#creerbtn').click(function(){
        $('#creer').show();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').hide();
    });
    $('#categoriebtn').click(function(){
        $('#creer').hide();
        $('#categorie').show();
        $('#contact').hide();
        $('#recette').hide();

    });
    $('#contactbtn').click(function(){
        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').show();
        $('#recette').hide();

    });
    $('#recettebtn').click(function(){
        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').show();

    });
});
