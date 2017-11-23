  <?php 

  function afficheRecette(){
    $mysqli = mysqli_connect("localhost", "root", "", "projetweb");
    $mysqli->set_charset("utf8"); // Résolution des problèmes d'accents
<<<<<<< HEAD
                $req = "Select * from recette where tri <> 0 order by tri DESC  LIMIT 0,10";
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
=======
    
  require("php/fonctions.php");
  $recette = "";

    $req = "Select * from recette LIMIT 0,10";
    $res = $mysqli->query($req);
        if ($res->num_rows > 0) {
        // output data of each row
          echo "<div id =\"recettebody\">";         
          echo "<ul class=\"cd-items cd-container\">"; 
              while($row = $res->fetch_assoc()) {
                     echo "lol";     
              echo "<li class=\"cd-item\">";
              echo "<img src=\"".$row["url_img"]."\" class=\" recetteimg  \" alt=\"".$row["id"]."\"/>";
              echo "<button onclick=\"showRecette(".$row["id"].")\" href=#\"?id=".$row["id"]."\" class=\"cd-trigger titre\">".$row["titre"]."</button>";
              echo "</li>";
              echo "</ul>";
              echo "<div class=\"div".$row["id"]." divlol\">";
              echo "<div class=\"cd-quick-view\">";
                echo "<div class=\"cd-slider-wrapper\">";
                  echo "<ul class=\"cd-slider\">";
                    echo "<li class=\"selected\"><img src=\"".$row["url_img"]."\" class =\"recetteimg\" alt=\"Product 1\"></li>";
                  echo "</ul>";        
                echo"</div>";
                echo "<div class=\"cd-item-info\">";
                  echo "<h2>".$row["titre"]."</h2>";
                  echo "<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia, omnis illo iste ratione. Numquam eveniet quo, ullam itaque expedita impedit. Eveniet, asperiores amet iste repellendus similique reiciendis, maxime laborum praesentium.</p>";			
                  echo "<ul class=\"cd-item-action\">";
                    echo "<li><button class=\"add-to-cart\">Add to cart</button></li>";	
                    echo "<li><a href=\"#0\" class =\"titre\">Learn more</a></li>";
                  echo "</ul>";
                echo "</div>";
                echo "<a href=\"#0\" class=\"cd-close titre\">Close</a>";
                
            echo "</div>";
            echo "</div>";
            echo "</div>";
            echo "</div>"; 
            
            echo "
            <script type=\"text/javascript\">
            </script>
        ";
            }
              
              }
             

                    
                       
               else {
                  echo "0 results";
              }
>>>>>>> 029d7c3396f6bd0f43b7d2acf8202b497e3fce4d
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