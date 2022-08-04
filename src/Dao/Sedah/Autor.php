<?php
namespace Dao\Sedah;

use Dao\Table;

class Autor extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select * from autor";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from autor where idAutor=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }

    public static function obtenerTodosNombres(){
        $sqlstr = "Select idAutor, concat(primerNombreAutor, ' ', primerApellidoAutor) as nombre from autor;";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }

    public static function insertarAutor(
        $primerNombreAutor,
        $segundoNombreAutor,
        $primerApellidoAutor,
        $segundoApellidoAutor,
        $idImagen,
        $fechaDeNacimiento
    ) {
        $sqlstr = "INSERT INTO autor (
        primerNombreAutor,
        segundoNombreAutor,
        primerApellidoAutor,
        segundoApellidoAutor,
        idImagen,
        fechaDeNacimiento
        ) values (
        :primerNombreAutor,
        :segundoNombreAutor,
        :primerApellidoAutor,
        :segundoApellidoAutor,
        :idImagen,
        :fechaDeNacimiento
        );";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "primerNombreAutor" => $primerNombreAutor,
                "segundoNombreAutor" => $segundoNombreAutor,
                "primerApellidoAutor" => $primerApellidoAutor,
                "segundoApellidoAutor" => $segundoApellidoAutor,
                "idImagen" => $idImagen,
                "fechaDeNacimiento" => $fechaDeNacimiento,
            )
        );
    }
    public static function actualizarAutor(
        $idAutor,
        $primerNombreAutor,
        $segundoNombreAutor,
        $primerApellidoAutor,
        $segundoApellidoAutor,
        $idImagen,
        $fechaDeNacimiento
    ) {
        $sqlstr = "UPDATE autor set
        primerNombreAutor = :primerNombreAutor,
        segundoNombreAutor = :segundoNombreAutor,
        primerApellidoAutor = :primerApellidoAutor,
        segundoApellidoAutor = :segundoApellidoAutor,
        idImagen = :idImagen,
        fechaDeNacimiento = :fechaDeNacimiento
        where
        idAutor = :idAutor
        ";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idAutor" => $idAutor,
                "primerNombreAutor" => $primerNombreAutor,
                "segundoNombreAutor" => $segundoNombreAutor,
                "primerApellidoAutor" => $primerApellidoAutor,
                "segundoApellidoAutor" => $segundoApellidoAutor,
                "idImagen" => $idImagen,
                "fechaDeNacimiento" => $fechaDeNacimiento,
            )
        );
    }
    public static function eliminarAutor($idAutor)
    {
        $sqlstr = "DELETE FROM autor where idAutor=:idAutor;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idAutor" => $idAutor,
            )
        );
    }
}
