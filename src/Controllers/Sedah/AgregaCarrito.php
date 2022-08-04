<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Dao\Sedah\Carrito as DaoCarrito;


class AgregaCarrito extends PublicController
{
    private $viewData = array();

    public function run(): void
    {
        if ($this->isPostBack()) {
            $this->procesarPost();
        }
    }

    private function procesarPost()
    {
        $result = null;
        $existe = false;
        $idProducto = $_POST['id'];
        $cantidad = $_POST['cantidad'];

        $this->viewData["IdLibros"] = array();

        $this->tmpIDLibros = DaoCarrito::obtenerIdsDeProductosEnCarrito();

        $this->viewData["IdLibros"] = $this->tmpIDLibros;

        foreach ($this->viewData["IdLibros"] as $key) {
            if ($key["id_libro"] == $idProducto) {
                $existe = true;
            }
        }

        if ($existe !== true) {
            $result = DaoCarrito::agregarProductoAlCarrito($idProducto, $cantidad);
            if ($result) {
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=sedah_librosjava",
                    "Libro Agregado al carrito!"
                );
            }
        } else {
            $result = DaoCarrito::actualizarProductoAlCarrito($idProducto, $cantidad);
            if ($result) {
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=sedah_librosjava",
                    "Libro Agregado al carrito!"
                );
            }
        }
    }
}
