<?php
namespace Controllers\Sedah;

use Controllers\PublicController;
use Views\Renderer;

class Contactenos extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        Renderer::render("sedah/contactenos", $viewData);
    }
}