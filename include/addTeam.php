<?php
  include 'defaults.php';

  $name = $_POST['name'];
  $image = $_POST['image'];

  // echo json_encode($_POST);

  $insertReview = "INSERT INTO `teams` (`name`, `image`)
    VALUES ('$name','$image');";

  if (mysqli_query($connect, $insertReview)) {
    echo "succes";
  } else {
    echo "Error: " . $insertRating . "<br>" . mysqli_error($connect);
  }
?>
