<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webapphr1_2023.Beans.Publicacion" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Mis Publicaciones</title>

    <!-- CSS externo de librerías y estilos locales -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: white;">

<!-- Barra de navegación superior -->
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
        <a class="nav-link" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<!-- Layout principal con la barra lateral -->
<div id="layoutSidenav">

    <!-- Incluir el sidebar común -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 text-center">MIS PUBLICACIONES</h2>
                <ol class="breadcrumb mb-4 d-flex justify-content-center align-items-center">
                    <li class="breadcrumb-item active" style="color: black; text-align: center;">
                        ¡Aquí están tus publicaciones registradas!
                    </li>
                </ol>

                <!-- Contenido dinámico de publicaciones -->
                <div class="row">
                    <%
                        List<Publicacion> publicaciones = (List<Publicacion>) request.getAttribute("publicaciones");
                        if (publicaciones != null && !publicaciones.isEmpty()) {
                            for (Publicacion publicacion : publicaciones) {
                                String base64Image = "";
                                if (publicacion.getFoto() != null) { // Verifica que Foto no sea null
                                    base64Image = Base64.getEncoder().encodeToString(publicacion.getFoto());
                                }
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <% if (!base64Image.isEmpty()) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top img-fluid" alt="<%= publicacion.getNombre() %>" style="height: 200px; object-fit: cover;">
                            <% } else { %>
                            <img src="<%= request.getContextPath() %>/path/to/default-image.jpg" class="card-img-top img-fluid" alt="Imagen no disponible">
                            <% } %>
                            <div class="card-body text-center">
                                <h5 class="card-title"><%= publicacion.getNombre() %></h5>
                                <p class="text-muted"><strong>Tipo:</strong> <%= publicacion.getTipoPublicacion().getNombre() %></p>
                                <p class="card-text"><%= publicacion.getDescripcion() %></p>
                                <div class="text-center">
                                    <a href="<%= request.getContextPath() %>/editar_publicacion.jsp?id=<%= publicacion.getIdPublicacion() %>" class="btn btn-aprove">
                                        <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                    </a>
                                    <a href="#" class="btn btn-trash eliminar-btn" data-id="<%= publicacion.getIdPublicacion() %>">
                                        <i class="fa-solid fa-trash" style="color: #e53434; font-size: 2rem;"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <p class="text-center">No tienes publicaciones registradas en este momento.</p>
                    <% } %>
                </div>
            </div>
        </main>

        <!-- Pie de página -->
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a><a href="#" style="color: white;"> info@alberguegosu.com</a>
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

<!-- Archivos JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
</body>
</html>
