<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>

    <h1 style="padding: 1.5rem;">Imagen</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Dirección</th>
                <th><a href="index.php?page=sedah.imagen.imagen&mode=INS&idImagen=0"><img src="public\imgs\add32px.png" alt="editar"></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach imagenLista}}
            <tr>
                <th scope="row">{{idImagen}}</th>
                <td> <a href="index.php?page=sedah.imagen.imagen&mode=DSP&idImagen={{idImagen}}">
                    <img style="width: 10%; height: auto;" src="{{direccion}}" alt="">
                </a></td>
                <td>
                    <a href="index.php?page=sedah.imagen.imagen&mode=UPD&idImagen={{idImagen}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.imagen.imagen&mode=DEL&idImagen={{idImagen}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor imagenLista}}
        </tbody>
    </table>
</div>