<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Dao\Sedah\DetalleJava as DaoDetalle;

class DetalleJava extends PublicController
{
    public function run() :void
    {
        // code
        $this->init();
        // Cuando es método GET (se llama desde la lista)
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }
        // Cuando es método POST (click en el botón)
        if ($this->isPostBack()) {
            $this->procesarPost();
        }
        // Ejecutar Siempre
        $this->processView();

        Renderer::render('sedah/detallejava', $this->viewData);
    }

    private function init()
    {
        $this->viewData = array();
        $this->viewData["Libros"] = array();
    }

    private function procesarGet()
    {
        if (isset($_GET["id"])) {
            $this->viewData["idLibro"] = intval($_GET["id"]);
            $tmpLibros = DaoDetalle::getById($this->viewData["idLibro"]);
            error_log(json_encode($tmpLibros));
            \Utilities\ArrUtils::mergeFullArrayTo($tmpLibros, $this->viewData);
        }
    }

    private function procesarPost()
    {

    }

    private function processView()
    {

    }
}
?>