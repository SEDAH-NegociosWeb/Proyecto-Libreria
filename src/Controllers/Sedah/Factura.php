<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;

class Factura extends PublicController
{
    public function run() :void
    {
        $viewData = array();
        Renderer::render('sedah/factura', $viewData);
    }
}
?>