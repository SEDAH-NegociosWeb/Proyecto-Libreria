<?php
namespace Dao\Sedah;

use Dao\Table;

class libro extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select * from libro";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from libro where idLibro=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }
    public static function insertarlibro(
        $nombreLibro,
        $descripcion,
        $edicion,
        $anio,
        $precio,
        $idEditorial,
        $idImagen,
        $idAutor,
        $idCategoria
    ) {
        $sqlstr = "INSERT INTO libro (
        nombreLibro,
        descripcion,
        edicion,
        anio,
        precio,
        idEditorial,
        idImagen,
        idAutor,
        idCategoria
        ) values (
        :nombreLibro,
        :descripcion,
        :edicion,
        :anio,
        :precio,
        :idEditorial,
        :idImagen,
        :idAutor,
        :idCategoria
        );";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "nombreLibro" => $nombreLibro,
                "descripcion" => $descripcion,
                "edicion" => $edicion,
                "anio" => $anio,
                "precio" => $precio,
                "idEditorial" => $idEditorial,
                "idImagen" => $idImagen,
                "idAutor" => $idAutor,
                "idCategoria" => $idCategoria,
            )
        );
    }
    public static function actualizarlibro(
        $idLibro,
        $nombreLibro,
        $descripcion,
        $edicion,
        $anio,
        $precio,
        $idEditorial,
        $idImagen,
        $idAutor,
        $idCategoria
    ) {
        $sqlstr = "UPDATE libro set
        nombreLibro = :nombreLibro,
        descripcion = :descripcion,
        edicion = :edicion,
        anio = :anio,
        precio = :precio,
        idEditorial = :idEditorial,
        idImagen = :idImagen,
        idAutor = :idAutor,
        idCategoria = :idCategoria
        where
        idLibro = :idLibro
        ";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idLibro" => $idLibro,
                "nombreLibro" => $nombreLibro,
                "descripcion" => $descripcion,
                "edicion" => $edicion,
                "anio" => $anio,
                "precio" => $precio,
                "idEditorial" => $idEditorial,
                "idImagen" => $idImagen,
                "idAutor" => $idAutor,
                "idCategoria" => $idCategoria,
            )
        );
    }
    public static function eliminarlibro($idLibro)
    {
        $sqlstr = "DELETE FROM libro where idLibro=:idLibro;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idLibro" => $idLibro,
            )
        );
    }
}
