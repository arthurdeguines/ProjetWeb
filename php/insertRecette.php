<?php
if(isset($_POST['envoiRecette'])) { // si le bouton "envoiRecette" est appuyé
echo 'test';
    $titre = htmlentities($_POST['titre'], ENT_QUOTES, "ISO-8859-1"); // le htmlentities() passera les guillemets en entités HTML, ce qui empêchera les injections SQL
    $img = htmlentities($_POST['img'], ENT_QUOTES, "ISO-8859-1");
    $temps = htmlentities($_POST['temps'], ENT_QUOTES, "ISO-8859-1"); // le htmlentities() passera les guillemets en entités HTML, ce qui empêchera les injections SQL
    $difficulte = htmlentities($_POST['difficulte'], ENT_QUOTES, "ISO-8859-1");
    $recette = htmlentities($_POST['recette'], ENT_QUOTES, "ISO-8859-1"); // le htmlentities() passera les guillemets en entités HTML, ce qui empêchera les injections SQL
    
  $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
    $req = "INSERT INTO `recette` (id,url_img,titre,date_creation,temps_cuisson,status,difficulte,id_utilisateur,id_categorie,id_type,recette_text)  VALUES
    	(null, '$img' , '$titre' , '2017-11-11' , '$temps', 0, $difficulte,1,1,2,'$recette');";
    $res = $mysqli->query($req);
}
  header('Location: http://localhost/ProjetWeb/ProjetWeb/');
?>    