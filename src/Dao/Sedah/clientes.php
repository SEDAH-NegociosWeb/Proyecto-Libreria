<?php
namespace Dao\Sedah;

use Dao\Table;

class clientes extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select * from clientes";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from clientes where idCliente=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }
    public static function insertarclientes(
        $nombreCliente,
        $generoCliente,
        $telefonoCliente,
        $celularCliente,
        $correoCliente,
        $numeroIdCliente,
        $biografiaCliente,
        $estadoCliente,
        $fechaRegistro
    ) {
        $sqlstr = "INSERT INTO clientes (
        nombreCliente,
        generoCliente,
        telefonoCliente,
        celularCliente,
        correoCliente,
        numeroIdCliente,
        biografiaCliente,
        estadoCliente,
        fechaRegistro
        ) values (
        :nombreCliente,
        :generoCliente,
        :telefonoCliente,
        :celularCliente,
        :correoCliente,
        :numeroIdCliente,
        :biografiaCliente,
        :estadoCliente,
        :fechaRegistro
        );";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "nombreCliente" => $nombreCliente,
                "generoCliente" => $generoCliente,
                "telefonoCliente" => $telefonoCliente,
                "celularCliente" => $celularCliente,
                "correoCliente" => $correoCliente,
                "numeroIdCliente" => $numeroIdCliente,
                "biografiaCliente" => $biografiaCliente,
                "estadoCliente" => $estadoCliente,
                "fechaRegistro" => $fechaRegistro,
            )
        );
    }
    public static function actualizarclientes(
        $idCliente,
        $nombreCliente,
        $generoCliente,
        $telefonoCliente,
        $celularCliente,
        $correoCliente,
        $numeroIdCliente,
        $biografiaCliente,
        $estadoCliente,
        $fechaRegistro
    ) {
        $sqlstr = "UPDATE clientes set
        nombreCliente = :nombreCliente,
        generoCliente = :generoCliente,
        telefonoCliente = :telefonoCliente,
        celularCliente = :celularCliente,
        correoCliente = :correoCliente,
        numeroIdCliente = :numeroIdCliente,
        biografiaCliente = :biografiaCliente,
        estadoCliente = :estadoCliente,
        fechaRegistro = :fechaRegistro
        where
        idCliente = :idCliente
        ";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idCliente" => $idCliente,
                "nombreCliente" => $nombreCliente,
                "generoCliente" => $generoCliente,
                "telefonoCliente" => $telefonoCliente,
                "celularCliente" => $celularCliente,
                "correoCliente" => $correoCliente,
                "numeroIdCliente" => $numeroIdCliente,
                "biografiaCliente" => $biografiaCliente,
                "estadoCliente" => $estadoCliente,
                "fechaRegistro" => $fechaRegistro,
            )
        );
    }
    public static function eliminarclientes($idCliente)
    {
        $sqlstr = "DELETE FROM clientes where idCliente=:idCliente;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "idCliente" => $idCliente,
            )
        );
    }
}
