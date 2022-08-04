<?php
namespace Controllers\Sedah\imagen;

use Controllers\PublicController;
use Views\Renderer;

class imagen extends PublicController
{
    private $_modeStrings = array(
        "INS" => "Insertar imagen",
        "UPD" => "Editar imagen",
        "DSP" => "Detalle imagen",
        "DEL" => "Eliminando imagen");
    private $_cmbOpciones = array(
        "EJ1" => "Ejemplo 1",
        "EJ2" => "Ejemplo 2");
    private $_viewData = array(
        "mode" => "INS",
        "idImagen" => "",
        "direccion" => "",
        "modeDsc" => "",
        "readonly" => false,
        "isInsert" => false,
        "cmbOpciones" => [],
        "opciones" => "Eje1",
        "errors" => [],
        "crsxToken" => "");
    private function init()
    {
        if (isset($_GET["mode"])) {
            $this->_viewData["mode"] = $_GET["mode"];
        }
        if (isset($_GET["idImagen"])) {
            $this->_viewData["idImagen"] = $_GET["idImagen"];
        }
        if (!isset($this->_modeStrings[$this->_viewData["mode"]])) {
            error_log($this->toString() . "Mode not valid " . $this->_viewData["mode"], 0);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.imagen.imagenLista", "Sucedio un error al procesar la pagina");
        }
        if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idImagen"], 10) !== 0) {
            $this->_viewData["mode"] !== "DSP";
        }
    }
    private function handlePost()
    {
        \Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
        if (!isset($_SESSION["imagen_crsxToken"]) || $_SESSION["imagen_crsxToken"] !== $this->_viewData["crsxToken"]) {
            unset($_SESSION["imagen_crsxToken"]);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.imagen.imagenLista", "Ocurrio un error, no se puede procesar");
        }

        $direccionimg = $this->_viewData["direccion"];
        if ($direccionimg != "") {
            $this->_viewData["idImagen"] = intval($this->_viewData["idImagen"], 10);
            if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0) {
            }
            else {
                unset($_SESSION["imagen_crsxToken"]);
                switch ($this->_viewData["mode"]) {
                    case "INS":
                        $result = \Dao\Sedah\imagen::insertarimagen(
                            $this->_viewData["direccion"]
                        );
                        if ($result) {
                            \Utilities\Site::redirectToWithMsg(
                                "index.php?page=sedah.imagen.imagenLista",
                                "¡Registro guardado exitosamente!"
                            );
                        }
                        break;
                    case "UPD":
                        $result = \Dao\Sedah\imagen::actualizarimagen(
                            $this->_viewData["idImagen"],
                            $this->_viewData["direccion"]
                        );
                        if ($result) {
                            \Utilities\Site::redirectToWithMsg(
                                "index.php?page=sedah.imagen.imagenLista",
                                "¡Registro Actualizado exitosamente!"
                            );
                        }
                        break;
                    case "DEL":
                        $result = \Dao\Sedah\imagen::eliminarimagen(
                            $this->_viewData["idImagen"]
                        );
                        if ($result) {
                            \Utilities\Site::redirectToWithMsg(
                                "index.php?page=sedah.imagen.imagenLista",
                                "¡Registro Eliminado exitosamente!"
                            );
                        }
                        break;
                }
            }
        }

    }
    private function prepareViewData()
    {
        if ($this->_viewData["mode"] == "INS") {
            $this->_viewData["modeDsc"] = $this->_modeStrings[$this->_viewData["mode"]];
        }
        else {
            $tmpimagen = \Dao\Sedah\imagen::obtenerPorId(intval($this->_viewData["idImagen"], 10));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpimagen, $this->_viewData);
            $this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
                $this->_viewData["idImagen"],
                $this->_viewData["direccion"],
            );
        }
        $this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
            $this->_cmbOpciones,
            'value',
            'text',
            'selected',
            $this->_viewData["opciones"]
        );
        $this->_viewData["crsxToken"] = md5(time() . "imagen");
        $_SESSION["imagen_crsxToken"] = $this->_viewData["crsxToken"];
    }
    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->handlePost();
        }
        $this->prepareViewData();
        Renderer::render("sedah/imagen", $this->_viewData);
    }
}
