<?php
namespace Controllers\Sedah\categoria;

use Controllers\PublicController;
use Views\Renderer;

class categoria extends PublicController
{
    private $_modeStrings = array(
        "INS" => "Insertar categoria",
        "UPD" => "Editar categoria",
        "DSP" => "Detalle categoria",
        "DEL" => "Eliminando categoria");
    private $_cmbOpciones = array(
        "EJ1" => "Ejemplo 1",
        "EJ2" => "Ejemplo 2");
    private $_viewData = array(
        "mode" => "INS",
        "idCategoria" => "",
        "nombreCategoria" => "",
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
        if (isset($_GET["idCategoria"])) {
            $this->_viewData["idCategoria"] = $_GET["idCategoria"];
        }
        if (!isset($this->_modeStrings[$this->_viewData["mode"]])) {
            error_log($this->toString() . "Mode not valid " . $this->_viewData["mode"], 0);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.categoria.categoriaLista", "Sucedio un error al procesar la pagina");
        }
        if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["idCategoria"], 10) !== 0) {
            $this->_viewData["mode"] !== "DSP";
        }
    }
    private function handlePost()
    {
        \Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
        if (!isset($_SESSION["categoria_crsxToken"]) || $_SESSION["categoria_crsxToken"] !== $this->_viewData["crsxToken"]) {
            unset($_SESSION["categoria_crsxToken"]);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.categoria.categoriaLista", "Ocurrio un error, no se puede procesar");
        }

        $this->_viewData["idCategoria"] = intval($this->_viewData["idCategoria"], 10);
        if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0) {
        } else {
            unset($_SESSION["categoria_crsxToken"]);
            switch ($this->_viewData["mode"]) {
                case "INS":
                    $result = \Dao\Sedah\categoria::insertarcategoria(
                        $this->_viewData["nombreCategoria"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.categoria.categoriaLista",
                            "¡Registro guardado exitosamente!"
                        );
                    }
                    break;
                case "UPD":
                    $result = \Dao\Sedah\categoria::actualizarcategoria(
                        $this->_viewData["idCategoria"],
                        $this->_viewData["nombreCategoria"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.categoria.categoriaLista",
                            "¡Registro Actualizado exitosamente!"
                        );
                    }
                    break;
                case "DEL":
                    $result = \Dao\Sedah\categoria::eliminarcategoria(
                        $this->_viewData["idCategoria"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.categoria.categoriaLista",
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
            $tmpcategoria = \Dao\Sedah\categoria::obtenerPorId(intval($this->_viewData["idCategoria"], 10));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpcategoria, $this->_viewData);
            $this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
                $this->_viewData["idCategoria"],
                $this->_viewData["nombreCategoria"],
            );
        }
        $this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
            $this->_cmbOpciones,
            'value',
            'text',
            'selected',
            $this->_viewData["opciones"]
        );
        $this->_viewData["crsxToken"] = md5(time() . "categoria");
        $_SESSION["categoria_crsxToken"] = $this->_viewData["crsxToken"];
    }
    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->handlePost();
        }
        $this->prepareViewData();
        Renderer::render("sedah/categoria", $this->_viewData);
    }
}
