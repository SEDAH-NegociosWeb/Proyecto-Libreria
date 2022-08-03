<?php

namespace Controllers\Sec;

use Controllers\PublicController;
use \Utilities\Validators;
use Exception;
use phpDocumentor\Reflection\Types\This;

class Cambiarpwd extends PublicController
{
    private $txtNewPwd = "";
    private $txtConPwd = "";
    private $txtCodigo = "";
    private $errorCodigo = "";
    private $errorNewPwd ="";
    private $errorConPwd = "";
    private $hasErrors = false;
    public function run() :void
    {

        if ($this->isPostBack()) {
            $this->txtCodigo = $_POST["txtCodigo"];
            $this->txtNewPwd = $_POST["txtNewPwd"];
            $this->txtConPwd = $_POST["txtConPwd"];
            //validaciones

            if ((Validators::IsEmpty($this->txtCodigo))){
                $this->errorCodigo = "Debe ingresar el código de recuperación";
                $this->hasErrors = true;
            }
            if ((Validators::IsEmpty($this->txtNewPwd))){
                $this->errorNewPwd = "Debe ingresar una nueva Contraseña";
                $this->hasErrors = true;
            }
            if ((Validators::IsEmpty($this->txtConPwd))) {
                $this->errorConPwd = "Debe ingresar nuevamente la Contraseña";
                $this->hasErrors = true;
            }
            // if (!Validators::IsValidPassword($this->txtPswd)) {
            //     $this->errorPswd = "La contraseña debe tener al menos 8 caracteres una mayúscula, un número y un caracter especial.";
            //     $this->hasErrors = true;
            // }
            if($this->txtNewPwd != $this->txtConPwd){
                $this->errorConPwd = "Las Contraseñas no coinciden";
                $this->hasErrors = true;
            }
            
            if (!$this->hasErrors) {
                try{
                    if (\Dao\Security\Security::cambiarContraseñas($this->txtCodigo, $this->txtNewPwd)) {
                        \Utilities\Site::redirectToWithMsg("index.php?page=sec_login", "¡Contraseña restablecida Satisfactoriamente!");
                                              
                    }
                } catch (Exception $ex){
                    die($ex);
                }
            }
        }
        $viewData = get_object_vars($this);
        \Views\Renderer::render("security/cambiarpwd", $viewData);
    }

}

?>