<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Albergue</title>
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
          <!-- Crear Publicación -->
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
             data-bs-target="#collapseCrearPublicacion" aria-expanded="false" aria-controls="collapseCrearPublicacion">
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

          <!-- Publicaciones (Activa y Abierta) -->
          <a class="nav-link collapsed active" href="#" data-bs-toggle="collapse"
             data-bs-target="#collapsePublicaciones" aria-expanded="true" aria-controls="collapsePublicaciones">
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

          <!-- Mis Actividades -->
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
             data-bs-target="#collapseTemporal" aria-expanded="false" aria-controls="collapseTemporal">
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
        <h1 class="h3 mb-0 text-gray-800">Publicaciones - Adopciones</h1>
      </div>

      <div class="container mt-4">
        <div class="row justify-content-center">
          <!-- Cards -->
          <%-- Aquí se pueden añadir múltiples tarjetas dinámicas de adopciones --%>
          <div class="col-md-4 mb-4">
            <div class="card shadow bg-white">
              <a href="adopcion1.jsp">
                <img src="<%= request.getContextPath() %>/assets/img/Adopcion1.jpeg" alt="Imagen del Evento" class="card-img-top img-fluid">
              </a>
              <div class="card-body text-center">
                <h5 class="card-title">¡Dale un hogar a un amigo fiel!</h5>
                <p class="card-text">
                  Estamos buscando una familia amorosa para Louna, una adorable perrita Golden Retriever de 4 meses.
                  Es cariñosa, juguetona y está llena de energía. Louna ya está vacunada, desparasitada y lista para ser parte de tu vida.
                </p>
                <div class="d-flex justify-content-center">
                  <!-- Botón de edición -->
                  <a href="Editar_adopcion.jsp" class="me-5">
                    <i class="fa-solid fa-pen-to-square fa-2x" style="color: #6c757d;"></i>
                  </a>
                  <!-- Botón de eliminación con Modal -->
                  <a href="#" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                    <i class="fa-solid fa-trash fa-2x text-danger"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>
          <!-- Modal de confirmación -->
          <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="confirmDeleteModalLabel">Confirmar Eliminación</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                  ¿Estás seguro de que deseas eliminar esta publicación?
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                  <button type="button" class="btn btn-danger" onclick="confirmDelete()">Eliminar</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="d-flex justify-content-center">
        <nav aria-label="Page navigation example">
          <ul class="pagination">
            <li class="page-item">
              <a class="page-link text-danger" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
              </a>
            </li>
            <li class="page-item"><a class="page-link text-danger" href="#">1</a></li>
            <li class="page-item"><a class="page-link text-danger" href="#">2</a></li>
            <li class="page-item"><a class="page-link text-danger" href="#">3</a></li>
            <li class="page-item">
              <a class="page-link text-danger" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
              </a>
            </li>
          </ul>
        </nav>
      </div>

      <footer class="py-4 mt-auto mt-3" style="background-color: black;">
        <div class="container-fluid px-4">
          <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted" style="color: white !important;">© Huella Viva</div>
            <div>
              <a style="color: white;">Correo: </a> <a href="#" style="color: white;"> info@alberguegosu.com</a>
              <div></div>
              <a style="color: white;">Teléfono: </a><a href="#" style="color: white;"> +123 456 7890</a>
              <div></div>
              <a style="color: white;">Ubicación: </a><a href="#" style="color: white;"> Calle Ejemplo 123, Ciudad, País</a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </div>
</div>

<script>
  function confirmDelete() {
    console.log("Publicación eliminada"); // Reemplaza esto con tu lógica de eliminación
    const modal = document.getElementById('confirmDeleteModal');
    const bootstrapModal = bootstrap.Modal.getInstance(modal);
    bootstrapModal.hide();
  }
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
