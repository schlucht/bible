<?php

declare(strict_types=1);

use Ots\Bible\Controllers\UserController;
use Ots\Bible\Middleware\AddJsonResponseHeader;
use Slim\Factory\AppFactory;
   
require dirname(__DIR__) . '/public/vendor/autoload.php';

$app = AppFactory::create();

$app->addBodyParsingMiddleware();
$error_middleware = $app->addErrorMiddleware(true, true, true);
$error_handler = $error_middleware->getDefaultErrorHandler();
$error_handler->forceContentType('application/json');
$app->add(new AddJsonResponseHeader);

$app->get('/api/users', [UserController::class, 'allUsers']);

$app->run();
?>