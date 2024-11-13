<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background: white;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link active" id="navbarDropdown2" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>
<div id="layoutSidenav">
    <!-- Incluir el sidebar común -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 text-center">¡BIENVENIDO!</h1>
                <ol class="breadcrumb mb-4 text-center" style="display: flex; justify-content: center;">
                    <li class="breadcrumb-item active" style="color: black; text-align: center; width: 100%;">
                        Nos alegra que estés visitándonos. Te deseamos un grato acceso a nuestra página. Presentarás las siguientes funciones:
                    </li>
                </ol>
                <hr class="hr" />
            </div>
        </main>
        <div class="container">
            <div class="row justify-content-center">
                <!-- Card 1 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <a href="<%= request.getContextPath() %>/registrar_solicitud.jsp">
                            <img src="<%= request.getContextPath() %>/assets/img/hogar_temporal.png" class="card-img-top" alt="Solicitudes de Hogares Temporales"/>
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">HOGARES TEMPORALES</h5>
                            <p class="card-text">Nuestra plataforma presenta la opción de postular para ser un hogar temporal, ofreciendo un espacio seguro y acogedor para mascotas que necesiten un lugar temporal.</p>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <a href="<%= request.getContextPath() %>/noticias.jsp">
                            <img src="<%= request.getContextPath() %>/assets/img/publicaciones.png" class="card-img-top" alt="Verificación Publicaciones"/>
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">PUBLICACIONES</h5>
                            <p class="card-text">Nuestra plataforma permite realizar publicaciones sobre mascotas perdidas, ofreciendo la posibilidad de reportar y visualizar eventos para inscribirte.</p>
                        </div>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <a href="<%= request.getContextPath() %>/Usuario?action=adopcion">
                            <img src="<%= request.getContextPath() %>/assets/img/adopcion_icono_home.jpg" class="card-img-top" alt="Adopciones"/>
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">ADOPCIONES</h5>
                            <p class="card-text">Explora varias mascotas que buscan un hogar cálido y revisa los requisitos para darles una nueva oportunidad.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a> <a href="#" style="color: white;">info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono:</a> <a href="#" style="color: white;">+123 456 7890</a>
                        <a style="color: white;">Ubicación:</a> <a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
</body>
</html>
