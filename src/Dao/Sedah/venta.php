<?php
namespace Dao\Sedah;

use Dao\Table;

class venta extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select v.idventa, v.fecha, u.username, d.direccion, v.Total from venta as v
        inner join usuario as u on v.usercod = u.usercod
        inner join direccionentrega as d on v.idDireccionEntrega = d.iddireccionEntrega;";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from venta where idventa=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }
    public static function insertarventa(
        $fecha,
        $usercod,
        $idDireccionEntrega,
        $Total
        )
    {
        $sqlstr = "INSERT INTO venta (
fecha,
usercod,
idDireccionEntrega,
Total
) values (
:fecha,
:usercod,
:idDireccionEntrega,
:Total
);";
        return self::executeNonQuery(
            $sqlstr,
            array(
            "fecha" => $fecha,
            "usercod" => $usercod,
            "idDireccionEntrega" => $idDireccionEntrega,
            "Total" => $Total,
        )
        );
    }
    public static function actualizarventa(
        $idventa,
        $fecha,
        $usercod,
        $idDireccionEntrega,
        $Total
        )
    {
        $sqlstr = "UPDATE venta set
fecha = :fecha,
usercod = :usercod,
idDireccionEntrega = :idDireccionEntrega,
Total = :Total
where
idventa = :idventa
";
        return self::executeNonQuery(
            $sqlstr,
            array(
            "idventa" => $idventa,
            "fecha" => $fecha,
            "usercod" => $usercod,
            "idDireccionEntrega" => $idDireccionEntrega,
            "Total" => $Total,
        )
        );
    }
    public static function eliminarventa($idventa)
    {
        $sqlstr = "DELETE FROM venta where idventa=:idventa;";
        return self::executeNonQuery(
            $sqlstr,
            array(
            "idventa" => $idventa,
        )
        );
    }
}
