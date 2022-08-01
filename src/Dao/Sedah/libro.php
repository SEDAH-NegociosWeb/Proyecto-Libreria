<?php
namespace Dao\Mnt;
use Dao\Table;
class libro extends Table {
public static function obtenerTodos(){
$sqlstr = "select * from libro";
return self::obtenerRegistros(
$sqlstr,
array()
);
}
public static function obtenerPorId($id){
$sqlstr = "select * from libro where idLibro=:id";
return self::obtenerUnRegistro(
$sqlstr,
array("id" => $id));
}
public static function insertarlibro(
$nombreLibro,
$descripcion,
$edicion,
$año,
$precio,
$idEditorial,
$idImagen,
$idAutor
)
{
$sqlstr= "INSERT INTO libro (
nombreLibro,
descripcion,
edicion,
año,
precio,
idEditorial,
idImagen,
idAutor
) values (
:nombreLibro,
:descripcion,
:edicion,
:año,
:precio,
:idEditorial,
:idImagen,
:idAutor
);";
return self::executeNonQuery(
$sqlstr,
array(
"nombreLibro" => $nombreLibro,
"descripcion" => $descripcion,
"edicion" => $edicion,
"año" => $año,
"precio" => $precio,
"idEditorial" => $idEditorial,
"idImagen" => $idImagen,
"idAutor" => $idAutor
)
);
}
public static function actualizarlibro(
$idLibro,
$nombreLibro,
$descripcion,
$edicion,
$año,
$precio,
$idEditorial,
$idImagen,
$idAutor
)
{
$sqlstr = "UPDATE libro set
nombreLibro = :nombreLibro,
descripcion = :descripcion,
edicion = :edicion,
año = :año,
precio = :precio,
idEditorial = :idEditorial,
idImagen = :idImagen,
idAutor = :idAutor
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
"año" => $año,
"precio" => $precio,
"idEditorial" => $idEditorial,
"idImagen" => $idImagen,
"idAutor" => $idAutor
)
);
}
public static function eliminarlibro($idLibro){
$sqlstr = "DELETE FROM libro where idLibro=:idLibro;";
return self::executeNonQuery(
$sqlstr,
array(
"idLibro" => $idLibro
)
);
}
}
?>