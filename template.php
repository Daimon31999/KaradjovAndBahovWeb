<?php
    #**************     errors log    *******************
    error_reporting(E_ALL);
    ini_set("display_errors", 1);
    ini_set("display_startap_errors", 1);
    #**************     language on first launch   *******************
    if (!isset($_COOKIE['language']))
        setcookie('language', 'ru');
    #**************     mysql    *******************
    $mysqli = new mysqli("localhost", "root", "", "miximix");
    $mysqli->set_charset("utf8");
    $result_set = $mysqli->query("SELECT * FROM `main` WHERE `id` = 'main'");
    $article = $result_set->fetch_assoc();
    $mysqli->close();
    #**************     switch language button language was pressed   *******************
    if (isset($_POST['lan'])) { 
        $target = $_POST['lan'];
        if($target == 'ru'){
            $title = $article['title'];
            $body = $article['body'];
            $id = $article["id"];
            $img = $article["img"];
        }
        elseif($target == 'en')
        {

            $source = 'ru';
            $title = $article['title'];
            $body = $article['body'];


            include('translate.php');
            $trans = new GoogleTranslate();

            $id = $article["id"];
            $title = $trans->translate($source, $target, $title);
            $body = $trans->translate($source, $target, $body);
            $img = $article["img"];
        }
    } else 
    {
        $id = $article["id"];
        $title = $article["title"];
        $body = $article["body"];
        $img = $article["img"];
    }


    #**************     initialization    *******************
    
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./style.css">
    <title>Karadjov&Bahov</title>
</head>

<body>
    <div id="web-site-wrapper">
        <div id="web-site">
            <header id="header-bottom">
                <a href="#">Главная</a>
                <a href="#">Новости</a>
                <a href="#">Расписание</a>
                <a href="#">Фотогалерея</a>
                <a href="#">О нас</a>
                <a>О нас</a>
            </header>

            <div id="content-wrapper">
                <div id="content">
                    <h1><?= $title ?></h1>
                     <?= $img ?>
                    <?= $body ?>  
                </div>
            </div>

            <footer id="footer">
                <form method="POST">
                            <div class="lang-buttons">
                                <input type="submit" name="lan" value="ru" id="ru">
                                <input type="submit" name="lan" value="en" id="en">
                            </div>
                </form>
            </footer>
        </div>
    </div>
</body>

</html>