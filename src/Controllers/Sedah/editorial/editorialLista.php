<?php
namespace Controllers\Sedah\editorial;

use Controllers\PublicController;
use Views\Renderer;

class editorialLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["editorialLista"] = \Dao\Sedah\editorial::obtenerTodos();
        Renderer::render("sedah/editorialLista", $viewData);
    }
}
