<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="css/style-recette.css" rel="stylesheet">
    <link href="css/reset-recette.css" rel="stylesheet">
    <script src="js/modernizr.js"></script> 
    <script src="js/jquery-3.2.1.js"></script>
    <script src="js/velocity.min.js"></script>
    <script src="js/main-recette.js"></script>
    <title>Document</title>
</head>
<body>

  <!--Affichage des recettes -->
  <?php
require('php/recette.php');
echo afficheRecette();
?>


</body>
</html>