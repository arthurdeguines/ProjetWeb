<?php
function troncText($text){
	$max=200;

  // Met la portion de chaine dans $chaine
  $text=substr($text,0,$max); 
  // position du dernier espace
  $espace=strrpos($text," "); 
  // Ajoute ... à la chaine
  $text .= '...';
  return $text;

}
?>
