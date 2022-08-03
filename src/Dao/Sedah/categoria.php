<?php
namespace Dao\Sedah;

use Dao\Table;

class categoria extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select * from categoria";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from categoria where idCategoria=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }
    public static function insertarcategoria(
        $nombreCategoria
    ) {
        $sqlstr = "INSERT INTO categoria (
        nombreCategoria
        ) values (
        :nombreCategoria
        );";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "nombreCategoria" => $nombreCategoria,
            )
        );
    }
    public static function actualizarcategoria(
        $idCategoria,
        $nombreCategoria
    ) {
        $sqlstr = "UPDATE categoria set
        nombreCategoria = :nombreCategoria
        where
        idCategoria = :idCategoria
        ";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idCategoria" => $idCategoria,
                "nombreCategoria" => $nombreCategoria,
            )
        );
    }
    public static function eliminarcategoria($idCategoria)
    {
        $sqlstr = "DELETE FROM categoria where idCategoria=:idCategoria;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idCategoria" => $idCategoria,
            )
        );
    }
}
