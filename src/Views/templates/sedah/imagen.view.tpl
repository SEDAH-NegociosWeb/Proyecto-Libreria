<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con imagen</h1>
    <hr>

    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.imagen.imagen&mode={{mode}}&idImagen={{idImagen}}" method="post">

            <div class="row">
                <div class="col-md-8"><input type="hidden" name="crsxToken" value="{{crsxToken}}">
                    <fieldset class="row flex-center align-center">
                        <label for="idImagen" class="col-5">ID Imagen</label>
                        <input class="col-7" id="idImagen" name="idImagen" value="{{idImagen}}" placeholder=""
                            type="text" readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="direccion" class="col-5">Dirección</label>
                        <textarea name="direccion" id="direccion" placeholdercols="10" rows="2" placeholder="{{direccion}}" value="{{direccion}}"></textarea>
                    </fieldset>
                </div>

                <div class="col-md-4">
                    <div class="text-center flex-center">
                        <img src="{{direccion}}" alt="" style="max-width: 300px; max-width: 300px;">
                    </div>
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
            window.location.assign("index.php?page=sedah.imagen.imagenLista");
        });
    });
</script>