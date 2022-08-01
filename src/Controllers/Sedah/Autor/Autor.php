<?php
namespace Controllers\Sedah\Autor;

use Controllers\PublicController;
use Views\Renderer;

class Autor extends PublicController
{
    private $_modeStrings = array(
        "INS" => "Insertar Autor",
        "UPD" => "Editar Autor",
        "DSP" => "Detalle Autor",
        "DEL" => "Eliminando Autor");
    private $_cmbOpciones = array(
        "EJ1" => "Ejemplo 1",
        "EJ2" => "Ejemplo 2");
    private $_viewData = array(
        "mode" => "INS",
        "idAutor" => "",
        "primerNombreAutor" => "",
        "segundoNombreAutor" => "",
        "primerApellidoAutor" => "",
        "segundoApellidoAutor" => "",
        "idImagen" => "",
        "fechaDeNacimiento" => "",
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
        if (isset($_GET["idAutor"])) {
            $this->_viewData["idAutor"] = $_GET["idAutor"];
        }
        if (!isset($this->_modeStrings[$this->_viewData["mode"]])) {
            error_log($this->toString() . "Mode not valid " . $this->_viewData["mode"], 0);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.Autor.AutorLista", "Sucedio un error al procesar la pagina");
        }
        if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idAutor"], 10) !== 0) {
            $this->_viewData["mode"] !== "DSP";
        }
    }
    private function handlePost()
    {
        \Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
        if (!isset($_SESSION["Autor_crsxToken"]) || $_SESSION["Autor_crsxToken"] !== $this->_viewData["crsxToken"]) {
            unset($_SESSION["Autor_crsxToken"]);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.Autor.AutorLista", "Ocurrio un error, no se puede procesar");
        }

        $this->_viewData["idAutor"] = intval($this->_viewData["idAutor"], 10);
        if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0) {
        } else {
            unset($_SESSION["Autor_crsxToken"]);
            switch ($this->_viewData["mode"]) {
                case "INS":
                    $result = \Dao\Sedah\Autor::insertarAutor(
                        $this->_viewData["primerNombreAutor"],
                        $this->_viewData["segundoNombreAutor"],
                        $this->_viewData["primerApellidoAutor"],
                        $this->_viewData["segundoApellidoAutor"],
                        $this->_viewData["idImagen"],
                        $this->_viewData["fechaDeNacimiento"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.Autor.AutorLista",
                            "¡Registro guardado exitosamente!"
                        );
                    }
                    break;
                case "UPD":
                    $result = \Dao\Sedah\Autor::actualizarAutor(
                        $this->_viewData["idAutor"],
                        $this->_viewData["primerNombreAutor"],
                        $this->_viewData["segundoNombreAutor"],
                        $this->_viewData["primerApellidoAutor"],
                        $this->_viewData["segundoApellidoAutor"],
                        $this->_viewData["idImagen"],
                        $this->_viewData["fechaDeNacimiento"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.Autor.AutorLista",
                            "¡Registro Actualizado exitosamente!"
                        );
                    }
                    break;
                case "DEL":
                    $result = \Dao\Sedah\Autor::eliminarAutor(
                        $this->_viewData["idAutor"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.Autor.AutorLista",
                            "¡Registro Eliminado exitosamente!"
                        );
                    }
                    break;
            }
        }
    }
    private function prepareViewData()
    {
        if ($this->_viewData["mode"] == "INS") {
            $this->_viewData["modeDsc"] = $this->_modeStrings[$this->_viewData["mode"]];
        } else {
            $tmpAutor = \Dao\Sedah\Autor::obtenerPorId(intval($this->_viewData["idAutor"], 10));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpAutor, $this->_viewData);
            $this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
                $this->_viewData["idAutor"],
                $this->_viewData["primerNombreAutor"],
            );
        }
        $this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
            $this->_cmbOpciones,
            'value',
            'text',
            'selected',
            $this->_viewData["opciones"]
        );
        $this->_viewData["crsxToken"] = md5(time() . "Autor");
        $_SESSION["Autor_crsxToken"] = $this->_viewData["crsxToken"];
    }
    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->handlePost();
        }
        $this->prepareViewData();
        Renderer::render("sedah/Autor", $this->_viewData);
    }
}
