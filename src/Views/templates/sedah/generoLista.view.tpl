<h1>genero</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>idGenero</td>
<td>nombreGenero</td>
<td><a href="index.php?page=mnt.genero.genero&mode=INS&idGenero=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach generoLista}}
                                <tr>
<td>{{idGenero}}</td>
<td> <a href="index.php?page=mnt.genero.genero&mode=DSP&idGenero={{idGenero}}">
{{nombreGenero}}</a></td>
<td>
            <a href="index.php?page=mnt.genero.genero&mode=UPD&idGenero={{idGenero}}">Editar</a>
            &nbsp;
            <a href="index.php?page=mnt.genero.genero&mode=DEL&idGenero={{idGenero}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor generoLista}}
                            </tbody>
                        </table>