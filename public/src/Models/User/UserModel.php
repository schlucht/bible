<?php

declare(strict_types=1);

namespace Ots\Bible\Models\User;

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

}