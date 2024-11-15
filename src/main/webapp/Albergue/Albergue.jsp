<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Albergue</title>
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
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4 text-center">¡BIENVENIDO!</h1>
                <ol class="breadcrumb mb-4 text-center">
                    <li class="breadcrumb-item active">Nos alegra que estés visitándonos. Te deseamos un grato acceso a nuestra página. Presentarás las siguientes funciones:</li>
                </ol>
                <hr class="hr" />
            </div>
        </main>

        <div class="container">
            <div class="row justify-content-center">
                <!-- Card 1 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <img src="<%= request.getContextPath() %>/assets/img/inicio_crear.jpg" class="card-img-top" alt="Crear_publicacion_inicio"/>
                        <div class="card-body">
                            <h5 class="card-title">CREAR PUBLICACIONES</h5>
                            <p class="card-text">Eliga el tipo de publicaciones quiere realizar.</p>
                            <li><a href="Albergue_adopcion.jsp" style="color: #581925">Crear Adopcion</a></li>
                            <li><a href="Albergue_donacion.jsp" style="color: #581925">Crear Donacion</a></li>
                            <li><a href="Albergue_eventos.jsp" style="color: #581925">Crear Evento Benefico</a></li>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <img src="<%= request.getContextPath() %>/assets/img/publicacion_inicio.jpg" class="card-img-top" alt="Publicaciones_inicio"/>
                        <div class="card-body">
                            <h5 class="card-title">PUBLICACIONES</h5>
                            <p class="card-text">Explora las distintas publicaciones </p>
                            <li><a href="Adopciones_publicaciones.jsp" style="color: #581925">Adopciones</a></li>
                            <li><a href="Donaciones_publicaciones.jsp" style="color: #581925">Donaciones</a></li>
                            <li><a href="Hogares_publicaciones.jsp" style="color: #581925">Hogares Temporales</a></li>
                            <li><a href="Eventos_publicaciones.jsp" style="color: #581925">Eventos Beneficos</a></li>
                        </div>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="card h-100 custom-post">
                        <img src="<%= request.getContextPath() %>/assets/img/actividades_inicio.jpg" class="card-img-top" alt="Adopciones_inicio"/>
                        <div class="card-body">
                            <h5 class="card-title">MIS ACTIVIDADES</h5>
                            <p class="card-text">Gestiona las publicaciones</p>
                            <li><a href="Adopciones_tabla.jsp" style="color: #581925">Adopciones</a></li>
                            <li><a href="Donaciones_tabla.jsp" style="color: #581925">Donaciones</a></li>
                            <li><a href="Hogares_tabla.jsp" style="color: #581925">Hogares Temporales</a></li>
                            <li><a href="Eventos_tabla.jsp" style="color: #581925">Eventos Beneficos</a></li>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a> <a href="#" style="color: white;"> info@alberguegosu.com</a>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
</body>
</html>
