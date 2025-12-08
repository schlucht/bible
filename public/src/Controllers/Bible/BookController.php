<?php

declare(strict_types=1);

namespace Ots\Bible\Controllers\Bible;


use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;
use Ots\Bible\Repositories\Bible\BookRepository;
use Ots\Bible\Utils\ResponseHelper;
use Ots\Bible\Utils\ResponseMessage;

class BookController
{
    public function __construct(private BookRepository $repo){}

    function allBooks(Request $request, Response $response): Response{
        $resp = new ResponseHelper($response);
        $message = new ResponseMessage(true);
        try{
            $res = $this->repo->getAllBooks();
            $body = json_encode($res);
            $response->getBody()->write($body);
            $message->data = $body;
            return $resp->write($message, 200);               

        } catch (\PDOException $e) {
            return $resp->write(new ResponseMessage(false, null, $e->getMessage()), 500);  
        }
    }
}