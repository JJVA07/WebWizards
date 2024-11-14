<%@ page import="com.example.webapphr1_2023.Beans.Postulacion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Postulacion postulacion = (Postulacion) request.getAttribute("postulacion");
%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Ver Solicitud</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body class="sb-nav-fixed" style="background-color: white;">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="Home.jsp">Usuario Final</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="mi_cuenta.jsp">Mi cuenta</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="inicio_sesion.jsp">Cerrar Sesión</a></li>
                    </ul>
                </li>
                <a class="nav-link" id="navbarDropdown" href="home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <!-- Inclusión del sidebar -->
                <jsp:include page="/WEB-INF/sidebar.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-3">
                        <h1 class="text-center mb-3">Detalles de Solicitud</h1>
                        <form class="p-4 border rounded bg-light mx-auto mb-4" style="width: 100%; max-width: 1800px; background-color: rgb(200, 200, 200) !important;">
                            <div class="row">
                                <!-- Primera columna -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre:</label>
                                        <input type="text" id="nombre" class="form-control" value="<%= postulacion.getNombre() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="apellido" class="form-label">Apellido:</label>
                                        <input type="text" id="apellido" class="form-control" value="<%= postulacion.getApellido() %>" readonly>
                                    </div>

                                    <div class="mb-3 row">
                                        <div class="col-md-6">
                                            <label for="genero" class="form-label">Género:</label>
                                            <input type="text" id="genero" class="form-control" value="<%= postulacion.getGenero() %>" readonly>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="edad" class="form-label">Edad:</label>
                                            <input type="text" id="edad" class="form-control" value="<%= postulacion.getEdad() %>" readonly>
                                        </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="persona_referencial" class="form-label">Persona Referencial:</label>
                                        <input type="text" id="persona_referencial" class="form-control" value="<%= postulacion.getPersonaReferencia() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="metraje" class="form-label">Metraje de Vivienda (m²):</label>
                                        <input type="text" id="metraje" class="form-control" value="<%= postulacion.getMetrajeVivienda() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="mascotas" class="form-label">Tipo de Mascotas:</label>
                                        <input type="text" id="mascotas" class="form-control" value="<%= postulacion.getTipoMascotas() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="cuartos" class="form-label">Cantidad de Cuartos:</label>
                                        <input type="text" id="cuartos" class="form-control" value="<%= postulacion.getCantidadCuartos() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="fecha_inicio" class="form-label">Fecha de Inicio:</label>
                                        <input type="text" id="fecha_inicio" class="form-control" value="<%= postulacion.getFechaInicioTemporal() %>" readonly>
                                    </div>
                                </div>

                                <!-- Segunda columna -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="vivienda" class="form-label">¿Vive solo o con dependientes?</label>
                                        <input type="text" id="vivienda" class="form-control" value="<%= postulacion.getViveConDependientes() ? "Con dependientes" : "Solo" %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="trabajo" class="form-label">¿Trabaja remoto o presencial?</label>
                                        <input type="text" id="trabajo" class="form-control" value="<%= postulacion.getTrabajaRemoto() ? "Remoto" : "Presencial" %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="mascota" class="form-label">¿Tiene mascota?</label>
                                        <input type="text" id="mascota" class="form-control" value="<%= postulacion.getTieneMascotas() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="hijos" class="form-label">¿Tiene hijos?</label>
                                        <input type="text" id="hijos" class="form-control" value="<%= postulacion.getTieneHijos() ? "Sí" : "No" %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="celular_personal" class="form-label">Celular Personal:</label>
                                        <input type="text" id="celular_personal" class="form-control" value="<%= postulacion.getCelular() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="celular_referencia" class="form-label">Celular de Referencia:</label>
                                        <input type="text" id="celular_referencia" class="form-control" value="<%= postulacion.getTelefonoReferencia() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="direccion" class="form-label">Dirección:</label>
                                        <input type="text" id="direccion" class="form-control" value="<%= postulacion.getDireccion() %>" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="fecha_fin" class="form-label">Fecha de Fin:</label>
                                        <input type="text" id="fecha_fin" class="form-control" value="<%= postulacion.getFechaFinTemporal() %>" readonly>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </main>
                <footer class="py-4 mt-auto mt-3" style="background-color: black;">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                            <div>
                                <a style="color: white;">Correo: </a> <a href="#" style="color: white;">info@alberguegosu.com</a>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
    </body>
</html>

<script>
    document.querySelector('.postular-btn').addEventListener('click', function (e) {
        e.preventDefault(); // Evita el envío inmediato del formulario

        const form = document.querySelector('#postulacionForm');

        // Verifica si el formulario es válido
        if (form.checkValidity()) {
            Swal.fire({
                title: '¿Estás seguro de tu postulación?',
                showDenyButton: true,
                showCancelButton: false,
                confirmButtonText: '<i class="fa-solid fa-check" style="color: #008000; font-size: 1.5rem;"></i>',
                denyButtonText: '<i class="fa-solid fa-x" style="color: #e53434; font-size: 1.5rem;"></i>',
                buttonsStyling: false,
                customClass: {
                    confirmButton: 'btn btn-light mx-2',
                    denyButton: 'btn btn-light mx-2'
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Se envió la postulación',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-success'
                        }
                    }).then(() => {
                        // Redirige a la nueva página después del envío
                        window.location.href = "registrar_solicitud.jsp";
                    });
                } else if (result.isDenied) {
                    Swal.fire({
                        title: 'No se envió la postulación',
                        icon: 'info',
                        confirmButtonText: 'OK',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-secondary'
                        }
                    });
                }
            });
        } else {
            // Si el formulario no es válido, muestra los mensajes de error del navegador
            form.reportValidity();
        }
    });
</script>
