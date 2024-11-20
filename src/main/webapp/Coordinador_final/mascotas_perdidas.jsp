<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Mascotas Perdidas</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<c:url value='/css/styles.css' />" rel="stylesheet" />
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
                <h1 class="mt-4">Mascotas Perdidas</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"></li>
                </ol>

                <!-- Tabla de mascotas perdidas -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fa-solid fa-dog"></i>
                        Mascotas Perdidas
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Edad/años</th>
                                    <th>Raza</th>
                                    <th>Tamaño</th>
                                    <th>Contacto</th>
                                    <th>Opciones</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="mascota" items="${mascotas}">
                                    <tr>
                                        <td>${mascota.nombre}</td>
                                        <td>${mascota.edad}</td>
                                        <td>${mascota.raza}</td>
                                        <td>${mascota.tamaño}</td>
                                        <td>${mascota.contacto}</td>
                                        <td>
                                            <div class="dropdown">
                                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${mascota.index}" data-bs-toggle="dropdown" aria-expanded="false">
                                                    Opciones
                                                </button>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton${mascota.index}">
                                                    <li><a class="dropdown-item" href="<c:url value='detalle_mascota.jsp?index=${mascota.index}' />">Revisar</a></li>
                                                    <li><a class="dropdown-item" href="#">Eliminar</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
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

<script src="<c:url value='/js/scripts.js' />"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/assets/demo/chart-area-demo.js' />"></script>
<script src="<c:url value='/assets/demo/chart-bar-demo.js' />"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/js/datatables-simple-demo.js' />"></script>
</body>
</html>
