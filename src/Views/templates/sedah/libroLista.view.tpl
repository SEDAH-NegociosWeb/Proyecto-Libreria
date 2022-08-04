<h1>libro</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>idLibro</td>
<td>nombreLibro</td>
<td>descripcion</td>
<td>edicion</td>
<td>anio</td>
<td>precio</td>
<td>idEditorial</td>
<td>idImagen</td>
<td>idAutor</td>
<td>idCategoria</td>
<td>existencia</td>
<td><a href="index.php?page=mnt.libro.libro&mode=INS&idLibro=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach libroLista}}
                                <tr>
<td>{{idLibro}}</td>
<td> <a href="index.php?page=mnt.libro.libro&mode=DSP&idLibro={{idLibro}}">
{{nombreLibro}}</a></td>
<td>{{descripcion}}</td>
<td>{{edicion}}</td>
<td>{{anio}}</td>
<td>{{precio}}</td>
<td>{{idEditorial}}</td>
<td>{{idImagen}}</td>
<td>{{idAutor}}</td>
<td>{{idCategoria}}</td>
<td>{{existencia}}</td>
<td>
            <a href="index.php?page=mnt.libro.libro&mode=UPD&idLibro={{idLibro}}">Editar</a>
            &nbsp;
            <a href="index.php?page=mnt.libro.libro&mode=DEL&idLibro={{idLibro}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor libroLista}}
                            </tbody>
                        </table>