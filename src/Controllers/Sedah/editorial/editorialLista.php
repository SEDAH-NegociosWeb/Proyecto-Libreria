<?php
namespace Controllers\Mnt\editorial;
use Controllers\PublicController;
use Views\Renderer;
class editorialLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["editorialLista"] = \Dao\Mnt\editorial::obtenerTodos();
Renderer::render("mnt/editorialLista", $viewData);
}
}
?>