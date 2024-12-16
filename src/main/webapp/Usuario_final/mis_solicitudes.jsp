<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Mis Solicitudes</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed" style="background-color: white;">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
            <a class="navbar-brand ps-3" href="Home.html">Usuario Final</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="inicio_sesion.html">Cerrar Sesión</a></li>
                    </ul>
                </li>
                <a class="nav-link" href="home.html" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>

                    <% List<Object[]> solicitudes = (List<Object[]>) request.getAttribute("solicitudes"); %>
                    <div class="container-fluid">
                        <h2 class="mt-4 text-center">MIS SOLICITUDES</h2>
                        <div class="row justify-content-center mt-3">
                            <% for (Object[] solicitud : solicitudes) { %>
                            <div class="col-sm-12 col-md-6 col-lg-4 d-flex justify-content-center">
                                <div class="card mb-4" style="width: 100%;">
                                    <!-- Mostrar la imagen de la solicitud -->
                                    <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString((byte[]) solicitud[1]) %>"
                                         class="card-img-top img-fluid" alt="Foto de Lugar" style="height: 200px; object-fit: cover;">

                                    <div class="card-body">
                                        <h5 class="card-title">Estado: <%= (String) solicitud[0] %></h5>

                                        <div class="text-center">
                                            <!-- Condición para mostrar el botón adecuado según el estado -->
                                            <% if ("Aprobada".equals(solicitud[0])) { %>
                                            <a href="<%= request.getContextPath() %>//Usuario?action=mostrarSolicitud" class="btn inscribirse-btn d-inline-flex align-items-center">
                                                <i class="fas fa-info-circle" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                                <span style="color: #808080; font-size: 1.2rem;">Más detalles</span>
                                            </a>
                                            <% } else { %>
                                            <a href="editar_solicitud.html" class="btn btn-aprove">
                                                <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                            </a>
                                            <% } %>
                                            <a href="#" class="btn btn-trash eliminar-btn">
                                                <i class="fa-solid fa-trash" style="color: #e53434; font-size: 2rem;"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </main>
                <footer class="py-4 mt-auto" style="background-color: black;">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">© Huella Viva</div>
                            <div>
                                <a style="color: white;">Correo: </a><a href="#" style="color: white;">info@alberguegosu.com</a>
                                <a style="color: white;">Teléfono: </a><a href="#" style="color: white;">+123 456 7890</a>
                                <a style="color: white;">Ubicación: </a><a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            document.querySelectorAll('.eliminar-btn').forEach(button => {
                button.addEventListener('click', function (e) {
                    e.preventDefault();
                    Swal.fire({
                        title: '¿Estás seguro de eliminar?',
                        showDenyButton: true,
                        confirmButtonText: '<i class="fa-solid fa-check" style="color: #008000; font-size: 1.5rem;"></i>',
                        denyButtonText: '<i class="fa-solid fa-x" style="color: #e53434; font-size: 1.5rem;"></i>',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-light mx-2',
                            denyButton: 'btn btn-light mx-2'
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire('Eliminado!', '', 'success');
                        } else if (result.isDenied) {
                            Swal.fire('No se eliminó', '', 'info');
                        }
                    });
                });
            });
        </script>
    </body>
</html>
