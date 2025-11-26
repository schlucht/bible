<?php

declare(strict_types=1);

namespace Ots\Bible\Controllers\Bible;


use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Ots\Bible\Repositories\Bible\TestamentRepository;

class TestamentController
{
    

    public function __construct(private TestamentRepository $repo){}

    function allTestaments(Request $request, Response $response): Response{

        $res = $this->repo->allTestaments();
        $body = json_encode($res);
        $response->getBody()->write($body);
        return $response;
    
    }
}