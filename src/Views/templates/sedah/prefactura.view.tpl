<div class="container p-5">
    <div style="height: 100px"></div>
    <div class="container-fluid">

        <ul id="listProgress">
            <li class="active" id="direccion"><strong>Envio</strong></li>
            <li class="active" id="confirmacion"></i><strong>Confirmación</strong></li>
            <li id="factura"></i><strong>Factura</strong></li>
        </ul>

        <!-- progressbar -->
        <div class="progress" style="height: 20px;">
            <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar"
                aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
                style="width: 50%"></div>
        </div>
        <br>
        <h1>Prefactura y confirmación</h1>

        <form action="index.php?page=Sedah_prefactura" method="post" id="infoEnvio">

            <div class="container" style="align-items: center; width: auto">
                <h3>Su total a pagar es de: $ {{Total}}</h3>

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Libro</th>
                            <th scope="col">Precio</th>
                            <th scope="col">Cantidad</th>
                            <th scope="col">Subtotal</th>
                        </tr>
                    </thead>
                    <tbody>
                        {{foreach Libros}}
                        <tr>
                            <td>
                                <p>{{nombreLibro}}</p>
                                <p>{{Autor}}</p>
                            </td>
                            <td>$ {{precio}}</td>
                            <td>{{cantidad}}</td>
                            <td>$ {{SubTotal}}</td>
                        </tr>
                        {{endfor Libros}}
                </table>
                </tbody>
            </div>
            <div class="container text-center row" style="align-items: center;">
                <div class="col-6">
                    <button name="btnAtras" id="btnAtras" type="button" class="btn btn-info">Atras</button>
                </div>
                <div class="col-6">

                    <button name="btnConfirmar" id="btnConfirmar" type="submit"
                        class="btn btn-warning">Confirmar</button>
                </div>
            </div>
        </form>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('btnAtras').addEventListener('click', function (e) {
                e.preventDefault();
                e.stopPropagation();
                window.location.href = 'index.php?page=sedah_infoenvio';
            });
        });
    </script>