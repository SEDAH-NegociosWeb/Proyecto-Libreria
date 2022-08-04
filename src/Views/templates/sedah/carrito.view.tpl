<div class="container-fluid" style="padding-top: 100px; width: 55%;">
  <div class="container">
    <h2 class="text-center">TU CESTA</h2>
  </div>
  <hr>
  <div class="container">
    <br>
    {{foreach Libros}}
    <div class="row">
      <div class="col-md-4">
        <div class="d-flex align-items-center">
          <img src="{{direccion}}" alt="{{nombreLibro}}" style="width: 170px;" />
        </div>
      </div>

      <div class="col-md-8">
        <div class="pb-3">
          <h4 class="fw-normal mb-1">{{nombreLibro}}</h4>
          <p class="text-muted mb-0">{{autor}}</p>
        </div>
        <br><br><br>

        <div class="row" style="align-items: center; justify-content:center margin:end">
            <div class="col-md-6">
              <h5>Precio: $ {{precio}}</h5>
              <h5>SubTotal: $ {{SubTotal}}</h5>
            </div>

            <div class="col-md-3">
              <h5>Cantidad:
                <span class="badge badge-success rounded-pill d-inline">{{cantidad}}</span>
              </h5>
            </div>

            <div class="col-md-3" style="padding: 8%;">
              <form action="index.php?page=Sedah_Carrito" method="post">
                <input type="hidden" name="idLibro" id="idLibro" value="{{idLibro}}" />
                <button name="Eliminar" type="submit" class="btn btn-outline-danger">
                  Quitar</button>
              </form>
            </div>
          </div>
      </div>
    </div>
    <hr>
    {{endfor Libros}}
  </div>

  <div class="container d-grid gap-2" style="margin-top: 50px; margin-bottom:50px">
    <h1 style="text-align: right;">Total: $ {{Total}}</h1>
    <hr>
    <button type="button" class="btn btn-info" style="font-size: 1.5rem;"
      onclick="window.location='index.php?page=sedah_infoenvio'">Realizar Compra</button>
  </div>

</div>