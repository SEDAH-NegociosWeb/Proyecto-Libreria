<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Utilities\Validators;

class InfoPago extends PublicController
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
        Renderer::render('sedah/infopago', $this->viewData);
    }
    private function init()
    {
        $this->viewData = array();
        $this->viewData["nombre"] = "";
        $this->viewData["error_nombre"] = array();
        $this->viewData["numeroTar"] = "";
        $this->viewData["error_numeroTar"] = array();
        $this->viewData["mesEx"] = "";
        $this->viewData["error_mesEx"] = array();
        $this->viewData["anioEx"] = "";
        $this->viewData["error_anioEx"] = array();
        $this->viewData["cvv"] = "";
        $this->viewData["error_cvv"] = array();
        $this->viewData["error_fecha"] = array();

    }

    private function procesarPost()
    {
        $hasErrors = false;
        $this->viewData["nombre"] = ($_POST["nombre"]);
        $this->viewData["numeroTar"] = ($_POST["numeroTar"]);
        $this->viewData["mesEx"] = ($_POST["mesEx"]);
        $this->viewData["anioEx"] = ($_POST["anioEx"]);
        $this->viewData["cvv"] = ($_POST["cvv"]);

        if (Validators::IsEmpty($this->viewData["nombre"])) {
            $this->viewData["error_nombre"][] =
                "El nombre es requerido";
            $hasErrors = true;
        }
        if (Validators::IsEmpty($this->viewData["numeroTar"])) {
            $this->viewData["error_numeroTar"][] =
                "El número de tarjeta es requerido";
            $hasErrors = true;

        }elseif ((strlen($this->viewData["numeroTar"])) > 16) {
            $this->viewData["error_numeroTar"][] =
                "El número de tarjeta es invalido";
            $hasErrors = true;
        }

        if (Validators::IsEmpty($this->viewData["mesEx"])) {
            $this->viewData["error_mesEx"][] =
                "El mes es requerido";
            $hasErrors = true;

        }elseif ((strlen($this->viewData["mesEx"])) != 2) {
            $this->viewData["error_mesEx"][] =
                "El formato es: (Enero) = '01'";
            $hasErrors = true;
        }

        if (Validators::IsEmpty($this->viewData["anioEx"])) {
            $this->viewData["error_anioEx"][] =
                "El año es requerido";
            $hasErrors = true;

        }elseif (((strlen($this->viewData["anioEx"])) != 4)) {
            $this->viewData["error_anioEx"][] =
                "El formato es: '2023'";
            $hasErrors = true;
        }

        $fecha_actual = date("m").'-'.date("Y");
        if (($fecha_actual >= ($this->viewData["mesEx"]).'-'.($this->viewData["anioEx"]))){
            $this->viewData["error_fecha"][] =
                "El fecha ingresada es invalida";
            $hasErrors = true;
        }

        if (Validators::IsEmpty($this->viewData["cvv"])) {
            $this->viewData["error_cvv"][] =
                "El código de seguridad es requerido";
            $hasErrors = true;

        }elseif ((strlen($this->viewData["cvv"])) != 3) {
            $this->viewData["error_cvv"][] =
                "El código de seguridad es invalido";
            $hasErrors = true;
        }

        if (!$hasErrors) {
            echo '<script type="text/JavaScript"> 
            alert("Cargando...");
            window.location.href = "index.php?page=sedah_prefactura";
            </script>'
                ;
        }

    }
}
?>