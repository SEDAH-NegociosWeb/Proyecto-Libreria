<?php

namespace Dao\Sedah;

use Dao\Table;


class ProcesoPago extends Table
{
    public static function agregarDireccionEntrega($direccion, $departamento, $codigoPostal, $ciudad)
    {
        $sqlstr = ("INSERT INTO `direccionentrega`
        (`direccion`,
        `departamento`,
        `codigoPostal`,
        `ciudad`)
        VALUES
        (:direccion,
        :departamento,
        :codigoPostal,
        :ciudad);");
        
        $sqlParams = [
            "direccion" => $direccion ,
            "departamento" => $departamento ,
            "codigoPostal" => $codigoPostal ,
            "ciudad" => $ciudad 
        ];
        
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function agregarVenta($Total)
    {
        $usercod = \Utilities\Security::getUserId();

        $sqlstr = ("INSERT INTO `venta`
        (`fecha`,
        `usercod`,
        `idDireccionEntrega`,
        `Total`)
        VALUES
        (CURDATE(),
        :usercod,
        (SELECT MAX(iddireccionEntrega) AS id FROM direccionentrega),
        :Total);");
        
        $sqlParams = [
            "usercod" => $usercod ,
            "Total" => $Total 
        ];
        
        return self::executeNonQuery($sqlstr, $sqlParams);
    }

    public static function agregarDetalleVenta($idLibro, $Cant, $Precio, $SubTotal)
    {
        $sqlstr = ("INSERT INTO `detalle_venta`
        (`idVenta`,
        `idLibro`,
        `Cant`,
        `Precio`,
        `SubTotal`)
        VALUES
        ((SELECT MAX(idventa) AS id FROM venta),
        :idLibro,
        :Cant,
        :Precio,
        :SubTotal);");
        
        $sqlParams = [
            "idLibro" => $idLibro ,
            "Cant" => $Cant ,
            "Precio" => $Precio ,
            "SubTotal" => $SubTotal 
        ];
        
        return self::executeNonQuery($sqlstr, $sqlParams);
    }
}

?>