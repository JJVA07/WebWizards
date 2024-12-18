<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Mi Cuenta</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: white;">
<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Perfil</h1>

                <div class="container-fluid mt-5">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Mi cuenta</h1>
                    </div>
                    <div id="account-info">
                        <h3>Información Actual</h3>
                        <!-- Mostrar información del usuario -->
                        <p><strong>Nombre:</strong> ${coordinador.nombre}</p>
                        <p><strong>Apellido:</strong> ${coordinador.apellido}</p>
                        <p><strong>Edad:</strong> ${coordinador.edad}</p>
                        <p><strong>Celular:</strong> ${coordinador.telefono}</p>
                        <p><strong>Correo:</strong> ${coordinador.correo}</p>
                    </div>

                    <button type="button" id="edit-info-btn" class="btn btn-secondary mt-3 mb-3" onclick="redirectToEditPage()">Editar Información</button>
                </div>
            </div>
        </main>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white;">© Huella Viva</div>
                    <div>
                        <span style="color: white;">Correo:</span>
                        <a href="mailto:info@alberguegosu.com" style="color: white;">info@alberguegosu.com</a>
                        <div></div>
                        <span style="color: white;">Teléfono:</span>
                        <a href="tel:+1234567890" style="color: white;">+123 456 7890</a>
                        <div></div>
                        <span style="color: white;">Ubicación:</span>
                        <span style="color: white;">Calle Ejemplo 123, Ciudad, País</span>
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
