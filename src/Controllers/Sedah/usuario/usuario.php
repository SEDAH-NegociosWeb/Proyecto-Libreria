<?php
namespace Controllers\Sedah\usuario;

use Controllers\PublicController;
use Views\Renderer;

class usuario extends PublicController
{
    private $_modeStrings = array(
        "INS" => "Insertar usuario",
        "UPD" => "Editar usuario",
        "DSP" => "Detalle usuario",
        "DEL" => "Eliminando usuario");
    private $_cmbOpciones = array(
        "EJ1" => "Ejemplo 1",
        "EJ2" => "Ejemplo 2");
    private $_viewData = array(
        "mode" => "INS",
        "usercod" => "",
        "useremail" => "",
        "username" => "",
        "userpswd" => "",
        "userfching" => "",
        "userpswdest" => "",
        "userpswdexp" => "",
        "userest" => "",
        "useractcod" => "",
        "userpswdchg" => "",
        "usertipo" => "",
        "token" => "",
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
        if (isset($_GET["usercod"])) {
            $this->_viewData["usercod"] = $_GET["usercod"];
        }
        if (!isset($this->_modeStrings[$this->_viewData["mode"]])) {
            error_log($this->toString() . "Mode not valid " . $this->_viewData["mode"], 0);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.usuario.usuarioLista", "Sucedio un error al procesar la pagina");
        }
        if ($this->_viewData["mode"] !== "INS" && intval($this->_viewData["usercod"], 10) !== 0) {
            $this->_viewData["mode"] !== "DSP";
        }
    }
    private function handlePost()
    {
        \Utilities\ArrUtils::mergeFullArrayTo($_POST, $this->_viewData);
        if (!isset($_SESSION["usuario_crsxToken"]) || $_SESSION["usuario_crsxToken"] !== $this->_viewData["crsxToken"]) {
            unset($_SESSION["usuario_crsxToken"]);
            \Utilities\Site::redirectToWithMsg("index.php?page=sedah.usuario.usuarioLista", "Ocurrio un error, no se puede procesar");
        }

        $this->_viewData["usercod"] = intval($this->_viewData["usercod"], 10);
        if (isset($this->_viewData["errors"]) && count($this->_viewData["errors"]) > 0) {
        } else {
            unset($_SESSION["usuario_crsxToken"]);
            switch ($this->_viewData["mode"]) {
                case "INS":
                    $result = \Dao\Sedah\usuario::insertarusuario(
                        $this->_viewData["useremail"],
                        $this->_viewData["username"],
                        $this->_viewData["userpswd"],
                        $this->_viewData["userfching"],
                        $this->_viewData["userpswdest"],
                        $this->_viewData["userpswdexp"],
                        $this->_viewData["userest"],
                        $this->_viewData["useractcod"],
                        $this->_viewData["userpswdchg"],
                        $this->_viewData["usertipo"],
                        $this->_viewData["token"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.usuario.usuarioLista",
                            "¡Registro guardado exitosamente!"
                        );
                    }
                    break;
                case "UPD":
                    $result = \Dao\Sedah\usuario::actualizarusuario(
                        $this->_viewData["usercod"],
                        $this->_viewData["username"],
                        $this->_viewData["userest"],
                        $this->_viewData["usertipo"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.usuario.usuarioLista",
                            "¡Registro Actualizado exitosamente!"
                        );
                    }
                    break;
                case "DEL":
                    $result = \Dao\Sedah\usuario::eliminarusuario(
                        $this->_viewData["usercod"]
                    );
                    if ($result) {
                        \Utilities\Site::redirectToWithMsg(
                            "index.php?page=sedah.usuario.usuarioLista",
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
            $tmpusuario = \Dao\Sedah\usuario::obtenerPorId(intval($this->_viewData["usercod"], 10));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpusuario, $this->_viewData);
            $this->_viewData["modeDsc"] = sprintf($this->_modeStrings[$this->_viewData["mode"]],
                $this->_viewData["usercod"],
                $this->_viewData["useremail"],
            );
        }
        $this->_viewData["cmbOpciones"] = \Utilities\ArrUtils::toOptionsArray(
            $this->_cmbOpciones,
            'value',
            'text',
            'selected',
            $this->_viewData["opciones"]
        );
        $this->_viewData["crsxToken"] = md5(time() . "usuario");
        $_SESSION["usuario_crsxToken"] = $this->_viewData["crsxToken"];
    }
    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->handlePost();
        }
        $this->prepareViewData();
        Renderer::render("sedah/usuario", $this->_viewData);
    }
}
