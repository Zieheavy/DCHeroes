<?php
  include 'defaults.php';
  $id = $_POST['id'];
  $name = $_POST['name'];
  $image = $_POST['image'];

  $update = "UPDATE `teams` SET `name`='$name', `image` = '$image' WHERE id=$id";

  if (mysqli_query($connect, $update)) {
      echo 'succes';
  } else {
    echo "Error: " . "<br>" . mysqli_error($connect);
    // echo json_encode('fail');
  }
?>
