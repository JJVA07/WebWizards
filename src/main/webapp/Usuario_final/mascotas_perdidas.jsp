<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Formulario Mascotas Perdidas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">

<!-- Navbar permanece como estaba -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <!-- Inclusión del Sidebar -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100 mb-4">
                <div class="col-lg-10">
                    <h1 class="mt-4 text-center">¡No te rindas, tu compañero te está esperando!</h1>
                    <form action="<%= request.getContextPath() %>/procesar_reportar.jsp" method="post" class="p-4 border rounded bg-light mx-auto mb-4" style="width: 100%; max-width: 1600px; background-color: rgb(200, 200, 200) !important;" enctype="multipart/form-data">
                        <!-- Formulario Aquí -->
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="nombre" class="form-label">Nombre de la Mascota:</label>
                                <input type="text" id="nombre" name="nombre" class="form-control" pattern="[A-Za-z\s]+" required>
                            </div>
                            <div class="col-md-6">
                                <label for="edad" class="form-label">Edad:</label>
                                <input type="number" id="edad" name="edad" class="form-control" min="0" required>
                            </div>
                        </div>
                        <!-- Continúa el formulario... -->
                        <div class="form-group d-flex justify-content-center">
                            <button type="submit" class="btn btn-danger" style="padding: 12px 24px; font-size: 1.1rem;">
                                Reportar
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a><a href="#" style="color: white;">info@alberguegosu.com</a>
                        <div></div>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;">+123 456 7890</a>
                        <div></div>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
