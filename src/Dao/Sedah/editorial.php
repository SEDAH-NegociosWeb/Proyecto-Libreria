<?php
namespace Dao\Mnt;
use Dao\Table;
class editorial extends Table {
public static function obtenerTodos(){
$sqlstr = "select * from editorial";
return self::obtenerRegistros(
$sqlstr,
array()
);
}
public static function obtenerPorId($id){
$sqlstr = "select * from editorial where idEditorial=:id";
return self::obtenerUnRegistro(
$sqlstr,
array("id" => $id));
}
public static function insertareditorial(
$nombreEditorial,
$direccion,
$telefono,
$email
)
{
$sqlstr= "INSERT INTO editorial (
nombreEditorial,
direccion,
telefono,
email
) values (
:nombreEditorial,
:direccion,
:telefono,
:email
);";
return self::executeNonQuery(
$sqlstr,
array(
"nombreEditorial" => $nombreEditorial,
"direccion" => $direccion,
"telefono" => $telefono,
"email" => $email
)
);
}
public static function actualizareditorial(
$idEditorial,
$nombreEditorial,
$direccion,
$telefono,
$email
)
{
$sqlstr = "UPDATE editorial set
nombreEditorial = :nombreEditorial,
direccion = :direccion,
telefono = :telefono,
email = :email
where
idEditorial = :idEditorial
";
return self::executeNonQuery(
$sqlstr,
array(
"idEditorial" => $idEditorial,
"nombreEditorial" => $nombreEditorial,
"direccion" => $direccion,
"telefono" => $telefono,
"email" => $email
)
);
}
public static function eliminareditorial($idEditorial){
$sqlstr = "DELETE FROM editorial where idEditorial=:idEditorial;";
return self::executeNonQuery(
$sqlstr,
array(
"idEditorial" => $idEditorial
)
);
}
}
?>