<h1>clientes</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>idCliente</td>
<td>nombreCliente</td>
<td>generoCliente</td>
<td>telefonoCliente</td>
<td>celularCliente</td>
<td>correoCliente</td>
<td>numeroIdCliente</td>
<td>biografiaCliente</td>
<td>estadoCliente</td>
<td>fechaRegistro</td>
<td><a href="index.php?page=mnt.clientes.clientes&mode=INS&idCliente=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach clientesLista}}
                                <tr>
<td>{{idCliente}}</td>
<td> <a href="index.php?page=mnt.clientes.clientes&mode=DSP&idCliente={{idCliente}}">
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
            <a href="index.php?page=mnt.clientes.clientes&mode=UPD&idCliente={{idCliente}}">Editar</a>
            &nbsp;
            <a href="index.php?page=mnt.clientes.clientes&mode=DEL&idCliente={{idCliente}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor clientesLista}}
                            </tbody>
                        </table>