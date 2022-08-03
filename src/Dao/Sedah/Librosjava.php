<?php

namespace Dao\Sedah;

use Dao\Table;

class LibrosJava extends Table {
    public static function getAll(){
        $sqlstr = "Select li.idLibro, li.nombreLibro, li.descripcion, img.direccion, concat(a.primerNombreAutor, ' ', a.primerApellidoAutor) as autor from libro as li inner join imagen as img on li.idImagen = img.idImagen
        inner join autor as a on li.idAutor = a.idAutor;";
        return self::obtenerRegistros($sqlstr, array());
    }
}

?>