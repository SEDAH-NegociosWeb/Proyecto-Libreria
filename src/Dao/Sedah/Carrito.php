<?php

namespace Dao\Sedah;

use Dao\Table;


class Carrito extends Table
{

    public static function agregarProductoAlCarrito($id_libro, $cantidad)
    {
        // Ligar el id del producto con el usuario a través de la sesión
        $id_sesion = 1;//session_id();
        $sqlstr = ("INSERT INTO carrito_usuarios(id_sesion, id_libro, cantidad) 
        VALUES (:id_sesion, :id_libro, :cantidad);");
        
        $sqlParams = [
            "id_sesion" => $id_sesion ,
            "id_libro" => $id_libro ,
            "cantidad" => $cantidad 
        ];
        
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function actualizarProductoAlCarrito($id_libro, $cantidad)
    {
        // Ligar el id del producto con el usuario a través de la sesión
        $id_sesion = 1;//session_id();
        $sqlstr = ("UPDATE `carrito_usuarios`
        SET `cantidad` = (`cantidad` + :cantidad)
        WHERE `id_sesion` = :id_sesion and `id_libro` = :id_libro;");
        
        $sqlParams = [
            "id_sesion" => $id_sesion ,
            "id_libro" => $id_libro ,
            "cantidad" => $cantidad 
        ];
        
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function obtenerIdsDeProductosEnCarrito()
    {

        $sqlstr = ("SELECT id_libro FROM carrito_usuarios
        WHERE id_sesion = :id_sesion;");
        $id_sesion = 1;//session_id();
        $sqlParams = [ "id_sesion" => $id_sesion ];
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }

    public static function obtenerProductosEnCarrito()
    {

        $sqlstr = ("SELECT libro.idLibro, libro.nombreLibro, libro.descripcion,
		concat(autor.primerNombreAutor, ' ', autor.primerApellidoAutor) as autor,
		carrito_usuarios.cantidad, 
        libro.precio, imagen.direccion,
        (carrito_usuarios.cantidad * libro.precio) as SubTotal
        FROM libro
        INNER JOIN carrito_usuarios
        ON libro.idLibro = carrito_usuarios.id_libro
        INNER JOIN imagen
        ON libro.idImagen = imagen.idImagen
        INNER JOIN autor
        ON libro.idAutor = autor.idAutor
        WHERE carrito_usuarios.id_sesion = :id_sesion;");
        $id_sesion = 1;//session_id();
        $sqlParams = [ "id_sesion" => $id_sesion ];
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }

    public static function quitarProductoDelCarrito($id_libro)
    {

        $id_sesion = 1;//session_id();
        $sqlstr = ("DELETE FROM carrito_usuarios 
        WHERE id_sesion = :id_sesion AND id_libro = :id_libro");
        $sqlParams = [
            "id_sesion" => $id_sesion ,
            "id_libro" => $id_libro 
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }
}
