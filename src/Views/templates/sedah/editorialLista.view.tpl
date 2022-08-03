<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>
    
    <h1 style="padding: 1.5rem;">Editorial</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Dirección</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th><a href="index.php?page=sedah.editorial.editorial&mode=INS&idEditorial=0"><img src="public\imgs\add32px.png" alt="editar"></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach editorialLista}}
            <tr>
                <th scope="row">{{idEditorial}}</th>
                <td> <a href="index.php?page=sedah.editorial.editorial&mode=DSP&idEditorial={{idEditorial}}">
                        {{nombreEditorial}}</a></td>
                <td>{{direccion}}</td>
                <td>{{telefono}}</td>
                <td>{{email}}</td>
                <td>
                    <a href="index.php?page=sedah.editorial.editorial&mode=UPD&idEditorial={{idEditorial}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.editorial.editorial&mode=DEL&idEditorial={{idEditorial}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor editorialLista}}
        </tbody>
    </table>
</div>