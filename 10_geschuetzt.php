<?php
require("includes/config.inc.php");
require("includes/common.inc.php");

testausgabe($_POST);

session_start();
testausgabe($_SESSION);
testausgabe(session_name());
if(count($_POST)>0 && isset($_POST["btnLogout"])) {
	//naja, offensichtsich will sich der User ausloggen
	$_SESSION = [];
	//XAMPP - Apache - Config - php.ini nachschlagen
	if(ini_get("session.use_cookies")) {//ini_get — Returns the value of the configuration option as a string on success, or an empty string for null values. Returns false if the configuration option doesn't exist.
		$params = session_get_cookie_params();
		setcookie(session_name(), '', time() - 86400, $params["path"], $params["domain"], $params["secure"], $params["httponly"]);
	}
	session_destroy();
	testausgabe($_SESSION);
}

if(!(isset($_SESSION["eingeloggt"]) && $_SESSION["eingeloggt"]==true)) {
	//nein, das ist kein korrekt eingeloggter User
	header("Location: 10_login01.php");
}
?>
<!doctype html>
<html lang="de">
	<head>
		<title>PHP: Geschützt</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<h1>Ich bin geschützt!</h1>
		<form method="post">
			<input type="submit" value="ausloggen" name="btnLogout">
		</form>
		<form method="post">
			<label>
				Vorname:
				<input type="text" name="VN">
			</label>
			<label>
				Nachname:
				<input type="text" name="NN">
			</label>
			<input type="submit" value="Kontaktaufnahme">
		</form>
		<p>Wirklich!</p>
	</body>
</html>