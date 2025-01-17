-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 17 jan. 2025 à 19:55
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `tiktok`
--

-- --------------------------------------------------------

--
-- Structure de la table `tag`
--

CREATE TABLE `tag` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `alignment` float(3,2) NOT NULL DEFAULT 0.50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tag`
--

INSERT INTO `tag` (`id`, `code`, `name`, `alignment`) VALUES
(8, 'chats', 'chats', 0.00),
(9, 'lifestyle', 'lifestyle', 0.30),
(10, 'book', 'book', 0.20),
(11, 'calm', 'calm', 0.10),
(12, 'selfcare', 'selfcare', 0.40),
(13, 'healthy', 'healthy', 0.45),
(14, 'etudiant', 'etudiant', 0.45),
(15, 'chiens', 'chiens', 1.00),
(16, 'comedie', 'comedie', 0.60),
(17, 'popculture', 'popculture', 0.55),
(18, 'motivation', 'motivation', 0.80),
(19, 'sports', 'sports', 0.90),
(20, 'food', 'food', 0.55),
(21, 'musculation', 'musculation', 0.70);

-- --------------------------------------------------------

--
-- Structure de la table `tag_videos_video`
--

CREATE TABLE `tag_videos_video` (
  `tagId` int(11) NOT NULL,
  `videoId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tag_videos_video`
--

INSERT INTO `tag_videos_video` (`tagId`, `videoId`) VALUES
(8, 26),
(8, 27),
(8, 28),
(8, 29),
(8, 30),
(8, 31),
(8, 32),
(8, 33),
(8, 34),
(8, 35),
(8, 36),
(8, 37),
(8, 38),
(8, 39),
(9, 40),
(9, 41),
(9, 42),
(9, 43),
(9, 44),
(9, 45),
(9, 46),
(9, 47),
(9, 48),
(9, 49),
(9, 50),
(10, 51),
(10, 52),
(10, 53),
(10, 54),
(10, 55),
(10, 56),
(10, 57),
(10, 58),
(10, 59),
(10, 60),
(10, 61),
(10, 62),
(10, 63),
(10, 64),
(10, 65),
(11, 66),
(11, 67),
(11, 68),
(11, 69),
(11, 70),
(11, 71),
(11, 72),
(11, 73),
(11, 74),
(12, 75),
(12, 76),
(12, 77),
(12, 78),
(13, 79),
(13, 80),
(13, 81),
(13, 82),
(13, 83),
(13, 84),
(13, 85),
(13, 86),
(13, 87),
(13, 88),
(13, 89),
(13, 90),
(14, 91),
(14, 92),
(14, 93),
(14, 94),
(14, 95),
(14, 96),
(14, 97),
(14, 98),
(14, 99),
(14, 100),
(14, 101),
(14, 102),
(15, 103),
(15, 104),
(15, 105),
(15, 106),
(15, 107),
(15, 108),
(15, 109),
(15, 110),
(15, 111),
(15, 112),
(15, 113),
(15, 114),
(15, 115),
(15, 116),
(15, 117),
(15, 118),
(15, 119),
(15, 120),
(15, 121),
(15, 122),
(15, 123),
(15, 124),
(15, 125),
(15, 126),
(15, 127),
(15, 128),
(15, 129),
(16, 130),
(16, 131),
(16, 132),
(16, 133),
(16, 134),
(16, 135),
(16, 136),
(16, 137),
(16, 138),
(16, 139),
(16, 140),
(16, 141),
(16, 142),
(16, 143),
(16, 144),
(17, 145),
(17, 146),
(17, 147),
(17, 148),
(18, 149),
(18, 150),
(18, 151),
(18, 152),
(18, 153),
(18, 154),
(18, 155),
(18, 156),
(18, 157),
(18, 158),
(18, 159),
(18, 160),
(18, 161),
(19, 162),
(19, 163),
(19, 164),
(19, 165),
(19, 166),
(19, 167),
(19, 168),
(19, 169),
(19, 170),
(19, 171),
(19, 172),
(19, 173),
(19, 174),
(19, 175),
(20, 176),
(20, 177),
(20, 178),
(20, 179),
(20, 180),
(20, 181),
(20, 182),
(20, 183),
(20, 184),
(20, 185),
(20, 186),
(20, 187),
(20, 188),
(20, 189),
(20, 190),
(20, 191),
(20, 192),
(20, 193),
(21, 194),
(21, 195),
(21, 196),
(21, 197),
(21, 198),
(21, 199),
(21, 200),
(21, 201);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `browser_id` varchar(255) NOT NULL,
  `user_alignment` float(3,2) NOT NULL DEFAULT 0.50
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `video`
--

CREATE TABLE `video` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `video`
--

INSERT INTO `video` (`id`, `title`, `description`, `url`, `views`) VALUES
(26, '#foryou #josephquinn #cat #aquietplace #aquietplacedayone ', '', 'video_1.mp4', 0),
(27, '😂#cat #fyp #cattok #funnycat #pet #cutecat ', '', 'video_2.mp4', 0),
(28, '#foryou #parati #cat Gato lamiendose la pata', '', 'video_3.mp4', 0),
(29, '#cat #fyp #котик #киця #kotka #kot #kotek #кіт #кошечка #parksołacki ', '', 'video_4.mp4', 0),
(30, 'My mental protector 집사의 심리상담사 #CapCut #catsoftiktok ', '', 'video_5.mp4', 0),
(31, 'video_6', '', 'video_6.mp4', 0),
(32, 'Doggy doggy #catsoftiktok ', '', 'video_7.mp4', 0),
(33, 'She is too comfortable,so envious 🥹🤣#pet #cat #catsoftiktok #massage #kitten #funnyvideo ', '', 'video_8.mp4', 0),
(34, 'best friends 🫶  #cats #catsoftiktok #brothers #fyp #kittensoftiktok #kitten #love #cutecat #fypシ #viraltiktok #viral ', '', 'video_9.mp4', 0),
(35, '#fyp #cute #fypシ #funnyvideos #catsoftiktok ', '', 'video_10.mp4', 0),
(36, '#funnyvideos😂 #cat ', '', 'video_11.mp4', 0),
(37, 'took a bath for the first time around my cat…. safe to say he was curios! #catsoftiktok #fyp #bath #kitten ', '', 'video_12.mp4', 0),
(38, '#catsoftiktok #fyp ', '', 'video_13.mp4', 0),
(39, 'hello#cats ', '', 'video_14.mp4', 0),
(40, 'Vivienne Westwood 🤝 moi  #grwm #fashionweek #viviennewestwood #pfw #teamsituations ', '', 'video_15.mp4', 0),
(41, 'Mon tout premier concours sur TikTok !!! On fait gagner 15 paires @courir  à l’un(e) d’entre vous 👟 Pour participer, il suffit de :  •⁠  ⁠suivre @Courir + @lenasituations  •⁠  ⁠⁠tag 2 potes en commentaires  #sneakerspirit #courir', '', 'video_16.mp4', 0),
(42, 'one boob for @Balmain 👄  #teamsituations #balmain #pfw #fashiontok ', '', 'video_17.mp4', 0),
(43, 'Merlin l’enchanteur dans sa salle de bain 🧪 @The Ordinary pour le défile Ganni SS25!  collaboration commerciale #TheOrdinary', '', 'video_18.mp4', 0),
(44, 'premier jour de fashion week, c’est le calme avant la tempete. #teamsituations ', '', 'video_19.mp4', 0),
(45, '🔬Dernièrement j’ai rencontré une dermatologue qui m’a expliqué les bases du soin de la peau ! 👩🏻‍⚕️Et selon elle, le B.A.BA d’une skincare routine doit se concentrer sur trois produits, notamment à partir de 25 ans : Vitamine C, Crème solaire et Retinol. ', '', 'video_20.mp4', 0),
(46, 'mon top 4 skincare coréenne 💙 @YesStyle collaboration commerciale #YesStyle #Kbeauty #glassskin', '', 'video_21.mp4', 0),
(47, 'Saviez-vous que vous pouviez créer des parfums 100% naturels avec Aroma-Zone ? 🫶🥰 #aromazone #beauty #naturel #viral #diy ', '', 'video_22.mp4', 0),
(48, 'Idée d’activité à la maison : créer un parfum ensemble 🥹 #aromazone #ideecadeau #activitemanuelle ', '', 'video_23.mp4', 0),
(49, 'Réponse à @Alexandra COMMENT UTILISER LES ACTIFS COSMÉTIQUES  POUR PRENDRE SOIN  DE SES CHEVEUX ? #soincheveuxmaison #aromazone #aromazoneaddict #aromazonerecette #aromazonecrashtest #soincheveuxnaturels #conseilcheveux #produitnaturels #soinnaturel ', '', 'video_24.mp4', 0),
(50, 'Je goûte 4 saveurs de Danette ! #danette #yaourt ', '', 'video_25.mp4', 0),
(51, 'C’est quoi le livre que tu recommande absoluement ?? #booktok #book #books #booktokfrance #livre #fyp #livresaddict ', '', 'video_26.mp4', 0),
(52, 'Le dernier est juste magnifique ! #conseillecture #litterature ', '', 'video_27.mp4', 0),
(53, 'Réponse à @𝖑𝖎𝖘𝖆 📖 en gros tout est : JUSTE INCROYABLE (c’est vraiment un tic de langage je suis désolée 😭) #boo#booktokokrecommendations #fantasybooktok #bookworm ', '', 'video_28.mp4', 0),
(54, 'encore un peu de philo aujourd’hui avec Pascal 🏛️ #philosophy #philosophytiktok #philosophie #philotok #philo #culturegenerale #apprendresurtiktok #philosophyquotes ', '', 'video_29.mp4', 0),
(55, 'La racine de la méchanceté peut être complexe à appréhender, mais elle est incroyablement simple dans le fond. #cyrusnorth #penséedusoir #philosophie #philo', '', 'video_30.mp4', 0),
(56, 'L’incroyable histoire de Diogène, le philosophe le plus barré de son époque. Vous êtes chauds pour la partie 2 ? 🔥 #diogène #cyrusnorth #philosophie #philosophe ', '', 'video_31.mp4', 0),
(57, 'La vie n\'a pas de sens ? C\'est en tout cas ce qu\'une fin du monde pourrait nous montrer. #absurde #camus #philosophie #findumonde #cyrusnorth', '', 'video_32.mp4', 0),
(58, 'C’est triste de ne pas vouloir d’enfants dans cette époque ? Créer et éduquer la nouvelle génération permettront de changer les choses ?  #enfants #avenir #nouvellegeneration #changement #cyrusnorth ', '', 'video_33.mp4', 0),
(59, 'video_34', '', 'video_34.mp4', 0),
(60, 'video_35', '', 'video_35.mp4', 0),
(61, 'Tu veux un appart stylé mais t’as un petit budget ? 💸 Dans ce nouvel épisode de Maintenant tu sais, je te donne quelques astuces pour réussir à meubler ton appartement avec de la déco stylée et pas trop chère entre seconde main, diy et produits neufs 🌸 #i', '', 'video_36.mp4', 0),
(62, 'in my Cruella era 🤍🖤 #interiordecor #interiordesign #midcenturymodern ', '', 'video_37.mp4', 0),
(63, 'You did good today Collaboration with @soulxsigh  I sometimes feel that no matter how much i do it will never be enough, a feeling that most of us seem to deal with, it really can be hard sometimes to realize how much you have done when youre hoping to do', '', 'video_38.mp4', 0),
(64, 'Isn\'t it weird ? Collaboration with @Momentary Existentialism  How endless versions of yourself exist out there, and how you may never know them.  Even in your own mind, you can conjure up different versions of yourself and most of the time still not know', '', 'video_39.mp4', 0),
(65, 'You will always be loved... We often forget, especially during hard times, that their is an endless amount of people who\'s idea of a good day is spending time with you. Our insecurities might creep up on us sometimes and make us feel alone but if you look', '', 'video_40.mp4', 0),
(66, 'On révise les parties du visage ? 👁️👃👄 #asmr #relaxation #routinedusoir #visualisation #vocabulaire #partiesducorps #visage ', '', 'video_41.mp4', 0),
(67, 'Ce soir, ma plus belle œuvre, c\'est toi 💫 Tu es ma toile alors que je me lance dans une nouvelle peinture. J\'ai débloqué la compétence effet vitre grâce aux précieux conseils de @ameli  ❤️ qui propose de nombreuses vidéos avec cet effet, n\'hésitez pas à a', '', 'video_42.mp4', 0),
(68, 'Réponse à @sorcieredesmoore c\'est le retour de la petite fée ! Malheureusement, elle a attrapé froid 🤧 Pas de problème, je vais m\'occuper de toi 🤍   #povfee #povfairy #shewasafairy #🧚‍♀️#povasmr #asmrfrancais #asmrfrance #asmrfrançais #asmr #tuesunefée ', '', 'video_43.mp4', 0),
(69, 'Répondre à @lysellaa De nouvelles ailes rien que pour toi 🧚‍♀️ #fée #elftok #fairy #fairycore #fairytok #faye #asmrpov', '', 'video_44.mp4', 0),
(70, 'Réponse à @ae.anderson un nouveau jeu de couleurs 🎨, cette fois ci plus compliqué ! J\'espère que ça ira quand même 🙏 #asmr #jeudereflexion #jeudememoire #asmrfrance #asmrfr ', '', 'video_45.mp4', 0),
(71, 'L’Almanach de la sorciere moderne 🧙‍♀️sortie le 2 novembre dans toutes les librairies, déjà disponibles en précommande 📦#almanachdelasorcieremoderne #auteure ', '', 'video_46.mp4', 0),
(72, 'Es-tu une sorcière ou un sorcier depuis la naissance ? 🌙🌟 #witchtok #fyp #witch #witchaesthetic ', '', 'video_47.mp4', 0),
(73, 'Types de protections et les pierres  #lithotherapie #pierrenaturelle #bijoupierrenaturelle #protection #oeildetigre ', '', 'video_48.mp4', 0),
(74, 'Les vertus de la Pierre de Lune🌙 #lithotherapie #pierrenaturelle #pierredelune🤍 #pierredeluneblanche #feminite ', '', 'video_49.mp4', 0),
(75, 'Partie 1/2 #crossfit #evolution #gymtok #pourtoi #fyp ', '', 'video_50.mp4', 0),
(76, 'DO IT TODAY 💪 Remember: REGRET is the ENEMY ❤️ #quotes #motivation #running #sport #run #runner ', '', 'video_53.mp4', 0),
(77, 'tuto : comment faire du sport chez soi 🔥🏠  dans la série où j’habite solo j’ai vite compris qu’avoir un appart  = vie active = bcp de tâches ménagères = peu de temps pour soi 💀 alors je vous propose ce petit circuit full body de 10m à faire chez vous sans', '', 'video_54.mp4', 0),
(78, 'l\'exercice le plus complet et qui met tout le monde d\'accord 🙌🏽 Voici un tutoriel complet des burpees. Tu as différents niveaux à toi de choisir. En fin de vidéo je te propose une routine en mode HIIT. 10 fois 30 secondes d\'effort enchaîné avec 30 seconde', '', 'video_55.mp4', 0),
(79, '⬇️ Recette de pâtes poulet curry pour perdre du poids. Une recette healthy et équilibrée pour mieux apprécier sa perte de poids, ou tout simplement maintenir un bon poids. Il faut aimer manger pour ne pas se créer de frustration et finalement grignoter n\'', '', 'video_56.mp4', 0),
(80, '🥑 BOWL AVOCAT SAUMON TERIYAKI 🥑 . _____________________________ . ⏱️ 20 MINUTES ⏱ 📉 656 KCAL (pour tout ) 📉 📈 32PROT 60GLU 32LIP  . _____________________________ . Ingrédients : . 75g de riz basmati (cru) 100g de pavé de saumon   1/2 avocat 1/2 oignon 1 c', '', 'video_57.mp4', 0),
(81, 'Ingrédients (pour 2 portions environ)👇🏻 •2 à 4 tranches de pain  •1 cuillère à soupe d’huile d’olive  •20g de parmesan  •30g de parmesan râpé (dont 10g pour les croûtons)  •2 filets de poulet (environ 220g) (à paner) •1 cœur de laitue ou batavia  •1 conco', '', 'video_58.mp4', 0),
(82, 'Poulet curry coco, repas parfait pour les sportif ou pas! #recette #diet #seche #prisedemasse #protein #gymtok #gymtok #healthyrecipes #musculation', '', 'video_59.mp4', 0),
(83, 'Des repas sains, fait maison et pas cher pour toute la semaine !! Tout ça préparé en moins d’une heure !! 👩‍🍳🤍 (Plus d’infos dans ma bio) #mealprep #mealprepideas #food #tiktokfood ', '', 'video_60.mp4', 0),
(84, 'Galettes de brocoli 🌱 Ingrédients pour 8 galettes  : - 1 brocoli cuit à la vapeur - 1/2 oignon haché - 1 gousse d’ail râpée - 1 poignée de persil haché - Sel et poivre - 1 càc de curry - 1 à 2 càc de levure maltée - 100g de farine (ou plus selon la consis', '', 'video_61.mp4', 0),
(85, '⬇️ Voilà le repas que j\'ai mangé quasiment tous les soirs, qui m\'a fait avoir des abdos! En réalité c\'est pas ce plat qui m\'a aidé, mais + m\'a dépense et la quantité de sport énorme. Mais ce plat est super bon, et contient suffisamment de glucides et prot', '', 'video_62.mp4', 0),
(86, 'Je vais me faire un gros stock !! 💚🍵 C’est quoi votre marque de matcha préférée ?  #matcha #matchalover #matchalatte #wellness #selfcare #nakamuratokichi ', '', 'video_63.mp4', 0),
(87, 'Comment je prépare mon Matcha Latte Glacé 🍵 Aujourd’hui, j’avais envie de vous réconcilier avec cette boisson qui n’est pas très aimée j’ai l’impression !  Alors que bien préparé et avec deux, trois petites astuces vous vous rendrez compte que c’est vraim', '', 'video_64.mp4', 0),
(88, 'Run a cozy fall morning bath with me 🍂🧸🛁 #fall #bath #selfcare #bathtok #cozy #cozyseason #cozyathome #morning #asmr #foryou #aesthetic #relaxing #bathtime #thatgirl #amazonfinds ', '', 'video_65.mp4', 0),
(89, 'La tête de mes recettes en ce moment 😂! Et pourtant sans doute le meilleur velouté de tous les temps 😋 #tiktokfood #recettefacile #vegetablesoup #vegetarianfood ', '', 'video_66.mp4', 0),
(90, 'Antwort auf @ivaaanesa bouncy frothy creamy amazingness 🥹🍵☁️✨ #matcha #matchatok #matchalover #matchatea #matchapowder #homecafe #oatly #matchawhisk #icedmatchalatte #horiishichimeienmatcha  ', '', 'video_67.mp4', 0),
(91, 'video_68', '', 'video_68.mp4', 0),
(92, '#fyp #pourtoi #foryoupage #foryourpage #vaiselle #menage #mdr ', '', 'video_69.mp4', 0),
(93, '#Animalcrossinghappyhomeparadise #animalcrossing #animalcrossingfr #acnh #acnhgift #acnhfr #animalcrossingnewhorizons ', '', 'video_71.mp4', 0),
(94, '#nostalgia #animalcrossing #animalcrossingwildworld #nintendo #ds #nintendods #nostalgic #memories #memory #foryou #foryoupage #fyp ', '', 'video_72.mp4', 0),
(95, 'mood🌧️ #acnh #acnhswitch #acnhdesign #acnhisland #animalcrossing #animalcrossingnewhorizons #rainyday #summerrain ', '', 'video_73.mp4', 0),
(96, 'video_74', '', 'video_74.mp4', 0),
(97, 'bonne journée☀️ #acnh #animalcrossing #animalcrossingnewhorizons #morningroutine ', '', 'video_75.mp4', 0),
(98, 'Certains prennent le risque, t’en fais partie?  #lawstudent #studentlife #facdedroit #etudiantendroit #facultededroit #partielsdroit #examen #partiels ', '', 'video_76.mp4', 0),
(99, 'C’est trop court😔✊#viral #lycee #fyp #faitespercer ', '', 'video_77.mp4', 0),
(100, '#fyp #lettredemotivation #bassem #pourtoi #motive #prt #lavie #reel ', '', 'video_78.mp4', 0),
(101, 'Congrats on making it to trombone Tiktok 🎶 David Finlayson#ImAMusician #Music Saves#Trombone', '', 'video_79.mp4', 0),
(102, '#kodakblack #animalcrossing ', '', 'video_80.mp4', 0),
(103, 'We LOVE our Maggie😊😊😊 @maggiethelab_smiles  #pawmspetresort #pawmshuntsville #pawms #dogsoftiktok #dogtok #dogboarding #petresortlife #dogsofhuntsville #huntsvillealabama ', '', 'video_81.mp4', 0),
(104, 'Shes very expressive this gurl! #goldenretriever #dogsoftiktok #goldensoftiktok #fyp #cutedog ', '', 'video_82.mp4', 0),
(105, 'We really dont deserve dogs 🥹 #dogs #dogsoftiktok #work #happy #family #viral #fyp ', '', 'video_83.mp4', 0),
(106, 'video_84', '', 'video_84.mp4', 0),
(107, 'Boyfriend calls me into the kitchen, says for me to grab my phone and start recording…. I walked in and seen this!!! #dog #funny#comedy#fypage #furbaby #hilariouspetstv #cantstoplaughing ', '', 'video_85.mp4', 0),
(108, 'Moose had us in the first half 😭😭🚨Follow @Pubity for your daily dose of uplifting content 🚨  #Pubity (Moose the Magnificent via @ViralHog)', '', 'video_86.mp4', 0),
(109, 'Then vs now with my 10 year old Riley❤️ #goldenretriever #dogsoftiktok ', '', 'video_87.mp4', 0),
(110, 'Wholesome 💕  #bestie #golden #goldensoftiktok #dog #dogsoftiktok #dogtok #dogs #goldentok #fyp #fypシ #wholesome ', '', 'video_88.mp4', 0),
(111, 'Getting more sassy by the day #dogs #dogsofttiktok #justababy #puppiesoftiktok #labradorpuppy #labrador #dog #puppytiktok #puppies #puppy #chomp #chomper #sassy #sassydog #chomping', '', 'video_89.mp4', 0),
(112, 'The other dog checking up on him 🥺🥺 #RoadTo15Million #Pubity  (Supervetteracer via ViralHog)', '', 'video_90.mp4', 0),
(113, 'video_91', '', 'video_91.mp4', 0),
(114, 'If you would like support me for more videos like this then I would be very grateful ⬇️ PayPal: Darren.domrow@gmail.com  #sunset #dog #nature ', '', 'video_92.mp4', 0),
(115, 'Camping with the sweetest golden boy 🥰 #golden #friends #camping #dog ', '', 'video_93.mp4', 0),
(116, '😴😂 #sleep #sleeping #dog #goldenretrieverlife #funnyvideo ', '', 'video_94.mp4', 0),
(117, 'The moment he said \"Hello small fellow\" my heart melted 🥺 (@boscoandhisbigstick) #dog #dogsoftiktok #stick #cute #wholesome #stranger #hoest ', '', 'video_95.mp4', 0),
(118, 'video_96', '', 'video_96.mp4', 0),
(119, 'The cutest 🥹🥰 #pup #puppy #puppies #puppylove #puppiesoftiktok #doglover #australianshepherd #aussie #aussies #aussiepuppy #australiansheperdpuppy #love #aussiething #dog #dogsoftiktok #fy #fyp #puppylife #cute #cutedog #cutedogs #new ', '', 'video_97.mp4', 0),
(120, 'Silly dogs 😍🤪🥰❤️💕😂🐾🐶🐩🐕🦴#funnyvideos #petlovers #animalsoftiktok #dogsoftiktokviral #viraldogs #puppiesoftiktok #cuteanimals #doglovers #funnypets #dogslife #cutepets #TrendTok #TrendTokApp', '', 'video_98.mp4', 0),
(121, '#wienerdog #cutedog #funnyvideos #funnydog #hahaha ', '', 'video_99.mp4', 0),
(122, 'My baby bear 🐻💛 #puppy #dogsoftiktok #puppiesoftiktok #bernesemountaindog #bernesemountaindogpuppy ', '', 'video_100.mp4', 0),
(123, 'A dog on a skateboard#dog #puppy #funny #fyp #dogsoftiktok ', '', 'video_101.mp4', 0),
(124, '#sneaky #borzoi #man ', '', 'video_102.mp4', 0),
(125, 'Rating the ⭐️SOUNDS⭐️ my goats make #borzoi #rating #doglife #weird #ASMR #dogs #unhinged #dogsoftiktok #list #best #cute ', '', 'video_103.mp4', 0),
(126, 'DidntidoIT4u . . . #didntidoitforyou #borzoi #wereback #snoot #loopsnoot #kermi #sighthound #memelord', '', 'video_104.mp4', 0),
(127, 'video_105', '', 'video_105.mp4', 0),
(128, 'lonely? vibe with Seal Winnie instead🙂‍↕️ . #dogtok #dogsoftiktok #dog #cutedog #shibainu #anri #citypop #sealwinnie ', '', 'video_106.mp4', 0),
(129, 'HANDS UP 🙌 BABY HANDS UP🐕 #fyp #dogsoftiktok #chihuahua ', '', 'video_107.mp4', 0),
(130, 'Carlos ADORE les mamans ! 😂💃 Retrouve le sketch d\'@alexandrekominek en intégralité sur notre chaîne Youtube. ✨ #Humour #StandUp #Sketch #Comédie #MontreuxComedy', '', 'video_108.mp4', 0),
(131, 'Un anglais vraaaaaaiment 😂 @rachidbadouriofficiel  #RachidBadouri #Anglais #Humour #StandUp #Comedy #Comédie #MontreuxComedy #MontreuxComedyFestival', '', 'video_109.mp4', 0),
(132, 'Mes conseils en éducation 🙆‍♀️🤷‍♀️ - Extrait du premier spectacle « Le diable est une gentille petite fille » dispo en streaming et DVD ☺🎤 - #humour #humoriste #lauralaune ', '', 'video_110.mp4', 0),
(133, '#redouane_bougheraba #redouanebougheraba #videoviral #fyp #amazonprime #comedie #canalplus #canal #comedie_humour #comediefrancaise #marseille #marseille13 #marseille🇫🇷 #onmapellemarseille #algeria #algerie #algerie🇩🇿 #france🇫🇷 #marocaine🇲🇦 #maroco🇲🇦alger', '', 'video_111.mp4', 0),
(134, 'Redouane Bougheraba - Un rire Extraordinaire #redouanebougheraba #redouane #humour #comédie #drole #spectacle #standup #humor #rigolade #humoriste #sketch #rire #blagues #theatre ', '', 'video_112.mp4', 0),
(135, 'La vie de @meryembenoua si elle était un mec ! 😂  #Humour#StandUp#Comédie#MontreuxComedy#MontreuxComedyFestival', '', 'video_113.mp4', 0),
(136, 'Le tennis créé par un mauvais perdant ? @warynichen t\'explique sa théorie ! 😂🎾 Retrouve son sketch en intégralité sur notre chaîne Youtube. ✨  #Humour #StandUp #Sketch #Comédie #MontreuxComedy #MontreuxComedyFestival #Tennis', '', 'video_114.mp4', 0),
(137, 'La blague du jour 😂', '', 'video_115.mp4', 0),
(138, 'J\'ai perdu #turistuperds #riredeouf  #behindthepanda #serietv #letrolldupanda #amazonprime', '', 'video_116.mp4', 0),
(139, 'Devine ces expressions que seul un français bien beauf pourra compléter. Tu as un niveau de beauferie très élevé si tu trouves toutes ces expressions françaises de beauf. #quiz #expressionfrancaise ', '', 'video_117.mp4', 0),
(140, '#foryou my first edit', '', 'video_118.mp4', 0),
(141, '\"J\'ai trop mangé de kebab\" Dispo partout 🥙🥙🥙', '', 'video_119.mp4', 0),
(142, 'Il a cru j\'etais anglais alors que jvoulais juste lui montrer mon portfolio #pourtoi #prank #humour idée de @oprahcam5', '', 'video_120.mp4', 0),
(143, 'video_121', '', 'video_121.mp4', 0),
(144, '#pourtoii #funny #memestiktok ', '', 'video_122.mp4', 0),
(145, 'Abonne-toi !✅ #tiktokfrance🇨🇵 #foryourpage #fyp #humour #percersurtiktok #fortnite #drole #rigole #vus #pourtoi ', '', 'video_124.mp4', 0),
(146, 'Bro what is ts😭🙏 |#fortnite #fyp #foryou #trending #fortniteremix ', '', 'video_125.mp4', 0),
(147, 'Drop it like it‘s HOT🔥  #fortnite #snoopdogg #fortniteanimation #chapter2remix #fortniteog ', '', 'video_126.mp4', 0),
(148, '“I got you right where i want you” ahh clip 😭💀 #fortnite ', '', 'video_127.mp4', 0),
(149, '4 principes de vie puissants que j\'aurais aimé connaître avant | #Motivation #conseil #france #principe #mindset ', '', 'video_128.mp4', 0),
(150, 'Pour te motiver💕💪🏼 #foryou #pourtoi #fyp #motivation #gym #sport #conseil #sport', '', 'video_129.mp4', 0),
(151, 'Vous êtes comme ça aussi ? ❌ #conseils #motivation #apprendresurtiktok ', '', 'video_130.mp4', 0),
(152, '3 conseils pour les jeunes et les débutants pour commencer à investir !  #laminutecoaching #business #entrepreneur #entreprendre #entrepreneuriat #devperso #immobilier #rentierimmo #investirimmo #investissement #investissementimmo #tiktokacademie ', '', 'video_131.mp4', 0),
(153, 'video_132', '', 'video_132.mp4', 0),
(154, 'Une idee de business pour débutant ! 🤯 #oussamaammar #entrepreneur #business #mindset #millionnaire #idéebusiness ', '', 'video_133.mp4', 0),
(155, 'Economiquement, un salarié est une marge pour son employeur #stephanemallard #findusalariat #entrepreneur #entrepreneuriat #chatgpt #intelligenceartificielle #business', '', 'video_134.mp4', 0),
(156, 'Une stratégie marketing de fou 🤯 #yomidenzel #entrepreneur #business #marketing #gucci', '', 'video_135.mp4', 0),
(157, 'video_136', '', 'video_136.mp4', 0),
(158, 'Si tu débutes dans le monde des cryptos, cette vidéo contient un message ULTRA important pour toi #hasheur', '', 'video_137.mp4', 0),
(159, 'video_138', '', 'video_138.mp4', 0),
(160, 'Un Bitcoin à 100k en 2025 ? ', '', 'video_139.mp4', 0),
(161, 'Tu ne sais pas comment acheter ton 1er bitcoin ? 🤯 La plupart des gens pensent qu\'ils devraient acheter du bitcoin. 🚀 Il y a un an, il était à 16 000 €. Aujourd\'hui, il est à 60 000 €. Alors, pourquoi tout le monde n\'en achète pas ? 🤔 Parce qu\'ils ne save', '', 'video_140.mp4', 0),
(162, 'Voici une séance adaptée à l\'obésité ! Plusieurs options sont disponible par exercice en fonction de ton niveau 😁 De même, selon ton niveau tu choisiras plus ou moins de temps de travail et plus ou moins de temps de repos, avec, en moyenne 4 tours au tota', '', 'video_141.mp4', 0),
(163, 'Je teste une salle de sport de luxe 💸 Insta:matosbeatbox 🗿', '', 'video_142.mp4', 0),
(164, 'video_143', '', 'video_143.mp4', 0),
(165, 'Le T, ça veut souvent dire Turbo, souvent.  #pourtoi #foryou #fyp #cars ', '', 'video_144.mp4', 0),
(166, 'Notre cher Multipla  #pourtoi #foryou #fiat ', '', 'video_145.mp4', 0),
(167, '\"Le Cross Fit c\'est mieux que la musculation\" #musculation #sport #crossfit', '', 'video_146.mp4', 0),
(168, 'I love the big red bull & no I didn’t drink it all by myself hahah #redbull #bigboy ', '', 'video_147.mp4', 0),
(169, '#redbull #fyp #global #glamour #cold #meow ', '', 'video_148.mp4', 0),
(170, 'Cuidado! ✋ Tricks hipnotizantes acima. 🌀 #bmx #bmxstreet #bike #bmxfreestyle #RedBull #TeDáAsas', '', 'video_149.mp4', 0),
(171, '#fyp #xyzbca #scootering #street #skatepark #viral #steez #rage #rob ', '', 'video_150.mp4', 0),
(172, 'I have tried doing this trick many times before. The support and encouragement from my friends have definitely helped me land it. Thank you! #trick #skatepark #support #trottinettefreestyle #freestylescooter #cheering #flying ', '', 'video_151.mp4', 0),
(173, 'Seul un vrai mécanicien pourra trouver le nom de ces 10 pièces automobiles dans ce quiz. Il faut adorer la mécanique et les voitures pour réussir ce test. #quiz #logo ', '', 'video_152.mp4', 0),
(174, '… and that how Kieran Reilly become BMX Freestyle WORLD CHAMP 👏🏽 #redbull ', '', 'video_153.mp4', 0),
(175, 'These are the moments I live for!❤️ #bmx #nitrocircus ', '', 'video_154.mp4', 0),
(176, 'UN BBQ CORÉEN AVEC VIANDE HALAL 🇰🇷🔥 Le concept est convivial et super sympas 🥰 Tu choisis tes viandes bien marinées que tu viens les cuire directement à table🍴 ➡️ T’as plein de viande Halal : entrecôte de bœuf mariné, paleron de boeuf, agneau désossé, pou', '', 'video_155.mp4', 0),
(177, 'COMMENT FAIRE UN BARBECUE CORÉEN À LA MAISON ? 🇰🇷🥢 comme au resto mais pas cher !! #bbqcoreen #bbq #kbbq #viande #tuto #recette #tiktokfood #foodie #asian #asianfood #koreanfood #pascher #bonplan #degustationasiatique #barbecuecoréen ', '', 'video_156.mp4', 0),
(178, 'Sharp as a razor🔥🍻 back in stock😱 check the bio🙌 #menwiththepot #cooking #fyp #foryou #food #forest #knife #nature', '', 'video_158.mp4', 0),
(179, '#asmr #asmrsounds #asmrvideo #asmrtiktoks #asmrfood #asmrcamping #camping #plat #cuisine #poisson ', '', 'video_159.mp4', 0),
(180, 'Pizza Madness 🔥 One slice is never enough 😎 #menwiththepot #foodporn #asmr #fyp #foryou #pizza #nature #forest #4u ', '', 'video_160.mp4', 0),
(181, '#asmr #cuisine #cuisinetiktok #asmrsounds #nature ', '', 'video_161.mp4', 0),
(182, 'Eat beef steak properly in the natural forest 🥩🥧🔥🔥🌳🌳 #leon #cooking #outdoorcooking #foryou #food #nature #asmr ', '', 'video_162.mp4', 0),
(183, 'Yayla da Dana Hamburger Köfte 🍔  #outdoorcooking #burger #outdor #outdoors #meatlovers #surviaval #mountains #nature #food #cooking #foodvideos #asmr #relax #hungry #crunch #wilderness #adventures #asmrvideo ', '', 'video_163.mp4', 0),
(184, 'Côte de bœuf et beurre à l\'ail 🥩  #cotedeboeuf #viande #viandar #cuisine #cuisinefrancaise #gastronomie #gastronomiefrancaise #recette #boeuf ', '', 'video_164.mp4', 0),
(185, '🥩Écouter le bruit de la viande, cuire sur une pierre ollaire 😍 #viande #meat #meatlovers #ripaille #food #restaurant #strasbourg #pierre #original #steack #boeuf #beef #canard #duck #veau #alsace #viandecrue #cuisine 🗣️ Voici un repère de viandards à Stra', '', 'video_165.mp4', 0),
(186, '#big #burger 🍔🍔🍔', '', 'video_166.mp4', 0),
(187, 'Giant cheeseburger!!! #ChiliDogYumPlz #foryou #fyp #tiktokfood #viral #burger', '', 'video_167.mp4', 0),
(188, 'Can you eat this? #dubai #fyp #foryoupage #1millionaudituon #larrywheels #viral #burger #اكسبلور #explore #uae #tiktok #arab #luxury #giantburger', '', 'video_168.mp4', 0),
(189, 'CHIPOTLE BURRITO!!❤️🌯 how many bites to finish the whole thing?😏 I shocked myself with that last bite😂#chipotle#giantburrito#chipotleburrito#burritos#burritomukbang#mexicanfood#chipotlemukbang#mukbang#chipotlehack#mukbangeatingshow#eatingshow#eating#eatin', '', 'video_169.mp4', 0),
(190, '#eat #food #mukbang fast food, gourmet', '', 'video_170.mp4', 0),
(191, 'video_171', '', 'video_171.mp4', 0),
(192, 'CHEESEBURGER WITH CHEESE SAUCE🤤 BURGER MUKBANG🍔 #foryou #foryoupage #fyp #asmreating #eatingshow #mukbang #먹방 #ddm_asmr #burger #cheeseburger ', '', 'video_172.mp4', 0),
(193, 'video_173', '', 'video_173.mp4', 0),
(194, 'video_174', '', 'video_174.mp4', 0),
(195, 'Partage tes sources de glucides préférées dans les commentaires pour aider un max de monde 🏆🔥 #gymtok #musculation #fitness #fypシ', '', 'video_175.mp4', 0),
(196, 'donnez-lui un Oscar s\'il vous plaît 😂 #humour #musculation #fyp #traning #pourtoi #fitness #basicfit #bodybuilding ', '', 'video_176.mp4', 0),
(197, '👉Arrête de faire ces erreurs et abonne-toi pour plus de tips sur le sport et la muscu  _ #salledesport #transformationphysique #motivation #tipsmusculation #prisedemassemusculaire #pertedepoids', '', 'video_177.mp4', 0),
(198, 'video_178', '', 'video_178.mp4', 0),
(199, 'Tag un ami qui vient de commencer la muscu 💪 #inshapenutrition ', '', 'video_179.mp4', 0),
(200, 'Tag un bigorexique !', '', 'video_180.mp4', 0),
(201, 'Recette petit déjeuner musclé ! Bowl cake healthy gourmand et protéinée ! Qui veut test ??', '', 'video_181.mp4', 0);

-- --------------------------------------------------------

--
-- Structure de la table `visionnage`
--

CREATE TABLE `visionnage` (
  `id` int(11) NOT NULL,
  `nb_views` int(11) NOT NULL DEFAULT 0,
  `watched_prcnt` float NOT NULL DEFAULT 0,
  `has_liked` tinyint(4) NOT NULL DEFAULT 0,
  `score` float DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `videoId` int(11) DEFAULT NULL,
  `watched_in_seconds` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `tag_videos_video`
--
ALTER TABLE `tag_videos_video`
  ADD PRIMARY KEY (`tagId`,`videoId`),
  ADD KEY `IDX_38df74e321a829c8ddd9fabad5` (`tagId`),
  ADD KEY `IDX_0979be2ef6eac80f1754363570` (`videoId`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `visionnage`
--
ALTER TABLE `visionnage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_a6193a043fabf73022697c60750` (`userId`),
  ADD KEY `FK_b9b5bc6d90ce87f73e144bf2f5b` (`videoId`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `tag`
--
ALTER TABLE `tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `video`
--
ALTER TABLE `video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT pour la table `visionnage`
--
ALTER TABLE `visionnage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `tag_videos_video`
--
ALTER TABLE `tag_videos_video`
  ADD CONSTRAINT `FK_0979be2ef6eac80f1754363570b` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_38df74e321a829c8ddd9fabad53` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `visionnage`
--
ALTER TABLE `visionnage`
  ADD CONSTRAINT `FK_a6193a043fabf73022697c60750` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_b9b5bc6d90ce87f73e144bf2f5b` FOREIGN KEY (`videoId`) REFERENCES `video` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
