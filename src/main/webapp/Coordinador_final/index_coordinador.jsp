<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background: white;">

<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 text-center">¡BIENVENIDO!</h1>
                <ol class="breadcrumb mb-4 text-center" style="display: flex; justify-content: center;">
                    <li class="breadcrumb-item active" style="color: black; text-align: center; width: 100%;">
                        Nos alegra que estés visitándonos. Te deseamos un grato acceso a nuestra página. Presentarás las siguientes funciones:
                    </li>
                </ol>
                <hr class="hr" />
            </div>
        </main>

        <div class="container">
            <div class="row justify-content-center">
                <!-- Card 1 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <a href="<%= request.getContextPath() %>/solicitud_hogares.jsp">
                            <img src="<%= request.getContextPath() %>/assets/img/casa.png" class="card-img-top" alt="Solicitudes de Hogares Temporales" />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">SOLICITUDES DE HOGARES TEMPORALES</h5>
                            <p class="card-text">Se podrá aceptar o rechazar la solicitud del postulante. En caso el postulante sea aceptado, podrá aparecer en la página de hogares temporales disponibles en los albergues.</p>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <a href="<%= request.getContextPath() %>/mascotas_perdidas.jsp">
                            <img src="<%= request.getContextPath() %>/assets/img/alimentos-para-mascotas.png" class="card-img-top" alt="Verificación Publicaciones" />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">VERIFICACIÓN DE PUBLICACIONES</h5>
                            <p class="card-text">Se podrá aprobar todas las publicaciones de mascotas perdidas y verificar si hay alguna publicación relacionada con una mascota perdida ya reportada y deberá de colocar un comentario en la publicación original.</p>
                        </div>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <a href="<%= request.getContextPath() %>/hogares_aprobados.jsp">
                            <img src="<%= request.getContextPath() %>/assets/img/promocion.png" class="card-img-top" alt="Adopciones" />
                        </a>
                        <div class="card-body">
                            <h5 class="card-title">HOGARES TEMPORALES</h5>
                            <p class="card-text">Los hogares temporales permiten que las mascotas en necesidad tengan un lugar transitorio donde estar mientras son adoptadas.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Contáctanos: Somos un albergue gosu...</div>
                    <div>
                        <a href="mailto:info@alberguegosu.com" style="color: white;">Correo: info@alberguegosu.com</a> |
                        <a href="tel:+1234567890" style="color: white;">Teléfono: +123 456 7890</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
</body>
</html>
