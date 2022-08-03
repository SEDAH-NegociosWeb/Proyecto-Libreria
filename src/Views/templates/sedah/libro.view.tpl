<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con libro</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 75rem;">
        <form action="index.php?page=sedah.libro.libro&mode={{mode}}&idLibro={{idLibro}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">

            <div class="row">
                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idLibro" class="col-5">ID Libro</label>
                        <input class="col-7" id="idLibro" name="idLibro" value="{{idLibro}}" placeholder="" type="text"
                            readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="nombreLibro" class="col-5">Nombre</label>
                        <input class="col-7" id="nombreLibro" name="nombreLibro" value="{{nombreLibro}}" placeholder=""
                            type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="descripcion" class="col-5">Descripción</label>
                        <textarea name="descripcion" id="descripcion" placeholdercols="30" rows="5" placeholder="{{descripcion}}" value="{{descripcion}}"></textarea>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="edicion" class="col-5">Edición</label>
                        <input class="col-7" id="edicion" name="edicion" value="{{edicion}}" placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="anio" class="col-5">Año</label>
                        <input class="col-7" id="anio" name="anio" value="{{anio}}" placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="precio" class="col-5">Precio</label>
                        <input class="col-7" id="precio" name="precio" value="{{precio}}" placeholder="" type="text">
                    </fieldset>
                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idEditorial" class="col-5">ID Editorial</label>
                        <input class="col-7" id="idEditorial" name="idEditorial" value="{{idEditorial}}" placeholder=""
                            type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idImagen" class="col-5">ID Imagen</label>
                        <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder=""
                            type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idAutor" class="col-5">ID Autor</label>
                        <input class="col-7" id="idAutor" name="idAutor" value="{{idAutor}}" placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idCategoria" class="col-5">ID Categoria</label>
                        <input class="col-7" id="idCategoria" name="idCategoria" value="{{idCategoria}}" placeholder=""
                            type="text">
                    </fieldset>
                </div>
            </div>
            <div class="container-fluid" style="width: 300px; padding-top: 48px;">
                <fieldset class="row flex-end align-center">
                    <button type="submit" name="btnConfirmar" class="btn btn-warning">Confirmar</button>
                    &nbsp;<button type="button" id="btnCancelar" class="btn btn-danger">Cancelar</button>
                    &nbsp;
                </fieldset>
            </div>
        </form>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", (e) => {
        document.getElementById("btnCancelar").addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=sedah.libro.libroLista");
        });
    });
</script>