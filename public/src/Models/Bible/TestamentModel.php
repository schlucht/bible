<?php

declare(strict_types=1);

namespace Ots\Bible\Models\Bible;

use DateTime;
use Ots\Bible\Repositories\Bible\TestamentRepository;
use Ots\Bible\Repositories\Repository;


class TestamentModel 
{
    public int $id;
    public string $name;
    public DateTime $createdAt;
    public DateTime $updatedAt;

}