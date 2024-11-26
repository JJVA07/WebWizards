<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapphr1_2023.Beans.Publicacion" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Detalles de la Mascota</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #ffffff;">
<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>
<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Detalles de la Mascota</h1>

                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <!-- Información de la mascota (Izquierda) -->
                            <div class="col-md-6">
                                <%
                                    Publicacion publicacion = (Publicacion) request.getAttribute("publicacionDetalles");
                                    if (publicacion != null) {
                                %>
                                <p><strong>Nombre:</strong> <%= publicacion.getNombre() %></p>
                                <p><strong>Edad:</strong> <%= publicacion.getEdad() %> años</p>
                                <p><strong>Raza:</strong> <%= publicacion.getRaza() %></p>
                                <p><strong>Tamaño:</strong> <%= publicacion.getTamano() %></p>
                                <p><strong>Contacto:</strong> <%= publicacion.getTelefono() %></p>
                                <p><strong>Distintivo:</strong> <%= publicacion.getDistintivo() %></p>
                                <p><strong>Lugar:</strong> <%= publicacion.getLugarPerdida() %></p>
                                <p><strong>Hora:</strong> <%= publicacion.getHoraPerdida() %></p>
                                <p><strong>Contacto Nombre:</strong> <%= publicacion.getNombreContacto() %></p>
                                <p><strong>Recompensa:</strong> <%= publicacion.getRecompensa() %></p>
                                <% } else { %>
                                <p class="text-danger">No se encontraron detalles para esta mascota.</p>
                                <% } %>
                            </div>
                            <!-- Imagen y descripción (Derecha) -->
                            <div class="col-md-6 text-center">
                                <%
                                    if (publicacion != null && publicacion.getFoto() != null) {
                                        // Convertir el array de bytes de la imagen a Base64
                                        String base64Image = Base64.getEncoder().encodeToString(publicacion.getFoto());
                                %>
                                <img id="imagen" class="img-fluid rounded mb-3"
                                     style="max-width: 300px; height: auto;"
                                     src="data:image/jpeg;base64,<%= base64Image %>"
                                     alt="Imagen de la mascota" />
                                <% } else { %>
                                <img id="imagen" class="img-fluid rounded mb-3"
                                     style="max-width: 300px; height: auto;"
                                     src="<%= request.getContextPath() %>/assets/img/default_mascota.jpg"
                                     alt="Imagen de la mascota" />
                                <% } %>

                                <!-- Recuadro para la descripción -->
                                <div class="border p-3 mt-3 rounded" style="background-color: #f8f9fa;">
                                    <h5>Descripción</h5>
                                    <p id="descripcion"><%= publicacion != null ? publicacion.getDescripcionAdicional() : "Sin descripción disponible" %></p>
                                </div>

                                <!-- Botones debajo de la imagen y la descripción -->
                                <div class="d-flex justify-content-center gap-5 mt-3">
                                    <button class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#modalCheck">
                                        <i class="fa-solid fa-check fa-2x"></i>
                                    </button>
                                    <button class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#modalRechazar">
                                        <i class="fa-solid fa-xmark fa-2x"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Contáctanos: Somos un albergue gosu...</div>
                    <div>
                        <a href="#" style="color: white;">Correo: info@alberguegosu.com</a>
                        <a href="#" style="color: white;">Teléfono: +123 456 7890</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script>
    function check() {
        alert("Mascota aprobada.");
    }

    function rechazar() {
        alert("Mascota rechazada.");
    }
</script>
</body>
</html>
