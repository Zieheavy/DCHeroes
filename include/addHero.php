<?php
  include 'defaults.php';

  $name = $_POST['name'];
  $power = $_POST['power'];
  $team = $_POST['team'];
  $image = $_POST['image'];
  $description = $_POST['description'];

  // echo json_encode($_POST);

  $insertReview = "INSERT INTO `heroes` (`name`, `power`, `teams_id`, `image`, `description`)
    VALUES ('$name', '$power', '$team','$image','$description');";

  if (mysqli_query($connect, $insertReview)) {
    echo "succes";
  } else {
    echo "Error: " . $insertReview . "<br>" . mysqli_error($connect);
  }
?>
