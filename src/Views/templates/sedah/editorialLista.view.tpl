<h1>editorial</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>idEditorial</td>
<td>nombreEditorial</td>
<td>direccion</td>
<td>telefono</td>
<td>email</td>
<td><a href="index.php?page=mnt.editorial.editorial&mode=INS&idEditorial=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach editorialLista}}
                                <tr>
<td>{{idEditorial}}</td>
<td> <a href="index.php?page=mnt.editorial.editorial&mode=DSP&idEditorial={{idEditorial}}">
{{nombreEditorial}}</a></td>
<td>{{direccion}}</td>
<td>{{telefono}}</td>
<td>{{email}}</td>
<td>
            <a href="index.php?page=mnt.editorial.editorial&mode=UPD&idEditorial={{idEditorial}}">Editar</a>
            &nbsp;
            <a href="index.php?page=mnt.editorial.editorial&mode=DEL&idEditorial={{idEditorial}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor editorialLista}}
                            </tbody>
                        </table>