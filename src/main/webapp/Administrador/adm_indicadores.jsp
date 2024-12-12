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
    <title>Dashboard con Gráficos - Coordinadores</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6ddcc;
            color: #333;
            margin: 20px;
        }

        h2, h3 {
            color: #4a4a8c;
        }

        .card {
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-header {
            background-color: #4a4a8c;
            color: white;
            text-align: center;
            font-weight: bold;
            border-top-left-radius: 12px;
            border-top-right-radius: 12px;
        }

        .dashboard-row {
            margin-bottom: 20px;
        }

        .chart-container {
            position: relative;
            height: 300px; /* Ajustado para reducir el espacio */
        }
    </style>
</head>
<body class="sb-nav-fixed">
<jsp:include page="/WEB-INF/navbar_admi.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/sidebar_admi.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Administrador - Dashboard con Gráficos</h1>
                    <hr>

                    <!-- Row of statistic cards -->
                    <div class="row dashboard-row">
                        <div class="col-lg-4 col-md-6">
                            <div class="card">
                                <div class="card-header">Lugares Habilitados</div>
                                <div class="card-body">
                                    <div>
                                        <div class="stat-title">Total</div>
                                        <h2><%= request.getAttribute("totalLugares") %></h2>
                                    </div>
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Donaciones recibidas por albergue -->
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">Donaciones por Albergue
                                    <select id="selectAlbergue" class="form-select form-select-sm">
                                        <%
                                            List<String> albergues = (List<String>) request.getAttribute("listaAlbergues");
                                            if (albergues != null) {
                                                for (String albergue : albergues) {
                                        %>
                                        <option value="<%= albergue %>"><%= albergue %></option>
                                        <%
                                                }
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="donacionesAlbergueChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Top 10 Usuarios que más han donado -->
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-header">Top 10 Donantes</div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="topDonantesChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Mascotas perdidas y encontradas -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">Mascotas Perdidas vs Encontradas
                                    <select id="selectPeriodo" class="form-select form-select-sm">
                                        <option value="3meses">Últimos 3 meses</option>
                                        <option value="anual">Anual</option>
                                    </select>
                                </div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="mascotasPerdidasEncontradasChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Albergues registrados y Usuarios activos/baneados en gráfico circular -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-header">Albergues y Usuarios Activos vs Baneados (Gráfico Circular)</div>
                                <div class="card-body">
                                    <div class="chart-container">
                                        <canvas id="alberguesUsuariosPieChart"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- Librerías JS de Bootstrap y Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Gráficos con Chart.js -->
    <script>
        // Donaciones por Albergue
        const donacionesAlbergueChart = new Chart(document.getElementById('donacionesAlbergueChart'), {
            type: 'bar',
            data: {
                labels: ['Enero', 'Febrero', 'Marzo'],
                datasets: [{
                    label: 'Donaciones por Albergue',
                    data: [500, 700, 800],
                    backgroundColor: '#6b8e23'  // Color verde oliva suave
                }]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Top 10 Donantes
        const topDonantesChart = new Chart(document.getElementById('topDonantesChart'), {
            type: 'bar',
            data: {
                labels: ['Usuario 1', 'Usuario 2', 'Usuario 3', 'Usuario 4', 'Usuario 5', 'Usuario 6', 'Usuario 7', 'Usuario 8', 'Usuario 9', 'Usuario 10'],
                datasets: [{
                    label: 'Cantidad Donada',
                    data: [100, 90, 80, 70, 60, 50, 40, 30, 20, 10],
                    backgroundColor: '#ffa07a' // Color salmón claro
                }]
            },h
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Mascotas Perdidas vs Encontradas
        const mascotasPerdidasEncontradasChart = new Chart(document.getElementById('mascotasPerdidasEncontradasChart'), {
            type: 'bar',
            data: {
                labels: ['Enero', 'Febrero', 'Marzo'],
                datasets: [
                    {
                        label: 'Mascotas Perdidas',
                        data: [30, 40, 50],
                        backgroundColor: '#f0e68c'  // Color amarillo suave
                    },
                    {
                        label: 'Mascotas Encontradas',
                        data: [20, 25, 30],
                        backgroundColor: '#87ceeb'  // Color azul cielo
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        // Albergues Registrados y Usuarios Activos vs Baneados - Gráfico Circular
        const alberguesUsuariosPieChart = new Chart(document.getElementById('alberguesUsuariosPieChart'), {
            type: 'pie',
            data: {
                labels: ['Albergues Registrados', 'Usuarios Activos', 'Usuarios Baneados'],
                datasets: [{
                    label: 'Cantidad',
                    data: [15, 200, 10],
                    backgroundColor: ['#ffdab9', '#98fb98', '#ffb6c1'] // Colores suaves
                }]
            },
            options: {
                responsive: true
            }
        });
    </script>
<script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
</body>
</html>
