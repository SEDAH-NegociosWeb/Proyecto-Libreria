<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con Categoria</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.categoria.categoria&mode={{mode}}&idCategoria={{idCategoria}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">
            <fieldset class="row flex-center align-center">
                <label for="idCategoria" class="col-5">ID Categoria</label>
                <input class="col-7" id="idCategoria" name="idCategoria" value="{{idCategoria}}" placeholder=""
                    type="text" readonly>
            </fieldset>
            <br>
            <fieldset class="row flex-center align-center">
                <input type="text" class="form-control" name="nombreCategoria" id="nombreCategoria"
                    value="{{nombreCategoria}}" required />
                <label for="nombreCategoria" class="form-label col-5">Nombre</label>
            </fieldset>
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
            window.location.assign("index.php?page=sedah.categoria.categoriaLista");
        });
    });
</script>