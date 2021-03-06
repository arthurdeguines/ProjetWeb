<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">        

    <link href="css/reset-recette.css" rel="stylesheet">
    <link href="css/style-contacts.css" rel="stylesheet">
    <link href="css/style-recette.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" media="screen and (min-width: 1000px) " href="css/styles-pc.css" type="text/css" />
    <link rel="stylesheet" media="screen and (max-width: 640px)" href="css/styles-portable.css" type="text/css" />
    <link rel="stylesheet" media="screen and (min-width: 640px) and (max-width: 1000px)" href="css/styles-tablette.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/footer.css">

    <script src="js/modernizr.js"></script> 
    <script src="js/contacts_js.js"></script>    
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/velocity.min.js"></script>   
    <script src="js/showrecette.js"></script>
    <script src="js/main-recette.js"></script>
    <script src="js/facebook.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/connectionenregistrer.js"></script>
    <script type="text/javascript" src="js/onglets.js"></script>
    <script type="text/javascript" src="js/footeranim.js"></script>
    <link rel="shortcut icon" href="img/favicon.ico">

    

  </head>
  <body>

    <?php session_start(); ?>
    <br>
    <div class="container">
      <div class="row">
        <div class="col-lg-2">
        <img class ="logo1 imgauto" src="img/logo1.png">
        <img class ="logo2 imgauto" src="img/logo2.png">
        <?php if ( isset ($_SESSION['session'])): ?>
            <form method="post" action ='php/deco.php' >
                <input type="submit" value="Déconnection" class = " col-lg-2 btn btn-light portable" ></input>
            </form>
        <?php else: ?> 
            <button class = "col-lg-2 btn btn-light portable" onclick="document.getElementById('id01').style.display='block'" ><img class ="imgauto" src="img/login2.png"></button>
        <?php endif; ?>
        </div>

        <form class=" col-lg-8 flexsearch--form" method="post" action ='php/recherche.php'>
            <div class="col-lg-12 flexsearch--input-wrapper">
                <input class="flexsearch--input" type="search" placeholder="search" name="search">
                <input class="flexsearch--submit" type="submit" value="&#10140;" name="rechercher" />
            </div>   
        </form>     
           
        <?php   if( isset($_SESSION['pseudo'])):?>

            <form method="post" class ="col-2 pc" action ='php/deco.php' >
                <input type="submit" value="Déconnection" class = "btn btn-light" ></input>
            </form>
        <?php else: ?> 
            <button class = "col-lg-2 btn btn-light pc" onclick="document.getElementById('id01').style.display='block'"><img class ="imgauto" src="img/login.png"></button>
        <?php endif; ?>
        
        </div>
      </div>
        <div id="id01" class="modal">
          <div class="modal-content animate" >
            
            <div class="imgcontainer">
              <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
            <div class="container">
            <?php       
            require('php/gpConfig.php');
            ?>
                <button class="btn btn-light" id="connectionbtn">Connection</button>
                <button class="btn btn-light" id="enregistrerbtn">Enregistrer</button>
                <br>

                
<div >

            <form id="connection" method="post" action ='php/connection.php' >
           
        

              <label><b>Login</b></label>
              <input  class ="input" type="text" placeholder="Enter Username" name="pseudo" required>
              <label><b>Mot de passe</b></label>
              <input  class ="input" type="password" placeholder="Enter Password" name="pass" required><br><br><br>
              <button name="connexion" value="Connexion" class ="btn btn-success validerbtn ">Valider</button>
              <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-danger ">Annuler</button><br>
              <span class="col-2"> <a href="#">Mot de passe oublié?</a></span>
              
            </form>
          </div>
            <form id = "inscription" method="post" action ='php/inscription.php'>

              <label><b>Login</b></label>
              <input  class ="input" type="text" placeholder="Enter Username" name="inscription_login" required>

              <label><b>Email</b></label>
              <input class ="input" type="text" placeholder="Enter Username" name="inscription_email" required>
        
              <label><b>Mot de passe</b></label>
              <input class ="input" type="password" placeholder="Enter Password" name="inscription_password" required>

              <label><b>Retapez le mot de passe</b></label>
              <input  class ="input" type="password" placeholder="Enter Password" name="inscription_password2" required><br><br><br>

              <button name="inscription" value="inscription" class ="btn btn-success validerbtn col-2" type="submit">Valider</button>
              <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-danger col-2">Annuler</button><br>
              <span class="col-2"> <a href="#">Mot de passe oublié?</a></span>
            </form>
        </div>

        </div>
    </div>

<!--Gestion des erreurs de connection/ inscription -->
    <br>
      
<?php if (isset($_SESSION['erreur']) && $_SESSION['erreur'] == 1): ?>
            
        <div class= "alert alert- col-12" role ="alert"> Erreur de connexion à la base de données. </div>

<?php elseif (isset($_SESSION['erreur']) && $_SESSION['erreur'] == 2): ?> 

        <div class= "alert alert-danger col-12" role ="alert"> Le pseudo ou le mot de passe est incorrect, le compte n'a pas été trouvé. </div>

<?php elseif (isset($_SESSION['erreur']) && $_SESSION['erreur'] == 3): ?> 

        <div class= "alert alert-danger col-12" role ="alert"> Les mots de passe sont differents. </div>

<?php elseif (isset($_SESSION['erreur']) && $_SESSION['erreur'] == 4): ?> 

        <div class= "alert alert-danger col-12" role ="alert"> Pseudo déjà utilisé. </div>

<?php elseif (isset($_SESSION['erreur']) && $_SESSION['erreur'] == 5): ?> 

        <div class= "alert alert-danger col-12" role ="alert"> Format d'email non valide. </div>

<?php elseif (isset($_SESSION['erreur']) && $_SESSION['erreur'] == 0): ?> 

        <div class="alert alert-success col-12" role="alert"> Vous êtes connecté. </div>

            
<?php endif; ?>



<!-- Onglets -->
<br>

        <nav class="col-12 navmenu">
        <?php 
        if( isset($_SESSION['pseudo'])):?>
      
      <button type="button" class="col-3 btn btn-light imgbtn" id="creerbtnmin"><img class ="imgbtn" src="img/plus.png"> 
      <?php else:?>
         <button type="button" class="col-3 btn btn-light imgbtn" onclick="document.getElementById('id01').style.display='block'" ><img class ="imgbtn" src="img/plus.png">
      
         <?php
        endif;
        ?>
           <button type="button" class="col-3 btn btn-light imgbtn" id="recettebtnmin"><img class ="imgbtn" src="img/recette.png"> 
            <button type="button" class="col-3 btn btn-light imgbtn" id="categoriebtnmin"><img class ="imgbtn" src="img/categorie.png"> 
            <button type="button" class="col-3 btn btn-light imgbtn"  id="contactbtnmin"><img class ="imgbtn" src="img/contact.png">

<?php 
  if( isset($_SESSION['pseudo'])):?>

  <button type="button" disp="col-3 btn btn-light btnimg" id="creerbtn">Créer
<?php else:?>
   <button type="button" class="col-3 btn btn-light btnimg" onclick="document.getElementById('id01').style.display='block'" >Créer

<?php
endif;
?>

            
            <button type="button" class="col-3 btn btn-light btnimg" id="recettebtn">Nos recettes
            <button type="button" class="col-3 btn btn-light btnimg" id="categoriebtn">Catégorie
            <button type="button" class="col-3 btn btn-light btnimg" id="contactbtn">Contact
        </nav>

       
    


<!-- Page Créer une recette -->



<div id="creer">
<h1> Créer!</h1>

  <form  method="post" action ='php/insertRecette.php'>
      
  <div class="row" id="name-form">

        <label class ="disblock" for="name">Titre</label>
        <input class =" col-9 input" type="text" id="name" name="titre" />
    </div>
    
    <div class="row">
    
        <label class ="disblock" for="email">Image</label>
        <input class =" col-9 input" type="text" id="email" name="img" />
    </div>
    <div class="row">

        <label class ="disblock" for="email">Temps Cuisson</label>
        <input class =" col-9 input" type="text" id="email" name="temps" />
    </div>

        <div class="row" id="email-form">
        <label class ="disblock" for="email">Difficulté</label>
        <input class =" col-9 input" type="text" id="email" name="difficulte" />
    </div>
    <div class="row" id="message-form">
        <label class ="disblock" for="message">Recette</label>
        <textarea class =" input col-9" id="message" name="recette"></textarea>
    </div>
    
    
      <input  class =" input btnorange" type="submit" name="envoiRecette" value="Envoyer la recette!" />

    </form>
</div>

<!-- Page Recette -->

<div id="recette">

    <div class="row filtres">
    <div class="col-4"></div>
    <div class="col-6 btn-group filtres" role="group" id="ButtonGroup" >

      <button type= "button" class= "col-2 btn btn-light filtres" id="IdeeJour">
      L'IDEE DU JOUR 
      </button>

      <button type= "button" class= "col-2 btn btn-light filtres" id="Filtre">
      LES RECETTES
      </button>

      <div class="btn-group" role="group">
        <button class="btn btn-warning dropdown-toggle" role="group" type="button" id="droptype" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display : none">
        Type
        </button>
       
        <div class="dropdown-menu filtres" aria-labelledby="dropdownMenu2">
             <form method="post" action ='php/recherche.php' >
          <input type="submit" value="Tout" class="dropdown-item" type="button"  name="tout"/> 
          <input type="submit" value="Entrée" class="dropdown-item" type="button"  name="entree"/> 
          <input type="submit" value="Plat" class="dropdown-item" type="button"  name="plat"/> 
          <input type="submit" value="Dessert" class="dropdown-item" type="button"  name="dessert"/> 
        </form>
        </div>

      </div>

      <div class="btn-group" role="group">
        <button class="btn btn-warning dropdown-toggle" role="group" type="button" id="dropfiltre" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="display : none">
        Filtre
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
          <button class="dropdown-item" type="button"> Pertinence </button>
          <button class="dropdown-item" type="button"> Vues </button>
          <button class="dropdown-item" type="button"> Date Création </button>
        </div>
      </div>

  
    </div>

    <!-- <button class="col-2 btn btn-light dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Filtres
      </button>
      <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
        <button class="dropdown-item" type="button">Pertinence</button>
        <button class="dropdown-item" type="button">Visualisation</button>
        <button class="dropdown-item" type="button">ordre </button>
      </div> -->

</div>
 

   
  
  <h1> Recettes!</h1>


  <!--Affichage des recettes -->
  <div id="listerecette">
  <?php
require('php/recette.php');
echo afficheRecette(100);
?>
</div>
<div id = "unerecette">
  <?php
echo afficheRecette(1);
?>

</div>


</div>


<!-- Page Recette -->
<div id="categorie">
  <h1> Categorie</h1>
      <?php
require('php/categorie.php');
echo afficheCategorie();
?>

</div>


<!-- Page Contact -->


<div id="contact">
<h1> Contact!</h1>

  <div class ="col-12" id="cform">
    <div class="fruit" id="fruit"></div>
    <div class="fruit" id="fruit2"></div>
    
    <form id="contactform" method="post" id="connection" action ='php/envoiMail.php' >
    
    <div class="row" id="name-form">
        <label class ="disblock" for="name">Votre nom*</label>
        <input class ="disblock col-9 input" type="text" id="name" name="name" />
    </div>
    
    <div class="row" id="email-form">
        <label class ="disblock" for="email">E-mail*</label>
        <input class ="disblock col-9 input" type="email" id="email" name="email" />
    </div>
    
    <div class="row" id="message-form">
        <label class ="disblock" for="message">Votre message</label>
        <textarea class ="disblock input col-9" id="message" name="message"></textarea>
    </div>
    
      <input class ="disblock input btnorange" type="submit" value="Envoyer votre message!"  />
    </form>
    </div>
</div>

    <div class = "footerBefore" >
      <a class="dropDeco" href="#" onclick="return false;"><img src="fleche-lign.png" width="45px" height="43px"></a>

    </div>
    
    <footer>

    <footer>
      <div class="row">
        <div class="margeLeftRight">
          
        </div>

        <div class="titleAbove">
          SUIVEZ NOUS !
        </div>

        <div class="margeLeftRight">
          
        </div>
      </div>

      <div class="row">
          
        
        <div class="margeLeftRight">
          

          <div class = "footerAfter" >
            <a class="dropDecoFacebook" href="#" onclick="return false;"><img src="fleche-lign.png" width="45px" height="43px"></a>

          </div>


        </div>
        <div class="centerFooter row" >
          
          <div class="logoFacebook">
             f 

          
          </div>
          <a class="dropDeco" href="https://www.facebook.com/Lidée-recette-143263643108200"> 
          <div class="logoOverFacebook">
              f   
          </div>
        </a>

          <div class="logoTwitter">
            <img src="twitterFirst.png" width="40px" height="40px">
          </div>
          
          <a class="dropDeco" href="https://twitter.com/LideeRecette" >
            <div class="logoOverTwitter">
              <img src="twitter.png" width ="45px" height="45px"> 
            </div>
          </a>

          <div class="logoYoutube">
            <img src="youtubeFirst.png" width="40px" height="40px">
          </div>

          <div class="logoOverYoutube">
            <a class="dropDeco" href="https://www.youtube.com/channel/UCViIUnYaj3XeQrwiBZ-He2Q?view_as=subscriber"><img src="youtube.png" class="pngyoutube" widtrh="55px" height="55px"></a>
          </div>
        </div>
        <div class="margeLeftRight">
        </div>
        

      </div>
      
    </footer>


  <?php unset($_SESSION['erreur']); ?>
    <script>
            // Get the modal
            var modal = document.getElementById('id01');
            
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
            var modal2 = document.getElementById('id02');
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal2) {
                modal2.style.display = "none";
    }
}
    </script>
  </body>
</html>