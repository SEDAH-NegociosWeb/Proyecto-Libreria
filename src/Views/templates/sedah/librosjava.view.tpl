<div style="height: 150px"></div>
<div class="container-fluid" style="width: 85%;">
    <nav class="navCategorias">
        <div class="container-fluid">
            <div id="mainListDiv" class="main_list">
                <ul class="navlinks">
                    <li><a class="nav-link" href="index.php?page=sedah_librosjava"><strong>Java</strong></a></li>
                    <li><a class="nav-link" href="#"><strong>PHP</strong></a></li>
                    <li><a class="nav-link" href="#"><strong>C and C++</strong></a></li>
                    <li><a class="nav-link" href="#"><strong>JavaScript</strong></a></li>
                    <li><a class="nav-link" href="#"><strong>.Net</strong></a></li>
                    <li><a class="nav-link" href="#"><strong>Kotlin</strong></a></li>
                </ul>
            </div>
        </div>
    </nav>
    <br />
    
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
    <div style="height: 500px;"></div>
</div>