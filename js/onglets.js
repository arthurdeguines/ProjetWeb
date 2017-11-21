$(function() {
	$('#creer').hide();
    $('#categorie').hide();
    $('#contact').hide();
    $('#Div_Filtre').hide();

    $('#creerbtn').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-6 btn btn-warning');
        $('#recettebtn').addClass('col-2 btn btn-light');
        $('#contactbtn').addClass('col-2 btn btn-light');

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-4 btn btn-light');
        $('#Filtre').addClass('col-4 btn btn-light');

        $('#creer').show();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').hide();

        $('#Div_Filtre').hide();

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

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-4 btn btn-light');
        $('#Filtre').addClass('col-4 btn btn-light');

        $('#creer').hide();
        $('#categorie').show();
        $('#contact').hide();
        $('#recette').hide();

        $('#Div_Filtre').hide();

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

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-4 btn btn-light');
        $('#Filtre').addClass('col-4 btn btn-light');

        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').show();
        $('#recette').hide();

        $('#Div_Filtre').hide();

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

        $('#Div_Filtre').hide();

    });

    $('#IdeeJour').click(function(){

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-6 btn btn-warning');
        $('#Filtre').addClass('col-2 btn btn-light');

        $('#Div_Filtre').hide();
    });

    $('#Filtre').click(function() {

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-2 btn btn-light');
        $('#Filtre').addClass('col-6 btn btn-warning');

        $('#Div_Filtre').show();
    });

});
