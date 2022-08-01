<?php
namespace Controllers\Mnt\clientes;
use Controllers\PublicController;
use Views\Renderer;
class clientesLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["clientesLista"] = \Dao\Mnt\clientes::obtenerTodos();
Renderer::render("mnt/clientesLista", $viewData);
}
}
?>