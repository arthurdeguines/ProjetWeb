$(function() {
	$('#creer').hide();
    $('#categorie').hide();
    $('#contact').hide();
    $('#unerecette').hide();
    $('#categoriebtn').removeClass();
    $('#creerbtn').removeClass();
    $('#recettebtn').removeClass();
    $('#contactbtn').removeClass();
    $('#Filtre').removeClass();
    $('#recettebtn').addClass('col-4 btn btn-warning');
    $('#categoriebtn').addClass('col-2 btn btn-light');
    $('#creerbtn').addClass('col-2 btn btn-light');
    $('#contactbtn').addClass('col-2 btn btn-light');
    $('#Filtre').addClass('col-3 btn btn-warning').text('LES RECETTES');
    $('#IdeeJour').addClass('btn btn-light').html('<img src="idée.png" width="25" height="25" id="lg_idee"/>');

    $('#creerbtn').click(function(){
        
        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-4 btn btn-warning');
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

        $('#categoriebtn').addClass('col-4 btn btn-warning');
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
        $('#contactbtn').addClass('col-4 btn btn-warning');

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
        $('#IdeeJour').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-2 btn btn-light');
        $('#recettebtn').addClass('col-4 btn btn-warning');
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
    $('#recettebtn').click(function(){

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();

        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-2 btn btn-light');
        $('#recettebtn').addClass('col-4 btn btn-warning');
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
        $('#listerecette').hide();
         $('#unerecette').show();

        $('#IdeeJour').addClass('col-3 btn btn-warning').text('L\'IDEE DU JOUR');
        $('#Filtre').addClass('btn btn-light').html('<img src="assiette.png" width="25" height="25" id="lg_recette"/>');

        $('#droptype').hide();
        $('#dropfiltre').hide();
        
    });

    $('#Filtre').click(function() {

        $('#IdeeJour').removeClass();
        $('#Filtre').removeClass();
        $('#unerecette').hide();
        $('#listerecette').show();

        $('#categoriebtn').removeClass();
        $('#creerbtn').removeClass();
        $('#recettebtn').removeClass();
        $('#contactbtn').removeClass();


        $('#categoriebtn').addClass('col-2 btn btn-light');
        $('#creerbtn').addClass('col-2 btn btn-light');
        $('#recettebtn').addClass('col-4 btn btn-warning');
        $('#contactbtn').addClass('col-2 btn btn-light');

        $('#IdeeJour').addClass('btn btn-light').html('<img src="idée.png" width="25" height="25" id="lg_idee"/>');
        $('#Filtre').addClass('col-3 btn btn-warning').text('LES RECETTES');

        $('#droptype').show();
        $('#dropfiltre').show();

        



        $('#Div_Filtre').show();
    });

    $('#creerbtnmin').click(function(){

        $('#creer').show();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').hide();



    });
    $('#categoriebtnmin').click(function(){

    
        $('#creer').hide();
        $('#categorie').show();
        $('#contact').hide();
        $('#recette').hide();




    });
    $('#contactbtnmin').click(function(){

        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').show();
        $('#recette').hide();

  
    });

    $('#recettebtnmin').click(function(){

    

        $('#creer').hide();
        $('#categorie').hide();
        $('#contact').hide();
        $('#recette').show();



    });
});
