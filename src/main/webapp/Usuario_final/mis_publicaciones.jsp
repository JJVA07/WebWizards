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
    <title>Mis Publicaciones</title>

    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">

<!-- Navbar -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/LoginServlet?action=logout">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <!-- Contenido -->
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 text-center">MIS PUBLICACIONES</h2>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item text-center">¡Aquí están tus publicaciones registradas!</li>
                </ol>

                <div class="row">
                    <%
                        List<Publicacion> publicaciones = (List<Publicacion>) request.getAttribute("publicaciones");
                        if (publicaciones != null && !publicaciones.isEmpty()) {
                            for (Publicacion publicacion : publicaciones) {
                                String base64Image = "";
                                if (publicacion.getFoto() != null) {
                                    base64Image = Base64.getEncoder().encodeToString(publicacion.getFoto());
                                }
                    %>
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <% if (!base64Image.isEmpty()) { %>
                            <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top" alt="Publicación">
                            <% } else { %>
                            <img src="<%= request.getContextPath() %>/assets/img/default-image.jpg" class="card-img-top" alt="Sin imagen">
                            <% } %>
                            <div class="card-body text-center">
                                <!-- Mostrar "No aplica" si el nombre es null -->
                                <h5 class="card-title">
                                    <%
                                        if (publicacion.getTipoPublicacion().getIdTipoPublicacion() == 1) {
                                            // Mascota Perdida
                                    %>
                                    <%= (publicacion.getNombre() != null && !publicacion.getNombre().trim().isEmpty())
                                            ? publicacion.getNombre()
                                            : "Nombre no especificado" %>
                                    <%
                                    } else if (publicacion.getTipoPublicacion().getIdTipoPublicacion() == 2) {
                                        // Denuncia
                                    %>
                                    <%= (publicacion.getNombreMaltratador() != null && !publicacion.getNombreMaltratador().trim().isEmpty())
                                            ? publicacion.getNombreMaltratador()
                                            : "Nombre del maltratador no especificado" %>
                                    <%
                                        }
                                    %>
                                </h5>



                                <p class="text-muted">Tipo: <%= publicacion.getTipoPublicacion().getNombre() %></p>
                                <p class="card-text"><%= publicacion.getDescripcion() %></p>
                                <div>
                                    <!-- Botón Editar -->
                                    <a href="<%= request.getContextPath() %>/Usuario?action=editarPublicacion&id=<%= publicacion.getIdPublicacion() %>"
                                       class="btn btn-warning btn-sm">
                                        <i class="fa-solid fa-pen-to-square"></i> Editar
                                    </a>

                                    <!-- Botón Eliminar -->
                                    <form method="post" action="<%= request.getContextPath() %>/Usuario?action=eliminarPublicacion"
                                          style="display:inline;" onsubmit="return confirm('¿Seguro que quieres eliminar esta publicación?');">
                                        <input type="hidden" name="idPublicacion" value="<%= publicacion.getIdPublicacion() %>">
                                        <button type="submit" class="btn btn-danger btn-sm">
                                            <i class="fa-solid fa-trash"></i> Eliminar
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="text-center">
                        <p>No tienes publicaciones registradas actualmente.</p>
                    </div>
                    <% } %>
                </div>

            </div>
        </main>

        <!-- Footer -->
        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a> info@alberguegosu.com
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
