<?php
// require_once __DIR__ . '/IndexController.php';
// require_once __DIR__ . '/ProfileController.php';

use Core\Router;
use Core\Request;

$router = new Router();


// $router->register('/', new IndexController());

// $router->register('/profile/{id}', new ProfileController(),'POST');
// $router->register('/profile/{id}', new ProfileController(),'GET');

$router->register('/', function (Request $request) {
    return 'Login';
}, 'GET');


return $router;