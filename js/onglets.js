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

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-2 btn btn-light');
        $('#Filtre').addClass('col-2 btn btn-light');

        $('#creer').show();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').hide();

        $('#droptype').hide();
        $('#dropfiltre').hide();

        $('#Filtre').text('LES RECETTES');
        $('#IdeeJour').text('L\'IDEE DU JOUR');

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

        $('#IdeeJour').addClass('col-2 btn btn-light');
        $('#Filtre').addClass('col-2 btn btn-light');

        $('#creer').hide();
        $('#categorie').show();
        $('#contact').hide();
        $('#recette').hide();

        $('#droptype').hide();
        $('#dropfiltre').hide();

        $('#Filtre').text('LES RECETTES');
        $('#IdeeJour').text('L\'IDEE DU JOUR');


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

        $('#IdeeJour').addClass('col-2 btn btn-light');
        $('#Filtre').addClass('col-2 btn btn-light');

        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').show();
        $('#recette').hide();

        $('#droptype').hide();
        $('#dropfiltre').hide();

        $('#Filtre').text('LES RECETTES');
        $('#IdeeJour').text('L\'IDEE DU JOUR');
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

        $('#droptype').hide();
        $('#dropfiltre').hide();

        $('#Filtre').text('LES RECETTES');
        $('#IdeeJour').text('L\'IDEE DU JOUR');

    });

    $('#IdeeJour').click(function(){

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('col-4 btn btn-warning').text('L\'IDEE DU JOUR');
        $('#Filtre').addClass('btn btn-light').html('<img src="assiette.png" width="25" height="25" id="lg_recette"/>');

        $('#droptype').hide();
        $('#dropfiltre').hide();
        
    });

    $('#Filtre').click(function() {

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();

        $('#IdeeJour').addClass('btn btn-light').html('<img src="idée.png" width="25" height="25" id="lg_idee"/>');
        $('#Filtre').addClass('col-4 btn btn-warning').text('LES RECETTES');

        $('#droptype').show();
        $('#dropfiltre').show();

        



        $('#Div_Filtre').show();
    });

});
