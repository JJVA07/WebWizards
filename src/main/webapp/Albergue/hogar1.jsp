<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sidebar.jsp" %> <!-- Incluir sidebar en todas las vistas -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Hogar Temporal</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(220,53,69);">
  <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/Albergue.jsp">Albergue</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mi_cuenta.jsp">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="#!">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" id="navbarDropdown" href="${pageContext.request.contextPath}/Albergue.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <jsp:include page="sidebar.jsp" /> <!-- Incluir sidebar.jsp -->
  </div>

  <div id="layoutSidenav_content">
    <div class="container-fluid">
      <!-- Page Heading -->
      <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Hogar Temporal - Más Información</h1>
      </div>

      <!-- Profile Section -->
      <div class="row">
        <!-- Left Column - Description -->
        <div class="col-md-12">
          <h4 class="mb-4">DATOS DETALLADOS DE LA MASCOTA</h4>
        </div>
        <div class="col-md-6">
          <form action="${pageContext.request.contextPath}/SubmitTemporaryHomeServlet" method="post" enctype="multipart/form-data" onsubmit="return mostrarAlerta(event)">
            <div class="form-group mt-2">
              <label for="description">Descripción:</label>
              <textarea class="form-control" id="description" name="description" rows="4" required>${pet.description}</textarea>
            </div>

            <div class="form-group mt-2">
              <label for="upload">Subir Foto:</label>
              <br>
              <input
                      type="file"
                      class="form-control-file"
                      id="upload"
                      name="upload"
                      accept=".jpeg, .jpg, .png"
                      required
              />
            </div>

            <div class="d-flex justify-content-center">
              <button type="submit" class="btn btn-secondary mt-4 mb-3">Enviar</button>
            </div>
          </form>
        </div>

        <!-- Right Column - Placeholder for future content (if any) -->
        <div class="col-md-6">
          <!-- Puedes agregar contenido adicional aquí si es necesario -->
        </div>
      </div>

    </div>
    <!-- End of Content -->

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>

<!-- Script para mostrar la alerta -->
<script>
  function mostrarAlerta(event) {
    event.preventDefault(); // Evitar el envío predeterminado del formulario

    alert("El formulario se completó exitosamente");

    // Redirigir después de la alerta
    window.location.href = "${pageContext.request.contextPath}/Albergue.jsp";
  }
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="sidebar.jsp" %> <!-- Incluir sidebar en todas las vistas -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Hogar Temporal</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(220,53,69);">
  <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/Albergue.jsp">Albergue</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mi_cuenta.jsp">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="#!">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" id="navbarDropdown" href="${pageContext.request.contextPath}/Albergue.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <jsp:include page="sidebar.jsp" /> <!-- Incluir sidebar.jsp -->
  </div>

  <div id="layoutSidenav_content">
    <div class="container-fluid">
      <!-- Page Heading -->
      <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Hogar Temporal - Más Información</h1>
      </div>

      <!-- Profile Section -->
      <div class="row">
        <!-- Left Column - Description -->
        <div class="col-md-12">
          <h4 class="mb-4">DATOS DETALLADOS DE LA MASCOTA</h4>
        </div>
        <div class="col-md-6">
          <form action="${pageContext.request.contextPath}/SubmitTemporaryHomeServlet" method="post" enctype="multipart/form-data" onsubmit="return mostrarAlerta(event)">
            <div class="form-group mt-2">
              <label for="description">Descripción:</label>
              <textarea class="form-control" id="description" name="description" rows="4" required>${pet.description}</textarea>
            </div>

            <div class="form-group mt-2">
              <label for="upload">Subir Foto:</label>
              <br>
              <input
                      type="file"
                      class="form-control-file"
                      id="upload"
                      name="upload"
                      accept=".jpeg, .jpg, .png"
                      required
              />
            </div>

            <div class="d-flex justify-content-center">
              <button type="submit" class="btn btn-secondary mt-4 mb-3">Enviar</button>
            </div>
          </form>
        </div>

        <!-- Right Column - Placeholder for future content (if any) -->
        <div class="col-md-6">
          <!-- Puedes agregar contenido adicional aquí si es necesario -->
        </div>
      </div>

    </div>
    <!-- End of Content -->

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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/assets/demo/chart-area-demo.js"></script>
<script src="${pageContext.request.contextPath}/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>

<!-- Script para mostrar la alerta -->
<script>
  function mostrarAlerta(event) {
    event.preventDefault(); // Evitar el envío predeterminado del formulario

    alert("El formulario se completó exitosamente");

    // Redirigir después de la alerta
    window.location.href = "${pageContext.request.contextPath}/Albergue.jsp";
  }
</script>
</body>
</html>
