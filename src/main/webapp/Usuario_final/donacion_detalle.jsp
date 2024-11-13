<%@ page import="com.example.webapphr1_2023.Beans.Donaciones" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Detalle de Donación</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    </head>
    <body class="sb-nav-fixed" style="background-color: white;">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
            <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
                    </ul>
                </li>
                <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Detalles de la Donación</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-info-circle me-1"></i>
                                Información Detallada
                            </div>
                            <div class="card-body">
                                <%
                                    Donaciones donacion = (Donaciones) request.getAttribute("donacion");
                                    if (donacion != null) {
                                %>
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <h5><strong>Fecha de Entrega:</strong></h5>
                                        <p><%= donacion.getFechaEntrega() != null ? donacion.getFechaEntrega() : "No especificada" %></p>
                                    </div>
                                    <div class="col-md-4">
                                        <h5><strong>Tipo de Donación:</strong></h5>
                                        <p><%= donacion.getTipoDonacion() != null ? donacion.getTipoDonacion() : "No especificado" %></p>
                                    </div>
                                    <div class="col-md-4">
                                        <h5><strong>Nombre del Producto:</strong></h5>
                                        <p><%= donacion.getMarca() != null ? donacion.getMarca() : "No especificado" %></p>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-md-4">
                                        <h5><strong>Cantidad:</strong></h5>
                                        <p><%= donacion.getCantidadDonacion() != null ? donacion.getCantidadDonacion() : "No especificado" %></p>
                                    </div>
                                    <div class="col-md-8">
                                        <h5><strong>Lugar de Entrega:</strong></h5>
                                        <p><%= donacion.getPuntoEntrega() != null ? donacion.getPuntoEntrega() : "No especificado" %></p>
                                    </div>
                                </div>
                                <% } else { %>
                                <p>No se encontró información sobre esta donación.</p>
                                <% } %>
                                <div class="d-flex justify-content-end">
                                    <a href="javascript:history.back()" class="btn btn-secondary me-2">Volver</a>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath() %>/js/scripts.js"></script>
    </body>
</html>
