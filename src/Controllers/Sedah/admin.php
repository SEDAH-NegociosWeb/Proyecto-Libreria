<?php
namespace Controllers\Sedah;

use Controllers\PublicController;
use Views\Renderer;


class Admin extends PublicController
{
    public function run(): void
    {
        $emailUser = \Utilities\Security::getUserEmail();
        $user = \Dao\Security\Security::getUsuarioByEmail($emailUser);
        if ($user["usertipo"] !== "ADM"){
            \Utilities\Site::redirectTo("index.php?page=index");
        }else{
            $viewData = array();
            Renderer::render("sedah/admin", $viewData);
        }
        
    }
}