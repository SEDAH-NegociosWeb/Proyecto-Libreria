<?php
namespace Controllers\Sedah\imagen;

use Controllers\PublicController;
use Views\Renderer;

class imagenLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["imagenLista"] = \Dao\Sedah\imagen::obtenerTodos();
        Renderer::render("sedah/imagenLista", $viewData);
    }
}
