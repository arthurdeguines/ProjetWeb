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
			$titretab = explode(" ", strtolower ($row["titre"]));
			$recettetab = explode(" ", strtolower ($row["recette_text"]));
			$corel = compareCorel($recherchetab, $titretab,5);
			$corel += compareCorel($recherchetab,$recettetab,1);
			$reqinsert = "UPDATE `recette` set tri = ".$corel." where id = ".$row["id"];
    		$resinsert = $mysqli->query($reqinsert);

      }
    }
 else {
    echo "0 results";
}


}
if(isset($_POST['tout'])){
	$mysqli = mysqli_connect("localhost", "root", "", "projetweb");
   	$mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
	$reqinsert = "UPDATE `recette` set tri = 1";
    $resinsert = $mysqli->query($reqinsert);
}
if(isset($_POST['entree'])){
	$mysqli = mysqli_connect("localhost", "root", "", "projetweb");
   	$mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
	$requn = "UPDATE `recette` set tri = 0 where id_type<>1";
    $resun = $mysqli->query($requn);
    $reqdeux = "UPDATE `recette` set tri = 1 where id_type=1";
    $resdeux = $mysqli->query($reqdeux);
}
if(isset($_POST['plat'])){
	$mysqli = mysqli_connect("localhost", "root", "", "projetweb");
   	$mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
	$requn = "UPDATE `recette` set tri = 0 where id_type<>2";
    $resun = $mysqli->query($requn);
    $reqdeux = "UPDATE `recette` set tri = 1 where id_type=2";
    $resdeux = $mysqli->query($reqdeux);
}
if(isset($_POST['dessert'])){
	$mysqli = mysqli_connect("localhost", "root", "", "projetweb");
   	$mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
	$requn = "UPDATE `recette` set tri = 0 where id_type<>3";
    $resun = $mysqli->query($requn);
    $reqdeux = "UPDATE `recette` set tri = 1 where id_type=3";
    $resdeux = $mysqli->query($reqdeux);
}

function compareCorel($stringsearch, $stringbdd,$importance){
	$coef = 0;
for($i=0;$i<count($stringsearch);$i++){
	for($j=0;$j<count($stringbdd);$j++){
	if(($stringsearch[$i] === $stringbdd[$j])){
			$coef+=$importance;
	}
	
}
}return $coef;
}

 header('Location: http://localhost/ProjetWeb/ProjetWeb/?rech=1');
?>