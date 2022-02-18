-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 13 2022 г., 14:52
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `jenyamelnik1986`
--

-- --------------------------------------------------------

--
-- Структура таблицы `books`
--

CREATE TABLE `books` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/uploaded/books/original/no_foto.jpg',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta title',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta keywords',
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `books`
--

INSERT INTO `books` (`id`, `title`, `description`, `img`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(69, 'Война и мир', '«Война́ и мир» — роман-эпопея Льва Николаевича Толстого, описывающий русское общество в эпоху войн против Наполеона в 1805—1812 годах. Эпилог романа доводит повествование до 1820 года.', '/uploaded/books/100x100/20211214-120612img20664.jpg', 'meta title', 'meta keywords', 'meta description'),
(70, 'Ромео и Джульета', 'Вниманию читателей предлагается первая значительная трагедия Уильяма Шекспира - \"печальнейшая на свете повесть\" о двух юных влюбленных, ценой своей смерти примиряющих издавна враждовавшие веронские семейства Монтекки и Капулетти. Остродраматические коллизии пьесы, возвышенная свобода и глубина чувств главных героев во многом определили эмоциональный мир и ценности новоевропейской любовной культуры и открыли перед современным искусством возможность виртуозной игры на тему \"влюбленного Шекспира\". Трагедия публикуется в ставшем классическим переводе Т. Щепкиной-Куперник.', '/uploaded/books/100x100/20211214-120537img56488.jpg', 'meta title', 'meta keywords', 'meta description'),
(81, 'Кобзарь', 'На відміну від численних так званих «повних» збірок, пропоноване видання є насправді максимально повним зібранням поетового спадку, яке поєднало всі твори, що потрапляли під цензурування як за царату, так і за радянщини. До того ж чимало творів подано з авторовими варіянтами, практично невідомими широкому загалові. Основну частину розпочинає авторова передмова до другого (нездійсненого) видання «Кобзаря». Зануритись у Шевченкову добу допоможуть чимало унікальних прижиттєвих документів, поетових автографів віршів, листів, і світлин й автопортретів. Нарешті, усе видання, від першої до останньої сторінки, унормовано згідно з правилами українського правопису 1928 р.(т. зв. Харківського, або Скрипниківського правопису), який, на думку науковців-філологів, є історично й фонетично найближчим до мови, якою промовляв до нас Поет.', '/uploaded/books/100x100/20211214-120319img71867.jpg', 'meta title', 'meta keywords', 'meta description'),
(82, 'Пиковая дама', 'Одно из первых произведений на русском языке, имевших успех в Европе', '/uploaded/books/100x100/20211214-120302img36188.jpg', 'meta title', 'meta keywords', 'meta description'),
(83, 'Сказка о царе Салтане', '«Сказка о царе Салта́не, о сыне его славном и могучем богатыре князе Гвидо́не Салта́новиче и о прекрасной царевне Лебеди» — сказка в стихах Александра Пушкина, написанная в 1831 году и впервые изданная в следующем году в собрании стихотворений.', '/uploaded/books/100x100/20211214-120251img65747.jpg', 'meta title', 'meta keywords', 'meta description'),
(84, 'Руслан и Людмила', '«Русла́н и Людми́ла» — первая законченная поэма Александра Сергеевича Пушкина; волшебная сказка, вдохновлённая древнерусскими былинами', '/uploaded/books/100x100/20211214-120240img21167.jpg', 'meta title', 'meta keywords', 'meta description'),
(85, 'Гамлет', '«Траги́ческая исто́рия о Га́млете, при́нце да́тском» или просто «Га́млет» — трагедия Уильяма Шекспира в пяти актах, одна из самых известных его пьес и одна из самых знаменитых пьес в мировой драматургии. Написана в 1600—1601 годах. Это самая длинная пьеса Шекспира — в ней 4042 строки и 29 551 слово.', '/uploaded/books/100x100/20211214-120222img44386.jpg', 'meta title', 'meta keywords', 'meta description'),
(86, 'Отелло', '«Отелло» (1606) – знаменитая трагедия Вильяма Шекспира (1564-1616), по праву считающаяся одним из высочайших его достижений в жанре драматургии. Предназначается для самой широкой читательской аудитории.', '/uploaded/books/100x100/20211214-120203img17840.jpg', 'meta title', 'meta keywords', 'meta description'),
(87, 'Анна Каренина', '«А́нна Каре́нина» — роман Льва Толстого о трагической любви замужней дамы Анны Карениной и блестящего офицера Алексея Вронского на фоне счастливой семейной жизни дворян Константина Лёвина и Кити Щербацкой.', '/uploaded/books/100x100/20211214-120152img48375.jpg', 'meta title', 'meta keywords', 'meta description'),
(88, 'Гайдамаки', 'Гайдамаки — историко-героическая поэма Т. Г. Шевченко, первый украинский исторический роман в стихах. Вступление в поэме «Гайдамаки», датировано 7 апреля 1841 года, поэт написал после завершения произведения. Автограф неизвестен.', '/uploaded/books/100x100/20211214-120140img88867.jpg', 'meta title', 'meta keywords', 'meta description'),
(98, 'Книга 5', 'QQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ', '/uploaded/books/original/no_foto.jpg', 'meta title', 'meta keywords', 'meta description'),
(102, 'Книга 4', 'ырьвпобврбарьь', '/uploaded/books/original/no_foto.jpg', 'meta title', 'meta keywords', 'meta description'),
(104, 'Книга 3', 'Здесь описание книги №3', '/uploaded/books/original/no_foto.jpg', 'meta title', 'meta keywords', 'meta description'),
(105, 'Книга 2', 'Здесь описание книги №2', '/uploaded/books/original/no_foto.jpg', 'meta title', 'meta keywords', 'meta description'),
(106, 'Книга 1', 'Здесь описание книги №1', '/uploaded/books/original/no_foto.jpg', 'meta title', 'meta keywords', 'meta description');

-- --------------------------------------------------------

--
-- Структура таблицы `books2books_author`
--

CREATE TABLE `books2books_author` (
  `id` int(11) NOT NULL,
  `book_id` int(10) UNSIGNED NOT NULL,
  `author_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `books2books_author`
--

INSERT INTO `books2books_author` (`id`, `book_id`, `author_id`) VALUES
(45, 87, 3),
(46, 86, 2),
(48, 84, 4),
(49, 83, 4),
(50, 82, 4),
(52, 81, 5),
(53, 70, 2),
(67, 88, 5),
(195, 105, 3),
(196, 105, 5),
(199, 104, 2),
(200, 104, 13),
(201, 104, 17),
(202, 102, 3),
(203, 102, 10),
(204, 98, 2),
(205, 98, 5),
(207, 85, 2),
(209, 69, 3),
(210, 106, 3),
(211, 106, 4),
(212, 106, 17);

-- --------------------------------------------------------

--
-- Структура таблицы `books_author`
--

CREATE TABLE `books_author` (
  `id` int(11) NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `books_author`
--

INSERT INTO `books_author` (`id`, `author`) VALUES
(1, ''),
(2, 'Уильям Шекспир'),
(3, 'Лев Толстой'),
(4, 'А. С. Пушкин'),
(5, 'Тарас Шевченко'),
(10, 'Чехов'),
(12, '<b>sfgsfhj<b>aehrgh'),
(13, '<script>afhahdghad</script>'),
(14, '\'\'`\'\'`\'\''),
(16, '<script>alert(\'Вас взломали\')</script>gjsfhjdtktdum\'\'``\'\'\''),
(17, '<b>Hello</b>');

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `login` text COLLATE utf8_unicode_ci NOT NULL,
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `comments`
--

INSERT INTO `comments` (`id`, `login`, `email`, `comment`, `date`) VALUES
(1, 'Sasha', '', 'Сегодня хорошая погода', '2021-08-11 00:00:00'),
(2, 'Kolya', '', 'Всем привет!', '2021-08-11 00:00:00'),
(3, 'Jenya', '', 'Классная база данных!', '2021-08-11 00:00:00'),
(13, 'Оля', 'Olya@i.ua', 'Хороший магазин!', '2021-09-09 17:48:27'),
(7, 'Саша', 'Sahsa@i.ua', 'Summer have gone', '2021-09-09 17:30:21'),
(8, 'Евгений', 'jenyamelnik1986@gmail.com', 'Всем привет!', '2021-09-09 17:34:36'),
(9, 'Андрей', 'Dron@i.ua', 'Люблю крассное вино!', '2021-09-09 17:37:23'),
(10, 'Коля', 'Kolya@i.ua', 'А я люблю белое', '2021-09-09 17:41:12'),
(11, 'Vasya', 'Vasya@i.ua', 'А я пью водку', '2021-09-09 17:42:51'),
(12, 'Lena', 'Lena@i.ua', 'А я все пью!', '2021-09-09 17:45:56'),
(14, 'Anna', 'Anna@i.ua', 'Посоветуйте хорошее вино', '2021-09-09 17:50:28'),
(15, 'Vera', 'Vera@i.ua', 'Anna, бери 777, не пожалеешь!', '2021-09-09 17:55:57'),
(16, 'Dasha', 'Dasha@i.ua', 'Anna, я пробовала 777 - БОМБА!', '2021-09-09 17:57:16'),
(17, 'Jenya', 'Jenya@i.ua', 'Андрей (2021-09-09 17:37:23)\r\n- Люблю крассное вино!\r\n\r\nАндрей, \"крассное\" пишется с одной \"c\")))', '2021-09-09 17:59:30'),
(18, 'Masha', 'Masha@i.ua', 'Привет.\r\nКак дела?', '2021-09-09 18:09:39'),
(19, 'Masha', 'Masha@i.ua', 'Привет.\r\nКак дела?', '2021-09-09 18:09:39'),
(20, 'Sveta', 'Sveta@i.ua', 'Я пью белое вино<br />\r\nи крассное<br />\r\nи водку', '2021-09-09 18:17:35'),
(21, 'Lera', 'Lera@i.ua', '', '2021-09-09 19:30:43'),
(22, 'Jenya2', 'Jenya@i.ua', 'Всем привет<br />\r\n', '2021-09-09 19:32:44'),
(27, 'Jenya123', 'Jenya123@i.ua', 'Ghbdtn\r\nrfr ltkf\r\nbffdg', '2021-09-10 09:37:51'),
(26, 'Jenya', 'erhaehae@i.ua', 'zdfhadghadgj', '2021-09-09 19:53:48'),
(28, 'Jenya123', 'Jenya123@i.ua', 'Ghbdtn\r\nrfr ltkf\r\nbffdg', '2021-09-10 09:47:39'),
(29, 'Jenya4321', 'JEnya@i.ua', 'Hello\r\nsdfhgsjwrykmts', '2021-09-10 09:49:30'),
(30, 'Jenya4321', 'JEnya@i.ua', 'Hello\r\nsdfhgsjwrykmts', '2021-09-10 09:49:35'),
(31, 'Jenya4321', 'JEnya@i.ua', 'Hello\r\nsdfhgsjwrykmts', '2021-09-10 09:49:39'),
(32, 'Denya', 'Denya@i.ua', 'afhadgn\r\nxbn\r\nxbvm\r\n', '2021-09-10 10:10:12'),
(33, 'Denya', 'Denya@i.ua', 'afhadgn\r\nxbn\r\nxbvm\r\n', '2021-09-10 10:10:12'),
(34, 'Oleh', 'Oleh@i.ua', 'aehagh\r\nsdghsxvnm\r\ncvn', '2021-09-10 10:13:33'),
(35, 'Petya', 'Petya@i.ua', 'sfhsfhm\r\nsfhmsfhm', '2021-09-10 10:14:11'),
(37, 'Renat', 'Renat@i.ua', 'abwbvetopuwidahlkhb\r\ndfbkewjl', '2021-09-15 10:34:10'),
(38, 'Jenya', 'jenyamelnik1986@gmail.com', 'zdsfhadnvxcnbxf', '2021-09-16 14:18:13'),
(41, 'Jenya', 'Jenya@i.ua', 'aehdgnsgn', '2021-09-16 16:18:52'),
(42, 'Jenya', 'Jenya@i.ua', 'adthae;igjnsx;fign', '2021-09-16 16:19:30'),
(43, 'Jenya', 'jenyamelnik1986@gmail.com', 'kjfkcgkgcghkc', '2021-09-16 16:21:54'),
(44, 'Jenya', 'Jenya@i.ua', 'zdfbzdgnfgnxg', '2021-09-16 16:30:52'),
(45, 'Jenya', 'jenyamelnik1986@gmail.com', 'eyetdgfgncbnvbnsfjsfhf\r\nfhmh\r\nfhmx', '2021-09-16 16:34:20'),
(46, 'Jenya', 'jenyamelnik1986@gmail.com', 'sfjmsdfhm\r\ngnmfhklu\r\nj.,', '2021-09-16 16:37:17'),
(47, 'Yevhenii Melnik', 'jenyamelnik1986@gmail.com', 'eatnfhn', '2021-09-16 16:38:27'),
(48, 'Jenya', 'jenyamelnik1986@gmail.com', 'zdgnshmsdghmdg', '2021-09-16 16:44:33'),
(49, 'Jenya', 'Jenya@i.ua', 'Привет.\r\nПривет', '2021-09-20 09:48:41'),
(50, 'Jenya', 'jenyamelnik1986@gmail.com', 'ЙЙЙЙЙЙЙЙ', '2021-10-04 15:30:21'),
(51, 'Anna', 'Anna@i.ua', 'qwrgqehqtja', '2021-10-05 15:44:01'),
(52, 'Anna', 'Anna@i.ua', 'qazqazqaz', '2021-10-05 15:44:11');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `category` enum('Белые вина','Красные вина','Крепленые вина','') COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `strength` float NOT NULL,
  `price` smallint(6) NOT NULL,
  `availability` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 - есть в наличии\r\n0 - нет в наличии',
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/uploaded/original/no_foto.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`id`, `category`, `category_id`, `title`, `description`, `strength`, `price`, `availability`, `img`) VALUES
(1, 'Белые вина', 0, 'Sauvignon Blanc Marlborough Sun', 'Яркость Совиньон Блана проявляется в выразительном аромате маракуйи, крыжовника, листьев черной смородины в обрамлении тонких цитрусовых тонов. Во вкусе хорошо сбалансированное вино, обладает приятной свежестью и ярким характером. Послевкусие затяжное, освежающее.', 13, 345, 1, '/uploaded/20211123-135524img76152.jpg'),
(2, 'Белые вина', 0, 'Chardonnay', 'Ароматное, утонченное Шардоне с нюансами манго, персиков, цитрусов и цветения липы. Во вкусе, свежее, фруктовое, питкое. Послевкусие мягкое, фруктовое. Отлично сочетается с различной рыбой, моллюсками, пастой со сливочным соусом и белым мясом, а также хорошо в качестве аперитива.', 13, 520, 1, '/uploaded/original/20211110-152345img67305.jpg'),
(3, 'Красные вина', 0, 'Pinot Noir', 'Применяя свой многолетний опыт в Бургундии Doudet Naudin создали этот Пино Нуар с лоз, высаженных в Долине Од региона Лангедок-Руссильон вблизи Пиренеев, где прохладнее климат и мягче температуры. Вино с выразительным ароматом темных и красных ягод, гармонично переплетенных с цветочными тонами. Вкус обладает прекрасным балансом и элегантностью присущему Пино Нуару. Вино дополнит множество блюд от холодных закусок до белого и красного мяса.', 12.5, 290, 1, '/uploaded/original/20211110-152317img82471.jpg'),
(4, 'Белые вина', 0, 'Cabernet Sauvignon Reserva', 'Кольчагуа - одна из чилийских винных долин, с большим международным авторитетом. В этой же долине, между прибрежным хребтом и Тихим океаном разбиты виноградники хозяйства. Линейка «Reserva» - прекрасные повседневные вина, которые никогда не подведут. Перед вами 100% Кабарне Совиньон, выдержанный 6 месяцев в дубовых бочках. Вино предлагает четко очерченные оттенки черной смородины, ванили и фиалки. Вино средней насыщенности, с сочными танинами и прекрасным фруктовым акцентом на послевкусие. Хорошее дополнение к мясным блюдам.', 25, 430, 1, '/uploaded/original/20211110-140110img96564.jpg'),
(5, 'Белые вина', 0, 'Fonseca Tawny', 'Аромат раскрывается оттенками абрикос, спелых слив, пряностей и сливочного масла. Во вкусе ощущаются нюансы джема и прекрасный баланс. Послевкусие затяжное, уравновешенное хорошо интегрированной кислотностью.', 15, 385, 1, '/uploaded/original/20211110-135028img44986.jpg'),
(6, 'Крепленые вина', 0, 'Taylor\'s Fine Ruby', 'Яркий фруктовый аромат наполнен оттенками черной смородины, вишни и спелой сливы. Вкус переполнен фруктовым характером. Послевкусие долгое, оставляющее приятную сладость.', 15, 350, 1, '/uploaded/20211123-135202img34729.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `goods2goods_category`
--

CREATE TABLE `goods2goods_category` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `goods_category`
--

CREATE TABLE `goods_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `goods_category`
--

INSERT INTO `goods_category` (`id`, `category`) VALUES
(1, 'Белые вина'),
(2, 'Красные вина'),
(3, 'Крепленые вина');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `text` text COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta title',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta keywords',
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta description'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `date`, `title`, `category_id`, `text`, `meta_title`, `meta_keywords`, `meta_description`) VALUES
(22, '2021-12-01 11:48:53', 'Динамо выиграло у Баварии', 1, '30.11.2021 года в матче лиги чемпионов, киевское Динамо выиграло у Мюнхенской Баварии со счетом 1:0. Гол на 61 минуте забил Николай Шапаренко.', 'meta title', 'meta keywords', 'meta description'),
(23, '2021-12-06 10:32:28', 'Свежий рейтинг политических партий', 2, 'По даным компании \"Рога и копыта\", по состоянию на 01.12.2021 рейтинг политических партий снова возглавляет партия \"Европейская солидарность\". На тором месте \"Слуга народа\".', 'meta title', 'meta keywords', 'meta description'),
(24, '2021-12-02 12:53:08', 'Гривна снова пошла вниз', 4, 'По последний даным Нацбанка, гривна снова начала опускаться.\r\nЭксперты прогнозируют, что снижение закончиться перед Новым годом.', 'meta title', 'meta keywords', 'meta description'),
(25, '2021-12-03 11:47:08', 'Украина выпустила новую модель ЗАЗ', 3, 'На автовыставке в Дубаи Украина представила новый автомобиль ЗАЗ nosens. Планировали сделать тестдрайв, но авто не смогли завести.', 'meta title', 'meta keywords', 'meta description'),
(26, '2021-12-02 12:13:26', 'Усик - лучший боксер мира', 1, 'Александр Усик победил Энтони Джошуа, и стал обладателем 4-ох чемпионских поясов!!', 'meta title', 'meta keywords', 'meta description'),
(27, '2021-12-06 10:33:38', 'Скоро начнется олимпиада 2022', 1, 'В 2022 году пройдет зимняя олимпиада. Сборная Украины планирует попасть в ТОП-10.', 'meta title', 'meta keywords', 'meta description'),
(29, '2021-12-06 10:39:10', 'Украина показала рост ВВП', 4, 'В 2021 году Украина показывает рост ВВП на уровне 2,3 %.', 'meta title', 'meta keywords', 'meta description'),
(30, '2022-01-10 18:56:18', '===================', 5, '+++++++++++++++++++++++++++', 'meta title', 'meta keywords', 'meta description'),
(31, '2022-01-11 13:41:48', '<b>arhsryjsr<b>aethsrnshfnsfh', 2, 'HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH', 'meta title', 'meta keywords', 'meta description'),
(32, '2022-01-11 14:26:12', '<script>alert(\'Hello\')</script>', 4, 'zvccccccccccccccccccccccccccccccccccccccccccccccccc', 'meta title', 'meta keywords', 'meta description');

-- --------------------------------------------------------

--
-- Структура таблицы `news_category`
--

CREATE TABLE `news_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `news_category`
--

INSERT INTO `news_category` (`id`, `category`) VALUES
(1, 'Спорт'),
(2, 'Политика'),
(3, 'Авто'),
(4, 'Экономика'),
(5, 'Медицина'),
(6, 'Наука'),
(13, '<b>qwerty<b>qwrdfhmdhk//123\'\'\'\'\'\'`\'');

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `static` tinyint(1) NOT NULL DEFAULT '0',
  `meta_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta description',
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta keywords',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'meta title',
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Text'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `module`, `static`, `meta_description`, `meta_keywords`, `meta_title`, `text`) VALUES
(1, '404', 1, 'Данная страница отсутствует!', 'Данная страница отсутствует!', 'Данная страница отсутствует!', 'Данная страница отсутствует!'),
(3, 'comments', 0, '', '', '', ''),
(4, 'comments2', 0, '', '', '', ''),
(5, 'components', 0, '', '', '', ''),
(6, 'static', 0, '', '', '', ''),
(7, 'contacts', 0, '', '', '', ''),
(8, 'aboutus', 1, '', '', '', 'Статичная информация о нас!!!'),
(9, 'game', 0, '', '', '', ''),
(10, 'game2', 0, '', '', '', ''),
(11, 'manager', 0, '', '', '', ''),
(12, 'manager2', 0, '', '', '', ''),
(13, 'errors', 0, '', '', '', ''),
(14, 'cab', 0, '', '', '', ''),
(15, 'admin', 0, '', '', '', ''),
(17, 'wines', 0, '', '', '', ''),
(18, 'gifts', 0, '', '', '', ''),
(19, 'news', 0, '', '', '', ''),
(20, 'goods', 0, '', '', '', ''),
(21, 'users', 0, '', '', '', ''),
(22, 'pages', 0, '', '', '', ''),
(24, 'food', 1, '', '', '', ''),
(29, 'books', 0, 'meta description', 'meta keywords', 'meta title', 'Text');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `login` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'login',
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/uploaded/original/no_foto.jpg',
  `age` tinyint(4) UNSIGNED NOT NULL DEFAULT '18',
  `email` text COLLATE utf8_unicode_ci NOT NULL,
  `password` text COLLATE utf8_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `access` tinyint(4) NOT NULL DEFAULT '0',
  `ip` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userAgent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `avatar`, `age`, `email`, `password`, `active`, `hash`, `access`, `ip`, `userAgent`) VALUES
(2, 'Sasha', '', 34, '', '', 0, '', 0, '', ''),
(4, 'Marharita', '', 31, '', '', 0, '', 0, '', ''),
(5, 'Olya', '', 31, '', '', 0, '', 0, '', ''),
(6, 'Sergey', '', 36, '', '', 0, '', 0, '', ''),
(7, 'Sergey2', '', 31, '', '', 0, '', 0, '', ''),
(8, 'Denys', '', 18, '', '', 0, '', 0, '', ''),
(10, 'Yamamoto', '', 9, '', '', 0, '', 0, '', ''),
(11, 'inpost', '', 2, 'inpost@list.ru', 'CBouTQUYHXuWI', 0, '', 0, '', ''),
(12, 'Vasilij', '', 25, 'Vasilij@.ru', '345', 0, '', 0, '', ''),
(13, 'Tolya', '', 18, 'Tolya2003@i.ua', '123456789', 0, '', 0, '', ''),
(15, 'Dima', '', 34, 'Dima1999@i.ua', 'CBouTQUYHXuWI', 1, '', 0, '', ''),
(16, 'login1', '', 20, 'Login@i.ua', 'CBouTQUYHXuWI', 0, '', 0, '', ''),
(18, 'login2', '', 25, 'Login2@i.ua', 'password2', 0, '', 0, '', ''),
(43, 'Rita', '', 31, 'Rita@i.ua', 'CB4wFZWK//fyU', 1, 'CBQHm3yu2ikWc', 0, '', ''),
(45, 'Anna', '', 25, 'Anna@i.ua', 'CB4wFZWK//fyU', 1, 'CBLkijhaQAl2Y', 5, 'CBacOoVtp4.ZM', 'CBsArLTFekQzI'),
(46, 'Nikolay', '', 40, 'Nikolay@i.ua', 'CBdb5tnrHmBWA', 1, 'CBcxQMfO0TWCg', 0, '', ''),
(50, 'Makar', '', 25, 'Makar@i.ua', 'CBVEPntF35lX.', 1, 'CB0A346UhHAos', 0, '', ''),
(51, 'Polina', '', 27, 'Polina@i.ua', 'CBdb5tnrHmBWA', 1, 'CBR0sB1y4qpcA', 0, '', ''),
(52, 'Alenka', '', 31, 'Alenka@i.ua', 'CBaNmpw53Mh92', 1, 'CBgEcjpXVK6ag', 0, '', ''),
(54, 'Nikkolay', '', 45, 'Nikkolay@i.ua', 'CBdb5tnrHmBWA', 1, 'CBp.fGK4ttVE.', 0, '', ''),
(58, 'Vassya', '', 45, 'Vassya@i.ua', 'CBdb5tnrHmBWA', 1, 'CBAcldwPMYj0.', 0, '', ''),
(62, 'Roman', '', 25, 'Roman@i.ua', 'CBdb5tnrHmBWA', 1, 'CB88tkMWL6Gns', 0, '', ''),
(64, 'Oleh', '', 25, 'Oleh@i.ua', 'CBdb5tnrHmBWA', 1, 'CB7253PFLDhUg', 0, '', ''),
(74, 'qqqqq', '/uploaded/20211111-135909img96099.jpg', 35, 'aaaaaaaaaaaaa@i.ua', 'CBTmAKGeGP9p6', 1, 'CBrUrTCoFgjfE', 0, '', ''),
(75, 'Jenya', '/uploaded/100x100/20211124-160141img46287.jpg', 35, 'jenyamelnik1986@i.ua', 'CBcGtU7HY7hPU', 1, 'CBlDgUhpO14AU', 5, '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books2books_author`
--
ALTER TABLE `books2books_author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `books_author`
--
ALTER TABLE `books_author`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods`
--
ALTER TABLE `goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ixTitle` (`title`),
  ADD KEY `ixCategory` (`category`);

--
-- Индексы таблицы `goods2goods_category`
--
ALTER TABLE `goods2goods_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods_category`
--
ALTER TABLE `goods_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ixTitle` (`title`);

--
-- Индексы таблицы `news_category`
--
ALTER TABLE `news_category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ixLogin` (`login`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `books`
--
ALTER TABLE `books`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT для таблицы `books2books_author`
--
ALTER TABLE `books2books_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT для таблицы `books_author`
--
ALTER TABLE `books_author`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT для таблицы `goods`
--
ALTER TABLE `goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `goods2goods_category`
--
ALTER TABLE `goods2goods_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `goods_category`
--
ALTER TABLE `goods_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT для таблицы `news_category`
--
ALTER TABLE `news_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
