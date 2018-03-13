<?php
  include 'defaults.php';
  $id = $_POST['id'];
  $name = $_POST['name'];
  $power = $_POST['power'];
  $team_id = $_POST['team'];
  $image = $_POST['image'];
  $description = $_POST['description'];

  $update = "UPDATE `heroes` SET `name`='$name', `power` = '$power', `teams_id` = '$team_id', `image` = '$image', `description` = '$description' WHERE id=$id";

  // echo json_encode($_POST);
  // echo $update;

  if (mysqli_query($connect, $update)) {
      echo 'succes';
  } else {
    echo "Error: " . "<br>" . mysqli_error($connect);
    // echo json_encode('fail');
  }
?>
