	<?php
session_start();
date_default_timezone_set('CET');
include 'include/defaults.php';

if(!isset($_SESSION['user'])){
	$_SESSION['user'] = '';
}
if(!isset($_SESSION['password'])){
	$_SESSION['password'] = '';
}
if(!isset($_SESSION['logedIn'])){
	$_SESSION['logedIn'] = 0;
}
if(!isset($_SESSION['userId'])){
	$_SESSION['userId'] = -1;
}
if(!isset($_SESSION['privilege'])){
	$_SESSION['privilege'] = 0;
}

//integers
$teamId = 1;
$selectedHeroNumber = 1;

if(isset($_GET['teamId']) == true){
	$teamId = $_GET['teamId'];
	$_SESSION['selectedInfo'] = [$teamId,$selectedHeroNumber];
}
if(isset($_GET['heroId']) == true){
	$selectedHeroNumber = $_GET['heroId'];
	$_SESSION['selectedInfo'] = [$teamId,$selectedHeroNumber];
}

if(isset($_SESSION['selectedInfo'])){
	$teamId = $_SESSION['selectedInfo'][0];
	$selectedHeroNumber = $_SESSION['selectedInfo'][1];
}

//arrays
$userTable;
$teamTable;
$heroTable;
// $ratingTable;
$allHeroTable;
$reviewTable;

$score;
$selectedHero;

//default query's?
$userQuery = mysqli_query($connect,"SELECT * FROM `users`");
$teamQuery =  mysqli_query($connect,"SELECT * FROM `teams`");
$heroQuery = mysqli_query($connect,"SELECT * FROM `heroes` WHERE `teams_id` = $teamId");
$allHeroQuery = mysqli_query($connect,"SELECT * FROM `heroes`");
$reviewQuery = mysqli_query($connect,"SELECT * FROM `revieuws`ORDER BY `score` DESC");

while($row = mysqli_fetch_assoc($teamQuery))
{
	$teamTable[] = $row;
}

while($row = mysqli_fetch_assoc($heroQuery)){
	$heroTable[] = $row;
}

while($row = mysqli_fetch_assoc($allHeroQuery)){
	$allHeroTable[] = $row;
}

while($row = mysqli_fetch_assoc($reviewQuery)){
	$reviewTable[] = $row;
}

//when you switch to another team selects the first person of that team
$a_tempIdArr;
for($i = 0; $i < count($allHeroTable);$i++){
	if($allHeroTable[$i]['teams_id'] == $teamId){
		$a_tempIdArr[$i+1] = $allHeroTable[$i]['id'];
	}
}
if(array_search($selectedHeroNumber, $a_tempIdArr) == ''){
	$selectedHeroNumber = $heroTable[0]['id'];
}

//calculates the total members in a team and pushes the ratings in a new array
for($j = 0; $j < count($teamTable);$j++){
	$a_heroCounter = 0;
	$a_ratingCount = 0;

	for($k = 0; $k < count($allHeroTable); $k++){
		if($allHeroTable[$k]['teams_id']-1 == $j){
			$a_heroCounter++;
			$a_heroRatingCounter = 0;
			$a_heroScoreCounter = 0;

			for($l = 0; $l < count($reviewTable); $l++){
				if($reviewTable[$l]['heroes_id'] == $allHeroTable[$k]['id']){
					$a_heroRatingCounter++;
					$score[$j]['empty'] = false;
					$score[$j][] = $reviewTable[$l];
					$a_ratingCount++;
					$a_heroScoreCounter += $reviewTable[$l]['score'];
				}
			}
			$allHeroTable[$k]['totalRatings'] = $a_heroRatingCounter;
			$allHeroTable[$k]['totalScore'] = $a_heroScoreCounter;

			if($a_heroScoreCounter !== 0){
				$allHeroTable[$k]['averageScore'] = round($a_heroScoreCounter / $a_heroRatingCounter,1);
			}else{
				$allHeroTable[$k]['averageScore'] = 0;
			}
		}
	}
	$teamTable[$j]['totalRatings'] = $a_ratingCount;
	$teamTable[$j]['members'] = $a_heroCounter;
}

//calculates the average and total score for each team
for($j = 0; $j < count($teamTable);$j++){
	if(isset($score[$j]['empty']) == true){
		$a_scoreCounter = 0;

		for($i = 0; $i < count($score[$j])-1;$i++){
			$a_scoreCounter += $score[$j][$i]['score'];
		}
		$teamTable[$j]['totalScore'] = $a_scoreCounter;
		$teamTable[$j]['averageScore'] = round($teamTable[$j]['totalScore'] / $teamTable[$j]['totalRatings'],1);
	}else{
		$teamTable[$j]['totalScore'] = "none";
		$teamTable[$j]['averageScore'] = "none";
	}
}

for($i = 0; $i < count($allHeroTable);$i++){
	if($allHeroTable[$i]['teams_id'] == $teamId){
		if($allHeroTable[$i]['id'] == $selectedHeroNumber){
			$selectedHero = $allHeroTable[$i];
		}
	}
}


//checks if your user name and password are in the database
if(isset($_POST['login'])){
	if($_SESSION['logedIn'] == 0){
		if(isset($_POST['userName'])){
			$_SESSION['user'] = $_POST['userName'];
		}
		if(isset($_POST['userPassword'])){
			$_SESSION['password'] = $_POST['userPassword'];
		}

		while($row = mysqli_fetch_assoc($userQuery))
		{
			if($row['name'] == $_SESSION['user'] && $row['password'] == $_SESSION['password']){
				$_SESSION['logedIn'] = 1;
				$_SESSION['userId'] = $row['id'];
				if($row['privilege'] == 1){
					$_SESSION['privilege'] = 1;
				}else{
					$_SESSION['privilege'] = 0;
				}
			}
		}
	}
}else if(isset($_POST['logOut'])){
	$_SESSION['logedIn'] = 0;
	$_SESSION['user'] = '';
	$_SESSION['password'] = '';
	$_SESSION['privilege'] = 0;
}else if(isset($_POST['register'])){
	$_SESSION['selectedInfo'] = [$teamId,$selectedHeroNumber];
	header('Location:http://localhost/DCHeroes/register.php');
}

if(isset($_POST['commentSubmit'])){
	if(isset($_POST['rating'])){
		if($_POST['comment'] !== "" && $_POST['rating'] != -1 && $_SESSION['userId'] != -1){
			$a_score = (intval($_POST['rating'])/2);
			$a_heroId = $selectedHero['id'];
			$a_userId = $_SESSION['userId'];
			$a_comment = $_POST['comment'];
			$a_date = date("Y-m-d, H:m");
			$a_user = $_SESSION['user'];

			// $insertRating = "INSERT INTO `rating` (`score`, `users_id`, `heroes_id`)
			// 	VALUES ('$a_rating', '$a_userId', '$a_heroId');";

			$insertReview = "INSERT INTO `revieuws` (`score`, `heroes_id`, `users_id`, `comment`, `date`,`userName`)
				VALUES ('$a_score', '$a_heroId', '$a_userId','$a_comment','$a_date','$a_user');";

			if (mysqli_query($connect, $insertReview)) {
				$_POST['rating'] = -1;
				unset($_POST['commentSubmit']);
				header("Refresh:0");
			} else {
		    echo "Error: " . $insertRating . "<br>" . mysqli_error($connect);
			}
		}
	}else{
		$msg = "text";
		echo "<script>(function(){alert('$msg');})();</script>";
	}
}

if(isset($_POST['CMS'])){
header('Location:http://localhost/DCHeroes/CMS.php');
}
// dump($teamTable);

?>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/main.min.css">
</head>
<body class="homePage">
	<nav class="header">
		<a href="http://localhost/DCHeroes/">
			<img src="img/logo.jpg" class="logo">
		</a>

		<?php if($_SESSION['logedIn'] == 0){?>
			<form class="inputField" method="post">
				<input name="userName" class="inputName" type='text' placeholder="user">
				<input name="userPassword" class="inputPassword" type='password' placeholder="password">
				<a class="submitContainer" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $selectedHeroNumber ?>">
					<input name='login' class='inputLogin' type='submit' value="login">
				</a>
				<a class="submitContainer" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $selectedHeroNumber ?>">
					<input name='register' class='inputLogin' type='submit' value="register">
				</a>
			</form>
		<?php }else{ ?>
			<form class="inputField" method="post">
				<div class="inputUser"><?php echo $_SESSION['user'] ?></div>
				<a class="submitContainer submitContainerLogout" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $selectedHeroNumber ?>">
					<input name='logOut' class='inputLogin' type='submit' value="logout">
				</a>
				<?php if($_SESSION['privilege'] == 1){?>
					<a class="submitContainer submitContainerLogout" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $selectedHeroNumber ?>">
						<!-- <input name='CMS' class='inputLogin' type='submit' value="CMS"> -->
					</a>
				<?php } ?>
			</form>
		<?php } ?>
	</nav>

	<div class="container left">
		<div class="subContainer left">
			<ul class="list">
				<?php
				for($i = 0; $i < count($teamTable); $i++){
				?>
				<li>
					<?php
					if($teamId != $teamTable[$i]['id']){
						if ( $i & 1 ) {
					?>
					<a class="teamContainer even" href="<?php echo '?teamId=' . ($i+1) . '&heroId=' . $selectedHeroNumber ?>">
					<?php }else { ?>
					<a class="teamContainer" href="<?php echo '?teamId=' . ($i+1) . '&heroId=' . $selectedHeroNumber ?>">
					<?php }}else{ ?>
					<a class="teamContainer selected" href="<?php echo '?teamId=' . ($i+1) . '&heroId=' . $selectedHeroNumber ?>">
					<?php }?>
						<!-- <div class="teamContainer"> -->
						<?php if($teamTable[$i]['image'] !== null){?>
							<img class="teamImage" src="img/<?php echo $teamTable[$i]['image']; ?>">
						<?php }else {?>
							<img class="teamImage" src="img/puppy.jpg">
						<?php } ?>
							<div class="teamText teamName"><?php echo $teamTable[$i]['name']; ?></div>
							<div class="teamText">Members: <?php echo $teamTable[$i]['members']; ?></div>
							<div class="teamText">Ratings: <?php echo $teamTable[$i]['totalRatings']; ?></div>
							<div class="teamText">Total Stars: <?php echo $teamTable[$i]['totalScore']; ?></div>
							<div class="teamText">Average Stars: <?php echo $teamTable[$i]['averageScore']; ?></div>
						<!-- </div> -->
					</a>
				</li>
			<?php }?>
			<ul>
		</div>
		<div class="subContainer right">
			<ul class="list">
				<?php
				for($i = 0; $i < count($allHeroTable); $i++){
					if($allHeroTable[$i]['teams_id'] == $teamId){
						?>
						<li>
						<?php
						if($selectedHero['id'] != $allHeroTable[$i]['id']){
						if ( $i & 1 ) {
						?>
						<a class="heroContainer" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $allHeroTable[$i]['id'] ?>">
						<?php }else{ ?>
						<a class="heroContainer even" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $allHeroTable[$i]['id'] ?>">
						<?php }}else{ ?>
						<a class="heroContainer selected" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $allHeroTable[$i]['id'] ?>">
						<?php } ?>
							<!-- <div class="heroContainer"> -->
							<?php if($allHeroTable[$i]['image'] !== null){?>
								<img class="teamImage" src="img/<?php echo $allHeroTable[$i]['image']; ?>">
							<?php }else {?>
								<img class="heroImage" src="img/puppy.jpg">
							<?php } ?>
							<div class="heroText heroName">Name: <?php echo $allHeroTable[$i]['name']; ?></div>
							<div class="heroText">Ratings: <?php echo $allHeroTable[$i]['totalRatings']; ?></div>
							<div class="heroText">Total stars: <?php echo $allHeroTable[$i]['totalScore']; ?></div>
							<div class="heroText">Average stars: <?php echo $allHeroTable[$i]['averageScore']; ?></div>
							<!-- </div> -->
						</a>
					<li>
				<?php }}?>
			</ul>
		</div>
	</div>

	<div class="container right">
		<?php if($selectedHero['image'] !== null){?>
			<img class="teamImage" src="img/<?php echo $selectedHero['image']; ?>">
		<?php }else {?>
			<img class="heroImage" src="img/puppy.jpg">
		<?php } ?>
		<div class="heroText heroName">Name: <?php echo $selectedHero['name']; ?></div><br>
		<div class="heroText heroName">Description: <?php echo $selectedHero['description']; ?></div><bR>
		<div class="heroText heroName">Powers: <?php echo $selectedHero['power']; ?></div><br>
		<div class="heroText heroName">Average Rating: <?php echo $selectedHero['averageScore']  ?></div>
		<form method="POST">
			<fieldset class="rate">
			    <input type="radio" id="rating10" name="rating" value="10" /><label for="rating10" title="5 stars"></label>
			    <input type="radio" id="rating9" name="rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
			    <input type="radio" id="rating8" name="rating" value="8" /><label for="rating8" title="4 stars"></label>
			    <input type="radio" id="rating7" name="rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
			    <input type="radio" id="rating6" name="rating" value="6" /><label for="rating6" title="3 stars"></label>
			    <input type="radio" id="rating5" name="rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
			    <input type="radio" id="rating4" name="rating" value="4" /><label for="rating4" title="2 stars"></label>
			    <input type="radio" id="rating3" name="rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
			    <input type="radio" id="rating2" name="rating" value="2" /><label for="rating2" title="1 star"></label>
			    <input type="radio" id="rating1" name="rating" value="1" /><label class="half" for="rating1" title="1/2 star"></label>
			    <input type="radio" id="rating0" name="rating" value="0" /><label for="rating0" title="No star"></label>
			</fieldset>

			<input type='text' name="comment" value="" class="submitComment" maxlength="100" placeholder="Your comment...">
			<a class="submitContainer" href="<?php echo '?teamId=' . $teamId . '&heroId=' . $selectedHeroNumber ?>">
				<input type="submit" class="inputLogin" name="commentSubmit" value="Submit">
			</a>
		</form>
		<div class="commentContainer">
			<?php
			for($i = 0; $i < count($reviewTable); $i++){
				if($reviewTable[$i]["heroes_id"] == $selectedHero['id']){
					?>
					<div class="comment">
						<div class="rating">rating: <?php echo $reviewTable[$i]['score'] ?></div>
						<div class="date"><?php echo $reviewTable[$i]['date'] ?></div>
						<div class="user">user: <?php echo $reviewTable[$i]['userName'] ?></div>
						<div class="comment"><?php echo $reviewTable[$i]['comment'] ?></div>
					</div>
		<?php }}?>
		</div>
	</div>

	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
		<!-- jQuery -->
		<script src="js/jquery-3.3.1.min.js"></script>
    <!-- Custom js  -->
    <script src="js/main.js"></script>
</body>
</html>
