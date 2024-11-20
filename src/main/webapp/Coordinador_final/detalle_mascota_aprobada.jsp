<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Detalles de la Mascota Aprobada</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #ffffff;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(58, 49, 70);">
  <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/index_coordinador.jsp">Coordinador Zonal</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Mi_cuenta.jsp">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="#!">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" id="navbarDropdown" href="<%= request.getContextPath() %>/index_coordinador.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" style="background-color: rgb(58, 49, 70)" id="sidenavAccordion">
      <div class="sb-sidenav-menu">
        <div class="nav">
          <a class="nav-link" href="<%= request.getContextPath() %>/mascotas_perdidas.jsp">
            <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
            Mascotas Perdidas
          </a>
          <a class="nav-link active" href="<%= request.getContextPath() %>/mascotas_aprobadas.jsp">
            <div class="sb-nav-link-icon"><i class="fa-solid fa-check"></i></div>
            Mascotas Aprobadas
          </a>
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHogaresTemporales" aria-expanded="false" aria-controls="collapseHogaresTemporales">
            <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
            Hogares Temporales
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapseHogaresTemporales" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="<%= request.getContextPath() %>/hogares_aprobados.jsp">Hogares Aprobados</a>
              <a class="nav-link" href="<%= request.getContextPath() %>/solicitud_hogares.jsp">Solicitud de Hogares</a>
              <a class="nav-link" href="<%= request.getContextPath() %>/solicitudes_agendadas.jsp">Solicitudes Agendadas</a>
            </nav>
          </div>
        </div>
      </div>
    </nav>
  </div>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Detalles de la Mascota</h1>
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <!-- Información de la Mascota -->
              <div class="col-md-6">
                <p><strong>Nombre:</strong> <%= request.getParameter("nombre") != null ? request.getParameter("nombre") : "N/A" %></p>
                <p><strong>Edad:</strong> <%= request.getParameter("edad") != null ? request.getParameter("edad") : "N/A" %> años</p>
                <p><strong>Raza:</strong> <%= request.getParameter("raza") != null ? request.getParameter("raza") : "N/A" %></p>
                <p><strong>Tamaño:</strong> <%= request.getParameter("tamano") != null ? request.getParameter("tamano") : "N/A" %></p>
                <p><strong>Contacto:</strong> <%= request.getParameter("contacto") != null ? request.getParameter("contacto") : "N/A" %></p>
                <p><strong>Distintivo:</strong> <%= request.getParameter("distintivo") != null ? request.getParameter("distintivo") : "N/A" %></p>
                <p><strong>Descripción:</strong> <%= request.getParameter("descripcion") != null ? request.getParameter("descripcion") : "N/A" %></p>
                <p><strong>Lugar:</strong> <%= request.getParameter("lugar") != null ? request.getParameter("lugar") : "N/A" %></p>
                <p><strong>Hora:</strong> <%= request.getParameter("hora") != null ? request.getParameter("hora") : "N/A" %></p>
                <p><strong>Recompensa:</strong> <%= request.getParameter("recompensa") != null ? request.getParameter("recompensa") : "N/A" %></p>
              </div>

              <!-- Imagen y Notas Adicionales -->
              <div class="col-md-6 text-center">
                <img src="<%= request.getParameter("imagen") != null ? request.getParameter("imagen") : request.getContextPath() + "/assets/img/default.png" %>"
                     class="img-fluid rounded mb-3" style="max-width: 300px;" alt="Imagen de la mascota">
                <div class="mt-4">
                  <h5>Notas Adicionales</h5>
                  <textarea class="form-control mb-3" rows="3" placeholder="Escribe cualquier información adicional aquí..."></textarea>
                </div>
                <button class="btn btn-secondary btn-lg">Actualizar</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>

    <footer class="py-4 mt-auto" style="background-color: black;">
      <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
          <div class="text-muted">Contáctanos: Somos un albergue gosu...</div>
          <div>
            <a href="#" style="color: white;">Correo: info@alberguegosu.com</a>
            <a href="#" style="color: white;">Teléfono: +123 456 7890</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>
</body>
</html>
