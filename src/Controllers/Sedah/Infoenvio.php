<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Sedah\ProcesoPago as DaoProcesoPago;

class InfoEnvio extends PublicController
{
    private $viewData = array();

    public function run(): void
    {
        // code
        $this->init();

        // Cuando es método POST (click en el botón)
        if ($this->isPostBack()) {
            $this->procesarPost();
        }
        Renderer::render('sedah/infoenvio', $this->viewData);
    }
    private function init()
    {
        $this->viewData = array();
        $this->viewData["tADireccion"] = "";
        $this->viewData["error_direccion"] = array();
        $this->viewData["sDepartamento"] = "";
        $this->viewData["error_departamento"] = array();
        $this->viewData["zip"] = "";
        $this->viewData["error_zip"] = array();
        $this->viewData["ciudad"] = "";
        $this->viewData["error_ciudad"] = array();
    }

    private function procesarPost()
    {
        $hasErrors = false;
        $this->viewData["tADireccion"] = ($_POST["tADireccion"]);
        $this->viewData["sDepartamento"] = ($_POST["sDepartamento"]);
        $this->viewData["zip"] = ($_POST["zip"]);
        $this->viewData["ciudad"] = ($_POST["ciudad"]);

        if (Validators::IsEmpty($this->viewData["tADireccion"])) {
            $this->viewData["error_direccion"][] =
                "La dirección es requerida";
            $hasErrors = true;
        }
        if ($this->viewData["sDepartamento"] == "0") {
            $this->viewData["error_departamento"][] =
                "Seleccione un departamento";
            $hasErrors = true;
        }
        if (Validators::IsEmpty($this->viewData["zip"])) {
            $this->viewData["error_zip"][] =
                "El código Zip es requerido";
            $hasErrors = true;
        } elseif ((strlen($this->viewData["zip"])) != 5) {
            $this->viewData["error_zip"][] =
                "El código de Zip es incorrecto";
            $hasErrors = true;
        }
        if (Validators::IsEmpty($this->viewData["ciudad"])) {
            $this->viewData["error_ciudad"][] =
                "La ciudad es requerida";
            $hasErrors = true;
        }

        if (!$hasErrors) {

            $result = DaoProcesoPago::agregarDireccionEntrega($this->viewData["tADireccion"], $this->viewData["sDepartamento"], $this->viewData["zip"], $this->viewData["ciudad"]);
            if ($result) {
                echo '<script type="text/JavaScript"> 
                alert("Cargando...");
                window.location.href = "index.php?page=sedah_prefactura";
                </script>';
            }
        }
    }
}
