<?php
  include 'defaults.php';

  $id = $_POST['id'];

  $review = "DELETE FROM `revieuws` WHERE `heroes_id`=$id";
  $delete = "DELETE FROM `heroes` WHERE `id`=$id";

  if (mysqli_query($connect, $review)) {
      echo json_encode('succes');
  } else {
    echo "error";
    // echo json_encode('fail');
  }

  if (mysqli_query($connect, $delete)) {
      echo json_encode('succes');
  } else {
    echo "error";
    // echo json_encode('fail');
  }
 ?>
