<?php

declare(strict_types=1);

namespace Ots\Bible\Repositories;

use Ots\Bible\Database;

class UserRepository extends Repository
{
    public function __construct(Database $database)
    {
        parent::__construct($database);
        $this->table = "users";
    }    
}