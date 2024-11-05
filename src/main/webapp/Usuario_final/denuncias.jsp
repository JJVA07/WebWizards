<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Denuncias</title>

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
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>

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

<!-- Layout principal con la barra lateral -->
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: rgb(27, 94, 87)">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">MENU</div>
                    <!-- Enlaces de menú colapsables -->
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

                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Publicaciones
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="<%= request.getContextPath() %>/noticias.jsp">Noticias</a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/mis_publicaciones.jsp">Mis Publicaciones</a>
                        </nav>
                    </div>

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

                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDonaciones" aria-expanded="false" aria-controls="collapseDonaciones">
                        <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                        Donaciones
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseDonaciones" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="<%= request.getContextPath() %>/donar.jsp">Donar</a>
                            <a class="nav-link" href="<%= request.getContextPath() %>/mis_donaciones.jsp">Mis Donaciones</a>
                        </nav>
                    </div>

                    <a class="nav-link active" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCrearPublicacion" aria-expanded="true" aria-controls="collapseCrearPublicacion">
                        <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                        Crear Publicación
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse show" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="<%= request.getContextPath() %>/mascotas_perdidas.jsp">Mascotas Perdidas</a>
                            <a class="nav-link active" href="<%= request.getContextPath() %>/denuncias.jsp">Denuncias</a>
                        </nav>
                    </div>

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
            <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100">
                <div class="col-lg-10">
                    <h1 class="mt-4 text-center">¡Tu voz puede marcar la diferencia!</h1>
                    <form action="<%= request.getContextPath() %>/procesar_denuncia.jsp" method="post" class="p-4 border rounded bg-light mx-auto mb-4"
                          style="width: 100%; max-width: 1600px; background-color: rgb(200, 200, 200) !important;">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="nombre_maltratador" class="form-label">Nombre del Maltratador:</label>
                                <input type="text" id="nombre_maltratador" name="nombre_maltratador" class="form-control" required>
                            </div>
                            <div class="col-md-6">
                                <label for="tipo_maltrato" class="form-label">Tipo de Maltrato:</label>
                                <input type="text" id="tipo_maltrato" name="tipo_maltrato" class="form-control" required>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="tamano_mascota" class="form-label">Tamaño de la Mascota:</label>
                                <select id="tamano_mascota" name="tamano_mascota" class="form-control" required>
                                    <option value="">Seleccionar...</option>
                                    <option value="pequeño">Pequeño</option>
                                    <option value="mediano">Mediano</option>
                                    <option value="grande">Grande</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="raza_mascota" class="form-label">Raza de la Mascota:</label>
                                <input type="text" id="raza_mascota" name="raza_mascota" class="form-control" required>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="direccion_maltrato" class="form-label">Dirección del Animal Maltratado:</label>
                            <input type="text" id="direccion_maltrato" name="direccion_maltrato" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label>¿Se ha realizado denuncia policial?</label><br>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="denuncia_policial" id="denuncia_si" value="si" required>
                                <label class="form-check-label" for="denuncia_si">Sí</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="denuncia_policial" id="denuncia_no" value="no">
                                <label class="form-check-label" for="denuncia_no">No</label>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="informacion_extra" class="form-label">Información Extra:</label>
                            <textarea id="informacion_extra" name="informacion_extra" class="form-control" rows="3"></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="archivo" class="form-label">Subir Archivo (Imagen o Video):</label>
                            <input type="file" id="archivo" name="archivo" class="form-control" accept="image/*,video/*" required>
                        </div>

                        <div class="form-group d-flex justify-content-center">
                            <button type="submit" class="btn btn-danger" style="padding: 12px 24px; font-size: 1.1rem;">
                                Denunciar
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
