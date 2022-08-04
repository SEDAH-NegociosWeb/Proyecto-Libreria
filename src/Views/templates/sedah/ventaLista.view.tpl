<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>

    <h1 style="padding: 1.5rem;">Ventas</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th>ID Venta</th>
                <th>Fecha</th>
                <th>Usuario</th>
                <th>Dirección Entrega</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            {{foreach ventaLista}}
            <tr>
                <th>{{idventa}}</th>
                <td>{{fecha}}</td>
                <td>{{username}}</td>
                <td>{{direccion}}</td>
                <td>{{Total}}</td>
            </tr>
            {{endfor ventaLista}}
        </tbody>
    </table>
</div>