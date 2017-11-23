  <?php 
  function afficheRecette(){
  require("php/fonctions.php");
  $recette = "";
    $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
                $req = "Select * from recette LIMIT 0,10";
                $res = $mysqli->query($req);
if ($res->num_rows > 0) {
    // output data of each row
    while($row = $res->fetch_assoc()) {
          $recette.= "<div class=\"recette col-6\">"; 
          $recette.= "<p class=\"temps_cuisson\">".$row["temps_cuisson"]." minutes</p>";
          $recette.= "<img src=\"".$row["url_img"]."\" class=\"img_recette\"/>";
          $recette.= "<h2>".$row["titre"]."</h2> <br>".troncText(nl2br($row["recette_text"])); //nl2br sert à mettre tout le text comme on l'a mis dans la bdd
          $recette.= "</div>";
      }
    }
 else {
    $recette.= "0 results";
}
return $recette;
}
  ?>