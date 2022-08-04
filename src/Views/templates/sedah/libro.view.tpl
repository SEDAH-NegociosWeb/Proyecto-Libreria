<div class="container-fluid" style="padding-top: 150px; height: 100%;">
    <h1>Trabajando con Libro</h1>
    <hr>
    <section class="container-m"></section>
    <div class="container" style="width: 60rem;">
        <form action="index.php?page=sedah.libro.libro&mode={{mode}}&idLibro={{idLibro}}" method="post">
            <input type="hidden" name="crsxToken" value="{{crsxToken}}">
            <div class="row">
                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idLibro" class="col-5">ID Libro</label>
                        <input class="col-7" id="idLibro" name="idLibro" value="{{idLibro}}" placeholder="" type="text"
                            readonly>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="nombreLibro" id="nombreLibro"
                            value="{{nombreLibro}}" required />
                        <label for="nombreLibro" class="form-label col-5">Nombre Libro</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <textarea class="form-control is-valid" name="descripcion" id="descripcion" placeholder=""
                            required>{{descripcion}}</textarea>
                        <label for="descripcion" class="form-label">Descripción</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="edicion" id="edicion" value="{{edicion}}" />
                        <label for="edicion" class="form-label col-5">Edición</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="number" class="form-control" name="anio" id="anio" value="{{anio}}" required />
                        <label for="anio" class="form-label col-5">Año</label>
                    </fieldset>
                    <fieldset class="row flex-center align-center">
                        <input type="number" class="form-control" name="precio" id="precio" value="{{precio}}"
                            required />
                        <label for="precio" class="form-label col-5">Precio</label>
                    </fieldset>

                </div>

                <div class="col-md-6">
                    <fieldset class="row flex-center align-center">
                        <label for="idEditorial" class="col-5">Editorial</label>
                        <div class="custom-select" style="width:200px;">
                            <select id="idEditorial" name="idEditorial">
                                <option value="0">Selecciona </option>
                                {{foreach editorial}}
                                <option value="{{idEditorial}}">{{nombreEditorial}}</option>
                                {{endfor editorial}}
                            </select>
                        </div>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idImagen" class="col-5">Imagen</label>
                        <div class="custom-select" style="width:200px;">
                            <select id="idImagen" name="idImagen" onchange="select()">
                                <option value="0">Selecciona </option>
                                {{foreach imagen}}
                                <option value="{{idImagen}}">{{direccion}}</option>
                                {{endfor imagen}}
                            </select>
                            <img style="width:80%; height:auto;" id="imgImagen" src="" alt="">
                        </div>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idAutor" class="col-5">Autor</label>
                        <div class="custom-select" style="width:200px;">
                            <select id="idAutor" name="idAutor">
                                <option value="0">Selecciona </option>
                                {{foreach autor}}
                                <option value="{{idAutor}}">{{nombre}}</option>
                                {{endfor autor}}
                            </select>
                        </div>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <label for="idCategoria" class="col-5">Categoria</label>
                        <div class="custom-select" style="width:200px;">
                            <select id="idCategoria" name="idCategoria">
                                <option value="0">Selecciona </option>
                                {{foreach categoria}}
                                <option value="{{idCategoria}}">{{nombreCategoria}}</option>
                                {{endfor categoria}}
                            </select>
                        </div>
                    </fieldset>
                    <br>
                    <fieldset class="row flex-center align-center">
                        <input type="text" class="form-control" name="existencia" id="existencia" value="{{existencia}}"
                            required />
                        <label for="existencia" class="form-label col-5">Existencia</label>
                    </fieldset>
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
            window.location.assign("index.php?page=sedah.libro.libroLista");
        });
    });

    var seleccion = document.getElementById("idImagen");
    function select(){
        document.getElementById("imgImagen").src = seleccion.selectedOptions[0].text;
    }
</script>