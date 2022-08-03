<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>
    <h1 style="padding: 1.5rem;">Libro</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Edición</th>
                <th>Año</th>
                <th>Precio</th>
                <th>Editorial</th>
                <th>Imagen</th>
                <th>Autor</th>
                <th>Categoria</th>
                <th><a href="index.php?page=sedah.libro.libro&mode=INS&idLibro=0"><img src="public\imgs\add32px.png" alt="editar"></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach libroLista}}
            <tr>
                <th scope="row">{{idLibro}}</th>
                <td> <a href="index.php?page=sedah.libro.libro&mode=DSP&idLibro={{idLibro}}">
                        {{nombreLibro}}</a></td>
                <td>{{descripcion}}</td>
                <td>{{edicion}}</td>
                <td>{{anio}}</td>
                <td>{{precio}}</td>
                <td>{{idEditorial}}</td>
                <td>{{idImagen}}</td>
                <td>{{idAutor}}</td>
                <td>{{idCategoria}}</td>
                <td>
                    <a href="index.php?page=sedah.libro.libro&mode=UPD&idLibro={{idLibro}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.libro.libro&mode=DEL&idLibro={{idLibro}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor libroLista}}
        </tbody>
    </table>
</div>