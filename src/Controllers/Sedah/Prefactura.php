<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Dao\Sedah\Carrito as DaoCarrito;

class PreFactura extends PublicController
{
    private $viewData = array();

    public function run(): void
    {
        $this->init();
        if ($this->isPostBack()) {
            $this->procesarPost();
        }
        Renderer::render('sedah/prefactura', $this->viewData);
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
        $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
            "test".(time() - 10000000),
            "http://localhost/ProyectoFinal_NegociosWeb/index.php?page=checkout_error",
            "http://localhost/ProyectoFinal_NegociosWeb/index.php?page=checkout_accept"
        );
        // Nombre, Autor, SKU, precio, impuesto, cantidad,categoria
        foreach ($this->viewData["Libros"] as $key => $value) {
            $PayPalOrder->addItem($value["nombreLibro"], $value["autor"], $value["idLibro"], intval($value["precio"]), 15, intval($value["cantidad"]), "DIGITAL_GOODS"); 
        }

        $response = $PayPalOrder->createOrder();
        $_SESSION["orderid"] = $response[1]->result->id;
        \Utilities\Site::redirectTo($response[0]->href); 

    }
}
?>