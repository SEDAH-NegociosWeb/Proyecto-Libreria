<div class="container-fluid" style="padding-bottom: 200px;">
    <div>
        <div class="row g-col-6 g-col-md-4">
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
</div>