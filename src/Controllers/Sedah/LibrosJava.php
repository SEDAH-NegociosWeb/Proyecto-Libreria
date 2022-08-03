<?php

namespace Controllers\Sedah;


use Controllers\PublicController;
use Views\Renderer;
use Utilities\Validators;
use Dao\Sedah\LibrosJava as DaoLibros;

class LibrosJava extends PublicController
{
    private $viewData = array();

    public function run() :void
    { 
        $this->init();

        Renderer::render('sedah/librosjava', $this->viewData);
    }

    public function init(){
        $this->viewData = array();
        $this->viewData["Libros"] = array();

        $this->tmpLibros = DaoLibros::getAll();
        $this->viewData["Libros"] = $this->tmpLibros;
    }
}
?>