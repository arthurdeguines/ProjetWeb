<?php
/*
Page: inscription.php
*/
session_start(); // à mettre tout en haut du fichier .php, cette fonction propre à PHP servira à maintenir la $_SESSION
if(isset($_POST['inscription'])) { // si le bouton "Connexion" est appuyé
    
     // les champs sont bien posté et pas vide, on sécurise les données entrées par le membre:
    $Pseudo = htmlentities($_POST['inscription_login'], ENT_QUOTES, "ISO-8859-1"); // le htmlentities() passera les guillemets en entités HTML, ce qui empêchera les injections SQL
    $MotDePasse = htmlentities($_POST['inscription_password'], ENT_QUOTES, "ISO-8859-1");
    $MotDePasse2 = htmlentities($_POST['inscription_password2'], ENT_QUOTES, "ISO-8859-1");
    $Email = htmlentities($_POST['inscription_email'], ENT_QUOTES, "ISO-8859-1");
    $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $veriflog = mysqli_query($mysqli,"SELECT login FROM utilisateur WHERE login = '".$Pseudo."';");
    echo"lol1";  
    if ($MotDePasse != $MotDePasse2) {
        $_SESSION['erreur'] = 3;
        echo"lol2";
        header('Location: http://localhost/ProjetWeb/ProjetWeb/');
         }
    elseif(!$mysqli){
        $_SESSION['erreur'] = 1;
        echo"lol3";
        header('Location: http://localhost/ProjetWeb/ProjetWeb/');
        echo "Erreur de connexion à la base de données.";
        } 
        
    elseif ($veriflog == null){
        echo $veriflog;
        $_SESSION['erreur'] = 4;
        header('Location: http://localhost/ProjetWeb/ProjetWeb/'); 
    
            }
    else {
                $req = "INSERT INTO utilisateur (id, login, mdp, email, nom, prenom, id_role ) VALUES 
                (null, '$Pseudo' , '$MotDePasse' , '$Email' , null, null, 1  );";
                $res = $mysqli->query($req);
                $_SESSION['erreur'] = 0;
                header('Location: http://localhost/ProjetWeb/ProjetWeb/');
                
            }

        }

    
