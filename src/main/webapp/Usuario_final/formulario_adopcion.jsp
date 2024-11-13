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
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal">Cerrar Sesión</a></li>
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
                        <form action="<%= request.getContextPath() %>/Usuario?action=adoptarMascota" method="post" class="p-3 border rounded bg-light" style="background-color: rgb(200, 200, 200) !important;">
                            <!-- Campo oculto para el ID de la mascota -->
                            <input type="hidden" name="idMascota" value="<%= request.getParameter("id") %>">

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="nombre" class="form-label">Nombre:</label>
                                    <input type="text" id="nombre" name="Nombre" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="apellido" class="form-label">Apellido:</label>
                                    <input type="text" id="apellido" name="Apellido" class="form-control" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="genero" class="form-label">Género:</label>
                                    <select id="genero" name="Genero" class="form-control" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="Masculino">Masculino</option>
                                        <option value="Femenino">Femenino</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="edad" class="form-label">Edad:</label>
                                    <input type="number" id="edad" name="Edad" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="direccion" class="form-label">Dirección:</label>
                                <input type="text" id="direccion" name="Direccion" class="form-control" required>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="metraje" class="form-label">Metraje de Vivienda:</label>
                                    <input type="number" id="metraje" name="metraje_vivienda" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="cuartos" class="form-label">Cantidad de Cuartos:</label>
                                    <input type="number" id="cuartos" name="cantidad_cuartos" class="form-control" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="celular_personal" class="form-label">Celular Personal:</label>
                                    <input type="tel" id="celular_personal" name="celular" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="celular_referencia" class="form-label">Celular de Referencia:</label>
                                    <input type="tel" id="celular_referencia" name="telefono_referencia" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>¿Vive solo o con dependientes?</label><br>
                                    <select name="vive_con_dependientes" class="form-control" required>
                                        <option value="false">Solo</option>
                                        <option value="true">Con dependientes</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>¿Trabaja remoto o presencial?</label><br>
                                    <select name="trabaja_remoto" class="form-control" required>
                                        <option value="true">Remoto</option>
                                        <option value="false">Presencial</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label>¿Tiene mascotas?</label><br>
                                    <select name="Tiene_mascotas" class="form-control" required>
                                        <option value="true">Sí</option>
                                        <option value="false">No</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label>¿Tiene hijos?</label><br>
                                    <select name="tiene_hijos" class="form-control" required>
                                        <option value="true">Sí</option>
                                        <option value="false">No</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group d-flex justify-content-center">
                                <input type="submit" class="btn btn-secondary btn-block w-100">
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
