<?php

declare(strict_types=1);

use Controllers\UserController;
use Models\UserGateway;
use Core\Database;
use Core\Router;
use Core\Request;
use Core\RouteNotFoundException;

require 'functions.php';



$router = require_once 'routes.php';

$request = Request::createFromGlobal();

try{
    echo $router->handle($request);
}catch (RouteNotFoundException $exception){
    echo $exception->getMessage();
}


