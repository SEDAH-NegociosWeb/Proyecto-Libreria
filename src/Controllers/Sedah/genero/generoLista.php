<?php
namespace Controllers\Mnt\genero;
use Controllers\PublicController;
use Views\Renderer;
class generoLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["generoLista"] = \Dao\Mnt\genero::obtenerTodos();
Renderer::render("mnt/generoLista", $viewData);
}
}
?>