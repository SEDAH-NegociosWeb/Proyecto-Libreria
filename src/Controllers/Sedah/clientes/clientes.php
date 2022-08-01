<?php
namespace Controllers\Mnt\clientes;
use Controllers\PublicController;
use Views\Renderer;
class clientes extends PublicController {
private $_modeStrings = array(
"INS" => "Insertar clientes",
"UPD" => "Editar clientes",
"DSP" => "Detalle clientes",
"DEL" => "Eliminando clientes");
private $_cmbOpciones = array(
"EJ1"  => "Ejemplo 1",
"EJ2"  => "Ejemplo 2");
private $_viewData = array(
"mode" => "INS",
"idCliente" => "",
"nombreCliente" => "",
"generoCliente" => "",
"telefonoCliente" => "",
"celularCliente" => "",
"correoCliente" => "",
"numeroIdCliente" => "",
"biografiaCliente" => "",
"estadoCliente" => "",
"fechaRegistro" => "",
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
if (isset($_GET["idCliente"])){
$this->_viewData["idCliente"] = $_GET["idCliente"];
}
if(!isset($this->_modeStrings[$this->_viewData["mode"]])){
error_log($this->toString()."Mode not valid ". $this->_viewData["mode"],0);
\Utilities\Site::redirectToWithMsg("index.php?page=mnt.clientes.clientesLista","Sucedio un error al procesar la pagina");
}
if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idCliente"],10) !== 0){
$this->_viewData["mode"] !== "DSP";
}
}
private function handlePost(){
\Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
if(!isset($_SESSION["clientes_crsxToken"]) || $_SESSION["clientes_crsxToken"] !== $this->_viewData["crsxToken"]){
   unset($_SESSION["clientes_crsxToken"]);
   \Utilities\Site::redirectToWithMsg("index.php?page=mnt.clientes.clientesLista","Ocurrio un error, no se puede procesar");
       }

$this->_viewData["idCliente"] = intval($this->_viewData["idCliente"], 10);
if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0 ) {
       }
 else{
unset($_SESSION["clientes_crsxToken"]);
switch ($this->_viewData["mode"]) {
case "INS":
$result = \Dao\Mnt\clientes::insertarclientes(
$this->_viewData["nombreCliente"],
$this->_viewData["generoCliente"],
$this->_viewData["telefonoCliente"],
$this->_viewData["celularCliente"],
$this->_viewData["correoCliente"],
$this->_viewData["numeroIdCliente"],
$this->_viewData["biografiaCliente"],
$this->_viewData["estadoCliente"],
$this->_viewData["fechaRegistro"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.clientes.clientesLista",
"¡Registro guardado exitosamente!"
);
}
break;
case "UPD":
$result = \Dao\Mnt\clientes::actualizarclientes(
$this->_viewData["idCliente"],
$this->_viewData["nombreCliente"],
$this->_viewData["generoCliente"],
$this->_viewData["telefonoCliente"],
$this->_viewData["celularCliente"],
$this->_viewData["correoCliente"],
$this->_viewData["numeroIdCliente"],
$this->_viewData["biografiaCliente"],
$this->_viewData["estadoCliente"],
$this->_viewData["fechaRegistro"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.clientes.clientesLista",
"¡Registro Actualizado exitosamente!"
);
}
break;
case "DEL":
$result = \Dao\Mnt\clientes::eliminarclientes(
$this->_viewData["idCliente"]
);
if ($result) {
\Utilities\Site::redirectToWithMsg(
"index.php?page=mnt.clientes.clientesLista",
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
$tmpclientes = \Dao\Mnt\clientes::obtenerPorId(intval($this->_viewData["idCliente"],10));
\Utilities\ArrUtils::mergeFullArrayTo($tmpclientes, $this->_viewData);
$this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
 $this->_viewData["idCliente"],
 $this->_viewData["nombreCliente"],
);
}
$this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
$this->_cmbOpciones,
'value',
'text',
'selected',
$this->_viewData["opciones"]
);
$this->_viewData["crsxToken"] = md5(time()."clientes");
$_SESSION["clientes_crsxToken"] = $this->_viewData["crsxToken"];
}
public function run(): void{
$this->init();
if($this->isPostBack()){
$this->handlePost();
}
$this->prepareViewData();
Renderer::render("mnt/clientes", $this->_viewData);
}
}
?>