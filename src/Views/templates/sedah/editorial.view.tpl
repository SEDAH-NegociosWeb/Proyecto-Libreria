<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con editorial</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.editorial.editorial&mode={{mode}}&idEditorial={{idEditorial}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">

            <div class="row">
                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idEditorial" class="col-5">ID Editorial</label>
                        <input class="col-7" id="idEditorial" name="idEditorial" value="{{idEditorial}}" placeholder=""
                            type="text" readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="nombreEditorial" class="col-5">Nombre</label>
                        <input class="col-7" id="nombreEditorial" name="nombreEditorial" value="{{nombreEditorial}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="direccion" class="col-5">Dirección</label>
                        <textarea name="direccion" id="direccion" placeholdercols="30" rows="2"
                            placeholder="{{direccion}}" value="{{direccion}}"></textarea>
                    </fieldset>
                </div>


                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="telefono" class="col-5">Teléfono</label>
                        <input class="col-7" id="telefono" name="telefono" value="{{telefono}}" placeholder=""
                            type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="email" class="col-5">Correo</label>
                        <input class="col-7" id="email" name="email" value="{{email}}" placeholder="" type="text">
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
            window.location.assign("index.php?page=sedah.editorial.editorialLista");
        });
    });
</script>