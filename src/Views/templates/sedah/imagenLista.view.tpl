<h1>imagen</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>idImagen</td>
<td>direccion</td>
<td><a href="index.php?page=mnt.imagen.imagen&mode=INS&idImagen=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach imagenLista}}
                                <tr>
<td>{{idImagen}}</td>
<td> <a href="index.php?page=mnt.imagen.imagen&mode=DSP&idImagen={{idImagen}}">
{{direccion}}</a></td>
<td>
            <a href="index.php?page=mnt.imagen.imagen&mode=UPD&idImagen={{idImagen}}">Editar</a>
            &nbsp;
            <a href="index.php?page=mnt.imagen.imagen&mode=DEL&idImagen={{idImagen}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor imagenLista}}
                            </tbody>
                        </table>