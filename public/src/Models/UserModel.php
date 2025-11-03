<?php

declare(strict_types=1);

namespace Ots\Bible\Models;

use DateTime;
use Ots\Bible\Repositories\UserRepository;

class UserModel 
{
    public int $id;
    public string $firstname;
    public string $lastname;
    public string $email;
    public string $password;
    public DateTime $updated;
    public DateTime $created;

    public function __construct(private UserRepository $repo) {

    }

    public function allUsers(): array {
        return $this->repo->getAll();    
    }

}