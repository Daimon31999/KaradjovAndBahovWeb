<?php
$mysqli = new mysqli('localhost', 'root', '', 'miximix');
$users;
if (isset($_POST['register'])) {
    $measurement_error = 3;
    $phone_lenth = 8;
    ###################### Name ######################
    if (($_POST['name'] === "") || (is_numeric($_POST['name'])) || (strlen($_POST['name']) < $measurement_error)) {
        echo 'Поле "Имя" не было заполнено правельно.<br><a href="index.html">Возврат к форме</a> чтобы заполнить все поля.';
    }
    ###################### Surname ######################
    else if (($_POST['surname'] === "") || (is_numeric($_POST['surname'])) || (strlen($_POST['surname']) < $measurement_error)) {
        echo 'Поле "Фамилия" не было заполнено правельно.<br><a href="index.html">Возврат к форме</a> чтобы заполнить все поля.';
    } else if (($_POST['city'] === "") || (is_numeric($_POST['city'])) || (strlen($_POST['city']) < $measurement_error)) {
        echo 'Поле "Город" не было заполнено правельно.<br><a href="index.html">Возврат к форме</a> чтобы заполнить все поля.';
    } else if (($_POST['phone'] === "") || (strlen($_POST['phone']) < $phone_lenth) || (strlen($_POST['phone']) > $phone_lenth + 1)) {
        echo 'Поле "Телефон" не было заполнено правельно.<br><a href="index.html">Возврат к форме</a> чтобы заполнить все поля.';
    } else {
        $values =
            "'" . $_POST['name'] . "'," .
            "'" . $_POST['surname'] . "'," .
            "'" . $_POST['sex'] . "'," .
            "'" . $_POST['family'] . "'," .
            "'" . $_POST['date_of_birth'] . "'," .
            "'" . $_POST['address'] . "'," .
            "'" . $_POST['city'] . "'," .
            "'" . $_POST['email'] . "'," .
            "'" . $_POST['phone'] . "'," .
            "'" . implode("|", $_POST['hobby']) . "'";
        $query = "INSERT INTO `users_info`(`name`, `surname`, `sex`, `family`, `date_of_birth`, `address`, `city`, `email`, `phone`, `hobby`) VALUES($values);  ";
        if ($mysqli->query($query)) {
            echo '<div class="link"><a href="template.php"><p>Поздравляю вы успешно заполнили анкету!!! <br />Нажмите, чтобы перейти на главную страницу</p></a></div>';
        } else {
            echo '<div class="link"><a href="templates.php"><p>Упс что-то пошло не так ;(</p></a></div>';
        }
    }
}

?>
<style>
    .link {
        display: flex;
        width: 500px;
        height: 200px;
        border-radius: 20px;
        background: rgba(0, 0, 255, 0.4);
        margin: 40px;
    }

    a,
    p {
        text-decoration: none;
        color: cyan;
        font-size: 28px;
        margin: 0 auto;
    }

    a {
        display: flex;
        margin: 0 auto;
        align-items: center;
        margin-left: 20px;
    }
</style>