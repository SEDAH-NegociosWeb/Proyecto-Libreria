<h1>Trabajando con imagen</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=mnt.imagen.imagen&mode={{mode}}&idImagen={{idImagen}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="idImagen" class="col-5">idImagen</label>
                <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="direccion" class="col-5">direccion</label>
                <input class="col-7" id="direccion" name="direccion" value="{{direccion}}" placeholder="" type="text">
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
                    window.location.assign("index.php?page=mnt.imagen.imagenLista");
                });
            });
        </script>