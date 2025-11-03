<?php

declare(strict_types=1);

use Ots\Bible\Database;
use Slim\Factory\AppFactory;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
   
require dirname(__DIR__) . '/public/vendor/autoload.php';

$app = AppFactory::create();

$app->get('/api/users', function (Request $request, Response $response){

    $database = new Database;
    $pdo = $database->getConnection();
    $stmt = $pdo->query("SELECT * FROM users");
    
    $res = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $body = json_encode($res);

    $response->getBody()->write($body);
    return $response->withHeader('Content-Type', 'application/json');

});

$app->run();
?>