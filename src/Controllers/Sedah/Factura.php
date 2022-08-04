<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Dao\Sedah\Carrito as DaoCarrito;
use Dao\Sedah\ProcesoPago as DaoProcesoPago;
use Symfony\Component\HttpFoundation\Cookie;

class Factura extends PublicController
{
    private $viewData = array();

    public function run() :void
    {
        $this->init();
        if (!$this->isPostBack()) {
            $this->procesarGet();
        }

        Renderer::render('sedah/factura', $this->viewData);
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

    private function procesarGet()
    {
        $this->viewData["infoEnvio"] = (unserialize($_COOKIE["infoEnvio"]));

        DaoProcesoPago::agregarDireccionEntrega($this->viewData["infoEnvio"]["tADireccion"], $this->viewData["infoEnvio"]["sDepartamento"], $this->viewData["infoEnvio"]["zip"], $this->viewData["infoEnvio"]["ciudad"]);
        DaoProcesoPago::agregarVenta($this->viewData["Total"]);
    
        foreach ($this->viewData["Libros"] as $key => $value) {
            DaoProcesoPago::agregarDetalleVenta($value["idLibro"], $value["cantidad"], $value["precio"], $value["SubTotal"]);
        }
        DaoCarrito::limpiarCarritoUsuario();
    }
}
?>