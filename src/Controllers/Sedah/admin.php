<?php
namespace Controllers\Sedah;

use Controllers\PublicController;
use Views\Renderer;

class Admin extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        Renderer::render("sedah/admin", $viewData);
    }
}