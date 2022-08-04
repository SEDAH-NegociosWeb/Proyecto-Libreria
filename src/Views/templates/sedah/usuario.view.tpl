<h1>Trabajando con usuario</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=mnt.usuario.usuario&mode={{mode}}&usercod={{usercod}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="usercod" class="col-5">usercod</label>
                <input class="col-7" id="usercod" name="usercod" value="{{usercod}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="useremail" class="col-5">useremail</label>
                <input class="col-7" id="useremail" name="useremail" value="{{useremail}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="username" class="col-5">username</label>
                <input class="col-7" id="username" name="username" value="{{username}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="userpswd" class="col-5">userpswd</label>
                <input class="col-7" id="userpswd" name="userpswd" value="{{userpswd}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="userfching" class="col-5">userfching</label>
                <input class="col-7" id="userfching" name="userfching" value="{{userfching}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="userpswdest" class="col-5">userpswdest</label>
                <input class="col-7" id="userpswdest" name="userpswdest" value="{{userpswdest}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="userpswdexp" class="col-5">userpswdexp</label>
                <input class="col-7" id="userpswdexp" name="userpswdexp" value="{{userpswdexp}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="userest" class="col-5">userest</label>
                <input class="col-7" id="userest" name="userest" value="{{userest}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="useractcod" class="col-5">useractcod</label>
                <input class="col-7" id="useractcod" name="useractcod" value="{{useractcod}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="userpswdchg" class="col-5">userpswdchg</label>
                <input class="col-7" id="userpswdchg" name="userpswdchg" value="{{userpswdchg}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="usertipo" class="col-5">usertipo</label>
                <input class="col-7" id="usertipo" name="usertipo" value="{{usertipo}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="token" class="col-5">token</label>
                <input class="col-7" id="token" name="token" value="{{token}}" placeholder="" type="text">
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
                    window.location.assign("index.php?page=mnt.usuario.usuarioLista");
                });
            });
        </script>