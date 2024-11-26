<%@ page import="java.util.Base64" %>
<%@ page import="com.example.webapphr1_2023.Beans.Eventos" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("paginaActiva", "eventos");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Eventos</title>

    <!-- CSS externo de librerías y estilos locales -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: white;">

<!-- Barra de navegación superior -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/Usuario?action=home">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>

    <!-- Navegación de usuario -->
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user fa-fw"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=logout">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" id="navbarDropdown" href="<%= request.getContextPath() %>/Usuario?action=home" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<!-- Layout principal con la barra lateral -->
<div id="layoutSidenav">
    <!-- Incluir el sidebar común -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 text-center">NUESTROS EVENTOS</h2>
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <!-- Generar dinámicamente las tarjetas de eventos -->
                    <%
                        List<Eventos> eventos = (List<Eventos>) request.getAttribute("eventos");
                        if (eventos != null && !eventos.isEmpty()) {
                            for (Eventos evento : eventos) {
                                String encodedImage = evento.getFoto() != null
                                        ? Base64.getEncoder().encodeToString(evento.getFoto())
                                        : null;
                    %>
                    <div class="col d-flex justify-content-center">
                        <div class="card" style="width: 25rem;">
                            <img src="<%= encodedImage != null ? "data:image/jpeg;base64," + encodedImage : request.getContextPath() + "/assets/img/placeholder.png" %>"
                                 class="card-img-top" alt="<%= evento.getNombreEvento() %>" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title"><%= evento.getNombreEvento() %></h5>
                                <p class="card-text"><%= evento.getDescripcion() %></p>
                                <a href="<%= request.getContextPath() %>/Usuario?action=detallesEvento&idEvento=<%= evento.getIdEventos() %>" class="btn btn-primary">Más detalles</a>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="text-center mt-4">
                        <p>No hay eventos disponibles en este momento.</p>
                    </div>
                    <%
                        }
                    %>
                </div>

                <!-- Paginación -->
                <nav aria-label="Page navigation" class="mt-4">
                    <ul class="pagination justify-content-center">
                        <%
                            Integer paginaActual = (Integer) request.getAttribute("paginaActual");
                            Integer totalPaginas = (Integer) request.getAttribute("totalPaginas");
                            if (paginaActual != null && totalPaginas != null) {
                        %>
                        <li class="page-item <%= paginaActual == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="<%= request.getContextPath() %>/Usuario?action=eventos&pagina=<%= paginaActual - 1 %>">Anterior</a>
                        </li>
                        <%
                            for (int i = 1; i <= totalPaginas; i++) {
                        %>
                        <li class="page-item <%= paginaActual == i ? "active" : "" %>">
                            <a class="page-link" href="<%= request.getContextPath() %>/Usuario?action=eventos&pagina=<%= i %>"><%= i %></a>
                        </li>
                        <%
                            }
                        %>
                        <li class="page-item <%= paginaActual == totalPaginas ? "disabled" : "" %>">
                            <a class="page-link" href="<%= request.getContextPath() %>/Usuario?action=eventos&pagina=<%= paginaActual + 1 %>">Siguiente</a>
                        </li>
                        <%
                            }
                        %>
                    </ul>
                </nav>
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

<!-- Archivos JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
