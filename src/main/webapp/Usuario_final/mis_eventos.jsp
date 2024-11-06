<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Mis eventos</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
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
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <!-- Inclusión del Sidebar -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Mis eventos</h1>
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
                                <tr>
                                    <td>12 - 12 - 2024</td>
                                    <td>1 p.m</td>
                                    <td>Albergue Perritos Felices</td>
                                    <td>S/. 15.00</td>
                                    <td>50 personas</td>
                                    <td>
                                        <a href="<%= request.getContextPath() %>/evento_albergue_perritos_felices.jsp" class="btn inscribirse-btn d-inline-flex align-items-center" style="text-align: center; padding: 5px 10px; border-radius: 8px; background-color: transparent; text-decoration: none;">
                                            <i class="fas fa-info-circle" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                            <span style="color: #808080; font-size: 1.2rem;">Más detalles</span>
                                        </a>
                                    </td>
                                </tr>
                                <!-- Agrega más filas si es necesario -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a><a href="#" style="color: white;">info@alberguegosu.com</a>
                        <div></div>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;">+123 456 7890</a>
                        <div></div>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
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
<script>
    // Inicialización del DataTable con configuración en español
    document.addEventListener('DOMContentLoaded', function () {
        const eventosTable = document.getElementById('eventosTable');
        if (eventosTable) {
            new simpleDatatables.DataTable(eventosTable, {
                labels: {
                    placeholder: "Buscar...",
                    perPage: "Mostrar registros por página",
                    noRows: "No se encontraron registros",
                    info: "Mostrando {start} a {end} de {rows} registros",
                    loading: "Cargando...",
                    infoFiltered: " - filtrado de {rows} registros totales",
                    infoEmpty: "Mostrando 0 a 0 de 0 registros"
                },
                perPageSelect: [5, 10, 15, 20],
                perPage: 10,
                searchable: true,
                sortable: true,
                fixedHeight: true
            });
        }
    });
</script>
</body>
</html>
