<?php
function dd($msg) {
    echo '<hr><pre style="background-color: beige; padding: 1rem">';
    var_dump($msg);
    echo '</pre><hr>';
    // die();
}

/**
 * Autoload
 */
spl_autoload_register(function($class) {
    // var_dump($class);
    $cl = str_replace('\\', DIRECTORY_SEPARATOR, $class);
    $file =  __DIR__ . "/src/{$cl}.php";    
    //die();
    if (file_exists($file)) {
        require_once $file;
    } 
});

