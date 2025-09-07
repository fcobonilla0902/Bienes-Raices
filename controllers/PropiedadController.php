<?php

namespace Controllers;
use MVC\Router;
use Model\Propiedad;
use Model\Vendedor;
use Intervention\Image\ImageManager as Image;
use Intervention\Image\Drivers\Gd\Driver;

class PropiedadController {
    public static function index(Router $router){

        $propiedades = Propiedad::all(); // :: para metodos estaticos

        $vendedores = Vendedor::all();
        
        $resultado = $_GET['resultado'] ?? null; // mensaje condicional

        $router->render('propiedades/admin', [
            'propiedades' => $propiedades,
            'resultado' => $resultado,
            'vendedores' => $vendedores
        ]);
    }



    public static function crear(Router $router){
        $propiedad = new Propiedad;
        $vendedores = Vendedor::all();

        // arreglo con mensajes de errores
        $errores = Propiedad::getErrores();

        if($_SERVER['REQUEST_METHOD'] === 'POST'){

             // Crea una nueva instancia
            $propiedad = new Propiedad($_POST['propiedad']);

            // generar un nombre único para la imagen
            $nombreImagen = md5(uniqid(rand(), true)) . ".jpg";

            if($_FILES['propiedad']['tmp_name']['imagen']){
                $manager = new Image(Driver::class);
                $imagen = $manager->read($_FILES['propiedad']['tmp_name']['imagen'])->cover(800, 600);
                $propiedad->setImagen($nombreImagen);
            }

            // validar
            $errores = $propiedad->validar();

            // Revisar que el arreglo de errores este vacío
            if(empty($errores)){
       
            // Subida de archivos 
            // si no existe la carpeta se crea
            if(!is_dir(CARPETA_IMAGENES)){
                mkdir(CARPETA_IMAGENES);
            }


            // guarda la imagen en el servidor
            $imagen->save(CARPETA_IMAGENES . $nombreImagen);

            $propiedad->guardar();

            }
        }

        $router->render('propiedades/crear', [
            'propiedad' => $propiedad,
            'vendedores' => $vendedores,
            'errores' => $errores
        ]);
    }



    public static function actualizar(Router $router){
        $id = validarORedireccionar('/admin');

        $propiedad = Propiedad::find($id);
        $vendedores = Vendedor::all();
        $errores = Propiedad::getErrores();

        // método post para actualizar
        if($_SERVER['REQUEST_METHOD'] === 'POST'){

            // Asignar los atributos
            $args = $_POST['propiedad'];

            $propiedad->sincronizar($args);

            // validación
            $errores = $propiedad->validar();

            // subida de archivos
            // generar un nombre único para la imagen
            $nombreImagen = md5(uniqid(rand(), true)) . ".jpg";

            if($_FILES['propiedad']['tmp_name']['imagen']){
                $manager = new Image(Driver::class);
                $imagen = $manager->read($_FILES['propiedad']['tmp_name']['imagen'])->cover(800, 600);
                $propiedad->setImagen($nombreImagen);
            }


            if(empty($errores)){
                if($_FILES['propiedad']['tmp_name']['imagen']){
                    // guarda la imagen en el servidor
                    $imagen->save(CARPETA_IMAGENES . $nombreImagen);
                }
        
                $propiedad->guardar();
            }

        }

        $router->render('/propiedades/actualizar', [
            'propiedad' => $propiedad,
            'errores' => $errores,
            'vendedores' => $vendedores
        ]);
    }



    public static function eliminar(){
        if($_SERVER['REQUEST_METHOD'] === 'POST'){

            // Validar id
            $id = $_POST['id'];
            $id = filter_var($id, FILTER_VALIDATE_INT);

            if($id){
                $tipo = $_POST['tipo'];
       
                if(validarTipoContenido($tipo)){
                    $propiedad = Propiedad::find($id);
                    $propiedad->eliminar();
                } 
            }
        }   
    }

}