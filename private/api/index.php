<?php

declare(strict_types=1);



spl_autoload_register(function($class) {
    require __DIR__ . "/src/$class.php";
});

set_error_handler("ErrorHandler::handleError");
set_exception_handler("ErrorHandler::handleException");

header("Content-Type: application/json; charset=UTF-8");

$parts = explode("/",$_SERVER["REQUEST_URI"]);
var_dump($_SERVER["REQUEST_URI"]);
var_dump($_POST);
var_dump($parts);
if ($parts[3] != "users") {
    http_response_code(404);
    exit;
}

$id = $parts[4] ?? null;

$database = new Database;

$database->getConnection();

$controller = new UserController(new UserGateway($database));
$controller->processRequest($_SERVER["REQUEST_METHOD"], $id);


