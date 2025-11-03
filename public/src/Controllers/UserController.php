<?php

declare(strict_types=1);

namespace Ots\Bible\Controllers;

use Ots\Bible\Database;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Ots\Bible\Models\UserModel;
use Ots\Bible\Repositories\UserRepository;

class UserController
{
    private UserModel $model;

    public function __construct()
    {
        $repo = new UserRepository(new Database);
        $this->model = new UserModel($repo);
    }

    function allUsers(Request $request, Response $response): Response{

        $res = $this->model->allUsers();
        $body = json_encode($res);
        $response->getBody()->write($body);
        return $response;
    
    }
}