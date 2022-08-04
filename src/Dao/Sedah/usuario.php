<?php
namespace Dao\Sedah;

use Dao\Table;

class usuario extends Table
{
    public static function obtenerTodos()
    {
        $sqlstr = "select * from usuario";
        return self::obtenerRegistros(
            $sqlstr,
            array()
        );
    }
    public static function obtenerPorId($id)
    {
        $sqlstr = "select * from usuario where usercod=:id";
        return self::obtenerUnRegistro(
            $sqlstr,
            array("id" => $id));
    }
    public static function insertarusuario(
        $useremail,
        $username,
        $userpswd,
        $userfching,
        $userpswdest,
        $userpswdexp,
        $userest,
        $useractcod,
        $userpswdchg,
        $usertipo,
        $token
    ) {
        $sqlstr = "INSERT INTO usuario (
useremail,
username,
userpswd,
userfching,
userpswdest,
userpswdexp,
userest,
useractcod,
userpswdchg,
usertipo,
token
) values (
:useremail,
:username,
:userpswd,
:userfching,
:userpswdest,
:userpswdexp,
:userest,
:useractcod,
:userpswdchg,
:usertipo,
:token
);";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "useremail" => $useremail,
                "username" => $username,
                "userpswd" => $userpswd,
                "userfching" => $userfching,
                "userpswdest" => $userpswdest,
                "userpswdexp" => $userpswdexp,
                "userest" => $userest,
                "useractcod" => $useractcod,
                "userpswdchg" => $userpswdchg,
                "usertipo" => $usertipo,
                "token" => $token,
            )
        );
    }
    public static function actualizarusuario(
        $usercod,
        $username,
        $userest,
        $usertipo
    ) {
        $sqlstr = "UPDATE usuario set
username = :username,
userest = :userest,
usertipo = :usertipo
where
usercod = :usercod
";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "usercod" => $usercod,
                "username" => $username,
                "userest" => $userest,
                "usertipo" => $usertipo
            )
        );
    }
    public static function eliminarusuario($usercod)
    {
        $sqlstr = "UPDATE usuario SET userest = 'INA' WHERE usercod=:usercod;";
        return self::executeNonQuery(
            $sqlstr,
            array(
                "usercod" => $usercod,
            )
        );
    }
}
