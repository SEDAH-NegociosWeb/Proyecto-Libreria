<div style="height: 150px"></div>
<div class="container-fluid" style="width: 55%;">
    <div>
        <div class="row" style="align-items: center; justify-content:center">
            <div class="col-md-8 text-center">
                <div class="pb-3 center">
                    <h2>Detalle del Producto</h2>
                    <br />
                    <br>
                    <img src="{{direccion}}" alt="{{nombreLibro}}" class="img-fluid rounded-start" />
                </div>
                <br>
                <div class="row">
                    <div class="col-md-6">
                        <button type="button" class="btn btn-secondary"
                            onclick="location.href='index.php?page=sedah_librosjava'">Atras
                        </button>
                    </div>

                    <div class="col-md-6">
                        <form action="index.php?page=Sedah_AgregaCarrito" method="post">
                            <input type="hidden" name="id" id="id" value="{{idLibro}}">
                            <input type="hidden" name="nombreLibro" id="nombreLibro" value="{{nombreLibro}}">
                            <input type="hidden" name="precio" id="precio" value="{{precio}}">
                            <input type="hidden" name="cantidad" id="cantidad" value="1">

                            <button type="submit" class="btn btn-secondary" name="action"
                                onclick="agregarValorCarrito(this)" value="Agregar">Agregar al Carrito
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <br>
                <h4 class="text-center">{{nombreLibro}}</h6>
                    <br>
                    <h6>Descripción: {{descripcion}}</h6>
                    <br>
                    <h6>Edición: {{edicion}}</h6>
                    <br>
                    <h6>Año: {{anio}}</h6>
                    <br>
                    <h6>Precio: $ {{precio}}</h6>
                    <br>
                    <div class="row">
                        <div class="text-center">
                            <h6>Cantidad</h6>
                        </div>
                        <br>
                        <div class="col-6 col-sm-4">
                            <button type="button" class="btn btn-secondary" id='disminuir' onclick="carrito(this)"
                                value="disminuir">-
                            </button>
                        </div>

                        <div class="col-6 col-sm-4 text-center">
                            <p id='contador'>
                                1
                            </p>
                        </div>

                        <div class="col-6 col-sm-4">
                            <button type="button" class="btn btn-secondary" id='aumentar' onclick="carrito(this)"
                                value="aumentar"> +
                            </button>
                        </div>

                    </div>
            </div>
        </div>
        <br>
        <hr>
    </div>
</div>

<script type="text/javascript">
    var valor = 0;
    function carrito(boton) {
        var contador = document.getElementById("contador").textContent;
        valor = parseInt(contador);
        if (boton.value == 'aumentar') {
            valor++;
        } else if (contador > 1) {
            valor--;
        }
        document.getElementById("contador").textContent = valor;
        document.getElementById("cantidad").value = valor;
    }

//
</script>