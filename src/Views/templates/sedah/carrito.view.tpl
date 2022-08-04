<div class="container-fluid" style="padding-top: 100px;">
  <div class="container">
    <h2 class="text-center">Tus Productos</h2>
  </div>

  <div class="container">
    <table class="table align-middle mb-0 bg-white">
      <thead class="bg-light">
        <tr>
          <th>Libro</th>
          <th>Nombre</th>
          <th>Cantidad</th>
          <th>Precio</th>
          <th>SubTotal</th>
          <th>Eliminar</th>
        </tr>
      </thead>
      <tbody>
        {{foreach Libros}}
        <tr>
          <td>
            <div class="d-flex align-items-center">
              <img src="{{direccion}}" alt="{{nombreLibro}}" style="width: 150px;">
            </div>
          </td>
          <td>
            <p class="fw-normal mb-1">{{nombreLibro}}</p>
            <p class="text-muted mb-0">{{autor}}</p>
          </td>
          <td>
            <span
              class="badge badge-success rounded-pill d-inline"
            >{{cantidad}}</span>
          </td>
          <td>$ {{precio}}</td>
          <td>$ {{SubTotal}}</td>
          <td>
            <form action="index.php?page=Sedah_Carrito" method="post">
              <input type="hidden"
                name="idLibro"
                id="idLibro"
                value="{{idLibro}}"/>
              <button name="Eliminar" type="submit" class="btn btn-link btn-sm btn-rounded">
              Eliminar</button>
            </form>
          </td>
        </tr>
        {{endfor Libros}}
      </tbody>
    </table>

  </div>

  <div class="container d-grid gap-2" style="margin-top: 50px; margin-bottom:50px">
    <h1 style="text-align: right;">Total: $ {{Total}}</h1>
    <button type="button" class="btn btn-info" style="font-size: 1.5rem;" onclick="window.location='index.php?page=sedah_infoenvio'">Realizar Compra</button>
  </div>

</div>