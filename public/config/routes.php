<?php

declare(strict_types=1);

use Slim\App;
use Ots\Bible\Controllers\UserController;

return function (App $app) {
    $app->get('/api/users', [UserController::class, 'allUsers']);
};