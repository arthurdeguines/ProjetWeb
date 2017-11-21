<?php
echo "coucou";
if(isset($_POST['envoiMail'])) { // si le bouton "Connexion" est appuyé
     $to      = 'deguinesarthur@gmail.com';
     $subject =  htmlentities($_POST['message'], ENT_QUOTES, "ISO-8859-1");
     $message = htmlentities($_POST['message'], ENT_QUOTES, "ISO-8859-1");
     $mail = htmlentities($_POST['email'], ENT_QUOTES, "ISO-8859-1");
     $headers = 'From: '.$mail.''. "\r\n" .
     'Reply-To: webmaster@example.com' . "\r\n" .
     'X-Mailer: PHP/' . phpversion();

     mail($to, $subject, $message, $headers);
 }
  header('Location: http://localhost/ProjetWeb/ProjetWeb/');
 ?>