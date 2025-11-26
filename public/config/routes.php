<?php

declare(strict_types=1);

use Slim\App;
use Ots\Bible\Controllers\UserController;
use Ots\Bible\Controllers\Bible\BookController;
use Ots\Bible\Controllers\Bible\TestamentController;

return function (App $app) {
    $app->get('/api/users', [UserController::class, 'allUsers']);
    $app->get('/api/bible/books', [BookController::class, 'allBooks']);
    $app->get('/api/bible/testaments', [TestamentController::class, 'allTestaments']);
};

