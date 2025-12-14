<?php

declare(strict_types=1);

use Slim\App;
use Ots\Bible\Controllers\User\UserController;
use Ots\Bible\Controllers\Bible\BookController;
use Ots\Bible\Controllers\Bible\TestamentController;
use Ots\Bible\Controllers\Weather\WeatherController;
use Ots\Bible\Controllers\User\AuthController;

return function (App $app) {
    $app->get('/api/bible/books', [BookController::class, 'allBooks']);
    $app->get('/api/bible/testaments', [TestamentController::class, 'allTestaments']);
    // // Weather
   $app->group('/api/weather', function ($group) {
      $group->get('', [WeatherController::class, 'index']);           // alle Wetterdaten
      $group->post('', [WeatherController::class, 'store']);          // neues Wetter hinzufügen
      $group->get('/{id}', [WeatherController::class, 'show']);       // einzelnes Wetter
   //     $group->put('/{id}', [WeatherController::class, 'update']);     // Wetter ändern
   //     $group->delete('/{id}', [WeatherController::class, 'destroy']); // Wetter löschen
   });
    
    $app->post('/api/users/register', [AuthController::class, 'register']);
    $app->post('/api/users/login', [AuthController::class, 'login']);
    
    $app->get('/api/users', [UserController::class, 'allUsers']);
    $app->post('/api/users/byId/{id}', [UserController::class, 'userById']);
    $app->delete('/api/users/delete/{id}', [UserController::class, 'delete']);



};
   // User löschen
//    // Bible
// $app->group('/api/bible', function ($group) {
//     $group->get('/books', [BookController::class, 'index']);        // alle Bücher
//     $group->get('/books/{id}', [BookController::class, 'show']);    // einzelnes Buch
//     $group->get('/testaments', [TestamentController::class, 'index']); // alle Testamente
// });




// // Auth
// $app->group('/api', function ($group) {
//     $group->post('/register', [AuthController::class, 'register']); // Registrierung
//     $group->post('/login', [AuthController::class, 'login']);       // Login
// });

// // Users
// $app->group('/api/users', function ($group) {
//     $group->get('', [UserController::class, 'index']);              // alle User
//     $group->get('/{id}', [UserController::class, 'show']);          // einzelner User
//     $group->post('', [UserController::class, 'store']);             // neuen User anlegen
//     $group->put('/{id}', [UserController::class, 'update']);        // User ändern
//     $group->delete('/{id}', [UserController::class, 'destroy']);    // User löschen
// });