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
        <title>Gestión de Solicitudes</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f9;
                color: #333;
                margin: 20px;
            }

            h2, h3 {
                color: #4a4a8c;
            }

            /* Estilo de la tabla */
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                background-color: #ffffff;
                border-radius: 8px;
                overflow: hidden;
            }

            th, td {
                padding: 12px 15px;
                text-align: left;
                background-color: #ffffff;
                color: black;
            }

            th {
                background-color: #ffc107;
                color: black;
                font-weight: bold;
            }

            tr:nth-child(even) {
                background-color: #f9f9f9;
            }

            tr:hover {
                background-color: #f1f1f1;
            }

            /* Estilo para el selector de Aprobar y Rechazar */
            .action-select {
                padding: 8px;
                border-radius: 4px;
                border: 1px solid #ccc;
                font-size: 14px;
                background-color: #fff;
                color: #333;
                cursor: pointer;
                width: 150px;
            }

            /* Estilos adicionales para el sidebar al abrir y cerrar */
            .sb-sidenav-toggled #layoutSidenav_nav {
                margin-left: -250px;
                transition: margin-left 0.3s ease;
            }

            .sb-sidenav-toggled #layoutSidenav {
                transition: margin-left 0.3s ease;
            }
        </style>
    </head>
    <body class="sb-nav-fixed" style="background-color: #e6ddcc;">
    <jsp:include page="/WEB-INF/navbar_admi.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/sidebar_admi.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div id="solicitudes" class="section" style="display: block;">
                        <h2>Gestión de Solicitudes de Acceso</h2>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Solicitudes de Acceso
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="solicitudesTable" class="table table-bordered">
                                        <thead class="table-header" style="background-color: #ffc107; color: black;">
                                            <tr>
                                                <th>Nombre de Albergue</th>
                                                <th>Correo Electrónico</th>
                                                <th>Fecha de Solicitud</th>
                                                <th>Red Social</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>Albergue1</td>
                                                <td>albergue1@example.com</td>
                                                <td>01/09/2024</td>
                                                <td>Facebook</td>
                                                <td>
                                                    <select class="action-select">
                                                        <option value="" disabled selected>Seleccionar acción</option>
                                                        <option value="aprobar">Aprobar</option>
                                                        <option value="rechazar">Rechazar</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Albergue2</td>
                                                <td>albergue2@example.com</td>
                                                <td>02/09/2024</td>
                                                <td>Instagram</td>
                                                <td>
                                                    <select class="action-select">
                                                        <option value="" disabled selected>Seleccionar acción</option>
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
        <script src="../js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Inicialización de DataTable -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const solicitudesTable = document.getElementById('solicitudesTable');
                if (solicitudesTable) {
                    new simpleDatatables.DataTable(solicitudesTable, {
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

            // Sidebar Toggle
            document.getElementById('sidebarToggle').addEventListener('click', function () {
                document.body.classList.toggle('sb-sidenav-toggled');
            });
        </script>
    <script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
    </body>
</html>
