<?php

declare(strict_types=1);

use DI\Container;
use Ots\Bible\Database;
use Ots\Bible\Models\UserModel;
use Ots\Bible\Repositories\UserRepository;
use Ots\Bible\Controllers\UserController;

use function DI\create;

return [
    Database::class => create(Database::class),
];