<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Base64" %>

<%
    List<Object[]> noticias = (List<Object[]>) request.getAttribute("noticias");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Noticias</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">

<!-- Navbar -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/LoginServlet?action=logout">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link " id="navbarDropdown2" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<!-- Sidebar -->
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <br>
                <h1 class="mt-4 text-center">Noticias</h1>
                <ol class="breadcrumb mb-4 d-flex justify-content-center align-items-center">
                    <li class="breadcrumb-item active" style="color: black;">
                        ¡En esta sección podrás estar informado con las últimas noticias sobre nosotros!
                    </li>
                </ol>

                <!-- Contenedor de Noticias -->
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <% if (noticias != null && !noticias.isEmpty()) { %>
                    <% for (Object[] noticia : noticias) { %>
                    <div class="col">
                        <div class="card h-100">
                            <%
                                String tipo = (String) noticia[0];
                                String titulo = (String) noticia[1];
                                java.sql.Date fecha = (java.sql.Date) noticia[2];
                                String descripcion = (String) noticia[3];
                                byte[] foto = (byte[]) noticia[4];
                            %>
                            <!-- Mostrar Imagen -->
                            <% if (foto != null) { %>
                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(foto) %>"
                                 class="card-img-top" style="height: 200px; object-fit: cover;" alt="Imagen">
                            <% } else { %>
                            <img src="<%= request.getContextPath() %>/assets/img/default.jpg" class="card-img-top" alt="Imagen no disponible">
                            <% } %>

                            <!-- Contenido de la Tarjeta -->
                            <div class="card-body text-center">
                                <h5 class="card-title"><%= titulo %> (<%= tipo %>)</h5>
                                <p class="card-text"><%= descripcion %></p>
                                <p class="card-text"><small class="text-muted">Fecha: <%= fecha %></small></p>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    <% } else { %>
                    <div class="col-12 text-center">
                        <p>No hay noticias disponibles en este momento.</p>
                    </div>
                    <% } %>
                </div>
            </div>
        </main>

        <!-- Footer -->
        <footer class="py-4 mt-auto bg-dark">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">&copy; Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a> <a href="mailto:info@alberguegosu.com" style="color: white;">info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono:</a> <a href="#" style="color: white;">+123 456 7890</a>
                        <a style="color: white;">Ubicación:</a> <a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
