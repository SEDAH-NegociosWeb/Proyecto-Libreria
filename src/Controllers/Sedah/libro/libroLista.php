<?php
namespace Controllers\Mnt\libro;
use Controllers\PublicController;
use Views\Renderer;
class libroLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["libroLista"] = \Dao\Mnt\libro::obtenerTodos();
Renderer::render("mnt/libroLista", $viewData);
}
}
?>