<?php
    #**************     setcookie('page')    *******************
    if(isset($_POST['page']))
    {
        setcookie('page', $_POST['page']);
        $_COOKIE['page'] = $_POST['page'];
    }
    else 
    {
        if(!isset($_COOKIE['page'])){
            setcookie('page', 'main');
            $_COOKIE['page'] = 'main';
        }
    }

    $page =  $_COOKIE['page'];

    if(!isset($_COOKIE['language'])){
        setcookie('language', 'ru');
        $_COOKIE['language'] = 'ru';
        
    }
    #**************     id initialization    *******************
    switch($page){
        case 'Main':case 'main':case 'Главная':
            $page = 'main';break;
        case 'News':case 'news':case 'Новости':
            $page = 'news';break;
        case 'Фотогалерея':case 'gallery':case 'Gallery':
            $page = 'gallery';break;
        case 'About us':case 'aboutus':case 'О нас':
            $page = 'aboutus';break;
        case 'Questionnaire':case 'shedule':case 'Опросник':
            $page = 'shedule';break;

    }

    #**************     errors log    *******************
    error_reporting(E_ALL);
    error_reporting(E_ERROR | E_PARSE);
    // ini_set("display_errors", 1);
    // ini_set("display_startap_errors", 1);
    #**************     mysql    *******************
    $mysqli = new mysqli("localhost", "root", "", "miximix");
    $mysqli->set_charset("utf8");
    $result_set = $mysqli->query("SELECT * FROM `articles` WHERE `id` = '$page'");
    $article = $result_set->fetch_assoc();
    $mysqli->close();
    #**************     switch language button language was pressed   *******************
    if (isset($_POST['lan'])) { 
        setcookie('language', $_POST['lan']);
        $_COOKIE['language'] = $_POST['lan'];
    }
    $language = $_COOKIE['language'];
    $target = $language;
    if($target == 'ru'){
        $title = $article['title'];
        $body = $article['body'];
        $page = $article["id"];
        $img = $article["img"];
        setcookie('language', 'ru');
        $_COOKIE['language'] = 'ru';
    }
    elseif($target == 'en')
    {
        $source = 'ru';
        $title = $article['title'];
        $body = $article['body'];
        $img = $article['img'];

        include('translate.php');
        $trans = new GoogleTranslate();
        
        $page = $article["id"];
        $title = $trans->translate($source, $target, $title);
        $body = $trans->translate($source, $target, $body);
        $img = $article['img'];
        if($_COOKIE['translation'] == 'true'){
            setcookie('language', $target);
            $_COOKIE['language'] = $target;
            $language = $target;

        }else {
            setcookie('language', $source);
            $_COOKIE['language'] = $source;
            $language = $source;
        }
    }

     #**************     ini initialization    *******************
     $names = parse_ini_file("system_$language.ini");
     $main = $names['MAIN'];
     $news = $names['NEWS'];
     $shedule = $names['SHEDULE'];
     $gallery = $names['GALLERY'];
     $aboutus = $names['ABOUT_US'];
 
    
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="./style.css">
    <link href="https://fonts.googleapis.com/css?family=Caveat&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet">
    <link rel="shortcut icon" href="/img/favicon.png" type="image/png">
    <title>Karadjov&Bahov</title>
</head>

<body>
    <div id="web-site-wrapper">
        <div id="web-site">
            <header id="header-bottom">
                <form method="post" id="header-form">
                    <input type="submit" name="page" value="<?=$main?>" id="main">
                    <input type="submit" name="page" value="<?=$news?>" id="news">
                    <input type="submit" name="page" value="<?=$gallery?>" id="gallery">
                    <input type="submit" name="page" value="<?=$aboutus?>" id="aboutus">
                    <input type="submit" name="page" value='<?=$shedule?>'id="shedule">
                </form>
            </header>

            <div id="content-wrapper">
                <div id="content">

                    <?php
                        switch ($page) {
                            case 'main':
                                echo "<h1>$title</h1>";
                                echo "$img";
                                echo "$body"; 
                                break;
                            case 'news':
                                echo "<h1>$title</h1>";
                                echo "<p>$body</p>"; 
                                echo "$img";
                                break;
                            case 'gallery':
                                echo "<h1 id='gallery-title'>$title</h1>";
                                echo "<div id='gallery-images'>$img</div>";
                                break;
                            case 'aboutus':
                                echo "$img";
                                echo '<script src="https://api-maps.yandex.ru/2.1/?apikey=c9df9525-e54e-436f-b283-015a4cc132cc&lang=ru_RU"
                                type="text/javascript"></script>
                                <script src="scripts/map.js" type="text/javascript"></script>';
                                echo '<div id="map"></div>';
                                break;
                            case 'shedule':
                                echo $body;
                                break;
                        }

                    ?>
                </div>
            </div>
            <footer id="footer">
                <div class="footer-aboutus">
                    <span>068007942</span>
                    <span>Сhisinau, Banulescu Bodoni 32</span>
                </div>
                <form method="POST" id="language">
                    <div id="lang-buttons">
                        <input type="submit" name="lan" value="ru" id="ru">
                        <input type="submit" name="lan" value="en" id="en">
                    </div>
                </form>
            </footer>
        </div>
    </div>
</body>

</html>