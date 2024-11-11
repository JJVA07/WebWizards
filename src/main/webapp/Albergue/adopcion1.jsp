<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Adopción</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: #581925;">
  <!-- Navbar Brand-->
  <a class="navbar-brand ps-3" href="Albergue.jsp">Albergue</a>
  <!-- Sidebar Toggle-->
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <!-- Navbar-->
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="mi_cuenta.jsp">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="#!">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" id="navbarDropdown" href="Albergue.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: #581925;">
      <div class="sb-sidenav-menu">
        <div class="nav">
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCrearPublicacion" aria-expanded="false" aria-controls="collapseCrearPublicacion">
            <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
            Crear Publicación
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="Albergue_adopcion.jsp">Adopción</a>
              <a class="nav-link" href="Albergue_donacion.jsp">Donación</a>
              <a class="nav-link" href="Albergue_eventos.jsp">Eventos Benéficos</a>
            </nav>
          </div>

          <a class="nav-link collapsed active" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="true" aria-controls="collapsePublicaciones">
            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
            Publicaciones
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse show" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link active" href="Adopciones_publicaciones.jsp">Adopciones</a>
              <a class="nav-link" href="Donaciones_publicaciones.jsp">Donaciones</a>
              <a class="nav-link" href="Hogares_publicaciones.jsp">Hogares Temporales</a>
              <a class="nav-link" href="Eventos_publicaciones.jsp">Eventos Benéficos</a>
            </nav>
          </div>

          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTemporal" aria-expanded="false" aria-controls="collapseTemporal">
            <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
            Mis Actividades
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapseTemporal" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="Adopciones_tabla.jsp">Adopciones</a>
              <a class="nav-link" href="Donaciones_tabla.jsp">Donaciones</a>
              <a class="nav-link" href="Hogares_tabla.jsp">Hogares Temporales</a>
              <a class="nav-link" href="Eventos_tabla.jsp">Eventos Benéficos</a>
            </nav>
          </div>
        </div>
      </div>
    </nav>
  </div>

  <div id="layoutSidenav_content">
    <div class="container-fluid">
      <!-- Page Heading -->
      <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Información - Adopción</h1>
      </div>

      <!-- Profile Section -->
      <div class="row">
        <!-- Left Column - Description -->
        <div class="col-md-6">
          <h3 id="nombreMascota">¡HOLA!</h3>
          <ul>
            <li><strong>Descripcion:</strong> <span id="descripcion"></span></li>
            <li><strong>Edad aproximada:</strong> <span id="edad"></span></li>
            <li><strong>Tipo de raza:</strong> <span id="raza"></span></li>
            <li><strong>Sexo:</strong> <span id="sexo"></span></li>
            <li><strong>Estado actual:</strong> <span id="estado"></span></li>
          </ul>
          <h4>Condiciones para adoptar:</h4>
          <p id="condiciones"></p>

          <div class="d-flex justify-content-center">
            <a href="#" class="btn btn-secondary mb-2 me-2">Compartir</a>
            <a href="#" class="btn btn-secondary mb-2">Postular</a>
          </div>
        </div>

        <!-- Right Column - Image -->
        <div class="col-md-6 text-center">
          <img src="<%= request.getContextPath() %>/assets/img/loula.png" alt="Loula" class="img-fluid rounded" style="width: 70%;">
        </div>
      </div>
    </div>
    <!-- End of Content -->

    <footer class="sticky-footer bg-dark text-white py-4">
      <div class="container my-auto">
        <div class="row">
          <div class="col-lg-4 mt-4 text-center">
            <h5>Contáctanos</h5>
          </div>
          <div class="col-lg-4 mt-3 text-center">
            <p>Somos un albergue con ganas de ayudar a perritos</p>
          </div>
          <div class="col-lg-4 text-center">
            <ul class="list-unstyled">
              <li><i class="fas fa-envelope fa-fw"></i> <a href="#" class="text-white">information@untitled.tld</a></li>
              <li><i class="fas fa-phone fa-fw"></i> (000) 000-0000</li>
              <li><i class="fas fa-home fa-fw"></i> 1234 Somewhere Road #8254<br />Nashville, TN 00000-0000</li>
            </ul>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>

<script>
  // Obtener los parámetros de la URL
  const params = new URLSearchParams(window.location.search);

  // Mostrar cada campo usando los parámetros
  document.getElementById("descripcion").innerText = params.get("descripcion") || "descripcion detallada de Loula";
  document.getElementById("nombreMascota").innerText = params.get("nombreMascota") || "Loula";
  document.getElementById("edad").innerText = params.get("edad") || "4-5 años";
  document.getElementById("raza").innerText = params.get("raza") || "Poodle";
  document.getElementById("sexo").innerText = params.get("sexo") || "Hembra";
  document.getElementById("estado").innerText = params.get("estado") || "Disponible para adoptar";
  document.getElementById("condiciones").innerText = params.get("condiciones") || "Debes ser mayor a 21 años, necesita ser esterilizada, tiempo para sus paseos diarios";
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
</body>
</html>
