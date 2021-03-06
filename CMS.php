<?php
  include 'include/defaults.php';

  // dump($_POST);
  if(isset($_POST['return'])){
    header('Location:http://localhost/DCHeroes/?teamId=1&heroId=');
  }
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/main.min.css">
</head>
<body class="js-cms-page CMSPage">
<div class="teams">
  <div class="teamRepeat">
    <div class="teamName" id="teamName_1"></div>
    <img class="teamImage" src="#" id="teamImage_1">
  </div>
</div>
  <form method="post" action="#" class="inlineForm" enctype="multipart/form-data">
    <input type="hidden" class="inputTeamId" name="inputTeamId" value="" />
    <input class="inputTeamName" name="inputTeamName" placeholder="team name"></input>
    <input class="inputTeamImage" name="inputTeamImage" placeholder="team image"></input>
    <input type="button" name="updateTeam" class="updateTeam inputLogin" value="update" />
    <input type="button" name="deleteTeam" class="deleteTeam inputLogin" value="delete" />
  </form>

  <form method="post" action="#" class="inlineForm" enctype="multipart/form-data">
    <input class="newTeamName" name="newTeamName" placeholder="new team name"></input>
    <input class="newTeamImage" name="newTeamImage" placeholder="new team image"></input>
    <input type="button" name="newTeam" class="newTeam inputLogin" value="new Team" />
  </form>

  <form method="post" action="#" class="inlineForm" enctype="multipart/form-data">
       <div class="repeatingSection">
           <a href="#" class="buttonGray buttonRight deleteHero inputLogin" id='id_1'>Delete</a>
           <!-- <input type="hidden" name="fighter_a_id_1" id="fighter_a_id_1" value="" />
           <input type="hidden" name="fighter_b_id_1" id="fighter_b_id_1" value="" />-->
           <input type="hidden" name="id_1" id="id_1" value="" />
           <div class="formRow">
               <label for="name_1">name</label>
               <input class="inputBox" type="text" name="name_1" id="name_1" value="" />
           </div>
           <div class="formRow textAreaRow">
               <label for="power_1">power</label>
               <textarea class="textArea inputBox" rows="4" cols="50" name="power_1" id="power_1"></textarea>
               <!-- <input type="text" name="power_1" id="power_1" value="" /> -->
           </div>
           <div class="formRow textAreaRow">
               <label for="description_1">description</label>
               <textarea class="textArea inputBox" rows="4" cols="50" name="description_1" id="description_1"></textarea>
           </div>
           <div class="formRow">
               <label for="image_1">image</label>
               <input class="inputBox" type="text" name="image_1" id="image_1" value="" />
           </div>
           <div class="formRow">
               <label for="teams_id_1">team</label>
               <!-- <input class="inputBox" type="text" name="teams_id_1" id="teams_id_1" value="" /> -->
               <select name="teamid_1" class="inputBox" id="teamid_1">
                 <option value="1">batman</option>
                 <option value="2">gotham</option>
               </select>
           </div>
           <input type="button" name="update_1" id="update_1" class="js-update inputLogin" value="update" />
       </div>
       <div class="formRowRepeatingSection">
               <a href="#" class="buttonGray buttonRight addHero inputLogin">Add Hero</a>
           </div>
       <div class="formRow">
           <input type="submit" class="submitButton inputLogin" name="return" value="return" />
       </div>
   </form>

<div style="opacity: 0;">
 </div>

    <!-- jQuery -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- Custom js  -->
    <script src="js/main.js"></script>
</body>
