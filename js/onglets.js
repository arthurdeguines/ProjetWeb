$(function() {
	$('#creer').hide();
    $('#categorie').hide();
    $('#contact').hide();

    $('#creerbtn').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-6 btn btn-warning');
        $('#recettebtn').addClass('col-2 btn btn-light');
        $('#contactbtn').addClass('col-2 btn btn-light');

        $('#creer').show();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').hide();
    });
    $('#categoriebtn').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-6 btn btn-warning');
        $('#creerbtn').addClass('col-2 btn btn-light');
        $('#recettebtn').addClass('col-2 btn btn-light');
        $('#contactbtn').addClass('col-2 btn btn-light');



        $('#creer').hide();
        $('#categorie').show();
        $('#contact').hide();
        $('#recette').hide();

    });
    $('#contactbtn').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-2 btn btn-light');
        $('#recettebtn').addClass('col-2 btn btn-light');
        $('#contactbtn').addClass('col-6 btn btn-warning');

        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').show();
        $('#recette').hide();

    });
    $('#recettebtn').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-2 btn btn-light');
        $('#recettebtn').addClass('col-6 btn btn-warning');
        $('#contactbtn').addClass('col-2 btn btn-light');

        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').show();

    });
});
