<h1>usuario</h1>
<hr>
                <table>
                <thead>
                <tr>
<td>usercod</td>
<td>useremail</td>
<td>username</td>
<td>userpswd</td>
<td>userfching</td>
<td>userpswdest</td>
<td>userpswdexp</td>
<td>userest</td>
<td>useractcod</td>
<td>userpswdchg</td>
<td>usertipo</td>
<td>token</td>
<td><a href="index.php?page=mnt.usuario.usuario&mode=INS&usercod=0">Nuevo</a></td>
</tr>
                         </thead>
                        <tbody>
{{foreach usuarioLista}}
                                <tr>
<td>{{usercod}}</td>
<td> <a href="index.php?page=mnt.usuario.usuario&mode=DSP&usercod={{usercod}}">
{{useremail}}</a></td>
<td>{{username}}</td>
<td>{{userpswd}}</td>
<td>{{userfching}}</td>
<td>{{userpswdest}}</td>
<td>{{userpswdexp}}</td>
<td>{{userest}}</td>
<td>{{useractcod}}</td>
<td>{{userpswdchg}}</td>
<td>{{usertipo}}</td>
<td>{{token}}</td>
<td>
            <a href="index.php?page=mnt.usuario.usuario&mode=UPD&usercod={{usercod}}">Editar</a>
            &nbsp;
            <a href="index.php?page=mnt.usuario.usuario&mode=DEL&usercod={{usercod}}">Eliminar</a>
            </td>
 </tr>
                                {{endfor usuarioLista}}
                            </tbody>
                        </table>