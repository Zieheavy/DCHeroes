<?php
session_start();
include 'include/defaults.php';

if(!isset($_SESSION['CMSSelector'])){
  $_SESSION['CMSSelector'] = 1;
}

if(isset($_POST['teams'])){
  $_SESSION['CMSSelector'] = 1;
}else if(isset($_POST['users'])){
  $_SESSION['CMSSelector'] = 2;
}else if(isset($_POST['heroes'])){
  $_SESSION['CMSSelector'] = 3;
}

$teamsTable;
$usersTable;
$heroesTable;

$teamsQuery = mysqli_query($connect,"SELECT * FROM `teams`");
$usersQuery = mysqli_query($connect,"SELECT * FROM `users`");
$heroesQuery = mysqli_query($connect,"SELECT * FROM `heroes`");

while($row = mysqli_fetch_assoc($teamsQuery)){
	$teamsTable[] = $row;
}
while($row = mysqli_fetch_assoc($usersQuery)){
	$usersTable[] = $row;
}
while($row = mysqli_fetch_assoc($heroesQuery)){
	$heroesTable[] = $row;
}

switch ($_SESSION['CMSSelector']) {
    case 1:
        echo "i equals 0";
        break;
    case 2:
        echo "i equals 1";
        break;
    case 3:
        echo "i equals 2";
        break;
}
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/main.min.css">
</head>
<body class="CMSPage">
  <form class="selecter" method="POST">
    <input type="submit" name="teams" value="teams" class='inputLogin'>
    <input type="submit" name="users" value="users" class='inputLogin'>
  </form>
  <?php
  if($_SESSION['CMSSelector'] == 1){
    dump($teamsTable);
    echo "1";
    for($i = 0; $i < count($teamsTable);$i++){
  ?>
    <input type="text" name="" value="">
  <?php
  }}else if($_SESSION['CMSSelector'] == 2){
    dump($usersTable);
    echo "2";
    for($i = 0; $i < count($usersTable);$i++){
    ?>

  <?php }}else if($_SESSION['CMSSelector'] == 3){ ?>

  <?php } ?>
  <input type="submit" name="submit" value="update">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>
