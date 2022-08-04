<?php

namespace Dao\Sedah;

use Dao\Table;

class DetalleJava extends Table 
{
    public static function getById(int $idLibro)
    {
        $sqlstr = "Select li.nombreLibro, li.descripcion, img.direccion, li.edicion, li.anio, li.precio, concat(a.primerNombreAutor, ' ', a.primerApellidoAutor) as autor from libro as li inner join imagen as img on li.idImagen = img.idImagen
        inner join autor as a on li.idAutor = a.idAutor where li.idLibro=:idLibro;";
        $sqlParams = array("idLibro" => $idLibro);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }
}

?>