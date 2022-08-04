<div class="container-fluid" style="padding-top: 150px; height: 100%; padding-bottom: 200px;">
    <a class="btn btn-primary" style="background-color: #fff;" href="index.php?page=sedah_admin" role="button">
        <img src="public\imgs\back-button.png" alt="" style="width: 20px;">
    </a>
    
    <h1 style="padding: 1.5rem;">Autores</h1>
    <hr>
    <table class="table">
        <thead class="table-light">
            <tr>
                <th scope="col">ID </th>
                <th scope="col">Primer Nombre</th>
                <th scope="col">Segundo Nombre</th>
                <th scope="col">Primer Apellido</th>
                <th scope="col">Segundo Apellido</th>
                <th scope="col">Imagen</th>
                <th scope="col">Fecha Nacimiento</th>
                <th scope="col"><a href="index.php?page=sedah.Autor.Autor&mode=INS&idAutor=0"><img src="public\imgs\add32px.png" alt="add"></a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach AutorLista}}
            <tr>
                <th scope="row">{{idAutor}}</th>
                <td> <a href="index.php?page=sedah.Autor.Autor&mode=DSP&idAutor={{idAutor}}">
                        {{primerNombreAutor}}</a></td>
                <td>{{segundoNombreAutor}}</td>
                <td>{{primerApellidoAutor}}</td>
                <td>{{segundoApellidoAutor}}</td>
                <td>
                    <img style="width: 10%; height: auto;" src="{{direccion}}" alt="">
                </td>
                <td>{{fechaDeNacimiento}}</td>
                <td>
                    <a href="index.php?page=sedah.Autor.Autor&mode=UPD&idAutor={{idAutor}}"><img src="public\imgs\edit.png" alt="editar" style="width: 20px;"></a>
                    &nbsp;
                    <a href="index.php?page=sedah.Autor.Autor&mode=DEL&idAutor={{idAutor}}"><img src="public\imgs\delete.png" alt="editar" style="width: 22px;"></a>
                </td>
            </tr>
            {{endfor AutorLista}}
        </tbody>
    </table>
</div>