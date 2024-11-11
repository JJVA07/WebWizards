<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Albergue - Donacion</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <!-- Crear Publicación (Activa y Abierta) -->
                    <a class="nav-link collapsed active" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapseCrearPublicacion" aria-expanded="true" aria-controls="collapseCrearPublicacion">
                        <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                        Crear Publicación
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse show" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="Albergue_adopcion.jsp">Adopción</a>
                            <a class="nav-link active" href="Albergue_donacion.jsp">Donación</a>
                            <a class="nav-link" href="Albergue_eventos.jsp">Eventos Benéficos</a>
                        </nav>
                    </div>

                    <!-- Publicaciones (Colapsada) -->
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Publicaciones
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="Adopciones_publicaciones.jsp">Adopciones</a>
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
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Crear Publicación - Donacion</h1>
            </div>

            <!-- Formulario -->
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <form id="donation-form" action="Albergue.jsp" method="post" class="needs-validation" novalidate>
                                <div class="row">
                                    <!-- Primera columna -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="contacto-albergue" class="form-label">Teléfono de contacto del albergue:</label>
                                            <input type="number" id="contacto-albergue" name="contacto-albergue"
                                                   class="form-control" min="100000000" max="999999999999999"
                                                   title="Ingrese un número válido (9-15 dígitos)" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese un número de teléfono válido (9-15 dígitos).
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="nombre-contacto" class="form-label">Nombre de contacto del albergue:</label>
                                            <input type="text" id="nombre-contacto" name="nombre-contacto"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese el nombre de contacto.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="punto-evento" class="form-label">Punto de eventos de donaciones:</label>
                                            <input type="text" id="punto-evento" name="punto-evento"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese el punto de evento.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="tipo-donacion" class="form-label">Tipos de donaciones:</label>
                                            <input type="text" id="tipo-donacion" name="tipo-donacion"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese los tipos de donaciones.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Segunda columna -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="cantidad-donaciones" class="form-label">Cantidad de donaciones:</label>
                                            <input type="number" id="cantidad-donaciones" name="cantidad-donaciones"
                                                   class="form-control" min="1" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese una cantidad válida.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="dinero-uso" class="form-label">Dinero (especificar en qué se usará):</label>
                                            <input type="text" id="dinero-uso" name="dinero-uso"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor especifique el uso del dinero.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="fechas-recepcion" class="form-label">Fechas programadas para recepción:</label>
                                            <input type="date" id="fechas-recepcion" name="fechas-recepcion"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor seleccione una fecha válida.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="horas-recepcion" class="form-label">Horas programadas para recepción:</label>
                                            <input type="time" id="horas-recepcion" name="horas-recepcion"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor seleccione una hora válida.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Botón Enviar -->
                                <div class="form-group mt-3 text-center">
                                    <button type="submit" class="btn btn-secondary">Enviar</button>
                                </div>
                            </form>
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
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>

<!-- Script para mostrar alerta -->
<script>
    function mostrarAlerta(event) {
        if (!event.target.checkValidity()) {
            return false;
        }
        alert("Formulario enviado exitosamente");
        return true;
    }
</script>
</body>
</html>
