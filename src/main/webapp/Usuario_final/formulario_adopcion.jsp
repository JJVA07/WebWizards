<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64" %>
<%@ page import="com.example.webapphr1_2023.Beans.Mascotas" %>

<%
    Mascotas mascota = (Mascotas) request.getAttribute("mascota");
    String base64Image = "";
    if (mascota != null && mascota.getFoto() != null) {
        base64Image = Base64.getEncoder().encodeToString(mascota.getFoto());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Formulario Adopción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>
<div id="layoutSidenav">
    <!-- Incluir el sidebar común -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Formulario de Adopción</h1>
                <div class="row align-items-center">
                    <div class="col-lg-6 d-flex flex-column align-items-center">
                        <div class="card shadow-sm mb-3" style="width: 75%; border-radius: 15px; overflow: hidden;">
                            <% if (!base64Image.isEmpty()) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image %>" class="img-fluid" alt="Imagen del perro" />
                            <% } else { %>
                            <img src="<%= request.getContextPath() %>/assets/img/default-image.jpg" class="img-fluid" alt="Imagen no disponible" />
                            <% } %>
                        </div>
                        <div class="text-center p-3" style="background-color: rgb(200, 200, 200) !important; border-radius: 10px;">
                            <h5 class="mb-3"><strong>Descripción del perro</strong></h5>
                            <p style="text-align: justify; line-height: 1.6;">
                                <%= mascota != null ? mascota.getDescripcion() : "Descripción no disponible" %>
                                <br><br>
                                <strong>Edad:</strong> <%= mascota != null ? mascota.getEdad() : "N/A" %> años <br>
                                <strong>Género:</strong> <%= mascota != null ? mascota.getGenero() : "N/A" %>
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form action="<%= request.getContextPath() %>/procesar_adopcion" method="post" class="p-3 border rounded bg-light" style="background-color: rgb(200, 200, 200) !important;">
                            <!-- Formulario de adopción con los campos que has diseñado -->
                            <div class="form-group mb-3">
                                <button type="submit" class="btn btn-secondary btn-block w-100">Adoptar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a> <a href="#" style="color: white;">info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono:</a> <a href="#" style="color: white;">+123 456 7890</a>
                        <a style="color: white;">Ubicación:</a> <a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
