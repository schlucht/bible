<?php

class UserController {

    public function __construct(private UserGateway $gateway) {}

    public function processRequest(string $method, ?string $id):void {
        if ($id) {
            $this->processRescourceRequest($method, $id);
        } else {
            $this->processCollectionRequest($method);
        }
    }

    public function processRescourceRequest(string $method, string $id): void {
        $product = $this->gateway->get($id);
        if(!$product) {
            http_response_code(404);
            echo json_encode(["message" => "Product not found"]);
            return;
        }
        switch ($method) {
            case "GET":                
                echo json_encode($product);
                break;
            case "PATCH":
                $data = (array)json_decode(file_get_contents("php://input"),true);

                $errors = $this->getValidationErrors($data, false);
                if(!empty($errors)) {
                    http_response_code(422);
                    echo json_encode(["errors" => $errors]);
                    break;
                }

                $rows = $this->gateway->update($user, $data);

                http_response_code(201);

                echo json_encode([
                    "message" => "Create a new User",
                    "rows" => $rows
                ]);
            case "DELETE":
                $rows = $this->gateway->delete($id);

                echo json_encode([
                    "message" => "Person $id deleted",
                    "rows" => $rows
                ]);
                break;
            default:
            http_response_code(405);
                header("Allow: GET, PATCH, DELETE");
        }
    }

    public function processCollectionRequest(string $method):void {

        switch ($method) {
            case "GET":
                echo json_encode($this->gateway->getAll());
                break;
            case "POST":
                $data = (array)json_decode(file_get_contents("php://input"),true);

                $errors = $this->getValidationErrors($data, true);
                if(!empty($errors)) {
                    http_response_code(422);
                    echo json_encode(["errors" => $errors]);
                    break;
                }

                $id = $this->gateway->create($data);

                http_response_code(201);

                echo json_encode([
                    "message" => "Create a new User",
                    "id" => $id
                ]);
            default:
                http_response_code(405);
                header("Allow: GET, POST");
        }
    }

    public function getValidationErrors(array $data, bool $is_validation): array {
        $errors = [];

        if ($is_validation && empty($data["first_name"])) {
            $errors[] = "name is required";
        }

        return $errors;
    }

}