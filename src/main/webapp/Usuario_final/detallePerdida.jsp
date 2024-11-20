<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Detalles de Pérdida</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="Home.html">Usuario Final</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="mi_cuenta.html">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="inicio_sesion.html">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" id="navbarDropdown" href="home.html" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-5">
                <h1 class="mt-5 text-center">¡Perrito perdido!</h1>
                <div class="card mb-3 mt-4 w-100">
                    <div class="row g-0">
                        <!-- Columna de la imagen -->
                        <div class="col-md-5 d-flex flex-column align-items-center justify-content-center">
                            <img src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode((byte[])request.getAttribute("publicacion.foto"))) %>"
                                 class="img-fluid rounded-start" style="height: auto; width: 100%; object-fit: cover;">
                            <div class="card-body text-center">
                                <h5 class="card-title">Recompensa</h5>
                                <p class="card-text">s/. <%= request.getAttribute("publicacion.recompensa") %></p>
                                <h5 class="card-title">Fecha de pérdida</h5>
                                <p class="card-text"><%= request.getAttribute("publicacion.horaPerdida") %></p>
                            </div>
                        </div>

                        <!-- Columna del texto -->
                        <div class="col-md-7">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5 class="card-title">Nombre de la mascota</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.nombre") %></p>
                                        <h5 class="card-title">Lugar de pérdida</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.lugarPerdida") %></p>
                                        <h5 class="card-title">Nombre de contacto</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.nombreContacto") %></p>
                                        <h5 class="card-title">Número de contacto</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.telefono") %></p>
                                    </div>
                                    <div class="col-md-6">
                                        <h5 class="card-title">Distintivo</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.distintivo") %></p>
                                        <h5 class="card-title">Descripción de la mascota</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.descripcion") %></p>
                                        <h5 class="card-title">Descripción adicional</h5>
                                        <p class="card-text"><%= request.getAttribute("publicacion.descripcionAdicional") %></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a> <a href="#" style="color: white;"> info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;"> +123 456 7890</a>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;"> Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../assets/demo/chart-area-demo.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
   </body>
</html>
