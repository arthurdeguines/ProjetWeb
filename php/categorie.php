<?php 
    
function afficheCategorie(){
  $mysqli = mysqli_connect("auth-db128.hostinger.fr", "u774378556_arthu", "azerty", "u774378556_udev");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
    $req = "Select * from categorie";
    $res = $mysqli->query($req);
if ($res->num_rows > 0) {
    // output data of each row
    while($row = $res->fetch_assoc()) {
      echo '<form>';
       
          echo "<div class=\"categorie col-12 containercategorie\">"; 
          echo "<a href=\"./?cat=".$row["id"]."\">";
          echo "<img src=\"".$row["img"]."\" class=\" image  \"/>";
          echo "</button>";
          echo "<div class=\" overlay text\">".$row["libelle"]."</div>";
          echo "</div>";
          echo "</a>";
          echo '</form>';
      }
    }
 else {
    echo "0 results";
}
}
  ?>
