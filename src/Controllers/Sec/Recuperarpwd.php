<?php
namespace Controllers\Sec;

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


class RecuperarPwd extends \Controllers\PublicController
{
    private $txtEmail = "";
    private $errorEmail = "";
    private $errorCodigo = "";
    private $generalError = "";
    private $hasError = false;

    public function run() :void
    {
        if ($this->isPostBack()) {
            $this->txtEmail = $_POST["txtEmail"];

            if (!\Utilities\Validators::IsValidEmail($this->txtEmail)) {
                $this->errorEmail = "¡Correo no tiene el formato adecuado!";
                $this->hasError = true;
            }
            if (! $this->hasError) {
                if ($dbUser = \Dao\Security\Security::getUsuarioByEmail($this->txtEmail)) {
                    if (! $this->hasError) {
                        // \Utilities\Security::login(
                        //     $dbUser["usercod"],
                        //     $dbUser["username"],
                        //     $dbUser["useremail"]
                        // );
                        // if (\Utilities\Context::getContextByKey("redirto") !== "") {
                        //     \Utilities\Site::redirectTo(
                        //         \Utilities\Context::getContextByKey("redirto")
                        //     );
                        // } else {
                        //     \Utilities\Site::redirectTo("index.php");
                        // }

                        $codigo = uniqid();  

                            if(!\Dao\Security\Security::saveCodigo($this->txtEmail, $codigo)){
                                $this->errorCodigo = "Error al guardar el Código";
                                $this->hasError = true;
                            }else{
                                
                                $mail = new PHPMailer(true);
                                try {
                                    //Server settings
                                    //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      //Enable verbose debug output
                                    $mail->isSMTP();                                            //Send using SMTP
                                    $mail->Host       = 'smtp.gmail.com';                     //Set the SMTP server to send through
                                    $mail->SMTPAuth   = true;                                   //Enable SMTP authentication
                                    $mail->Username   = 'sedah2023@gmail.com';                     //SMTP username
                                    $mail->Password   = 'ugiewaaavsdubrbo';                               //SMTP password
                                    $mail->SMTPSecure = PHPMailer::ENCRYPTION_SMTPS;            //Enable implicit TLS encryption
                                    $mail->Port       = 465;                                    //TCP port to connect to; use 587 if you have set `SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS`
                                
                                    //Recipients
                                    //Correo que envia
                                    $mail->setFrom('sedah2023@gmail.com', 'SEDAH');
                                    //Correo que recibe
                                    $mail->addAddress($this->txtEmail, $this->txtEmail);
                                
                                    //Content
                                    $mail->isHTML(true);                                  //Set email format to HTML
                                    $mail->Subject = 'Recuperar Credenciales';
                                    $mail->Body .= "<h4>Este es el codigo para restaurar sus credenciales:</h4>";
                                    $mail->Body .="<h1 style='color:#3498db;'>$codigo</h1>";
                                    $mail->Body .= "<p>Fecha y Hora: ".date("d-m-Y h:i:s")."</p>";

                                
                                    $mail->send();
                                    \Utilities\Site::redirectToWithMsg("index.php?page=sec_cambiarpwd", "Código Enviado Correcamente!");
                                } catch (Exception $e) {
                                    echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
                                }
                    
                            }

                    }
                } else {
                    error_log(
                        sprintf(
                            "ERROR: %s trato de ingresar",
                            $this->txtEmail
                        )
                    );
                    $this->generalError = "¡Credenciales son incorrectas!";
                }
            }
        }
        $dataView = get_object_vars($this);
        \Views\Renderer::render("security/recuperarpwd", $dataView);
    }
}
