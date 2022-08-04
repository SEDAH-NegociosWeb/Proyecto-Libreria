<div class="container p-5">
    <div style="height: 100px"></div>
<div class="container-fluid">

    <ul id="listProgress">
        <li class="active" id="direccion"><strong>Envio</strong></li>
        <li class="active" id="pago"><strong>Pago</strong></li>
        <li id="confirmacion"></i><strong>Confirmación</strong></li>
        <li id="factura"></i><strong>Factura</strong></li>
    </ul>

    <!-- progressbar -->
    <div class="progress" style="height: 20px;">
        <div class="progress-bar progress-bar-striped progress-bar-animated bg-warning" role="progressbar"
            aria-label="Animated striped example" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"
            style="width: 50%"></div>
    </div>
    <br>
    <h1>Información de pago</h1>

    <form action="index.php?page=sedah_infopago" method="post">

        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="pb-3">
                        <div class="form-outline">
                            <input type="text" id="nombre" name="nombre" class="form-control" value="{{nombre}}" />
                            <label class="form-label" for="nombre">Nombre del titular de la tarjeta</label>
                        </div>
                        {{if error_nombre}}
                        {{foreach error_nombre}}
                        <div class="error">{{this}}</div>
                        {{endfor error_nombre}}
                        {{endif error_nombre}}
                    </div>
                    <div class="pb-3">
                        <div class="form-outline">
                            <input type="number" id="numeroTar" name="numeroTar" class="form-control"
                                value="{{numeroTar}}" />
                            <label class="form-label" for="numeroTar">Número de tarjeta</label>
                        </div>
                        {{if error_numeroTar}}
                        {{foreach error_numeroTar}}
                        <div class="error">{{this}}</div>
                        {{endfor error_numeroTar}}
                        {{endif error_numeroTar}}
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="form-outline col-md-6">
                                    <input type="number" id="mesEx" name="mesEx" class="form-control"
                                        value="{{mesEx}}" />
                                    <label class="form-label" for="mesEx">Mes</label>
                                </div>
                                {{if error_mesEx}}
                                {{foreach error_mesEx}}
                                <div class="error">{{this}}</div>
                                {{endfor error_mesEx}}
                                {{endif error_mesEx}}
                                <div class="form-outline col-md-6">
                                    <input type="number" id="anioEx" name="anioEx" class="form-control"
                                        value="{{anioEx}}" />
                                    <label class="form-label" for="anioEx">Año</label>
                                </div>
                                {{if error_anioEx}}
                                {{foreach error_anioEx}}
                                <div class="error">{{this}}</div>
                                {{endfor error_anioEx}}
                                {{endif error_anioEx}}
                            </div>
                            <h5>Fecha de Expiración</h5>
                            {{if error_fecha}}
                            {{foreach error_fecha}}
                            <div class="error">{{this}}</div>
                            {{endfor error_fecha}}
                            {{endif error_fecha}}
                        </div>
                        <div class="col-md-8">
                            <div class="form-outline">
                                <input type="number" id="cvv" name="cvv" class="form-control" value="{{cvv}}" />
                                <label class="form-label" for="cvv">CVV</label>
                            </div>
                            {{if error_cvv}}
                            {{foreach error_cvv}}
                            <div class="error">{{this}}</div>
                            {{endfor error_cvv}}
                            {{endif error_cvv}}
                        </div>
                    </div>
                </div>

            </div>
            <br>
            <div class="text-center row">
                <div class="col-5">
                    <button name="btnAtras" id="btnAtras" type="button" class="btn btn-info">Atras</button>
                </div>
                <div class="col-1">
                    <button name="btnContinuar" id="btnContinuar" type="submit"
                        class="btn btn-warning">Continuar</button>
                </div>
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