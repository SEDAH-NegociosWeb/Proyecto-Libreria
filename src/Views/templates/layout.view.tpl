<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{{SITE_TITLE}}</title>
  <link rel="stylesheet" href="/{{BASE_DIR}}/public/css/plantillaBase.css" />
  <script src="https://kit.fontawesome.com/{{FONT_AWESOME_KIT}}.js" crossorigin="anonymous"></script>
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
  <!-- MDB -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.css" rel="stylesheet" />
  {{foreach SiteLinks}}
  <link rel="stylesheet" href="/{{~BASE_DIR}}/{{this}}" />
  {{endfor SiteLinks}}
  {{foreach BeginScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor BeginScripts}}
</head>

<body>
  <nav class="nav">
    <div class="container-fluid">
      <div class="logo">
        <img id="logoPeq" src="public\imgs\logoPeq2.png" alt="logo">
      </div>
      <div id="mainListDiv" class="main_list">
        <ul class="navlinks">
          <li><a href="index.php?page=index"><i class="fa-solid fa-house"></i>&nbsp;Inicio</a></li>
          <li><a href="index.php?page=sec_login"><i class="fas fa-sign-in-alt"></i>&nbsp;Iniciar Sesión</a></li>
              <li><a href="index.php?page=sec_register"><i class="fas fa-user-plus"></i>&nbsp;Crear Cuenta</a></li>
          <li><a href="index.php?page=sedah_admin"><i class="fas fa-user-plus"></i>&nbsp;Administrar</a></li>
          <li><a href="index.php?page=sedah_infoenvio">Sobre nosotros</a></li>
          <li><a href="#">Contactenos</a></li>
        </ul>
      </div>
      <span class="navTrigger">
        <i></i>
        <i></i>
        <i></i>
      </span>
    </div>
  </nav>

  <main class="main">
    {{{page_content}}}
  </main>
  <footer>
    <div class="container__footer">
      <div class="box__footer">
        <div class="logo2">
          <img src="public/imgs/logoPeq2.png" alt="Logo de SEDAH">
          <h3>Libreria SEDAH</h3>
        </div>
        <div class="terms">
          <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Beatae est facere
            dolorem expedita ratione quam itaque, placeat, quia nisi voluptas cumque
            laudantium necessitatibus numquam maiores laborum temporibus vero.
            Deleniti molestias aliquid, tenetur maxime dicta labore, sed dolorem
            praesentium magni quia quo tempora? Quod fuga praesentium quasi quas nesciunt.
            Nam, animi?</p>
        </div>
      </div>
      <div class="box__footer">
        <center>
          <h2>Contáctanos</h2>
        </center>
        <center>
          <h4>Correo:</h4>
        </center>
        <center>
          <h5 class="terms">sedah@example.com</h5>
        </center>
        <center>
          <h4>Teléfonos:</h4>
        </center>
        <center>
          <h5 class="terms">(+504) 0000-0000</h5>
          <h5 class="terms">(+504) 0000-0000</h5>
        </center>
      </div>
      <div class="box__footer">
        <center>
          <h2>Nuestras Redes:</h2>
          <a href="https://www.facebook.com"><img class="icon" src="public/imgs/facebook_64px.png"></img></a>
          <a href="https://www.instagram.com"><img class="icon" src="public/imgs/instagram_64px.png"></img></a>
          <a href="https://www.twitter.com"><img class="icon" src="public/imgs/Twitter_64px.png"></img></a>
          <h3 class="terms">3er piso del Centro Comercial Los Almendros</h3>
        </center>
      </div>
      <div class="box__footer">
        <center>
          <h2>Horarios</h2>
        </center>
        <h4 class="terms">Lun a Miér de 18:00 a 23:00</h4>
        <h4 class="terms">Jue a Dom de 16:00 a 00:00</h4>
        <h4 class="terms" style="text-align: center;">Dom de 15:00 a 22:00</h4>
      </div>
    </div>
    <div class="box__copyright">
      <hr>
      <p style="padding-bottom: 20px;">
        Todos los derechos reservados © 2022 <b>Sedah</b>
      </p>
    </div>
  </footer>
  {{foreach EndScripts}}
  <script src="/{{~BASE_DIR}}/{{this}}"></script>
  {{endfor EndScripts}}
  <!-- MDB -->
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.3.0/mdb.min.js"></script>
  <script src="../../../public/js/progressbar.js"></script>
</body>

</html>
<!-- Jquery needed -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="js/scripts.js"></script>

<!-- Function used to shrink nav bar removing paddings and adding black background -->
<script>
  $(window).scroll(function () {
    if ($(document).scrollTop() > 50) {
      $('.nav').addClass('affix');
      console.log("OK");
    } else {
      $('.nav').removeClass('affix');
    }
  });

  $('.navTrigger').click(function () {
    $(this).toggleClass('active');
    console.log("Clicked menu");
    $("#mainListDiv").toggleClass("show_list");
    $("#mainListDiv").fadeIn();

  });
</script>