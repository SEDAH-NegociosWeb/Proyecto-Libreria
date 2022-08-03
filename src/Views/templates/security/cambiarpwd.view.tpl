<body style="background-image:url(https://img.freepik.com/foto-gratis/libro-magico-plano-papel_1232-2098.jpg?t=st=1658787514~exp=1658788114~hmac=e8c3d5ee5498884761b1cbae5b61d2636efdc90e4c9573719b4441fc1ae6d526&w=1060); background-size: 100% 100vh; background-repeat: no-repeat;">
  
</body>
<br><br><br><br>
<section class="fullCenter">
  <form class="grid" method="post" action="index.php?page=sec_cambiarpwd {{if redirto}}&redirto={{redirto}}{{endif redirto}}">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12"><b>Cambiar Contraseña</b><i style="float: right;" class="fa-solid fa-rotate"></i></h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtCodigo"></label>
        <center>
          <div class="col-10 col-m-8">
            <input class="width-full" type="text" id="txtCodigo" name="txtCodigo" value="{{txtCodigo}}" placeholder="Código de recuperación" style="border-radius: 15px; padding-bottom: 12px;" />
          </div>
        </center>
        {{if errorCodigo}}
          <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorCodigo}}</div>
        {{endif errorCodigo}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center">&nbsp;</label>
        <label class="col-12 col-m-4 flex align-center">&nbsp;</label>
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtNewPwd"></label>
        <center>
          <div class="col-10 col-m-8">
            <input class="width-full" type="password" id="txtNewPwd" name="txtNewPwd" value="{{txtNewPwd}}" placeholder="Nueva Contraseña" style="border-radius: 15px; padding-bottom: 12px;" />
          </div>
        </center>
        {{if errorNewPwd}}
          <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorNewPwd}}</div>
        {{endif errorNewPwd}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center">&nbsp;</label>
        <label class="col-12 col-m-4 flex align-center">&nbsp;</label>
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtConPwd"></label>
        <center>
          <div class="col-10 col-m-8">
            <input class="width-full" type="password" id="txtConPwd" name="txtConPwd" value="{{txtConPwd}}" placeholder="Confirmar Contraseña" style="border-radius: 15px;" />
          </div>
        </center>
        {{if errorConPwd}}
          <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorConPwd}}</div>
        {{endif errorConPwd}}
      </div>
    {{if generalError}}
      <div class="row">
        {{generalError}}
      </div>
    {{endif generalError}}
    <center>
      <br><br>
      <div class="row center flex-end col-4">
        <button class="primary" style="background-color:#ffa900; border-radius:15px; border: none;" id="btnLogin" type="submit" style="border-radius: 15px;"><b>Enviar</b></button>
      </div>
    </center>
    </section>
  </form>
</section>