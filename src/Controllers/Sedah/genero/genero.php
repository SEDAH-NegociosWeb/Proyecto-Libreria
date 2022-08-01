<?php
namespace Controllers\Mnt\genero;
use Controllers\PublicController;
use Views\Renderer;
class genero extends PublicController {
private $_modeStrings = array(
"INS" => "Insertar genero",
"UPD" => "Editar genero",
"DSP" => "Detalle genero",
"DEL" => "Eliminando genero");
private $_cmbOpciones = array(
"EJ1"  => "Ejemplo 1",
"EJ2"  => "Ejemplo 2");
private $_viewData = array(
"mode" => "INS",
"idGenero" => "",
"nombreGenero" => "",
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
if (isset($_GET["idGenero"])){
$this->_viewData["idGenero"] = $_GET["idGenero"];
}
if(!isset($this->_modeStrings[$this->_viewData["mode"]])){
error_log($this->toString()."Mode not valid ". $this->_viewData["mode"],0);
\Utilities\Site::redirectToWithMsg("index.php?page=mnt.genero.generoLista","Sucedio un error al procesar la pagina");
}
if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idGenero"],10) !== 0){
$this->_viewData["mode"] !== "DSP";
}
}
private function handlePost(){
\Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
if(!isset($_SESSION["genero_crsxToken"]) || $_SESSION["genero_crsxToken"] !== $this->_viewData["crsxToken"]){
   unset($_SESSION["genero_crsxToken"]);
   \Utilities\Site::redirectToWithMsg("index.php?page=mnt.genero.generoLista","Ocurrio un error, no se puede procesar");
       }

$this->_viewData["idGenero"] = intval($this->_viewData["idGenero"], 10);
if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0 ) {
       }
 else{
unset($_SESSION["genero_crsxToken"]);
switch ($this->_viewData["mode"]) {
case "INS":
$result = \Dao\Mnt\genero::insertargenero(
$this->_viewData["nombreGenero"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.genero.generoLista",
"¡Registro guardado exitosamente!"
);
}
break;
case "UPD":
$result = \Dao\Mnt\genero::actualizargenero(
$this->_viewData["idGenero"],
$this->_viewData["nombreGenero"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.genero.generoLista",
"¡Registro Actualizado exitosamente!"
);
}
break;
case "DEL":
$result = \Dao\Mnt\genero::eliminargenero(
$this->_viewData["idGenero"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.genero.generoLista",
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
$tmpgenero = \Dao\Mnt\genero::obtenerPorId(intval($this->_viewData["idGenero"],10));
\Utilities\ArrUtils::mergeFullArrayTo($tmpgenero, $this->_viewData);
$this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
 $this->_viewData["idGenero"],
 $this->_viewData["nombreGenero"],
);
}
$this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
$this->_cmbOpciones,
'value',
'text',
'selected',
$this->_viewData["opciones"]
);
$this->_viewData["crsxToken"] = md5(time()."genero");
$_SESSION["genero_crsxToken"] = $this->_viewData["crsxToken"];
}
public function run(): void{
$this->init();
if($this->isPostBack()){
$this->handlePost();
}
$this->prepareViewData();
Renderer::render("mnt/genero", $this->_viewData);
}
}
?>