<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Perritos felices</title>

    <!-- CSS externo de librerías y estilos locales -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/assets/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/assets/css/styles_2.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: white;">

<!-- Barra de navegación superior -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>

    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>

    <!-- Navbar-->
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" id="navbarDropdown" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: rgb(27, 94, 87)">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">MENU</div>
                    <!-- Menú colapsable -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                        <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar"></i></div>
                        Eventos
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="<%= request.getContextPath() %>/eventos.jsp">Eventos</a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/mis_eventos.jsp">Mis eventos</a>
                        </nav>
                    </div>

                    <!-- Otros enlaces de menú -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Publicaciones
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse show" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link active" href="<%= request.getContextPath() %>/noticias.jsp">Noticias</a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/mis_publicaciones.jsp">Mis Publicaciones</a>
                        </nav>
                    </div>

                    <!-- Más enlaces de menú -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTemporal" aria-expanded="false" aria-controls="collapseTemporal">
                        <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                        Dueño Temporal
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseTemporal" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="<%= request.getContextPath() %>/registrar_solicitud.jsp">Registrar Solicitud</a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/mis_solicitudes.jsp">Mis Solicitudes</a>
                        </nav>
                    </div>

                    <!-- Enlace directo -->
                    <a class="nav-link" href="<%= request.getContextPath() %>/adopcion.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                        Adopción
                    </a>
                </div>
            </div>
        </nav>
    </div>

    <div id="layoutSidenav_content">
        <main>
            <section class="container-fluid px-5">
                <h1 class="mt-5 text-center">ALBERGUE PERRITOS FELICES</h1>

                <div class="card mb-3 mt-4 w-100">
                    <div class="row g-0">
                        <div class="col-md-5 d-flex align-items-center justify-content-center">
                            <img src="<%= request.getContextPath() %>/assets/img/principal1.jpeg"
                                 class="img-fluid rounded-start"
                                 style="height: auto; width: 100%; object-fit: cover;">
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <h5 class="card-title">Sobre Nosotros</h5>
                                <p class="card-text">
                                    El Albergue Perritos Felices no solo se dedica a ofrecer refugio temporal a perros en situación de calle o abandono,
                                    sino que también trabaja incansablemente en la rehabilitación emocional y física de cada animal que llega.
                                </p>
                                <h5 class="card-title">¿Qué ofrecemos?</h5>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <strong>🐾 Adopciones responsables:</strong> Buscamos hogares donde las familias estén preparadas para asumir el compromiso que implica adoptar un animal con amor y cuidado.
                                    </li>
                                    <li class="mb-3">
                                        <strong>🤝 Voluntariado y acogida temporal:</strong> Si no puedes adoptar, ofrecemos oportunidades para que participes como voluntario o brindes una acogida temporal.
                                    </li>
                                    <li>
                                        <strong>❤️ Cuidado personalizado:</strong> Todos los perros reciben atención veterinaria de calidad, desde vacunación hasta tratamientos especializados si es necesario.
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="container p-3 mb-5" style="border: 1px solid rgb(158, 158, 158) !important; border-radius: 12px;">
                    <section class="row">
                        <div class="col-lg-4 col-md-12 mb-4 mb-lg-0">
                            <div class="card shadow-lg border-0 rounded" style="background-color: white;">
                                <div class="bg-image hover-overlay ripple rounded" data-ripple-color="light">
                                    <img src="<%= request.getContextPath() %>/assets/img/perritos_felices1.jpeg" class="w-100" style="height: 250px; object-fit: cover; border-radius: 12px;">
                                    <a href="#!" data-mdb-modal-init data-mdb-target="#exampleModal1">
                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2);"></div>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- Repetir para las demás imágenes -->
                    </section>
                </div>
            </section>

            <div class="text-center mt-4 mb-4">
                <a href="<%= request.getContextPath() %>/donar.jsp" class="btn btn-secondary">¿Donar?</a>
            </div>
        </main>

        <!-- Pie de página -->
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a><a href="#" style="color: white;"> info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;"> +123 456 7890</a>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;"> Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
</body>
</html>
