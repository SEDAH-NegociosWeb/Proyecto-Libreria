<h1>Trabajando con clientes</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=mnt.clientes.clientes&mode={{mode}}&idCliente={{idCliente}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="idCliente" class="col-5">idCliente</label>
                <input class="col-7" id="idCliente" name="idCliente" value="{{idCliente}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="nombreCliente" class="col-5">nombreCliente</label>
                <input class="col-7" id="nombreCliente" name="nombreCliente" value="{{nombreCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="generoCliente" class="col-5">generoCliente</label>
                <input class="col-7" id="generoCliente" name="generoCliente" value="{{generoCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="telefonoCliente" class="col-5">telefonoCliente</label>
                <input class="col-7" id="telefonoCliente" name="telefonoCliente" value="{{telefonoCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="celularCliente" class="col-5">celularCliente</label>
                <input class="col-7" id="celularCliente" name="celularCliente" value="{{celularCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="correoCliente" class="col-5">correoCliente</label>
                <input class="col-7" id="correoCliente" name="correoCliente" value="{{correoCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="numeroIdCliente" class="col-5">numeroIdCliente</label>
                <input class="col-7" id="numeroIdCliente" name="numeroIdCliente" value="{{numeroIdCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="biografiaCliente" class="col-5">biografiaCliente</label>
                <input class="col-7" id="biografiaCliente" name="biografiaCliente" value="{{biografiaCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="estadoCliente" class="col-5">estadoCliente</label>
                <input class="col-7" id="estadoCliente" name="estadoCliente" value="{{estadoCliente}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="fechaRegistro" class="col-5">fechaRegistro</label>
                <input class="col-7" id="fechaRegistro" name="fechaRegistro" value="{{fechaRegistro}}" placeholder="" type="text">
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
                    window.location.assign("index.php?page=mnt.clientes.clientesLista");
                });
            });
        </script>