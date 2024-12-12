<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Lugares Habilitados</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed" style="background-color: #e6ddcc;">
    <jsp:include page="/WEB-INF/navbar_admi.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/sidebar_admi.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Lugares Habilitados</h1>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Lista de Lugares Habilitados
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="lugaresTable" class="table table-bordered">
                                        <thead class="table-header" style="background-color: #4CAF50; color: white;">
                                            <tr>
                                                <th>Nombre</th>
                                                <th>Dirección</th>

                                                <th>Capacidad</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Albergue 1</td>
                                                <td>Calle Falsa 123</td>
                                             
                                                <td>100</td>
                                                <td>
                                                    <select class="action-select" onchange="handleAction(this, 'Albergue1')">
                                                        <option value="" disabled selected>Seleccionar acción</option>
                                                        <option value="editar">Editar</option>
                                                        <option value="aprobar">Aprobar</option>
                                                        <option value="rechazar">Rechazar</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Albergue 2</td>
                                                <td>Av. Siempreviva 742</td>
                                               
                                                <td>150</td>
                                                <td>
                                                    <select class="action-select" onchange="handleAction(this, 'Albergue2')">
                                                        <option value="" disabled selected>Seleccionar acción</option>
                                                        <option value="editar">Editar</option>
                                                        <option value="aprobar">Aprobar</option>
                                                        <option value="rechazar">Rechazar</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>

        <!-- Librerías JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Función para inicializar DataTables -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const lugaresTable = document.getElementById('lugaresTable');
                if (lugaresTable) {
                    new simpleDatatables.DataTable(lugaresTable, {
                        labels: {
                            placeholder: "Buscar...",
                            perPage: "Mostrar registros por página",
                            noRows: "No se encontraron registros",
                            info: "Mostrando {start} a {end} de {rows} registros",
                        },
                        perPageSelect: [5, 10, 15, 20],
                        perPage: 10,
                        searchable: true,
                        sortable: true,
                    });
                }
            });
        </script>

        <!-- Función para controlar el sidebar -->
        <script>
            document.getElementById('sidebarToggle').addEventListener('click', function () {
                const body = document.body;
                body.classList.toggle('sb-sidenav-toggled');
            });
        </script>

        <!-- Función para manejar acciones del selector -->
        <script>
            function handleAction(select, lugar) {
                const action = select.value;
                if (action === 'editar') {
                    Swal.fire('Editar', `Editar ${lugar}`, 'info');
                } else if (action === 'aprobar') {
                    Swal.fire('Aprobado', `Aprobaste ${lugar}`, 'success');
                } else if (action === 'rechazar') {
                    Swal.fire('Rechazado', `Rechazaste ${lugar}`, 'error');
                }
            }
        </script>
    <script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
    </body>
</html>
