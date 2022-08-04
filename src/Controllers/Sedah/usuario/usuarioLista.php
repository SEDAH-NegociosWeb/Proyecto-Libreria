<?php
namespace Controllers\Sedah\usuario;

use Controllers\PublicController;
use Views\Renderer;

class usuarioLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["usuarioLista"] = \Dao\Sedah\usuario::obtenerTodos();
        Renderer::render("sedah/usuarioLista", $viewData);
    }
}
