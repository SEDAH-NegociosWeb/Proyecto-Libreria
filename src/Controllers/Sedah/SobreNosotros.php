<?php
    namespace Controllers\Sedah;

    use Controllers\PublicController;
    use Views\Renderer;
    use Dao\Sedah\DetalleJava as DaoDetalle;
    
    class SobreNosotros extends PublicController
    {
        public function run() :void
        {
            $viewData = array();
    
            Renderer::render('sedah/sobrenosotros', $viewData);
        }
    }

?>