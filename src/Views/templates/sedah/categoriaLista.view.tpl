<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>
    <h1 style="padding: 1.5rem;">Categorias</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th scope="col">ID</th>
                <th>Nombre Categoria</th>
                <th><a href="index.php?page=sedah.categoria.categoria&mode=INS&idCategoria=0"><img src="public\imgs\add32px.png" alt="editar"></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach categoriaLista}}
            <tr>
                <th scope="row">{{idCategoria}}</th>
                <td> <a href="index.php?page=sedah.categoria.categoria&mode=DSP&idCategoria={{idCategoria}}">
                        {{nombreCategoria}}</a></td>
                <td>
                    <a href="index.php?page=sedah.categoria.categoria&mode=UPD&idCategoria={{idCategoria}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.categoria.categoria&mode=DEL&idCategoria={{idCategoria}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor categoriaLista}}
        </tbody>
    </table>
</div>
