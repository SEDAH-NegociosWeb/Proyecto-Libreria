<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con Libro</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
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
                        <input type="text" class="form-control" name="nombreLibro" id="nombreLibro" value="{{nombreLibro}}" required />
                        <label for="nombreLibro" class="form-label col-5">Nombre Libro</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <textarea class="form-control is-valid" name="descripcion" id="descripcion" placeholder=""
                            required>{{descripcion}}</textarea>
                        <label for="descripcion" class="form-label">Descripción</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="edicion" id="edicion" value="{{edicion}}" />
                        <label for="edicion" class="form-label col-5">Edición</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="number" class="form-control" name="anio" id="anio" value="{{anio}}" required />
                        <label for="anio" class="form-label col-5">Año</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="number" class="form-control" name="precio" id="precio" value="{{precio}}" required />
                        <label for="precio" class="form-label col-5">Precio</label>
                    </fieldset>

                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idEditorial" class="col-5">idEditorial</label>
                        <input class="col-7" id="idEditorial" name="idEditorial" value="{{idEditorial}}" placeholder=""
                            type="text">
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <label for="idImagen" class="col-5">idImagen</label>
                        <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder=""
                            type="text">
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <label for="idAutor" class="col-5">idAutor</label>
                        <input class="col-7" id="idAutor" name="idAutor" value="{{idAutor}}" placeholder="" type="text">
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <label for="idCategoria" class="col-5">idCategoria</label>
                        <input class="col-7" id="idCategoria" name="idCategoria" value="{{idCategoria}}" placeholder=""
                            type="text">
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="existencia" id="existencia" value="{{existencia}}" required />
                        <label for="existencia" class="form-label col-5">Existencia</label>
                    </fieldset>
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