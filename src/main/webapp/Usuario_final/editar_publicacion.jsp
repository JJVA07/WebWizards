<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapphr1_2023.Beans.Publicacion" %>
<%@ page import="java.util.Base64" %>
<%
  Publicacion publicacion = (Publicacion) request.getAttribute("publicacion");
  int tipoPublicacion = publicacion.getTipoPublicacion().getIdTipoPublicacion(); // 1: Mascota Perdida, 2: Denuncia

  // Convertir la imagen a Base64 si existe
  String base64Image = "";
  if (publicacion.getFoto() != null) {
    base64Image = Base64.getEncoder().encodeToString(publicacion.getFoto());
  }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Editar Publicación</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
  <!-- FontAwesome -->
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">

<!-- Navbar -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
  <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal">Usuario Final</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fas fa-user fa-fw"></i>
      </a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/LoginServlet?action=logout">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>

<!-- Layout principal -->
<div id="layoutSidenav">
  <!-- Sidebar -->
  <jsp:include page="/WEB-INF/sidebar.jsp" />

  <!-- Contenido principal -->
  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h2 class="mt-4 text-center">Editar Publicación</h2>

        <form method="post" action="<%= request.getContextPath() %>/Usuario?action=actualizarPublicacion" enctype="multipart/form-data">
          <input type="hidden" name="idPublicacion" value="<%= publicacion.getIdPublicacion() %>">

          <% if (tipoPublicacion == 1) { %>
          <!-- MASCOTAS PERDIDAS -->
          <h4 class="text-center mb-4">Mascota Perdida</h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label>Nombre de la Mascota:</label>
              <input type="text" name="nombre" class="form-control" value="<%= publicacion.getNombre() %>">
            </div>
            <div class="col-md-6 mb-3">
              <label>Edad:</label>
              <input type="number" name="edad" class="form-control" value="<%= publicacion.getEdad() %>">
            </div>
            <div class="col-md-6 mb-3">
              <label>Raza:</label>
              <input type="text" name="raza" class="form-control" value="<%= publicacion.getRaza() %>">
            </div>
            <div class="col-md-6 mb-3">
              <label>Tamaño:</label>
              <select name="tamano" class="form-control">
                <option value="" disabled <%= publicacion.getTamano() == null ? "selected" : "" %>>Seleccionar...</option>
                <option value="Pequeño" <%= "Pequeño".equals(publicacion.getTamano()) ? "selected" : "" %>>Pequeño</option>
                <option value="Mediano" <%= "Mediano".equals(publicacion.getTamano()) ? "selected" : "" %>>Mediano</option>
                <option value="Grande" <%= "Grande".equals(publicacion.getTamano()) ? "selected" : "" %>>Grande</option>
              </select>
            </div>

            <div class="col-md-6 mb-3">
              <label>Distintivo:</label>
              <input type="text" name="distintivo" class="form-control" value="<%= publicacion.getDistintivo() %>">
            </div>
          </div>

          <% } else if (tipoPublicacion == 2) { %>
          <!-- DENUNCIAS -->
          <h4 class="text-center mb-4">Denuncia</h4>
          <div class="row">
            <div class="col-md-6 mb-3">
              <label>Nombre del Maltratador:</label>
              <input type="text" name="nombreMaltratador" class="form-control" value="<%= publicacion.getNombreMaltratador() %>">
            </div>
            <div class="col-md-6 mb-3">
              <label>Tipo de Maltrato:</label>
              <input type="text" name="tipoMaltrato" class="form-control" value="<%= publicacion.getTipoMaltrato() %>">
            </div>
            <div class="col-md-6 mb-3">
              <label>Dirección del Maltrato:</label>
              <input type="text" name="direccionMaltrato" class="form-control" value="<%= publicacion.getDireccionMaltrato() %>">
            </div>
            <div class="col-md-6 mb-3">
              <label>¿Se ha realizado denuncia policial?</label><br>
              <input type="radio" name="denunciaPolicial" value="true" <%= (publicacion.getDenunciaPolicial() != null && publicacion.getDenunciaPolicial()) ? "checked" : "" %>> Sí
              <input type="radio" name="denunciaPolicial" value="false" <%= (publicacion.getDenunciaPolicial() == null || !publicacion.getDenunciaPolicial()) ? "checked" : "" %>> No
            </div>
          </div>
          <% } %>

          <!-- CAMPOS COMUNES -->
          <div class="row">
            <div class="col-md-12 mb-3">
              <label>Información Extra / Descripción:</label>
              <textarea name="descripcion" class="form-control"><%= publicacion.getDescripcion() %></textarea>
            </div>

            <div class="col-md-12 mb-3">
              <label>Subir Nueva Imagen:</label>
              <input type="file" name="imagen" class="form-control">
              <small class="text-muted">Si no subes una nueva imagen, se conservará la actual.</small>
            </div>
          </div>

          <div class="text-center">
            <button type="submit" class="btn btn-success">Guardar Cambios</button>
            <a href="<%= request.getContextPath() %>/Usuario?action=misPublicaciones" class="btn btn-secondary">Cancelar</a>
          </div>
          <input type="hidden" name="tipoPublicacion" value="<%= tipoPublicacion %>">

        </form>
      </div>
    </main>
  </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
