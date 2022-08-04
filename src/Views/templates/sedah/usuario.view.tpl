<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con Usuario</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.usuario.usuario&mode={{mode}}&usercod={{usercod}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">

            <div class="row">
                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="usercod" class="col-5">ID Usuario</label>
                        <input class="col-7" id="usercod" name="usercod" value="{{usercod}}" placeholder="" type="text"
                            readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <input type="email" class="form-control" name="useremail" id="useremail" value="{{useremail}}" />
                        <label for="useremail" class="form-label col-5">Correo</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="username" id="username" value="{{username}}" />
                        <label for="username" class="form-label col-5">Nombre de usuario</label>
                    </fieldset>

                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="userest" id="userest" value="{{userest}}" />
                        <label for="userest" class="form-label col-5">Estado</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="usertipo" id="usertipo" value="{{usertipo}}" />
                        <label for="usertipo" class="form-label col-5">Tipo</label>
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
            window.location.assign("index.php?page=sedah.usuario.usuarioLista");
        });
    });
</script>