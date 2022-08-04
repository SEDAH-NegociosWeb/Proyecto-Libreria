<?php
namespace Controllers\Sedah\venta;

use Controllers\PublicController;
use Views\Renderer;

class ventaLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["ventaLista"] = \Dao\Sedah\venta::obtenerTodos();
        Renderer::render("sedah/ventaLista", $viewData);
    }
}
