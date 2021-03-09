-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 09 2021 г., 11:23
-- Версия сервера: 10.3.22-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `articles`
--

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `name` longtext DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `id` double NOT NULL,
  `post_id` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`name`, `email`, `body`, `id`, `post_id`) VALUES
('id voluptatibus voluptas occaecati quia sunt eveniet et eius', 'Tiana@jeramie.tv', 'dolore maxime saepe dolor asperiores cupiditate nisi nesciunt\nvitae tempora ducimus vel eos perferendis\nfuga sequi numquam blanditiis sit sed inventore et\nut possimus soluta voluptas nihil aliquid sed earum', 301, 61),
('quia voluptatem sunt voluptate ut ipsa', 'Lindsey@caitlyn.net', 'fuga aut est delectus earum optio impedit qui excepturi\niusto consequatur deserunt soluta sunt\net autem neque\ndolor ut saepe dolores assumenda ipsa eligendi', 302, 61),
('excepturi itaque laudantium reiciendis dolorem', 'Gregory.Kutch@shawn.info', 'sit nesciunt id vitae ut itaque sapiente\nneque in at consequuntur perspiciatis dicta consequatur velit\nfacilis iste ut error sed\nin sequi expedita autem', 303, 61),
('voluptatem quidem animi sit est nemo non omnis molestiae', 'Murphy.Kris@casimer.me', 'minus ab quis nihil quia suscipit vel\nperspiciatis sunt unde\naut ullam quo laudantium deleniti modi\nrerum illo error occaecati vel officiis facere', 304, 61),
('non cum consequatur at nihil aut fugiat delectus quia', 'Isidro_Kiehn@cristina.org', 'repellendus quae labore sunt ut praesentium fuga reiciendis quis\ncorporis aut quis dolor facere earum\nexercitationem enim sunt nihil asperiores expedita\neius nesciunt a sit sit', 305, 61),
('omnis nisi libero', 'Kenton_Carter@yolanda.co.uk', 'ab veritatis aspernatur molestiae explicabo ea saepe molestias sequi\nbeatae aut perferendis quaerat aut omnis illo fugiat\nquisquam hic doloribus maiores itaque\nvoluptas amet dolorem blanditiis', 306, 62),
('id ab commodi est quis culpa', 'Amos_Rohan@mozelle.tv', 'sit tenetur aut eum quasi reiciendis dignissimos non nulla\nrepellendus ut quisquam\nnumquam provident et repellendus eum nihil blanditiis\nbeatae iusto sed eius sit sed doloremque exercitationem nihil', 307, 62),
('enim ut optio architecto dolores nemo quos', 'Timothy_Heathcote@jose.name', 'officiis ipsa exercitationem impedit dolorem repellat adipisci qui\natque illum sapiente omnis et\nnihil esse et eum facilis aut impedit\nmaxime ullam et dolorem', 308, 62),
('maiores et quisquam', 'Otilia.Daniel@elvie.io', 'impedit qui nemo\nreprehenderit sequi praesentium ullam veniam quaerat optio qui error\naperiam qui quisquam dolor est blanditiis molestias rerum et\nquae quam eum odit ab quia est ut', 309, 62),
('sed qui atque', 'Toni@joesph.biz', 'quae quis qui ab rerum non hic\nconsequatur earum facilis atque quas dolore fuga ipsam\nnihil velit quis\nrerum sit nam est nulla nihil qui excepturi et', 310, 62),
('veritatis nulla consequatur sed cumque', 'Brisa@carrie.us', 'officia provident libero explicabo tempora velit eligendi mollitia similique\nrerum sit aut consequatur ullam tenetur qui est vero\nrerum est et explicabo\nsit sunt ea exercitationem molestiae', 311, 63),
('libero et distinctio repudiandae voluptatem dolores', 'Jasen.Kihn@devon.biz', 'ipsa id eum dolorum et officiis\nsaepe eos voluptatem\nnesciunt quos voluptas temporibus dolores ad rerum\nnon voluptatem aut fugit', 312, 63),
('quia enim et', 'Efren.Konopelski@madisyn.us', 'corporis quo magnam sunt rerum enim vel\nrepudiandae suscipit corrupti ut ab qui debitis quidem adipisci\ndistinctio voluptatibus vitae molestias incidunt laboriosam quia quidem facilis\nquia architecto libero illum ut dicta', 313, 63),
('enim voluptatem quam', 'Demetris.Bergnaum@fae.io', 'sunt cupiditate commodi est pariatur incidunt quis\nsuscipit saepe magnam amet enim\nquod quis neque\net modi rerum asperiores consequatur reprehenderit maiores', 314, 63),
('maxime nulla perspiciatis ad quo quae consequatur quas', 'Luella.Pollich@gloria.org', 'repudiandae dolores nam quas\net incidunt odio dicta eum vero dolor quidem\ndolorem quisquam cumque\nmolestiae neque maxime rerum deserunt nam sequi', 315, 63),
('totam est minima modi sapiente nobis impedit', 'Sister.Morissette@adelia.io', 'consequatur qui doloribus et rerum\ndebitis cum dolorem voluptate qui fuga\nnecessitatibus quod temporibus non voluptates\naut saepe molestiae', 316, 64),
('iusto pariatur ea', 'Shyanne@rick.info', 'quam iste aut molestiae nesciunt modi\natque quo laudantium vel tempora quam tenetur neque aut\net ipsum eum nostrum enim laboriosam officia eligendi\nlaboriosam libero ullam sit nulla voluptate in', 317, 64),
('vitae porro aut ex est cumque', 'Freeman.Dare@ada.name', 'distinctio placeat nisi repellat animi\nsed praesentium voluptatem\nplaceat eos blanditiis deleniti natus eveniet dolorum quia tempore\npariatur illum dolor aspernatur ratione tenetur autem ipsum fugit', 318, 64),
('et eos praesentium porro voluptatibus quas quidem explicabo est', 'Donnell@orland.org', 'occaecati quia ipsa id fugit sunt velit iure adipisci\nullam inventore quidem dolorem adipisci optio quia et\nquis explicabo omnis ipsa quo ut voluptatem aliquam inventore\nminima aut tempore excepturi similique', 319, 64),
('fugiat eos commodi consequatur vel qui quasi', 'Robin@gaylord.biz', 'nihil consequatur dolorem voluptatem non molestiae\nodit eum animi\nipsum omnis ut quasi\nvoluptas sed et et qui est aut', 320, 64),
('rem ducimus ipsam ut est vero distinctio et', 'Danyka_Stark@jedidiah.name', 'ea necessitatibus eum nesciunt corporis\nminus in quisquam iste recusandae\nqui nobis deleniti asperiores non laboriosam sunt molestiae dolore\ndistinctio qui officiis tempora dolorem ea', 321, 65),
('ipsam et commodi', 'Margarita@casper.io', 'id molestiae doloribus\nomnis atque eius sunt aperiam\ntenetur quia natus nihil sunt veritatis recusandae quia\ncorporis quam omnis veniam voluptas amet quidem illo deleniti', 322, 65),
('et aut non illo cumque pariatur laboriosam', 'Carlo@cortney.net', 'explicabo dicta quas cum quis rerum dignissimos et\nmagnam sit mollitia est dolor voluptas sed\nipsum et tenetur recusandae\nquod facilis nulla amet deserunt', 323, 65),
('ut ut architecto vero est ipsam', 'Mina@nikita.tv', 'ipsam eum ea distinctio\nducimus saepe eos quaerat molestiae\ncorporis aut officia qui ut perferendis\nitaque possimus incidunt aut quis', 324, 65),
('odit sit numquam rerum porro dolorem', 'Violette@naomi.tv', 'qui vero recusandae\nporro esse sint doloribus impedit voluptatem commodi\nasperiores laudantium ut dolores\npraesentium distinctio magnam voluptatum aut', 325, 65),
('voluptatem laborum incidunt accusamus', 'Lauren.Hodkiewicz@jarret.info', 'perspiciatis vero nulla aut consequatur fuga earum aut\nnemo suscipit totam vitae qui at omnis aut\nincidunt optio dolorem voluptatem vel\nassumenda vero id explicabo deleniti sit corrupti sit', 326, 66),
('quisquam necessitatibus commodi iure eum', 'Ernestina@piper.biz', 'consequatur ut aut placeat harum\nquia perspiciatis unde doloribus quae non\nut modi ad unde ducimus omnis nobis voluptatem atque\nmagnam reiciendis dolorem et qui explicabo', 327, 66),
('temporibus ut vero quas', 'Hettie_Morar@wiley.info', 'molestiae minima aut rerum nesciunt\nvitae iusto consequatur architecto assumenda dolorum\nnon doloremque tempora possimus qui mollitia omnis\nvitae odit sed', 328, 66),
('quasi beatae sapiente voluptates quo temporibus', 'Corbin.Hilll@modesto.biz', 'nulla corrupti delectus est cupiditate explicabo facere\nsapiente quo id quis illo culpa\nut aut sit error magni atque asperiores soluta\naut cumque voluptatem occaecati omnis aliquid', 329, 66),
('illo ab quae deleniti', 'Kenyatta@renee.io', 'dolores tenetur rerum et aliquam\nculpa officiis ea rem neque modi quaerat deserunt\nmolestias minus nesciunt iusto impedit enim laborum perferendis\nvelit minima itaque voluptatem fugiat', 330, 66),
('nemo cum est officia maiores sint sunt a', 'Don@cameron.co.uk', 'maxime incidunt velit quam vel fugit nostrum veritatis\net ipsam nisi voluptatem voluptas cumque tempora velit et\net quisquam error\nmaiores fugit qui dolor sit doloribus', 331, 67),
('dicta vero voluptas hic dolorem', 'Jovan@aaliyah.tv', 'voluptas iste deleniti\nest itaque vel ea incidunt quia voluptates sapiente repellat\naut consectetur vel neque tempora esse similique sed\na qui nobis voluptate hic eligendi doloribus molestiae et', 332, 67),
('soluta dicta pariatur reiciendis', 'Jeanie.McGlynn@enoch.ca', 'et dolor error doloremque\nodio quo sunt quod\nest ipsam assumenda in veniam illum rerum deleniti expedita\nvoluptate hic nostrum sed dolor et qui', 333, 67),
('et adipisci laboriosam est modi', 'Garett_Gusikowski@abigale.me', 'et voluptatibus est et aperiam quaerat voluptate eius quo\nnihil voluptas doloribus et ea tempore\nlabore non dolorem\noptio consequatur est id quia magni voluptas enim', 334, 67),
('voluptatem accusantium beatae veniam voluptatem quo culpa deleniti', 'Doug@alana.co.uk', 'hic et et aspernatur voluptates voluptas ut ut id\nexcepturi eligendi aspernatur nulla dicta ab\nsuscipit quis distinctio nihil\ntemporibus unde quasi expedita et inventore consequatur rerum ab', 335, 67),
('eveniet eligendi nisi sunt a error blanditiis et ea', 'Yoshiko@viviane.name', 'similique autem voluptatem ab et et\nodio animi repellendus libero voluptas voluptas quia\nlibero facere saepe nobis\nconsequatur et qui non hic ea maxime nihil', 336, 68),
('beatae esse tenetur aut est', 'Micaela_Bins@mertie.us', 'est ut aut ut omnis distinctio\nillum quisquam pariatur qui aspernatur vitae\ndolor explicabo architecto veritatis ipsa et aut est molestiae\nducimus et sapiente error sed omnis', 337, 68),
('qui sit quo est ipsam minima neque nobis', 'Loy@gillian.me', 'maiores totam quo atque\nexplicabo perferendis iste facilis odio ab eius consequatur\nsit praesentium ea vitae optio minus\nvoluptate necessitatibus omnis itaque omnis qui', 338, 68),
('accusantium et sit nihil quibusdam voluptatum provident est qui', 'Tyrel@hunter.net', 'dicta dolorem veniam ipsa harum minus sequi\nomnis quia voluptatem autem\nest optio doloribus repellendus id commodi quas exercitationem eum\net eum dignissimos accusamus est eaque doloremque', 339, 68),
('rerum et quae tenetur soluta voluptatem tempore laborum enim', 'Otilia.Schuppe@randal.com', 'est aut consequatur error illo ut\nenim nihil fuga\nsuscipit inventore officiis iure earum pariatur temporibus in\naperiam qui quod vel necessitatibus velit eos exercitationem culpa', 340, 68),
('sunt ut voluptatem cupiditate maxime dolores eligendi', 'April@larissa.co.uk', 'iure ea ea neque est\nesse ab sed hic et ullam sed sequi a\nnon hic tenetur sunt enim ea\nlaudantium ea natus', 341, 69),
('corporis at consequuntur consequatur', 'Glenna_Waters@retha.me', 'quis beatae qui\nsequi dicta quas et dolor\nnon enim aspernatur excepturi aut rerum asperiores\naliquid animi nulla ea tempore esse', 342, 69),
('repellat sed consequatur suscipit aliquam', 'Cordelia.Oberbrunner@peyton.com', 'ea alias eos et corrupti\nvoluptatem ab incidunt\nvoluptatibus voluptas ea nesciunt\ntotam corporis dolor recusandae voluptas harum', 343, 69),
('blanditiis rerum voluptatem quaerat modi saepe ratione assumenda qui', 'Zander@santino.net', 'iusto nihil quae rerum laborum recusandae voluptatem et necessitatibus\nut deserunt cumque qui qui\nnon et et eos adipisci cupiditate dolor sed voluptates\nmaiores commodi eveniet consequuntur', 344, 69),
('ut deleniti autem ullam quod provident ducimus enim explicabo', 'Camila_Runolfsdottir@tressa.tv', 'omnis et fugit eos sint saepe ipsam unde est\ndolores sit sit assumenda laboriosam\ndolor deleniti voluptatem id nesciunt et\nplaceat dolorem cumque laboriosam sunt non', 345, 69),
('beatae in fuga assumenda dolorem accusantium blanditiis mollitia', 'Kirstin@tina.info', 'quas non magnam\nquia veritatis assumenda reiciendis\nsimilique dolores est ab\npraesentium fuga ut', 346, 70),
('tenetur id delectus recusandae voluptates quo aut', 'Anthony.Koepp@savannah.tv', 'consectetur illo corporis sit labore optio quod\nqui occaecati aut sequi quia\nofficiis quia aut odio quo ad\nrerum tenetur aut quasi veniam', 347, 70),
('molestias natus autem quae sint qui', 'Bradley.Lang@marilyne.tv', 'perferendis dignissimos soluta ut provident sit et\ndelectus ratione ad sapiente qui excepturi error qui quo\nquo illo commodi\nrerum maxime voluptas voluptatem', 348, 70),
('odio maiores a porro dolorum ut pariatur inventore', 'Loren@aric.biz', 'dicta impedit non\net laborum laudantium qui eaque et beatae suscipit\nsequi magnam rem dolorem non quia vel adipisci\ncorrupti officiis laudantium impedit', 349, 70),
('eius quia pariatur', 'Arjun@natalie.ca', 'eaque rerum tempore distinctio\nconsequatur fugiat veniam et incidunt ut ut et\nconsequatur blanditiis magnam\ndoloremque voluptate ut architecto facere in dolorem et aut', 350, 70);

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `user_id` double DEFAULT NULL,
  `id` double NOT NULL,
  `title` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`user_id`, `id`, `title`, `body`) VALUES
(3, 6, 's9(9909090trigfkhgfkhgng', 'stdsfdhshfdring'),
(7, 61, 'voluptatem doloribus consectetur est ut ducimus', 'ab nemo optio odio\ndelectus tenetur corporis similique nobis repellendus rerum omnis facilis\nvero blanditiis debitis in nesciunt doloribus dicta dolores\nmagnam minus velit'),
(4, 63, 'voluptas blanditiis repellendus animi ducimus error sapiente et suscipit', 'enim adipisci aspernatur nemo\r\nnumquam omnis facere dolorem dolor ex quis temporibus incidunt\r\nab delectus culpa quo reprehenderit blanditiis asperiores\r\naccusantium ut quam in voluptatibus voluptas ipsam dicta'),
(4, 65, 'consequatur id enim sunt et et', 'voluptatibus ex esse\r\nsint explicabo est aliquid cumque adipisci fuga repellat labore\r\nmolestiae corrupti ex saepe at asperiores et perferendis\r\nnatus id esse incidunt pariatur'),
(7, 66, 'repudiandae ea animi iusto', 'officia veritatis tenetur vero qui itaque\nsint non ratione\nsed et ut asperiores iusto eos molestiae nostrum\nveritatis quibusdam et nemo iusto saepe'),
(7, 67, 'aliquid eos sed fuga est maxime repellendus', 'reprehenderit id nostrum\nvoluptas doloremque pariatur sint et accusantium quia quod aspernatur\net fugiat amet\nnon sapiente et consequatur necessitatibus molestiae'),
(4, 68, 'odioquis facere architecto reiciendis optio', 'magnam molestiae perferendis quisquam\r\nqui cum reiciendis\r\nquaerat animi amet hic inventore\r\nea quia deleniti quidem saepe porro velit'),
(7, 69, 'fugiat quod pariatur odit minima', 'officiis error culpa consequatur modi asperiores et\ndolorum assumenda voluptas et vel qui aut vel rerum\nvoluptatum quisquam perspiciatis quia rerum consequatur totam quas\nsequi commodi repudiandae asperiores et saepe a'),
(4, 70, 'voluptatem laborum magni', 'sunt repellendus quae\r\nest asperiores aut deleniti esse accusamus repellendus quia aut\r\nquia dolorem unde\r\neum tempora esse dolore'),
(14, 104, 'beatae(((( enim quia vel', 'fdh');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` double NOT NULL,
  `name` longtext DEFAULT NULL,
  `user_name` longtext DEFAULT NULL,
  `email` longtext DEFAULT NULL,
  `phone` longtext DEFAULT NULL,
  `website` longtext DEFAULT NULL,
  `password` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `user_name`, `email`, `phone`, `website`, `password`) VALUES
(1, 'Leanne Graham', 'Bret', 'Sincere@april.biz', '1-770-736-8031 x56442', 'hildegard.org', ''),
(2, 'Ervin Howell', 'Antonette', 'Shanna@melissa.tv', '010-692-6593 x09125', 'anastasia.net', ''),
(3, 'Clementine Bauch', 'Samantha', 'Nathan@yesenia.net', '1-463-123-4447', 'ramiro.info', ''),
(4, 'Patricia Lebsack', 'Karianne', 'Julianne.OConner@kory.org', '493-170-9623 x156', 'kale.biz', ''),
(5, 'Chelsey Dietrich', 'Kamren', 'Lucio_Hettinger@annie.ca', '(254)954-1289', 'demarco.info', ''),
(6, 'Mrs. Dennis Schulist', 'Leopoldo_Corkery', 'Karley_Dach@jasper.info', '1-477-935-8478 x6430', 'ola.org', ''),
(7, 'Kurtis Weissnat', 'Elwyn.Skiles', 'Telly.Hoeger@billy.biz', '210.067.6132', 'elvis.io', ''),
(8, 'Nicholas Runolfsdottir V', 'Maxime_Nienow', 'Sherwood@rosamond.me', '586.493.6943 x140', 'jacynthe.com', ''),
(9, 'Glenna Reichert', 'Delphine', 'Chaim_McDermott@dana.io', '(775)976-6794 x41206', 'conrad.com', ''),
(10, 'Clementina DuBuque', 'Moriah.Stanton', 'Rey.Padberg@karina.biz', '024-648-3804', 'ambrose.net', ''),
(12, '', 'hannaboiko2016@gmail.com', 'hannaboiko2016@gmail.com', '', 'Google', ''),
(14, 'Hanna Boiko', 'Hanna Boiko', '', '', 'FB', ''),
(15, 'Registration', 'Registration', 'Registration@hg.kjg', '', '', 'fgfhg');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=351;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
