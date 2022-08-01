<?php
namespace Controllers\Sedah\Autor;
use Controllers\PublicController;
use Views\Renderer;
class AutorLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["AutorLista"] = \Dao\Sedah\Autor::obtenerTodos();
Renderer::render("sedah/AutorLista", $viewData);
}
}
?>