<?php

declare(strict_types=1);

namespace Ots\Bible\Models\Bible;

use DateTime;
use Ots\Bible\Repositories\Bible\BookRepository;
use Ots\Bible\Repositories\Bible\TestamentRepository;
use Ots\Bible\Repositories\Repository;
class BookModel 
{
    public int $id;    
    public TestamentModel $testament;
    public string $name;
    public string $abbreviation;
    public string $author;
    public string $year;
    public string $description;
    public DateTime $createdAt;
    public DateTime $updatedAt;    

    public function allBooks(): array {        
        $res =  $this->repo->getAllBooks();
        $books = [];
        foreach($res as $t) {
            $testament = new TestamentModel();
            $testament->id = $t['t_id'];
            $testament->name = $t['t_name'];
            $this->testament = $testament;
            $this->id = $t['id'];
            $this->name = $t['name'];
            $this->abbreviation = $t['abbreviation'];
            $this->author = $t['author'] ?? '';
            $this->year = $t['year'] ?? '';
            $this->description = $t['description'] ?? '';
            $this->createdAt = new DateTime($t['created_at']);
            $this->updatedAt = $t['updated_at'] ?? new DateTime();
            array_push($books, $this);
        }        
        return $books;
    }


}

