<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>

    <h1 style="padding: 1.5rem;">Usuarios</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th>ID Usuario</th>
                <th>Correo</th>
                <th>Nombre de Usuario</th>
                <th>Estado</th>
                <th>Tipo</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            {{foreach usuarioLista}}
            <tr>
                <td>{{usercod}}</td>
                <td> <a href="index.php?page=sedah.usuario.usuario&mode=DSP&usercod={{usercod}}">
                        {{useremail}}</a></td>
                <td>{{username}}</td>
                <td>{{userest}}</td>
                <td>{{usertipo}}</td>
                <td>
                    <a href="index.php?page=sedah.usuario.usuario&mode=UPD&usercod={{usercod}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.usuario.usuario&mode=DEL&usercod={{usercod}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor usuarioLista}}
        </tbody>
    </table>
</div>