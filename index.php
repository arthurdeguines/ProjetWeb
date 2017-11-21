<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">        
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" media="screen and (max-width: 640px)" href="styles.css" type="text/css" />
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/style_contacts.css" rel="stylesheet">
    <script src="js/contacts_js.js"></script>    
    <script src="js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="js/connectionenregistrer.js"></script>
    <script type="text/javascript" src="js/onglets.js"></script>

  </head>
  <body>
    <?php session_start(); ?>
    <br>
    <div class="container">
      <div class="row">
        <div class="col-lg-2">Logo</div>
        <form class=" col-lg-8 flexsearch--form" action="#" method="post">
            <div class="col-lg-12 flexsearch--input-wrapper">
                <input class="flexsearch--input" type="search" placeholder="search">
                <input class="flexsearch--submit" type="submit" value="&#10140;"/>
            </div>   
        </form>     
           
        <?php if ( isset ($_SESSION['session'])): ?>
            <form method="post" class ="col-2" action ='php/deco.php' >
                <input type="submit" value="Déconnection" class = "btn btn-light" ></input>
            </form>
        <?php else: ?> 
            <button class = "col-lg-2 btn btn-light" onclick="document.getElementById('id01').style.display='block'" style="width:auto;"><img class ="col-4" src="1.png"></button>
        <?php endif; ?>
        
        </div>
        <div id="id01" class="modal">
          <div class="modal-content animate" >
            
            <div class="imgcontainer">
              <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>
        
            <div class="container">

                <button class="btn btn-light" id="connectionbtn">Connection</button>
                <button class="btn btn-light" id="enregistrerbtn">Enregistrer</button>
                <br>
        
            <form id="connection" method="post" action ='php/connection.php' >
              <label><b>Login</b></label>
              <input  class ="input" type="text" placeholder="Enter Username" name="pseudo" required>
              <label><b>Mot de passe</b></label>
              <input  class ="input" type="password" placeholder="Enter Password" name="pass" required><br><br><br>
              <button name="connexion" value="Connexion" class ="btn btn-success validerbtn col-2">Valider</button>
              <button type="button" onclick="document.getElementById('id01').style.display='none'" class="btn btn-danger col-2">Annuler</button><br>
              <span class="col-2"> <a href="#">Mot de passe oublié?</a></span>
              
            </form>

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
            
<?php endif; ?>


<!-- Onglets -->
<br>
        <nav class="col-12">
          <button type="button" display="hide" class="col-3 btn btn-light" id="creerbtn">Créer
            <img id ="img1" class ="col-3" src="1.png" style = "display :none"> 
          <button type="button" class="col-3 btn btn-light" id="recettebtn">Nos recettes
              <img class ="col-3" src="1.png" style = "display :none"> 
          <button type="button" class="col-3 btn btn-light" id="categoriebtn">Catégorie
              <img class ="col-3" src="1.png" style = "display :none"> 
          <button type="button" class="col-3 btn btn-light" id="contactbtn">Contact
              <img class ="col-3" src="1.png" style = "display :none"> 
        </nav>
       
    

</div>

<!-- Page Créer une recette -->

<div id="creer">
  <h1> Créer </h1>
  <form  method="post" action ='php/insertRecette.php'>
      
    <div class="formgroup" >
        <label class ="disblock" for="name">Titre</label>
        <input class ="disblock col-9 input" type="text" id="name" name="titre" />
    </div>
    
    <div class="formgroup" >
        <label class ="disblock" for="email">Image</label>
        <input class ="disblock col-9 input" type="text" id="email" name="img" />
    </div>
        <div class="formgroup" >
        <label class ="disblock" for="email">Temps Cuisson</label>
        <input class ="disblock col-9 input" type="text" id="email" name="temps" />
    </div>

        <div class="formgroup" id="email-form">
        <label class ="disblock" for="email">Difficulté</label>
        <input class ="disblock col-9 input" type="text" id="email" name="difficulte" />
    </div>
    <div class="formgroup" id="message-form">
        <label class ="disblock" for="message">Recette</label>
        <textarea class ="disblock input col-9" id="message" name="recette"></textarea>
    </div>
    
      <input class ="disblock input btnorange" type="submit" name="envoiRecette" value="Envoyer la recette!" />
    </form>
</div>

<!-- Page Recette -->

<div id="recette">
    <div class="row">
    <div class="col-3"></div>
    <div class="col-9 btn-group" role="group" id="ButtonGroup" >

      <button type= "button" class= "col-4 btn btn-light" id="IdeeJour">
      L'IDEE DU JOUR 
      </button>

      <button type= "button" class= "col-4 btn btn-light" id="Filtre">
      LES RECETTES
      </button>

      
      

    </div>

</div>
 

   <div class="row" id="Div_Filtre">
    <div class="col-3"></div>
    <select class="col-2 form-control">
      <option value="option-1"> Type </option>
      <option value="option-2"> Occasions Particulières </option>
      <option value="option-3"> Pertinence </option>
      <option value="option-4"> Visualisation </option>
    </select>
    <div class="col-7"></div>
  </div>
  
  <h1> Recettes!</h1>

  <div class="row">

  <!--Affichage des recettes -->

  <?php 
  require("php/fonctions.php");
    $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
                $req = "Select * from recette";
                $res = $mysqli->query($req);
if ($res->num_rows > 0) {
    // output data of each row
    while($row = $res->fetch_assoc()) {
          echo "<div class=\"recette col-6\">"; 
          echo "<p class=\"temps_cuisson\">".$row["temps_cuisson"]." minutes</p>";
          echo "<img src=\"".$row["url_img"]."\" class=\"img_recette\"/>";
          echo "<h2>".$row["titre"]."</h2> <br>".troncText(nl2br($row["recette_text"])); //nl2br sert à mettre tout le text comme on l'a mis dans la bdd
          echo "</div>";
      }
    }
 else {
    echo "0 results";
}
  ?>
</div>


</div>


<!-- Page Recette -->
<div id="categorie">
  <h1> Categorie</h1>
    <?php 
    $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
    $req = "Select * from periode";
    $res = $mysqli->query($req);
if ($res->num_rows > 0) {
    // output data of each row
    while($row = $res->fetch_assoc()) {
          echo "<div class=\"categorie col-12 containercategorie\">"; 
          echo "<img src=\"".$row["img"]."\" class=\" image  \"/>";
          echo "<div class=\" overlay text\">".$row["libelle"]."</div>";
          echo "</div>";
      }
    }
 else {
    echo "0 results";
}
  ?>
</div>


<!-- Page Contact -->

<div id="contact">
  <div class ="col-12" id="cform">
    
    <div class="fruit" id="fruit"></div>
    <div class="fruit" id="fruit2"></div>
    
    <form id="contactform" method="post" id="connection" action ='php/envoiMail.php' >
    
    <div class="formgroup" id="name-form">
        <label class ="disblock" for="name">Votre nom*</label>
        <input class ="disblock col-9 input" type="text" id="name" name="name" />
    </div>
    
    <div class="formgroup" id="email-form">
        <label class ="disblock" for="email">E-mail*</label>
        <input class ="disblock col-9 input" type="email" id="email" name="email" />
    </div>
    
    <div class="formgroup" id="message-form">
        <label class ="disblock" for="message">Votre message</label>
        <textarea class ="disblock input col-9" id="message" name="message"></textarea>
    </div>
    
      <input class ="disblock input btnorange" type="submit" value="Envoyer votre message!"  />
    </form>
    </div>
</div>
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