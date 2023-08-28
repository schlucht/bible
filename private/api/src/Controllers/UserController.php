<?php
namespace Controllers;

use Models\User;
use Core\Database;
use Core\Request;

class UserController {

    private User $user;
    private Database $db;

    public function __construct() {
        $this->db = new Database();
        $this->user = new User($this->db);
    }
   
    public function readUsers(Request $request) {
        return json_encode($this->user->getAll());
    }

    public function writeUser(Request $request) {    
        $data =  $request->getBody();
        $user = json_decode($data);
        dd($user);
    }

    public function userFromId(int $id, Request $request) {        
        dd($id);
    }

}