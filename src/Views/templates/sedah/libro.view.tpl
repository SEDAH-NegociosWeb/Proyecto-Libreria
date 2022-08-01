<h1>Trabajando con libro</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=mnt.libro.libro&mode={{mode}}&idLibro={{idLibro}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="idLibro" class="col-5">idLibro</label>
                <input class="col-7" id="idLibro" name="idLibro" value="{{idLibro}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="nombreLibro" class="col-5">nombreLibro</label>
                <input class="col-7" id="nombreLibro" name="nombreLibro" value="{{nombreLibro}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="descripcion" class="col-5">descripcion</label>
                <input class="col-7" id="descripcion" name="descripcion" value="{{descripcion}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="edicion" class="col-5">edicion</label>
                <input class="col-7" id="edicion" name="edicion" value="{{edicion}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="año" class="col-5">año</label>
                <input class="col-7" id="año" name="año" value="{{año}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="precio" class="col-5">precio</label>
                <input class="col-7" id="precio" name="precio" value="{{precio}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="idEditorial" class="col-5">idEditorial</label>
                <input class="col-7" id="idEditorial" name="idEditorial" value="{{idEditorial}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="idImagen" class="col-5">idImagen</label>
                <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="idAutor" class="col-5">idAutor</label>
                <input class="col-7" id="idAutor" name="idAutor" value="{{idAutor}}" placeholder="" type="text">
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
                    window.location.assign("index.php?page=mnt.libro.libroLista");
                });
            });
        </script>