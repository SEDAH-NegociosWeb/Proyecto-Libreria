<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con clientes</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.clientes.clientes&mode={{mode}}&idCliente={{idCliente}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">

            <div class="row">
                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idCliente" class="col-5">ID Cliente</label>
                        <input class="col-7" id="idCliente" name="idCliente" value="{{idCliente}}" placeholder=""
                            type="text" readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="nombreCliente" class="col-5">Nombre</label>
                        <input class="col-7" id="nombreCliente" name="nombreCliente" value="{{nombreCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="generoCliente" class="col-5">Genero</label>
                        <input class="col-7" id="generoCliente" name="generoCliente" value="{{generoCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="telefonoCliente" class="col-5">Teléfono</label>
                        <input class="col-7" id="telefonoCliente" name="telefonoCliente" value="{{telefonoCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="celularCliente" class="col-5">Celular</label>
                        <input class="col-7" id="celularCliente" name="celularCliente" value="{{celularCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="correoCliente" class="col-5">Correo</label>
                        <input class="col-7" id="correoCliente" name="correoCliente" value="{{correoCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="numeroIdCliente" class="col-5">Número ID</label>
                        <input class="col-7" id="numeroIdCliente" name="numeroIdCliente" value="{{numeroIdCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="biografiaCliente" class="col-5">Biografía</label>
                        <input class="col-7" id="biografiaCliente" name="biografiaCliente" value="{{biografiaCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="estadoCliente" class="col-5">Estado</label>
                        <input class="col-7" id="estadoCliente" name="estadoCliente" value="{{estadoCliente}}"
                            placeholder="" type="text">
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="fechaRegistro" class="col-5">Fecha Registro</label>
                        <input class="col-7" id="fechaRegistro" name="fechaRegistro" value="{{fechaRegistro}}"
                            placeholder="" type="text">
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
            window.location.assign("index.php?page=sedah.clientes.clientesLista");
        });
    });
</script>