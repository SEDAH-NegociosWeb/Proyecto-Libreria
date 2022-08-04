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
                        <input type="text" class="form-control" name="primerNombreAutor" id="primerNombreAutor" value="{{primerNombreAutor}}" required />
                        <label for="primerNombreAutor" class="form-label col-5">Primer Nombre</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="segundoNombreAutor" id="segundoNombreAutor" value="{{segundoNombreAutor}}" />
                        <label for="segundoNombreAutor" class="form-label col-5">Segundo Nombre</label>
                    </fieldset>
                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="primerApellidoAutor" id="primerApellidoAutor" value="{{primerApellidoAutor}}" required />
                        <label for="primerApellidoAutor" class="form-label col-5">Primer Apellido</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="segundoApellidoAutor" id="segundoApellidoAutor" value="{{segundoApellidoAutor}}" />
                        <label for="segundoApellidoAutor" class="form-label col-5">Segundo Apellido</label>
                    </fieldset>
                    <br>
                    <label for="idImagen" class="col-5">Imagen</label>
                    <fieldset class="row flex-center align-center">
                        <div class="custom-select" style="width:200px;">
                            <select id="idImagen" name="idImagen" onchange="select()" style="width:300px;">
                                <option value="0">Selecciona </option>
                                {{foreach imagen}}
                                <option value="{{idImagen}}">{{direccion}}</option>
                                {{endfor imagen}}
                            </select>
                            <img style="width:80%; height:auto;" id="imgImagen" src="" alt="">
                        </div>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <input type="date" class="form-control" name="fechaDeNacimiento" id="fechaDeNacimiento" value="{{fechaDeNacimiento}}" required />
                        <label for="fechaDeNacimiento" class="form-label col-5">Fecha Nacimiento</label>
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

    var seleccion = document.getElementById("idImagen");
    function select(){
        document.getElementById("imgImagen").src = seleccion.selectedOptions[0].text;
    }
</script>