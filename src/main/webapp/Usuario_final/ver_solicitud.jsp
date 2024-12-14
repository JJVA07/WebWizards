<%@ page import="java.util.Base64" %>
<%@ page import="com.example.webapphr1_2023.Beans.Postulacion" %>
<%@ page import="com.example.webapphr1_2023.Beans.Mascotas" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Postulacion postulacion = (Postulacion) request.getAttribute("postulacion");
    Mascotas mascota = (postulacion != null) ? postulacion.getMascota() : null;
%>
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

    <body class="sb-nav-fixed" style="background-color: white;">
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
                <a class="nav-link " id="navbarDropdown2" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="/WEB-INF/sidebar.jsp" />
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-4">
                        <h1 class="text-center mb-4">Detalles de la Solicitud</h1>
                        <% if (postulacion != null) { %>
                        <div class="card mb-4 shadow-sm">
                            <div class="card-header">
                                <h5>Postulación </h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <!-- Información Principal -->
                                    <div class="col-md-6">
                                        <p><strong>Cantidad de Cuartos:</strong> <%= postulacion.getCantidadCuartos() %></p>
                                        <p><strong>Metraje de Vivienda:</strong> <%= postulacion.getMetrajeVivienda() %> m²</p>
                                        <p><strong>Cantidad de Mascotas:</strong> <%= postulacion.getCantidadMascotas() %></p>
                                        <p><strong>Tipo de Mascotas:</strong> <%= postulacion.getTipoMascotas() %></p>
                                        <p><strong>¿Tiene Hijos?:</strong> <%= postulacion.getTieneHijos() ? "Sí" : "No" %></p>
                                        <p><strong>¿Vive con Dependientes?:</strong> <%= postulacion.getViveConDependientes() ? "Sí" : "No" %></p>
                                        <p><strong>¿Trabaja Remoto?:</strong> <%= postulacion.getTrabajaRemoto() ? "Sí" : "No" %></p>
                                        <p><strong>Dirección:</strong> <%= postulacion.getDireccion() %></p>

                                        <!-- Fechas y temporalidad debajo de Dirección -->
                                        <p><strong>Tiempo Temporal:</strong> <%= postulacion.getTiempoTemporal() %> días</p>
                                        <p><strong>Fecha de Inicio:</strong> <%= postulacion.getFechaInicioTemporal() %></p>
                                        <p><strong>Fecha de Fin:</strong> <%= postulacion.getFechaFinTemporal() %></p>
                                        <p><strong>Visita Inopinada:</strong> Sí</p>
                                    </div>

                                    <!-- Información de la Mascota -->
                                    <div class="col-md-6">
                                        <h6>Información de la Mascota</h6>
                                        <% if (mascota != null) { %>
                                        <p><strong>Nombre:</strong> <%= mascota.getNombreMascota() %></p>
                                        <p><strong>Raza:</strong> <%= mascota.getRaza() %></p>
                                        <p><strong>Edad:</strong> <%= mascota.getEdad() %> años</p>
                                        <p><strong>Género:</strong> <%= mascota.getGenero() %></p>
                                        <p><strong>Descripción:</strong> <%= mascota.getDescripcion() %></p>
                                        <p><strong>Comentario del Coordinador:</strong> <%= mascota.getComentarioCoordinador() %></p>

                                        <!-- Imagen más grande -->
                                        <% if (mascota.getFoto() != null) {
                                            String base64Image = Base64.getEncoder().encodeToString(mascota.getFoto());
                                        %>
                                        <img src="data:image/png;base64,<%= base64Image %>" class="img-thumbnail"
                                             alt="Foto Mascota" style="max-width: 200px; max-height: 400px;">
                                        <% } else { %>
                                        <p>No hay foto disponible</p>
                                        <% } %>
                                        <% } else { %>
                                        <p>No hay información de la mascota disponible.</p>
                                        <% } %>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <% } else { %>
                        <!-- Mensaje si no hay detalles -->
                        <div class="alert alert-warning text-center" role="alert">
                            No se encontró la solicitud seleccionada.
                        </div>
                        <% } %>
                    </div>
                </main>
                <footer class="py-4 mt-auto" style="background-color: black;">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">© Huella Viva</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </body>
</html>
