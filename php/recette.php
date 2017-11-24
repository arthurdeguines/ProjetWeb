  <?php 

  function afficheRecette(){
  $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents   
  require("php/fonctions.php");
  $recette = "";
if (isset($_GET["cat"])) {
  $req = "Select * from recette where tri <> 0 and id_categorie = ".$_GET["cat"]." order by tri DESC LIMIT 0,12";
}else{
    $req = "Select * from recette where tri <> 0 order by tri DESC LIMIT 0,12";
  }
    $res = $mysqli->query($req);
        if ($res->num_rows > 0) {
        // output data of each row
          echo "<div id =\"recettebody\" ";         
          echo "<ul class=\"cd-items cd-container\">"; 
              while($row = $res->fetch_assoc()) {
              echo "<li class=\"cd-item\">";
              echo "<img src=\"".$row["url_img"]."\" class=\" recetteimg  \" alt=\"".$row["id"]."\"/>";
              echo "<a onclick=\"showRecette(".$row["id"].")\" href=# class=\"cd-trigger titre\">".$row["titre"]."</a>";
              echo "</li>";
              echo "<div class=\"div".$row["id"]." divlol\">";
              echo "<div class=\"cd-quick-view\">";
                echo "<div class=\"cd-slider-wrapper\">";
                  echo "<ul class=\"cd-slider\">";
                    echo "<li class=\"selected\"><img src=\"".$row["url_img"]."\" class =\"recetteimg\" alt=\"Product 1\"></li>";
                  echo "</ul>";        
                echo"</div>";
                echo "<div class=\"cd-item-info\">";
                  echo "<h2>".$row["titre"]."</h2>";
                  echo "<p>".$row["recette_text"]."</p>";			
                  echo "<ul class=\"cd-item-action\">";
                  echo '<form>
                   <input id="impression" class="add-to-cart" name="impression" type="button" onclick="window.print()" value="Imprimer cette page" />
                  </form>';
                  echo "</ul>";
                echo "</div>";
                echo "<a href=\"#0\" class=\"cd-close titre\">Close</a>";
                
            echo "</div>";
            echo "</div>";
            
            }
            echo "</ul>";
            echo "</div>";

              
              }
             

                    
                       
               else {
                  echo "0 results";
              }
return $recette;
}
function getImage($id){
  $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
  $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
  $req = 'Select url_img from recette where id='.$id;
  $res = $mysqli->query($req);
  $row = $res->fetch_assoc();
  return $row["url_img"];
}

  ?>