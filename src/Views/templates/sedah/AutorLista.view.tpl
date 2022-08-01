<h1>Autor</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>idAutor</td>
<td>primerNombreAutor</td>
<td>segundoNombreAutor</td>
<td>primerApellidoAutor</td>
<td>segundoApellidoAutor</td>
<td>idImagen</td>
<td>fechaDeNacimiento</td>
<td><a href="index.php?page=sedah.Autor.Autor&mode=INS&idAutor=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach AutorLista}}
                                <tr>
<td>{{idAutor}}</td>
<td> <a href="index.php?page=sedah.Autor.Autor&mode=DSP&idAutor={{idAutor}}">
{{primerNombreAutor}}</a></td>
<td>{{segundoNombreAutor}}</td>
<td>{{primerApellidoAutor}}</td>
<td>{{segundoApellidoAutor}}</td>
<td>{{idImagen}}</td>
<td>{{fechaDeNacimiento}}</td>
<td>
            <a href="index.php?page=sedah.Autor.Autor&mode=UPD&idAutor={{idAutor}}">Editar</a>
            &nbsp;
            <a href="index.php?page=sedah.Autor.Autor&mode=DEL&idAutor={{idAutor}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor AutorLista}}
                            </tbody>
                        </table>