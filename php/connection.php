<?php
/*
Page: connexion.php
*/
session_start(); // à mettre tout en haut du fichier .php, cette fonction propre à PHP servira à maintenir la $_SESSION
if(isset($_POST['connexion'])) { // si le bouton "Connexion" est appuyé
    // on vérifie que le champ "Pseudo" n'est pas vide
    // empty vérifie à la fois si le champ est vide et si le champ existe belle et bien (is set)
    if(empty($_POST['pseudo'])) {
        echo "Le champ Pseudo est vide.";
    } else {
        // on vérifie maintenant si le champ "Mot de passe" n'est pas vide"
        if(empty($_POST['pass'])) {
            echo "Le champ Mot de passe est vide.";
        } else {
            // les champs sont bien posté et pas vide, on sécurise les données entrées par le membre:
            $Pseudo = htmlentities($_POST['pseudo'], ENT_QUOTES, "ISO-8859-1"); // le htmlentities() passera les guillemets en entités HTML, ce qui empêchera les injections SQL
            $MotDePasse = htmlentities($_POST['pass'], ENT_QUOTES, "ISO-8859-1");
            //on se connecte à la base de données:
                $mysqli = mysqli_connect("auth-db128.hostinger.fr", "u774378556_arthu", "azerty", "u774378556_udev");
            //on vérifie que la connexion s'effectue correctement:
            if(!$mysqli){
                $_SESSION['erreur'] = 1;
                header('Location: http://localhost/ProjetWeb/ProjetWeb/');
                echo "Erreur de connexion à la base de données.";
            } else {
                // on fait maintenant la requête dans la base de données pour rechercher si ces données existe et correspondent:
                $Requete = mysqli_query($mysqli,"SELECT * FROM utilisateur WHERE login = '".$Pseudo."' AND mdp = '".$MotDePasse."'");
                // si il y a un résultat, mysqli_num_rows() nous donnera alors 1
                // si mysqli_num_rows() retourne 0 c'est qu'il a trouvé aucun résultat
                if(mysqli_num_rows($Requete) == 0) {
                    $_SESSION['erreur'] = 2;
                    header('Location: http://localhost/ProjetWeb/ProjetWeb/');
                    echo "Le pseudo ou le mot de passe est incorrect, le compte n'a pas été trouvé.";
                } else {
                    // on ouvre la session avec $_SESSION:
                    $_SESSION['session'] = 1; // la session peut être appelée différemment et son contenu aussi peut être autre chose que le pseudo
                        $_SESSION['pseudo']=1;
                    $_SESSION['erreur'] = 0;
                    echo 'Vous êtes connecté';
                    header('Location: http://localhost/ProjetWeb/ProjetWeb/');
                    exit();
                  
                }
            }
        }
    }
}
?>