<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>
    <h1 style="padding: 1.5rem;">Clientes</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Genero</th>
                <th>Teléfono</th>
                <th>Celular</th>
                <th>Correo</th>
                <th>Número ID</th>
                <th>Biografía</th>
                <th>Estado</th>
                <th>Fecha de Registro</th>
                <th><a href="index.php?page=sedah.clientes.clientes&mode=INS&idCliente=0"><img src="public\imgs\add32px.png" alt="editar"></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach clientesLista}}
            <tr>
                <th scope="row">{{idCliente}}</th>
                <td> <a href="index.php?page=sedah.clientes.clientes&mode=DSP&idCliente={{idCliente}}">
                        {{nombreCliente}}</a></td>
                <td>{{generoCliente}}</td>
                <td>{{telefonoCliente}}</td>
                <td>{{celularCliente}}</td>
                <td>{{correoCliente}}</td>
                <td>{{numeroIdCliente}}</td>
                <td>{{biografiaCliente}}</td>
                <td>{{estadoCliente}}</td>
                <td>{{fechaRegistro}}</td>
                <td>
                    <a href="index.php?page=sedah.clientes.clientes&mode=UPD&idCliente={{idCliente}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.clientes.clientes&mode=DEL&idCliente={{idCliente}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor clientesLista}}
        </tbody>
    </table>
</div>