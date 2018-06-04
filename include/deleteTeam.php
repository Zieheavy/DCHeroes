<?php
  include 'defaults.php';

  $id = $_POST['id'];

  $update = "UPDATE `heroes` SET `teams_id`='999' WHERE `teams_id`='$id'";
  $delete = "DELETE FROM `teams` WHERE `id`=$id";

  if (mysqli_query($connect, $update)) {
  } else {
    // echo mysqli_error($connect);
    echo $update;
  }

  if (mysqli_query($connect, $delete)) {
    echo 'succes';
  } else {
    // echo "error";
    // echo json_encode('fail');
  }
 ?>
