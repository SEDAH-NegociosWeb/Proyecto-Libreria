<?php
namespace Dao\Sedah;

use Dao\Table;

class imagen extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select * from imagen";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from imagen where idImagen=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }
    public static function insertarimagen(
        $direccion
    ) {
        $sqlstr = "INSERT INTO imagen (
direccion
) values (
:direccion
);";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "direccion" => $direccion,
            )
        );
    }
    public static function actualizarimagen(
        $idImagen,
        $direccion
    ) {
        $sqlstr = "UPDATE imagen set
direccion = :direccion
where
idImagen = :idImagen
";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idImagen" => $idImagen,
                "direccion" => $direccion,
            )
        );
    }
    public static function eliminarimagen($idImagen)
    {
        $sqlstr = "DELETE FROM imagen where idImagen=:idImagen;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idImagen" => $idImagen,
            )
        );
    }
}
