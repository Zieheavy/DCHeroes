-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2018 at 08:59 AM
-- Server version: 10.1.26-MariaDB
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dcheroes`
--
CREATE DATABASE IF NOT EXISTS `dcheroes` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `dcheroes`;

-- --------------------------------------------------------

--
-- Table structure for table `heroes`
--

CREATE TABLE `heroes` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `power` varchar(300) NOT NULL,
  `teams_id` int(11) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  `description` varchar(750) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `heroes`
--

INSERT INTO `heroes` (`id`, `name`, `power`, `teams_id`, `image`, `description`) VALUES
(1, 'batman', 'Adaptive, Agility, Cosmic Awareness, Escape Artist, Gadgets, Insanely Rich, Intellect, Leadership, Marksmanship, Power Suit, Stamina, Stealth, Swordsmanship, Tracking, Unarmed Combat, Weapon Master', 1, 'batman.jpg', 'Bruce Wayne, who witnessed the murder of his multi-millionaire parents as a child, swore to avenge their deaths. He trained extensively to achieve mental and physical perfection, mastering martial arts, detective skills, and criminal psychology. Costumed as a bat to prey on criminalss fears, and utilizing a high-tech arsenal, he became the legendary Batman.'),
(90, 'Carrie Kelley', 'Agility, Claws, Gadgets, Marksmanship, Stealth, Tracking, Unarmed Combat', 1, 'carrieKelley.png', 'In the Dark Knight Returns, Carrie Kelley sought out Batman and earned the right to fight alongside him as Robin using her home made costume. She later took up the mantles of Catgirl, Batman, Batgirl, and Batwoman'),
(91, 'Damian Wayne', 'Agility, Escape Artist, Gadgets, Insanely Rich, Intellect, Marksmanship, Power Suit, Stamina, Stealth, Sub-Mariner, Swordsmanship, Tracking, Unarmed Combat, Weapon Master', 1, 'damianWayne.jpg', 'Damian Wayne is the son of Bruce Wayne and Talia al Ghul. Trained by the League of Assassins all his life, Damian joined his fathers side in the war against crime by becoming the fifth Robin.'),
(92, 'Dick Grayson', 'Agility, Escape Artist, Gadgets, Insanely Rich, Intellect, Leadership, Marksmanship, Power Suit, Stamina, Stealth, Tracking, Unarmed Combat, Weapon Master', 1, 'dickGrayson.jpg', 'As the first Robin, Dick Grayson was the most famous sidekick in all of fiction. As he ventured forth on his own, he formed the Teen Titans and became their leader. When the boy became a man, he became the independent hero known as Nightwing.'),
(95, 'Angie Peterson', 'Marksmanship, Unarmed Combat, Weapon Master', 2, 'angiePeterson.jpg', 'A Gotham police officer'),
(96, 'Angel Rojas', 'Gadgets, Unarmed Combat', 2, 'angelRojas.jpg', 'Angel Rojas is the first chief of police for Gotham City Police Department, before Gordon took over the role. He only respects the men and women who gives their lives for Gotham, not vigilantes in masks.'),
(97, 'Barbara Gordon', 'Agility, Electronic interaction, Gadgets, Intellect, Leadership, Marksmanship, Power Item, Psychic, Stamina, Stealth, Technopathy, Tracking, Unarmed Combat, Weapon Master', 2, 'barbaraGordon.jpg', 'Barbara Gordon was the first modern age Batgirl until she was brutally shot by the Joker, rendering her paralyzed from the waist down. Barbara reinvented herself as Oracle, providing intelligence to the DCU heroes and leading the Birds of Prey. She has recently become Batgirl once again to protect Gotham City.'),
(98, 'Brandon', 'Agility, Gadgets, Marksmanship, Unarmed Combat', 2, 'branden.jpg', 'The former leader of the Gotham City Police SWAT division under Commissioner Loeb during Batman\'s early years. Branden was notable for his corrupt and excessively violent approach to law enforcement.'),
(99, 'Commissioner Grogan', 'None', 2, 'commissionerGrogan.png', 'He is one of Gotham City\'s rogue politicians'),
(106, 'Archy', 'None', 10, 'archie.jpg', 'Archie (Last name unknown) was one of the many soldiers to serve in Sgt. Rocks Easy Co during World War II.'),
(113, 'Sgt. Rock', 'Adaptive, Agility, Danger Sense, Escape Artist, Gadgets, Intellect, Leadership, Marksmanship, Stamina, Stealth, Tracking, Unarmed Combat, Weapon Master', 10, 'sgtRock.jpg', 'A veteran of World War II who served as an infantry non commissioned officer, Frank Rock is one of the most popular characters from war comics.'),
(114, 'Aquaman', 'Agility, Animal Control, Electricity Control, Healing, Ice Control, Insanely Rich, Intellect, Invulnerability, Leadership, Longevity, Power Item, Radar Sense, Stamina, Sub-Mariner, Super Hearing, Super Sight, Super Speed, Super Strength, Swordsmanship\r\nTelepathy, Teleport', 7, 'aquaman.jpg', 'The son of an Atlantean queen and a lighthouse keeper from the town of Amnesty Bay, Arthur Curry would grow up to become the superhero Aquaman, and later take on his birthright as the King of Atlantis. He is a founding member of the Justice League and is among DC Comics\' most recognized heroes.'),
(115, 'Allorc', 'Sub-Mariner', 7, 'alloroc.jpg', 'Alloroc was the richest man in Atlantis, father of Bazil and friend of King Orin.'),
(116, ' Alonzo Malrey', 'Claws, Healing, Leadership, Radar Sense, Stamina, Sub-Mariner, Super Hearing, Super Sight, Super Smell, Super Speed, Super Strength, Unarmed Combat', 7, 'alonzoMalrey.jpg', 'A San Diego cop caught in the disaster who wanted to be able to continue being a cop in Sub Diego, so he asked Anton Geist to alter him into a more impressive form.'),
(117, 'Arion', 'Blast Power, Divine Powers, Illusion Casting, Immortal, Intellect, Levitation, Longevity, Magic, Phasing / Ghost, Swordsmanship, Weapon Master, Weather Control', 7, 'arion.png', 'The son of 2 Atlantean Gods, Arion is a powerful sorcerer and the first Lord of Atlantis.'),
(118, 'Captain Siron', 'none', 7, 'captainSiron.jpg', '-'),
(119, 'Atlanna', 'Agility, Animal Control, Blast Power, Insanely Rich, Intellect, Leadership, Postcognition, Power Item, Sub-Mariner, Super Strength, Telepathy, Tracking, Weapon Master', 7, 'atlanna.jpg', 'Atlanna is the Atlantean mother of Aquaman. Though her role changes depending on the continuity, she is most commonly depicted as the Queen/Princess of Atlantis who falls in love with a lonely lighthouse Keeper.'),
(125, 'Bulldozer', 'Agility, Intellect, Marksmanship, Stamina, Stealth, Tracking, Unarmed Combat, Weapon Master', 10, 'bulldozer.jpg', 'Member of the Easy Company and Sgt. Rock\'s second-in-command.'),
(126, 'Jackie Johnson', 'none', 10, 'jackieJohnson.jpg', 'Jackie Johnson was a former Boxing Champion. He became a soldier and member of Sgt. Rock\'s Easy Co.'),
(127, 'Joe Rock', 'Intellect, Leadership, Marksmanship, Stamina, Weapon Master', 10, 'joeRock.jpg', 'Frank Rock\'s grandson.'),
(130, 'Animal Girl', 'Animal Control, Healing', 3, 'animalGirl.jpg', 'Member of the Futures End Teen Titans'),
(131, 'Bart Allen', 'Agility, Duplication, Force Field, \r\nHealing, Holographic Projection, Intellect, Leadership, Phasing / Ghost, Stamina, Super Speed, Time Travel, Unarmed Combat, Vibration Wave, Wind Bursts', 3, 'bartAllen.jpg', 'Hailing from the 30th century, Bart Allen is the grandson of the Flash, Barry Allen and Iris Allen. Originally using the name Impulse and trained by Max Mercury, Bart utilizes the same powers of super-speed possessed by his grandfather and fights crime alongside the Teen Titans, know as Kid Flash and Wally West\'s sidekick.'),
(132, 'BombShell', 'Blast Power, Energy Absorption, Energy Manipulation, Energy-Enhanced Strike, Flight, Healing, Heat Generation, Invulnerability, Marksmanship, Stamina, Super Strength, Unarmed Combat', 3, 'bombshell.jpg', 'Amy Allen underwent an experiment similar to Captain Atom\'s and gained quantum powers. A member of the Teen Titans, Amy has betrayed the team before. She has since atoned for her past.'),
(133, 'Bunker', 'Agility, Density Control, Energy Based Constructs, Energy-Enhanced Strike, Flight, Force Field, Psionic, Willpower-Based Constructs', 3, 'bunker.jpg', 'An amateur superhero coming from a small town in Mexico, Bunker is a member of the Teen Titans. He is capable of projecting Psionic bricks to form walls and other structures in various forms. He can also use his psionic bricks as a form of armour.'),
(134, 'Cyborg', 'Agility, Blast Power, Electronic interaction, Flight, Gadgets, Implants, Intellect, Invulnerability, Leadership, Power Suit, Radar Sense, Stamina, Super Hearing, Super Sight, Super Strength, Technopathy, Vibration Wave, Weapon Master ', 3, 'cyborg.png', 'Half man, half machine - all hero! After a near fatal incident, Victor Stone was cybernetically enhanced by his father. He now possesses the ability to communicate, manipulate, and interface with nearly all forms of technology. As he is constantly upgrading, he promises to defend the future from any threat. He is also a founding member of both, the Justice League and the Teen Titans.'),
(135, 'Addellca', 'Blast Power, Energy Manipulation, Energy-Enhanced Strike, Flight, Force Field, Healing, Holographic Projection, Light Projection, Omni-lingual, Phasing / Ghost, Power Item, Radar Sense, Super Speed, Super Strength, Tracking, Unarmed Combat, Weapon Master, Willpower-Based Constructs', 4, 'adellca.jpg', 'Adellca was the Green Lantern of Space Sector 3595.2. She and her partner Vegar were killed when their Sector House was attacked by the monster Gigorr.'),
(136, 'Arisia', 'Agility, Astral Projection, Blast Power, Energy Manipulation, Energy Shield, Energy-Enhanced Strike, Flight, Force Field, Healing, Intellect, Invisibility, Invulnerability, Light Projection, Longevity, Marksmanship, Omni-lingual, Phasing / Ghost, Power Item, Radar Sense, Radiation, Stamina', 4, 'arisia.jpg', 'Arisia is the Green Lantern of Space Sector 2815. Her family has a long and proud history of serving in the Green Lantern Corps, and she has honored that lineage by serving with distinction in many of the Corps\' harrowing campaigns.'),
(137, 'Barreer Wot', 'Agility, Astral Projection, Blast Power, Claws, Danger Sense, Energy Manipulation, Energy Shield, Energy-Enhanced Strike, Feral, Flight, Force Field, Healing, Holographic Projection, Invisibility, Light Projection, Omni-lingual, Phasing / Ghost, Power Item, Stamina', 4, 'barrerWot.jpg', 'Green Lantern of Space Sector 3014'),
(138, 'Bronchuk', 'Energy Based Constructs', 4, 'bronchuk.jpg', 'Bronchuk is a Green Lantern and member of the Mean Machine'),
(139, 'Atalanta', 'none', 4, 'atalanta.jpg', '-'),
(140, 'Alena', 'Agility, Flight, Heat Vision, Invulnerability, Stamina, Super Hearing, Super Speed, Super Strength', 5, 'alena.jpg', 'A one shot character from Krypton in the Pre-Crisis universe.'),
(141, 'Alura', 'Flight, Heat Vision, Ice Breath, Intellect, Invulnerability, Leadership, Stamina, Super Hearing, Super Sight, Super Speed, Super Strength, Unarmed Combat, Wind Bursts', 5, 'alura.jpg', 'Alura-El (formerly In-Zee) is the wife of Zor-El, mother of Supergirl, and paternal aunt of Superman.'),
(142, 'Az-Rel', 'Agility, Flight, Heat Vision, Ice Breath, Invulnerability, Stamina, Super Hearing, Super Sight, Super Speed, Super Strength', 5, 'azRel.jpg', 'A Kryptonian criminal and one half of a \"Bonnie and Clyde\" relationship with Nadira. They briefly served under General Zod, but eventually pursued their own self-serving interests.'),
(143, 'Commander Gor', 'Blast Power, Flight, Heat Vision, Ice Breath, Ice Control, Leadership, Marksmanship, Super Hearing, Super Sight, Super Smell, Super Speed, Super Strength, Unarmed Combat, Weapon Master', 5, 'commanderGor.png', 'A member of the Kryptonian Military, he was one of the 600 soldiers who responded to Brainiac\'s attack under Zod\'s direction, and was trapped in Kandor until later freed by Kal-El.'),
(144, 'Dar Lilit', 'none', 5, 'darLilit.jpg', '-'),
(145, 'Blackhawk', 'Agility, Intellect, Leadership, Marksmanship, Stamina, Stealth, Tracking, Unarmed Combat, Weapon Master', 6, 'blackhawk.jpg', 'Janos Prohaska became a world renowned pilot during the Spanish Civil War. After the Nazis invaded his home country he named himself Blackhawk and joined with several of his friends to combat them as the Blackhawk Squadron.'),
(146, 'Canada', 'none', 6, 'canada.png', 'Member of the Blackhawks.'),
(147, 'The Irishman', 'Agility, Stamina, Unarmed Combat, Weapon Master', 6, 'theIrishman.png', 'Fielder operative and munitions expert for the Blackhawks.'),
(148, 'Natalie Reed', 'Intellect, Marksmanship, Omni-lingual, Unarmed Combat', 6, 'natalieReed.jpg', 'The Lady Blackhawk of the revamped Blackhawks by Howard Chaykin.'),
(149, 'Lady Blackhawk', 'Adaptive, Agility, Gadgets, Intellect, Leadership, Marksmanship, Stamina, Stealth, Unarmed Combat, Weapon Master', 6, 'ladyBlackhawk.jpg', 'Former member of the World War II Blackhawks. After being thrown into the present, she\'s now the pilot for Oracle\'s Birds of Prey.'),
(150, 'Deadshot', 'Agility, Escape Artist, Gadgets, Leadership, Marksmanship, Power Suit, Stamina, Stealth, Super Sight, Tracking, Unarmed Combat, Weapon Master', 8, 'deadshot.jpg', 'Deadshot is one of the world\'s greatest assassins, known for his expert marksmanship and near perfect track record. He is one of the core members of the Suicide Squad'),
(151, 'Harley Quinn', 'Agility, Gadgets, Healing, Intellect, Marksmanship, Stamina, Stealth, Super Strength, Unarmed Combat, Weapon Master', 8, 'harleyQuinn.jpg', 'Harley Quinn first appeared on Batman: The Animated Series in the episode, \"The Jokers Favor\". She was created by Paul Dini and Bruce Timm and inspired by Arleen Sorkin and one of her characters Harlequin. Harleen Quinzel was a former psychiatrist at Arkham Asylum. Her patient was the Joker and he told her all his \"secrets\", manipulating her into falling in love with the Clown Prince of Crime. Harleen Quinzel adopted the name Harley Quinn and broke the Joker out of the Asylum and became his assistant.'),
(152, 'Dr. Moon', 'Gadgets, Healing, Intellect, Stamina, Stealth', 8, 'drMoon.jpg', 'Dr. Moon is a doctor that has worked for the Suicide Squad.'),
(153, 'Amanda Waller', 'Intellect, Leadership, Stamina, Stealth, Tracking', 8, 'amandaWaller.jpg', 'The current head of the Suicide Squad and former Director of ARGUS.'),
(154, 'Deathstroke', 'Adaptive, Agility, Berserker Strength, Cosmic Awareness, Danger Sense, Enhance Mutation, Escape Artist, Gadgets, Healing, Immortal, Insanely Rich, Intellect, Leadership, Longevity, Marksmanship, Power Item, Power Suit, Stamina, Stealth, Super Hearing, Super Sight, Super Smell, Super Speed', 8, 'deathstroke.jpg', 'Genetically engineered to surpass all human limits, once a soldier, Slade Wilson now works as one of the most feared assassins in the DC Universe. He has frequently clashed with the Teen Titans, Batman, the Justice League, Green Arrow, and even gods!'),
(155, 'Fred Jones', 'Adaptive, Agility, Escape Artist, Gadgets, Leadership, Stealth, Tracking', 9, 'fredJones.jpg', 'Fred is the leader of Mystery Incorporated, a teenage team of detectives. He is commonly shown giving orders to the rest of the gang and driving the Mystery Machine, their way of transport.'),
(156, 'Daphne Blake', 'Agility, Gadgets, Insanely Rich, Intellect, Stamina, Stealth, Unarmed Combat', 9, 'daphneBlacke.jpg', 'Daphne Blake is a member of Mystery, Inc. She is known for her sense in style & fashion and Her fiery red hair. Daphne comes from a very wealthy family. Daphne\'s main attire in the Scooby-Doo series consists of a purple dress, pink pantyhose, purple shoes, and a green scarf.'),
(157, 'Scooby Dum', 'None', 9, 'scoobyDum.jpg', 'Scooby-Dum is the cousin of Scooby-Doo. He featured in four episodes of The Scooby-Doo Show and was then in Laff-a-Lympics as a member of the Scooby Doobies.'),
(158, 'Scooby-Doo', 'Agility, Claws, Feral, Stamina, Super Eating, Super Hearing, Super Smell, Super Speed, Tracking', 9, 'scoobyDoo.jpg', 'Scooby-Doo is a Great Dane who is the pet and best friend of Shaggy Rogers. Due to their cowardice, Scooby-Doo (and Shaggy) are often bribed by their friends (Velma, Daphne and Fred) to go on several of their adventures using Scooby Snacks.'),
(159, 'Scrappy Doo', 'Berserker Strength, Stamina', 9, 'scrappyDoo.jpg', 'Scooby Doo\'s nephew that has plenty of P-uppy Power!'),
(160, 'Shaggy', 'Agility, Leadership, Stealth, Super Eating, Super Speed', 9, 'shaggy.jpg', 'Scooby-Doo\'s best friend - he adopted him from a Puppy Farm and lovingly cares for him. A cowardly dude who is scared of monsters! Despite that, Shaggy is a member of Mystery, Inc.'),
(161, 'Velma Dinkley', 'Adaptive, Gadgets, Intellect, Omni-lingual, Tracking', 9, 'velmaDinkley.jpg', 'Velma is the brains of Mystery, Inc. She is known for her vast smarts, her catch phrase is \"Jinkies!\". She is well known for her wearing of an orange turtleneck, short pleated skirt, knee socks, and Mary Janes shoes.'),
(162, 'Green Arrow', 'Agility, Escape Artist, Gadgets, Insanely Rich, Intellect, Leadership, Marksmanship, Stamina, Stealth, Swordsmanship, Tracking, Unarmed Combat, Weapon Master', 11, 'greenArrow.jpg', 'Oliver Queen was a spoiled, thrill-seeking playboy, until he was left stranded on a deserted island for several years. There, he trained to become a master archer in order to survive. After his return home, he used his new-found skills and his wealth to became the costumed vigilante known as Green Arrow.'),
(163, 'Mia Dearden', 'Agility, Gadgets, Intellect, Marksmanship, Stamina, Stealth, Tracking, Unarmed Combat, Weapon Master', 11, 'miaDearden.jpg', 'A former prostitute on the streets of Star City, Mia Dearden picked up the bow and took the name \"Speedy\", crime-fighting student of Green Arrow. She is one of the few superheroes with HIV and was a member of the Teen Titans.'),
(164, 'Roy Harper', 'Agility, Escape Artist, Gadgets, Insanely Rich, Intellect, Leadership, Marksmanship, Power Suit, Stamina, Stealth, Swordsmanship, Tracking, Unarmed Combat, Weapon Master', 11, 'royHarper.jpg', 'Green Arrow\'s first sidekick Speedy, and later Arsenal, and then Red Arrow, Roy Harper has grown to become one of the most accomplished marksmen in the DC Universe. Roy now goes by the name Arsenal once more.'),
(165, 'Thea Queen', 'Adaptive, Agility, Escape Artist, Insanely Rich, Marksmanship, Stamina, Stealth, Swordsmanship, Unarmed Combat, Weapon Master', 11, 'theaQueen.jpg', 'Oliver Queen\'s younger half-sister, ex-girlfriend of Roy Harper, and the daughter of Malcolm Merlyn. She recently became a vigilante and member of Team Arrow, using Roy\'s abandoned Arsenal suit to become the Red Arrow, or \"Speedy.\"'),
(166, 'Felicity Smoak', 'Electronic interaction, Gadgets, Intellect, Leadership', 11, 'felicitySmoak.jpg', 'Originally Felicity Smoak was the stepmother of Ronnie Raymond, the hero known as Firestorm as well as being the manager of a computer company in New York. She is also one of the main characters on the TV series, Arrow, where she acts as a computer expert for Oliver Queen. This version has also made her debut in the comics.'),
(167, 'Bugs Bunny', 'Agility, Escape Artist, Gadgets, Immortal, Intellect, Invulnerability, Leadership, Reality Manpulation, Stealth, Super Hearing, Super Smell, Super Speed, Tracking, Weapon Master, Willpower-Based Constructs', 12, 'bugsBunny.jpg', 'One of the Greatest cartoon characters of all time, Bugs Bunny is known to the world as \'the funniest character on Earth\'; better known for saying his famous quote \"What\'s Up Doc?\" Bugs has been seen in numerous films and comics over the last 5 decades.'),
(168, 'Charlie Dog', 'Agility, Intellect, Super Smell', 12, 'charlieDog.jpg', 'Charlie Dog is an annoying dog that causes grief for some of the Looney Tunes.'),
(169, 'Claude the Cat', 'Claws, Intellect, Weapon Master', 12, 'claudeTheCat.jpg', 'Claude is a second-string Looney Tune character of the 1940s and 1950s.'),
(170, 'Bertie', 'Agility, Claws, Escape Artist', 12, 'bertie.png', 'Hubie and Bertie are two anthropomorphic mice in the Looney Tunes continuity'),
(171, 'Barnyard Dawg', 'Intellect, Super Smell, Unarmed Combat', 12, 'barnyardDawg.jpg', 'The guard dog that Foghorn Leghorn is always hassling.'),
(172, 'Alchemist', 'Intellect, Power Item', 26, 'alchemist.jpg', 'Curt Engstrom was an employee for S.T.A.R. Labs. He used Dr. Alchemys Philosophers Stone to become the Alchemist.'),
(173, 'Chrissie Cavendish', 'none', 26, 'chrissieCavendish.jpg', 'Associated with S.T.A.R. Labs, claims to be the great-great-granddaughter of Solomon Grundy.'),
(174, 'Burton Thompson', 'Intellect, Leadership', 26, 'burtonThompson.jpg', 'The director of Metropoliss STAR Labs.'),
(175, 'Bill Schmitz', 'Intellect', 26, 'billSchmitz.jpg', 'He is a scientist employed by S.T.A.R. Labs in Salt Lake City, Utah.'),
(176, 'Aya', 'none', 26, 'aya.jpg', 'employee of STAR Labss AID division'),
(181, 'Jean-Paul Valley', 'Adaptive, Agility, Berserker Strength, Fire Control, Gadgets, Healing, Intellect, Leadership, Longevity, Marksmanship, Power Suit, Stamina, Swordsmanship, Tracking, Unarmed Combat, Weapon Master', 1, 'jeanPaulValley.jpg', 'Named after the angel of death, Jean-Paul Valley was an agent of the Sacred Order of Saint Dumas. Jean-Paul becomes a more independent crime fighter after acting as Batman for a time.'),
(237, '1', '1', 999, '1', '1'),
(240, '', '', 9, '', ''),
(242, '1', '1', 999, '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `revieuws`
--

CREATE TABLE `revieuws` (
  `id` int(11) NOT NULL,
  `score` double(5,1) NOT NULL,
  `heroes_id` int(11) NOT NULL,
  `users_id` int(11) NOT NULL,
  `comment` varchar(100) DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL,
  `userName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `revieuws`
--

INSERT INTO `revieuws` (`id`, `score`, `heroes_id`, `users_id`, `comment`, `date`, `userName`) VALUES
(10, 5.0, 167, 1, 'wabit', '2018-03-05, 13:03', 'admin'),
(12, 2.5, 1, 1, 'Bats', '2018-03-05, 13:03', 'admin'),
(13, 4.5, 1, 1, 'more bats', '2018-03-05, 13:03', 'admin'),
(14, 2.0, 1, 1, 'even more bats', '2018-03-05, 13:03', 'admin'),
(15, 3.5, 91, 1, 'potato', '2018-03-05, 14:03', 'admin'),
(16, 5.0, 91, 1, 'more potatos', '2018-03-05, 14:03', 'admin'),
(17, 2.0, 91, 1, 'even more potatos', '2018-03-05, 14:03', 'admin'),
(18, 4.0, 138, 5, 'potato', '2018-03-06, 13:03', 'potato'),
(19, 3.0, 97, 2, 'Batgirl', '2018-03-07, 11:03', 'user'),
(20, 3.0, 97, 2, 'potato', '2018-03-07, 11:03', 'user'),
(21, 5.0, 95, 4, 'test', '2018-03-07, 11:03', 'test'),
(22, 1.5, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(23, 4.0, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(24, 3.0, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(25, 3.5, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(26, 4.5, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(27, 5.0, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(28, 0.5, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(29, 0.0, 138, 4, 'score', '2018-03-07, 11:03', 'test'),
(30, 2.5, 1, 4, 'adf', '2018-03-07, 11:03', 'test'),
(31, 3.0, 1, 2, 'bats', '2018-03-08, 12:03', 'user'),
(35, 2.5, 237, 1, 'Asdfghjkl;', '2018-03-14, 09:03', 'admin'),
(36, 3.0, 91, 1, 'daf', '2018-03-14, 12:03', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `image`) VALUES
(1, 'Batman en Robin', 'batmanEnRobin.jpg'),
(2, 'Gotham City Police Department', 'gothamCityPoliceDepartment.jpg'),
(3, 'Teen Titans', 'teenTitans.jpg'),
(4, 'Green Lantern Corps', 'greenLanternCorps.jpg'),
(5, 'Kryptonians', 'kryptonians.jpg'),
(6, 'Blackhawk Squadron', 'blackhawkSquadron.jpg'),
(7, 'Atlanteans', 'atlanteans.jpg'),
(8, 'Suicide Suad', 'suicideSquad.jpg'),
(9, 'Mystery, Inc.', 'mysteryInc.jpg'),
(10, 'Easy Company', 'easyCompany.jpg'),
(11, 'Green Arrow and Speedy', 'greenArrowAndSpeedy.jpg'),
(12, 'Looney Tunes', 'looneyTunes.jpg'),
(26, 'Star Labs', 'starLabs.jpg'),
(999, 'unassigned Heroes', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `fullName` varchar(50) NOT NULL,
  `privilege` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `fullName`, `privilege`) VALUES
(1, 'admin', 'admin', '', 1),
(2, 'user', 'user', '', 0),
(4, 'test', 'test', 'test', 0),
(5, 'potato', 'potato', 'potato', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `heroes`
--
ALTER TABLE `heroes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_heroes_teams_idx` (`teams_id`);

--
-- Indexes for table `revieuws`
--
ALTER TABLE `revieuws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_Revieuws_heroes1_idx` (`heroes_id`),
  ADD KEY `fk_Revieuws_users1_idx` (`users_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `heroes`
--
ALTER TABLE `heroes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;
--
-- AUTO_INCREMENT for table `revieuws`
--
ALTER TABLE `revieuws`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `heroes`
--
ALTER TABLE `heroes`
  ADD CONSTRAINT `fk_heroes_teams` FOREIGN KEY (`teams_id`) REFERENCES `teams` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `revieuws`
--
ALTER TABLE `revieuws`
  ADD CONSTRAINT `fk_Revieuws_heroes1` FOREIGN KEY (`heroes_id`) REFERENCES `heroes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Revieuws_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
