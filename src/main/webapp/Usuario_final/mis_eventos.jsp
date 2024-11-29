<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Mis eventos</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">

<!-- Barra de navegación -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=cerrarSesion">Cerrar Sesión</a></li>
            </ul>
        </li>
    </ul>
</nav>

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Mis eventos</h1>

                <!-- Verifica si hay eventos -->
                <c:choose>
                    <c:when test="${not empty eventos}">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Historial de eventos
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="eventosTable" class="table table-bordered">
                                        <thead class="table-header" style="background-color:rgb(27, 94, 87); color: white;">
                                        <tr>
                                            <th>FECHA</th>
                                            <th>HORA</th>
                                            <th>ALBERGUE</th>
                                            <th>COSTO</th>
                                            <th>AFORO</th>
                                            <th>DETALLE</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <!-- Iteración de la lista de eventos obtenidos desde la base de datos -->
                                        <c:forEach var="evento" items="${eventos}">
                                            <tr>
                                                <td><fmt:formatDate value="${evento.fecha}" pattern="dd-MM-yyyy" /></td>
                                                <td><fmt:formatDate value="${evento.hora}" pattern="hh:mm a" /></td>
                                                <td>${evento.albergue.nombre}</td>
                                                <td>S/. ${evento.donaciones.cantidadDonacion}</td>
                                                <td>${evento.aforo} personas</td>
                                                <td>
                                                    <a href="<%= request.getContextPath() %>/Usuario?action=detallesEvento&idEvento=${evento.idEventos}"
                                                       class="btn btn-sm btn-primary">
                                                        <i class="fas fa-info-circle"></i> Más detalles
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Mostrar mensaje si no hay eventos -->
                        <div class="alert alert-info text-center mt-4">
                            <strong>No tienes eventos registrados actualmente.</strong>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </main>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a><a href="#" style="color: white;">info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;">+123 456 7890</a>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script>
    // Inicializar DataTable
    document.addEventListener('DOMContentLoaded', function () {
        const eventosTable = document.getElementById('eventosTable');
        if (eventosTable) {
            new simpleDatatables.DataTable(eventosTable, {
                perPage: 5,
                labels: {
                    placeholder: "Buscar...",
                    perPage: "{select} registros por página",
                    noRows: "No se encontraron registros",
                    info: "Mostrando {start} a {end} de {rows} registros"
                }
            });
        }
    });
</script>
</body>
</html>
