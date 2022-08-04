<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con Editorial</h1>
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
                        <input type="text" class="form-control" name="nombreEditorial" id="nombreEditorial" value="{{nombreEditorial}}" required />
                        <label for="nombreEditorial" class="form-label col-5">Nombre</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <textarea class="form-control is-valid" name="direccion" id="direccion" placeholder=""
                            required>{{direccion}}</textarea>
                        <label for="direccion" class="form-label">Dirección</label>
                    </fieldset>
                </div>


                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <input type="number" class="form-control" name="telefono" id="telefono" value="{{telefono}}" required />
                        <label for="telefono" class="form-label col-5">Teléfono</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="email" class="form-control" name="email" id="email" value="{{email}}" required />
                        <label for="email" class="form-label col-5">Correo</label>
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