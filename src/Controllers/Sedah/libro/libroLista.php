<?php
namespace Controllers\Sedah\libro;

use Controllers\PublicController;
use Views\Renderer;

class libroLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["libroLista"] = \Dao\Sedah\libro::obtenerTodos();
        Renderer::render("sedah/libroLista", $viewData);
    }
}
