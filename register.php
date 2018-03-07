<?php
include 'include/defaults.php';

if(isset($_POST['register'])){
  $a_user = $_POST['name'];
  $a_password = $_POST['password'];
  $a_name = $_POST['fullName'];

  $insertReview = "INSERT INTO `users` (`name`, `password`, `fullName`)
    VALUES ('$a_user', '$a_password', '$a_name');";

  if (mysqli_query($connect, $insertReview)) {
	   header('Location:http://localhost/DCHeroes');
  } else {
    echo "Error: " . $insertRating . "<br>" . mysqli_error($connect);
  }
}

?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/main.min.css">
</head>
<body class="registerPage">
	<nav class="header">
		<a href="http://localhost/DCHeroes/">
			<img src="img/logo.jpg" class="logo">
		</a>
  </nav>
  <form class="register" method="post">
      <input type="text" name="name" value="" placeholder="Username">
      <input type="password" name="password" value="" placeholder="Password">
      <input type="text" name="fullName" value="" placeholder="Fullname">
      <input type="submit" name="register" value="Register" class="inputLogin">
  </form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
