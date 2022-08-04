<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
class Error extends PublicController
{
    public function run(): void
    {
        \Utilities\Site::redirectToWithMsg(
            "index.php?page=Sedah_Carrito",
            "Compra Cancelada!"
        );
        die();
    }
}

?>
