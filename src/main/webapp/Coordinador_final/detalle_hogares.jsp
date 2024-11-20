<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Detalle Hogares Aprobados</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #ffffff;">
<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>
<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_cordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Detalles del Hogar Aprobado</h1>
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <!-- Información del hogar -->
                            <div class="col-md-6">
                                <p><strong>Nombre:</strong> <%= request.getParameter("nombre") != null ? request.getParameter("nombre") : "N/A" %></p>
                                <p><strong>Apellido:</strong> <%= request.getParameter("apellido") != null ? request.getParameter("apellido") : "N/A" %></p>
                                <p><strong>Edad:</strong> <%= request.getParameter("edad") != null ? request.getParameter("edad") : "N/A" %></p>
                                <p><strong>Género:</strong> <%= request.getParameter("genero") != null ? request.getParameter("genero") : "N/A" %></p>
                                <p><strong>Celular:</strong> <%= request.getParameter("celular") != null ? request.getParameter("celular") : "N/A" %></p>
                                <p><strong>Dirección:</strong> <%= request.getParameter("direccion") != null ? request.getParameter("direccion") : "N/A" %></p>
                                <p><strong>Distrito:</strong> <%= request.getParameter("distrito") != null ? request.getParameter("distrito") : "N/A" %></p>
                                <p><strong>Metraje:</strong> <%= request.getParameter("metraje") != null ? request.getParameter("metraje") : "N/A" %> m²</p>
                            </div>
                            <!-- Fotos -->
                            <div class="col-md-6 text-center">
                                <img src="<%= request.getContextPath() %>/assets/img/hogar_default.jpg" class="img-fluid rounded mb-3" alt="Imagen del Hogar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Contáctanos: info@alberguegosu.com</div>
                    <div>Teléfono: +123 456 7890</div>
                </div>
            </div>
        </footer>
    </div>
</div>
</body>
</html>
