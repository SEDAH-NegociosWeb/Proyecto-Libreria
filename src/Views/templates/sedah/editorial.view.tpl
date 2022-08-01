<h1>Trabajando con editorial</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=mnt.editorial.editorial&mode={{mode}}&idEditorial={{idEditorial}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="idEditorial" class="col-5">idEditorial</label>
                <input class="col-7" id="idEditorial" name="idEditorial" value="{{idEditorial}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="nombreEditorial" class="col-5">nombreEditorial</label>
                <input class="col-7" id="nombreEditorial" name="nombreEditorial" value="{{nombreEditorial}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="direccion" class="col-5">direccion</label>
                <input class="col-7" id="direccion" name="direccion" value="{{direccion}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="telefono" class="col-5">telefono</label>
                <input class="col-7" id="telefono" name="telefono" value="{{telefono}}" placeholder="" type="text">
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="email" class="col-5">email</label>
                <input class="col-7" id="email" name="email" value="{{email}}" placeholder="" type="text">
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
                    window.location.assign("index.php?page=mnt.editorial.editorialLista");
                });
            });
        </script>