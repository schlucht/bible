<?php

declare(strict_types=1);

namespace Ots\Bible\Controllers\Bible;


use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Ots\Bible\Models\Bible\BookModel;
use Ots\Bible\Repositories\Bible\BookRepository;

class BookController
{
    public function __construct(private BookRepository $repo){}

    function allBooks(Request $request, Response $response): Response{
        $res = $this->repo->getAllBooks();
        $body = json_encode($res);
        $response->getBody()->write($body);
        return $response;    
    }
}