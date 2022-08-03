<?php
namespace Controllers\Sedah\clientes;

use Controllers\PublicController;
use Views\Renderer;

class clientesLista extends PublicController
{
    public function run(): void
    {
        $viewData = array();
        $viewData["clientesLista"] = \Dao\Sedah\clientes::obtenerTodos();
        Renderer::render("sedah/clientesLista", $viewData);
    }
}
