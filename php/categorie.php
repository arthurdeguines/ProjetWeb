<?php 
    
function afficheCategorie(){
  $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
    $req = "Select * from categorie";
    $res = $mysqli->query($req);
if ($res->num_rows > 0) {
    // output data of each row
    while($row = $res->fetch_assoc()) {
      echo '<form>';
       echo "<button onclick=\"showRecette(".$row["id"].")\" href=#\"?id=".$row["id"]."\" class=\"cd-trigger titre\">".$row["titre"];
          echo "<div class=\"categorie col-12 containercategorie\">"; 
          echo "<img src=\"".$row["img"]."\" class=\" image  \"/>";
          echo "<div class=\" overlay text\">".$row["libelle"]."</div>";
          echo "</div>";
          echo "</a></button>";
          echo '</form>';
      }
    }
 else {
    echo "0 results";
}
}
  ?>
