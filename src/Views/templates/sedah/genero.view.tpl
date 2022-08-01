<h1>Trabajando con genero</h1>
<hr>
<section class="container-m"></section>
<form action="index.php?page=mnt.genero.genero&mode={{mode}}&idGenero={{idGenero}}" method="post" >
<input type="hidden" name="crsxToken" value="{{crsxToken}}">
<fieldset class="row flex-center align-center">
                <label for="idGenero" class="col-5">idGenero</label>
                <input class="col-7" id="idGenero" name="idGenero" value="{{idGenero}}" placeholder="" type="text" readonly>
            </fieldset>
<fieldset class="row flex-center align-center">
                <label for="nombreGenero" class="col-5">nombreGenero</label>
                <input class="col-7" id="nombreGenero" name="nombreGenero" value="{{nombreGenero}}" placeholder="" type="text">
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
                    window.location.assign("index.php?page=mnt.genero.generoLista");
                });
            });
        </script>