<?php
namespace Controllers\Sedah\categoria;

use Controllers\PublicController;
use Views\Renderer;

class categoriaLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["categoriaLista"] = \Dao\Sedah\categoria::obtenerTodos();
        Renderer::render("sedah/categoriaLista", $viewData);
    }
}
