<body style="background-image:url(https://img.freepik.com/foto-gratis/libro-magico-plano-papel_1232-2098.jpg?t=st=1658787514~exp=1658788114~hmac=e8c3d5ee5498884761b1cbae5b61d2636efdc90e4c9573719b4441fc1ae6d526&w=1060); background-size: 100% 100vh; background-repeat: no-repeat;">
  
</body>
<br><br><br><br>
<section class="fullCenter">
  <form class="grid" method="post" action="index.php?page=sec_register">
    <section class="depth-1 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <h1 class="col-12"><b>Crea tu cuenta</b><i style="float: right;" class="fa-solid fa-user-plus"></i></h1>
    </section>
    <section class="depth-1 py-5 row col-12 col-m-8 offset-m-2 col-xl-6 offset-xl-3">
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtName"></label>
        <center>
          <div class="col-10 col-m-8">
            <input class="width-full" type="text" id="txtName" name="txtName" value="{{txtName}}" placeholder="Nombre de Usuario" style="border-radius: 15px;" />
          </div>
        </center>
        {{if errorName}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorName}}</div>
        {{endif errorName}}
      </div>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtEmail"></label>
        <center>
          <div class="col-10 col-m-8">
            <input class="width-full" type="email" id="txtEmail" name="txtEmail" value="{{txtEmail}}" placeholder="Correo Electronico" style="border-radius: 15px;" />
          </div>
        </center>
        {{if errorEmail}}
        <div class="error col-12 py-2 col-m-8 offset-m-4">{{errorEmail}}</div>
        {{endif errorEmail}}
      </div>
      <br><br><br><br><br>
      <div class="row">
        <label class="col-12 col-m-4 flex align-center" for="txtPswd"></label>
        <center>
          <div class="col-10 col-m-8">
            <input class="width-full" type="password" id="txtPswd" name="txtPswd" value="{{txtPswd}}" placeholder="Contraseña" style="border-radius: 15px;" />
          </div>
        </center>
        {{if errorPswd}}
        <center><div class="error col-12 py-2 col-m-8">{{errorPswd}}</div></center>
        {{endif errorPswd}}
      </div>
      <center>
        <br><br>
        <div class="row cennter flex-end col-4">
          <button class="primary" style="background-color:#ffa900; border-radius:15px; border: none;" id="btnSignin" type="submit"><b>Crear Cuenta</b></button>
        </div>
      </center>
      
    </section>
  </form>
</section>
