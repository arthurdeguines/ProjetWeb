<?php
if(isset($_POST['rechercher'])) {
	$mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
    $recherche =  htmlentities($_POST['search'], ENT_QUOTES, "ISO-8859-1");
                $req = "Select * from recette";
                $res = $mysqli->query($req);
                


if ($res->num_rows > 0) {
    // output data of each row

    while($row = $res->fetch_assoc()) {
    		$recherchetab = explode(" ", $recherche);
			$titretab = explode(" ", $row["titre"]);
			$recettetab = explode(" ", $row["recette_text"]);
			$corel = compareCorel($recherchetab,$titretab,5);
			$corel += compareCorel($recherchetab,$recettetab,1);
          /*echo "<div class=\"recette col-6\">"; 
          echo "<p class=\"temps_cuisson\">".$row["temps_cuisson"]." minutes</p>";
          echo "<img src=\"".$row["url_img"]."\" class=\"img_recette\"/>";
          echo "<h2>".$row["titre"]."</h2> <br>".troncText(nl2br($row["recette_text"])); //nl2br sert à mettre tout le text comme on l'a mis dans la bdd
          echo "</div>";*/
    $reqinsert = "UPDATE `recette` set tri = ".$corel." where id = ".$row["id"];
    $resinsert = $mysqli->query($reqinsert);
      }
    }
 else {
    echo "0 results";
}


}
function compareCorel($stringsearch, $stringbdd,$importance){
	$coef = 0;
for($i=0;$i<count($stringsearch);$i++){
	for($j=0;$j<count($stringbdd);$j++){
	if(($stringsearch[$i] === $stringbdd[$j])){
			$coef+=$importance;
	}
	
}
}

return $coef;
}
 header('Location: http://localhost/ProjetWeb/ProjetWeb/');
?>