-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Дек 11 2019 г., 16:59
-- Версия сервера: 10.3.13-MariaDB-log
-- Версия PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `miximix`
--
CREATE DATABASE IF NOT EXISTS `miximix` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `miximix`;

-- --------------------------------------------------------

--
-- Структура таблицы `articles`
--

CREATE TABLE `articles` (
  `id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'идентификатор страницы',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Название страницы',
  `body` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Текст страницы',
  `img` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Изображения в html'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `articles`
--

INSERT INTO `articles` (`id`, `title`, `body`, `img`) VALUES
('aboutus', NULL, NULL, '<img class=\"img\" id=\"aboutus-img\" src=\"./img/aboutus_img.png\" alt=\"aboutus_img\">'),
('gallery', 'Фотогалерея', NULL, '<div class=\"image-wrapper\"><img class=\"gallery-img\" id=\"img1\" src=\"./img/gallery_1.png\" alt=\"gallery\"><span>Maharaj</span></div>\r\n<div class=\"image-wrapper\"><img class=\"gallery-img\" id=\"img2\" src=\"./img/gallery_2.png\" alt=\"gallery\"><span>Robert Downey</span>  </div>\r\n<div class=\"image-wrapper\"><img class=\"gallery-img\" id=\"img3\" src=\"./img/gallery_3.png\" alt=\"gallery\"><span>Will Smith</span></div>\r\n<div class=\"image-wrapper\"><img class=\"gallery-img\" id=\"img4\" src=\"./img/gallery_4.png\" alt=\"gallery\"><span>Elena Carter</span></div>\r\n<div class=\"image-wrapper\"><img class=\"gallery-img\" id=\"img5\" src=\"./img/gallery_5.png\" alt=\"gallery\"><span>Kim Kardashian</span></div>'),
('main', 'MixiMix - креативный центр для детей', '<p> В развлекательном центре для детей Дрим Парк богатый выбор развлечений для детей разных\r\nвозрастных групп. Каждый ребенок найдет для себя что-то интересное и познавательное, о чем будет\r\nрассказывать родным или своим друзьям. Здесь можно культурно отдыхать, участвовать в играх и\r\nпреодолении увлекательных препятствий, прохождении сложных лабиринтов. Dream Park прекрасно\r\nподходит для отдыха всей семьей и дружными компаниями.</p>\r\n<p>Это первый развлекательный центр в нашем городе, который совместил в себе грандиозный Ниндзя\r\nПарк, батутную арену, детский скалодром, огромный игровой лабиринт, мини-футбольное поле, горки\r\nс тюбингами, пневмопушки, мультислайдинги, виртуальную реальность нового поколения, симуляторы,\r\nразвивающую детскую зону и многое другое.</p>\r\n<p>Парк развлечений Dream Park\r\nДетский развлекательный комплекс Dream Park поражает своими размерами, большим количеством\r\nплощадок и занятий для ребят с разными увлечениями. Здесь будет занимательно и весело как детям\r\nшкольного возраста, так и самым маленьким посетителям.</p>\r\n<p>Наш центр развлечений для детей отвечает всем требованиям безопасности. В парке предусмотрена\r\nспециальная зона ожидания для родителей, откуда они смогут наблюдать за своим ребенком.</p>\r\n<p>Детский парк развлечений Dream Park оснащен всем необходимым для проведения любого детского\r\nпраздника. Вы можете заказать развлекательную программу для детей, в которую входит интересные и\r\nувлекательные задания с нашим аниматором, безлимитный доступ в мягкую игровую зону, фотосессия,\r\nтематическое украшение зоны отдыха.\r\nВ зоне отдыха дети смогут подкрепиться после активных игр.</p>', '<img class=\"img\" id=\"main-img\" src=\"./img/main_img.png\" alt=\"main_img\">\r\n'),
('news', 'Открытие креативного центра для детей', 'Открытие креативного центра для детей, В развлекательном центре для детей Дрим Парк богатый выбор развлечений для детей разных возрастных групп. Каждый ребенок найдет для себя что-то интересное и познавательное, о чем будет рассказывать родным или своим друзьям. Здесь можно культурно отдыхать, участвовать в играх и преодолении увлекательных препятствий, прохождении сложных лабиринтов. Дреам Парк прекрасно подходит для отдыха всей семьей и дружными компаниями.<br>Это первый развлекательный центр в нашем городе, который совместил в грандиозный Ниндзя Парк, батутную арену, детский скалодром, огромный игровой лабиринт, мини-футбольное поле, горки с тюбингами, пневмопушки, мультислайдинги, виртуальную реальность нового поколения, симуляторы, развивающую детскую зону и многое другое!', '<img class=\"img\" id=\"news-img\" src=\"./img/news_img.png\" alt=\"news_img\">\r\n'),
('shedule', NULL, '\r\n    <form action=\"db_myform.php\" method=\"POST\" id=\"myform\">\r\n        <h1>Расскажите о себе</h1>\r\n        <label for=\"name\">Имя</label>\r\n        <input type=\"text\" id=\"name\" name=\"name\" required placeholder=\"Вася\">\r\n        <label for=\"surname\">Фамилия</label>\r\n        <input type=\"text\" id=\"surname\" name=\"surname\" required placeholder=\"Пупкин\">\r\n        <label for=\"sex\">Пол</label>\r\n        <span>М &nbsp;</span><input type=\"radio\" id=\"sex\" name=\"sex\" value=\"male\" required> <span>Ж</span> <input\r\n            type=\"radio\" id=\"sex\" name=\"sex\" value=\"female\" required>\r\n        <label for=\"family\">Семейное положение</label>\r\n        <select id=\"family\" name=\"family\" size=\"1\" required>\r\n            <option disabled>Выберите свое семейное положение</option>\r\n            <option value=\"Замужем (женат)\">Замужем (женат)</option>\r\n            <option value=\"Не замужем (холост)\" selected>Не замужем (холост)</option>\r\n            <option value=\"Разведен(а)\">Разведен(а)</option>\r\n        </select>\r\n        <label id=\"date_of_birth\">Дата рождения:</label>\r\n        <input id=\"date_of_birth\" type=\"date\" name=\"date_of_birth\" min=\"1900-01-01\" max=\"2018-01-01\" required>\r\n        <label for=\"address\">Адрес</label>\r\n        <textarea name=\"address\" id=\"address\" cols=\"30\" rows=\"5\" required\r\n            placeholder=\"Улица, номер дома, квартира\"></textarea>\r\n        <label for=\"city\">Город</label>\r\n        <input type=\"text\" id=\"city\" name=\"city\" required placeholder=\"New York\">\r\n        <label for=\"email\">Email</label>\r\n        <input type=\"email\" id=\"email\" name=\"email\" required placeholder=\"vaseapupkin@mail.ru\">\r\n        <label for=\"phone\">Телефон</label>\r\n        <input type=\"text\" name=\"phone\" id=\"phone\" placeholder=\"069699699\">\r\n        <label for=\"hobby\">Hobby</label>\r\n        <select multiple name=\"hobby[]\" id=\"hobby\" size=\"6\">\r\n            <option disabled>Выберите свои любимые занятия</option>\r\n            <option value=\"Спорт\">Спорт</option>\r\n            <option value=\"Музыка\">Музыка</option>\r\n            <option value=\"Лепка\">Лепка</option>\r\n            <option value=\"Танцы\">Танцы</option>\r\n            <option value=\"Рисование\">Рисование</option>\r\n            <option value=\"Книги\">Книги</option>\r\n        </select>\r\n\r\n        <div class=\"buttons\">\r\n            <input type=\"submit\" name=\"register\" value=\"Зарегистрироваться\" id=\"submit\">\r\n            <input type=\"reset\" value=\"Сброс\" id=\"reset\">\r\n        </div>\r\n    </form>', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `users_info`
--

CREATE TABLE `users_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `surname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sex` varchar(20) CHARACTER SET utf8 NOT NULL,
  `family` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_of_birth` varchar(255) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hobby` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users_info`
--

INSERT INTO `users_info` (`id`, `name`, `surname`, `sex`, `family`, `date_of_birth`, `address`, `city`, `email`, `phone`, `hobby`) VALUES
(4, 'Дима', 'Хинев', 'male', 'Замужем (женат)', '1999-11-11', 'яафывафв', 'Кишинев', 'dimahinev31999@gmail.com', '068007942', 'Музыка|Лепка|Танцы'),
(5, 'Дима', 'Хинев', 'male', 'Замужем (женат)', '1999-11-11', 'яафывафв', 'Кишинев', 'dimahinev31999@gmail.com', '068007942', 'Музыка|Лепка|Танцы');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- База данных: `users`
--
CREATE DATABASE IF NOT EXISTS `users` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `users`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
