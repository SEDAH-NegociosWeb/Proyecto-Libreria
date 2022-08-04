<?php
namespace Controllers\Sedah\editorial;

use Controllers\PublicController;
use Views\Renderer;

class editorial extends PublicController
{
    private $_modeStrings = array(
        "INS" => "Insertar editorial",
        "UPD" => "Editar editorial",
        "DSP" => "Detalle editorial",
        "DEL" => "Eliminando editorial");
    private $_cmbOpciones = array(
        "EJ1" => "Ejemplo 1",
        "EJ2" => "Ejemplo 2");
    private $_viewData = array(
        "mode" => "INS",
        "idEditorial" => "",
        "nombreEditorial" => "",
        "direccion" => "",
        "telefono" => "",
        "email" => "",
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
        if (isset($_GET["idEditorial"])) {
            $this->_viewData["idEditorial"] = $_GET["idEditorial"];
        }
        if (!isset($this->_modeStrings[$this->_viewData["mode"]])) {
            error_log($this->toString() . "Mode not valid " . $this->_viewData["mode"], 0);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.editorial.editorialLista", "Sucedio un error al procesar la pagina");
        }
        if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idEditorial"], 10) !== 0) {
            $this->_viewData["mode"] !== "DSP";
        }
    }
    private function handlePost()
    {
        \Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
        if (!isset($_SESSION["editorial_crsxToken"]) || $_SESSION["editorial_crsxToken"] !== $this->_viewData["crsxToken"]) {
            unset($_SESSION["editorial_crsxToken"]);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.editorial.editorialLista", "Ocurrio un error, no se puede procesar");
        }

        $nombre = $this->_viewData["nombreEditorial"];
        $direccion = $this->_viewData["direccion"];
        $telefono = $this->_viewData["telefono"];
        $email = $this->_viewData["email"];

        if ($nombre != "" && $direccion != "" && $telefono != "" && \Utilities\Validators::IsValidEmail($email)) {

            $this->_viewData["idEditorial"] = intval($this->_viewData["idEditorial"], 10);
            if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0) {
            } else {
                unset($_SESSION["editorial_crsxToken"]);
                switch ($this->_viewData["mode"]) {
                    case "INS":
                        $result = \Dao\Sedah\editorial::insertareditorial(
                            $this->_viewData["nombreEditorial"],
                            $this->_viewData["direccion"],
                            $this->_viewData["telefono"],
                            $this->_viewData["email"]
                        );
                        if ($result) {
                            \Utilities\Site::redirectToWithMsg(
                                "index.php?page=sedah.editorial.editorialLista",
                                "¡Registro guardado exitosamente!"
                            );
                        }
                        break;
                    case "UPD":
                        $result = \Dao\Sedah\editorial::actualizareditorial(
                            $this->_viewData["idEditorial"],
                            $this->_viewData["nombreEditorial"],
                            $this->_viewData["direccion"],
                            $this->_viewData["telefono"],
                            $this->_viewData["email"]
                        );
                        if ($result) {
                            \Utilities\Site::redirectToWithMsg(
                                "index.php?page=sedah.editorial.editorialLista",
                                "¡Registro Actualizado exitosamente!"
                            );
                        }
                        break;
                    case "DEL":
                        $result = \Dao\Sedah\editorial::eliminareditorial(
                            $this->_viewData["idEditorial"]
                        );
                        if ($result) {
                            \Utilities\Site::redirectToWithMsg(
                                "index.php?page=sedah.editorial.editorialLista",
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
        } else {
            $tmpeditorial = \Dao\Sedah\editorial::obtenerPorId(intval($this->_viewData["idEditorial"], 10));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpeditorial, $this->_viewData);
            $this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
                $this->_viewData["idEditorial"],
                $this->_viewData["nombreEditorial"],
            );
        }
        $this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
            $this->_cmbOpciones,
            'value',
            'text',
            'selected',
            $this->_viewData["opciones"]
        );
        $this->_viewData["crsxToken"] = md5(time() . "editorial");
        $_SESSION["editorial_crsxToken"] = $this->_viewData["crsxToken"];
    }
    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->handlePost();
        }
        $this->prepareViewData();
        Renderer::render("sedah/editorial", $this->_viewData);
    }
}
