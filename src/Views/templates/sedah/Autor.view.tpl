<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con Autor</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.Autor.Autor&mode={{mode}}&idAutor={{idAutor}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">

            <div class="row">
                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idAutor" class="col-5">ID Autor</label>
                        <input class="col-7" id="idAutor" name="idAutor" value="{{idAutor}}" placeholder="" type="text"
                            readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="primerNombreAutor" class="col-5">Primer Nombre</label>
                        <input class="col-7" id="primerNombreAutor" name="primerNombreAutor"
                            value="{{primerNombreAutor}}" placeholder="" type="text">
                        <span class="error">El nombre es requerido</span>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="segundoNombreAutor" class="col-5">Segundo Nombre</label>
                        <input class="col-7" id="segundoNombreAutor" name="segundoNombreAutor"
                            value="{{segundoNombreAutor}}" placeholder="" type="text">
                    </fieldset>
                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="primerApellidoAutor" class="col-5">Primer Apellido</label>
                        <input class="col-7" id="primerApellidoAutor" name="primerApellidoAutor"
                            value="{{primerApellidoAutor}}" placeholder="" type="text">
                        <span class="error">El apellido es requerido</span>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="segundoApellidoAutor" class="col-5">Segundo Apellido</label>
                        <input class="col-7" id="segundoApellidoAutor" name="segundoApellidoAutor"
                            value="{{segundoApellidoAutor}}" placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idImagen" class="col-5">ID Imagen</label>
                        <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder=""
                            type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="fechaDeNacimiento" class="col-5">Fecha Nacimiento</label>
                        <input class="col-7" id="fechaDeNacimiento" name="fechaDeNacimiento"
                            value="{{fechaDeNacimiento}}" placeholder="" type="text">
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
            window.location.assign("index.php?page=sedah.Autor.AutorLista");
        });
    });
</script>