<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Evento</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: #581925;">
    <a class="navbar-brand ps-3" href="Albergue.jsp">Albergue</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
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
                            <a class="nav-link" href="Adopciones_publicaciones.jsp">Adopciones</a>
                            <a class="nav-link" href="Donaciones_publicaciones.jsp">Donaciones</a>
                            <a class="nav-link" href="Hogares_publicaciones.jsp">Hogares Temporales</a>
                            <a class="nav-link active" href="Eventos_publicaciones.jsp">Eventos Benéficos</a>
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
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Pataton 2024</h1>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <h4>Información general</h4>
                    <ul>
                        <li><strong>Nombre del evento:</strong> <span id="nombreEvento"></span></li>
                        <li><strong>Fecha del evento:</strong> <span id="fechaEvento"></span></li>
                        <li><strong>Hora del evento:</strong> <span id="horaEvento"></span></li>
                        <li><strong>Lugar del evento:</strong> <span id="lugarEvento"></span></li>
                        <li><strong>Aforo:</strong> <span id="aforo"></span></li>
                        <li><strong>Organizador:</strong> <span id="organizador"></span></li>
                        <li><strong>Artistas Invitados:</strong> <span id="artistasInvitados"></span></li>
                        <li><strong>Costo:</strong> <span id="costo"></span></li>
                    </ul>

                    <h4>Para participar debes:</h4>
                    <ul>
                        <li>Solo tienes que pagar la entrada significativa que exclusivamente se usa para comprar cosas del albergue</li>
                        <li>El dinero se usara para ------(razon de evento)</li>
                    </ul>

                    <div class="d-flex justify-content-center">
                        <a href="#" class="btn btn-secondary mb-2 me-2">Compartir</a>
                        <a href="#" class="btn btn-secondary mb-2">Postular</a>
                    </div>
                </div>
                <div class="col-md-5 text-center">
                    <img src="<%= request.getContextPath() %>/assets/img/Evento2.jpeg" alt="Evento" class="img-fluid rounded" style="width: 80%;">
                </div>
            </div>
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

<script>
    const params = new URLSearchParams(window.location.search);
    document.getElementById("nombreEvento").innerText = params.get("nombreEvento") || "Patitas PUCP";
    document.getElementById("fechaEvento").innerText = params.get("fechaEvento") || "2024-12-12";
    document.getElementById("horaEvento").innerText = params.get("horaEvento") || "13:00";
    document.getElementById("lugarEvento").innerText = params.get("lugarEvento") || "PUCP";
    document.getElementById("aforo").innerText = params.get("aforo") || "Aforo";
    document.getElementById("organizador").innerText = params.get("organizador") || "Albergue Patitas";
    document.getElementById("artistasInvitados").innerText = params.get("artistasInvitados") || "Susy Díaz";
    document.getElementById("costo").innerText = params.get("costo") || "15";
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
