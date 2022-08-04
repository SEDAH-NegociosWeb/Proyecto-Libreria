<?php

namespace Dao\Sedah;

use Dao\Table;


class ProcesoPago extends Table
{
    public static function agregarDireccionEntrega($direccion, $departamento, $codigoPostal, $ciudad)
    {
        $sqlstr = ("INSERT INTO `prueba`.`direccionentrega`
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
}

?>