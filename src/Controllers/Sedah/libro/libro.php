<?php
namespace Controllers\Mnt\libro;
use Controllers\PublicController;
use Views\Renderer;
class libro extends PublicController {
private $_modeStrings = array(
"INS" => "Insertar libro",
"UPD" => "Editar libro",
"DSP" => "Detalle libro",
"DEL" => "Eliminando libro");
private $_cmbOpciones = array(
"EJ1"  => "Ejemplo 1",
"EJ2"  => "Ejemplo 2");
private $_viewData = array(
"mode" => "INS",
"idLibro" => "",
"nombreLibro" => "",
"descripcion" => "",
"edicion" => "",
"año" => "",
"precio" => "",
"idEditorial" => "",
"idImagen" => "",
"idAutor" => "",
"modeDsc" => "",
"readonly" => false,
"isInsert" => false,
"cmbOpciones"=>[],
"opciones"=> "Eje1",
"errors"=>[],
"crsxToken" => "" );
private function init(){
if (isset($_GET["mode"])){
$this->_viewData["mode"] = $_GET["mode"];
}
if (isset($_GET["idLibro"])){
$this->_viewData["idLibro"] = $_GET["idLibro"];
}
if(!isset($this->_modeStrings[$this->_viewData["mode"]])){
error_log($this->toString()."Mode not valid ". $this->_viewData["mode"],0);
\Utilities\Site::redirectToWithMsg("index.php?page=mnt.libro.libroLista","Sucedio un error al procesar la pagina");
}
if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idLibro"],10) !== 0){
$this->_viewData["mode"] !== "DSP";
}
}
private function handlePost(){
\Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
if(!isset($_SESSION["libro_crsxToken"]) || $_SESSION["libro_crsxToken"] !== $this->_viewData["crsxToken"]){
   unset($_SESSION["libro_crsxToken"]);
   \Utilities\Site::redirectToWithMsg("index.php?page=mnt.libro.libroLista","Ocurrio un error, no se puede procesar");
       }

$this->_viewData["idLibro"] = intval($this->_viewData["idLibro"], 10);
if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0 ) {
       }
 else{
unset($_SESSION["libro_crsxToken"]);
switch ($this->_viewData["mode"]) {
case "INS":
$result = \Dao\Mnt\libro::insertarlibro(
$this->_viewData["nombreLibro"],
$this->_viewData["descripcion"],
$this->_viewData["edicion"],
$this->_viewData["año"],
$this->_viewData["precio"],
$this->_viewData["idEditorial"],
$this->_viewData["idImagen"],
$this->_viewData["idAutor"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.libro.libroLista",
"¡Registro guardado exitosamente!"
);
}
break;
case "UPD":
$result = \Dao\Mnt\libro::actualizarlibro(
$this->_viewData["idLibro"],
$this->_viewData["nombreLibro"],
$this->_viewData["descripcion"],
$this->_viewData["edicion"],
$this->_viewData["año"],
$this->_viewData["precio"],
$this->_viewData["idEditorial"],
$this->_viewData["idImagen"],
$this->_viewData["idAutor"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.libro.libroLista",
"¡Registro Actualizado exitosamente!"
);
}
break;
case "DEL":
$result = \Dao\Mnt\libro::eliminarlibro(
$this->_viewData["idLibro"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.libro.libroLista",
"¡Registro Eliminado exitosamente!"
);
}
break;
           }
       }
   }
private function prepareViewData(){
if ($this->_viewData["mode"] == "INS"){
$this->_viewData["modeDsc"] = $this->_modeStrings[$this->_viewData["mode"]];
}
else{
$tmplibro = \Dao\Mnt\libro::obtenerPorId(intval($this->_viewData["idLibro"],10));
\Utilities\ArrUtils::mergeFullArrayTo($tmplibro, $this->_viewData);
$this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
 $this->_viewData["idLibro"],
 $this->_viewData["nombreLibro"],
);
}
$this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
$this->_cmbOpciones,
'value',
'text',
'selected',
$this->_viewData["opciones"]
);
$this->_viewData["crsxToken"] = md5(time()."libro");
$_SESSION["libro_crsxToken"] = $this->_viewData["crsxToken"];
}
public function run(): void{
$this->init();
if($this->isPostBack()){
$this->handlePost();
}
$this->prepareViewData();
Renderer::render("mnt/libro", $this->_viewData);
}
}
?>