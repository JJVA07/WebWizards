<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Mi cuenta</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/navbar_albergue.jsp" %>
<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_albergue.jsp" %>
    <div id="layoutSidenav_content">
        <div class="container-fluid mt-5">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Mi cuenta</h1>
            </div>
            <div id="account-info">
                <h3>Información Actual</h3>
                <p><strong>Nombre del Albergue:</strong> ${albergue.nombreAlbergue}</p>
                <p><strong>Encargado:</strong> ${albergue.nombre}</p>
                <p><strong>Teléfono:</strong> ${albergue.telefono}</p>
                <p><strong>Distrito:</strong> ${albergue.distrito.nombre}</p>
                <p><strong>Dirección:</strong> ${albergue.direccion}</p>
                <p><strong>Punto de acopio de donaciones:</strong> ${albergue.puntoAcopioDonaciones}</p>
                <p><strong>URL de redes sociales:</strong> <a href="${albergue.urlFbig}" target="_blank">${albergue.urlFbig}</a></p>
                <p><strong>Número de contacto de donaciones:</strong> ${albergue.numeroDonaciones}</p>
            </div>

            <button type="button" id="edit-info-btn" class="btn btn-secondary mt-3 mb-3" onclick="redirectToEditPage()">Editar Información</button>
        </div>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script>
    function redirectToEditPage() {
        window.location.href = "editar_informacion.jsp";
    }
</script>
</body>
</html>