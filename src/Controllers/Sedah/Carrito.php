<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Dao\Sedah\Carrito as DaoCarrito;


class Carrito extends PublicController
{
    private $viewData = array();

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->procesarPost();
        }
        Renderer::render('sedah/carrito', $this->viewData);
    }

    public function init()
    {
        $this->viewData = array();
        $this->viewData["Libros"] = array();
        $this->viewData["Total"] = 0;

        $this->tmpLibros = DaoCarrito::obtenerProductosEnCarrito();

        $this->viewData["Libros"] = $this->tmpLibros;

        foreach ($this->viewData["Libros"] as $key => $value) {
            $this->viewData["Total"] += $value["precio"] * $value["cantidad"];
        }

    }

    private function procesarPost()
    {
        $result = null;
        $idProducto = $_POST['idLibro'];

        $result = DaoCarrito::quitarProductoDelCarrito($idProducto);
        if ($result) {
            \Utilities\Site::redirectToWithMsg(
                "index.php?page=Sedah_Carrito",
                "Libro Eliminado!"
            );
        }
    }
}
