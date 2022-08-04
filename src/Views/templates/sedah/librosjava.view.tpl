<div style="height: 150px"></div>
<div class="container-fluid" style="padding-top: 100px ;width: 85%;">
    <div>
        <div class="row row-cols-3 row-cols-md-3 g-4">
        {{foreach Libros}}
            <div class="col">
                <div class="card">
                    <div class="imgBx">
                        <img src="{{direccion}}"
                            alt="{{nombreLibro}}" class="img-fluid rounded-start" />
                    </div>
                    <div class="details">
                        <h2>{{nombreLibro}}</h2>
                        <br>
                        <h5>Autor: {{autor}}</h5>
                        <p>
                            {{descripcion}}
                        </p>
                        <br>
                        <button type="button" class="btn btn-secondary"
                            onclick="location.href='index.php?page=sedah_detallejava&id={{idLibro}}'">Ver más
                        </button>
                    </div>
                </div>
            </div>
        {{endfor Libros}}
        </div>
    </div>
    <div style="height: 500px;"></div>
</div>