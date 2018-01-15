<!-- FRAGE: Wie löscht man sessions die nicht durch logout gelöscht wurden, da sich nicht manuell ausgeloggt wurde? Automatisch? -->

<?php
session_save_path(__DIR__.DIRECTORY_SEPARATOR.'data');
session_start();

// include config and functions to use them.
require_once './core/config.php'; 
require_once './core/functions.php'; 

if(isset($_POST['submitLogin']))
{
    $error = true;
    $user = logIn($error);
    if(!$error)
    {
        $_SESSION['user'] = $user;
    }
}
else if (isset($_POST['submitLogout']))
{
    logOut();
}
else if (isset($_COOKIE['userId']))
{
    $error = true;
    $user = logIn($error, true);
    if(!$error)
    {
        $_SESSION['user'] = $user;
    }
}

$loggedIn = isset($_SESSION['user']);

$title = 'Login';
$page = isset($_GET['p']) ? $_GET['p'] : '';
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<?=ROOTPATH.'assets/styles/style.css'?>">
    <title><?=$title?></title>
</head>
<body>

    <?
    if($loggedIn)
    {
        include (VIEWPATH.'site.php');  // When user is logged in, he gets the site.
    }
    elseif($page=='register')
    {
        include (VIEWPATH.'register.php');

    }
    else
    {
        include (VIEWPATH.'login.php'); // When user isnt logged in, he gets the login page.
    }
    
    ?>

    <? if(isset($error) && $error !== false) : ?>
        <div class="error">
            <span onclick="{this.parentNode.parentNode.removeChild(this.parentNode);}">
                x
            </span>
            <?=$error?>
        </div>
    <? endif; ?>

</body>
</html>