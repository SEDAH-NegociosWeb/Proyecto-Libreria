<?php
namespace Controllers\Mnt\usuario;
use Controllers\PublicController;
use Views\Renderer;
class usuarioLista extends PublicController {
public function run(): void {
$viewData = array();
$viewData["usuarioLista"] = \Dao\Mnt\usuario::obtenerTodos();
Renderer::render("mnt/usuarioLista", $viewData);
}
}
?>