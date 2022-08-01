<h1>Trabajando con Autor</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=sedah.Autor.Autor&mode={{mode}}&idAutor={{idAutor}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="idAutor" class="col-5">idAutor</label>
                <input class="col-7" id="idAutor" name="idAutor" value="{{idAutor}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="primerNombreAutor" class="col-5">primerNombreAutor</label>
                <input class="col-7" id="primerNombreAutor" name="primerNombreAutor" value="{{primerNombreAutor}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="segundoNombreAutor" class="col-5">segundoNombreAutor</label>
                <input class="col-7" id="segundoNombreAutor" name="segundoNombreAutor" value="{{segundoNombreAutor}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="primerApellidoAutor" class="col-5">primerApellidoAutor</label>
                <input class="col-7" id="primerApellidoAutor" name="primerApellidoAutor" value="{{primerApellidoAutor}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="segundoApellidoAutor" class="col-5">segundoApellidoAutor</label>
                <input class="col-7" id="segundoApellidoAutor" name="segundoApellidoAutor" value="{{segundoApellidoAutor}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="idImagen" class="col-5">idImagen</label>
                <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="fechaDeNacimiento" class="col-5">fechaDeNacimiento</label>
                <input class="col-7" id="fechaDeNacimiento" name="fechaDeNacimiento" value="{{fechaDeNacimiento}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-end align-center">
            <button type="submit" name="btnConfirmar" class="btn primary">Confirmar</button>
            &nbsp;<button type="button" id="btnCancelar" class="btn secondary">Cancelar</button>
            &nbsp;
        </fieldset>
</form>
            </section>
<script>
            document.addEventListener("DOMContentLoaded",(e)=>{
                document.getElementById("btnCancelar").addEventListener("click", (e)=>{
                    e.preventDefault();
                    e.stopPropagation();
                    window.location.assign("index.php?page=sedah.Autor.AutorLista");
                });
            });
        </script>