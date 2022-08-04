<?php

namespace Controllers\Checkout;

use Controllers\PublicController;

class Checkout extends PublicController{
    public function run():void
    {
        $viewData = array();
        if ($this->isPostBack()) {
            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "test".(time() - 10000000),
                "http://localhost/ProyectoFinal_NegociosWeb/index.php?page=checkout_error",
                "http://localhost/ProyectoFinal_NegociosWeb/index.php?page=checkout_accept"
            );
            // Nombre, Autor, SKU, precio, impuesto, cantidad,categoria
            $PayPalOrder->addItem("Test", "TestItem1", "PRD1", 100, 15, 31, "DIGITAL_GOODS");
            $PayPalOrder->addItem("Test 2", "TestItem2", "PRD2", 50, 7.5, 2, "DIGITAL_GOODS");
            $response = $PayPalOrder->createOrder();
            $_SESSION["orderid"] = $response[1]->result->id;
            \Utilities\Site::redirectTo($response[0]->href);
            die();
        }

        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
?>
