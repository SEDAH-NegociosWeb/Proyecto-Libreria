<?php
namespace Controllers\Mnt\imagen;
use Controllers\PublicController;
use Views\Renderer;
class imagenLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["imagenLista"] = \Dao\Mnt\imagen::obtenerTodos();
Renderer::render("mnt/imagenLista", $viewData);
}
}
?>