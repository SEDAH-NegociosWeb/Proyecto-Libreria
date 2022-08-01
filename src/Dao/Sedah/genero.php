<?php
namespace Dao\Mnt;
use Dao\Table;
class genero extends Table {
public static function obtenerTodos(){
$sqlstr = "select * from genero";
return self::obtenerRegistros(
$sqlstr,
array()
);
}
public static function obtenerPorId($id){
$sqlstr = "select * from genero where idGenero=:id";
return self::obtenerUnRegistro(
$sqlstr,
array("id" => $id));
}
public static function insertargenero(
$nombreGenero
)
{
$sqlstr= "INSERT INTO genero (
nombreGenero
) values (
:nombreGenero
);";
return self::executeNonQuery(
$sqlstr,
array(
"nombreGenero" => $nombreGenero
)
);
}
public static function actualizargenero(
$idGenero,
$nombreGenero
)
{
$sqlstr = "UPDATE genero set
nombreGenero = :nombreGenero
where
idGenero = :idGenero
";
return self::executeNonQuery(
$sqlstr,
array(
"idGenero" => $idGenero,
"nombreGenero" => $nombreGenero
)
);
}
public static function eliminargenero($idGenero){
$sqlstr = "DELETE FROM genero where idGenero=:idGenero;";
return self::executeNonQuery(
$sqlstr,
array(
"idGenero" => $idGenero
)
);
}
}
?>