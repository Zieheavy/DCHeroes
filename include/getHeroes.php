<?php
  include 'defaults.php';

  $highScoreArray = [];
  $id = $_POST['id'];

  $highScoreQuery = mysqli_query($connect,"SELECT * FROM `heroes` WHERE `teams_id` = $id");

  while($row = mysqli_fetch_assoc($highScoreQuery))
    {
    $highScoreArray[] = $row;
  }

  echo json_encode($highScoreArray);

  // echo json_encode($highScoreArray);


 ?>
