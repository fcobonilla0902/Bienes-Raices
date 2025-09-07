<?php

function conectarDB(){
    $db = new mysqli('localhost', 'root', 'root', 'bienesraices_curso');

    if(!$db){
        echo "Error, no se pudo conectar";
        exit; // detener ejecución del código
    }

    return $db;
}