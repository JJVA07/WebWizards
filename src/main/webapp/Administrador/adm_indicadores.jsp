<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="com.example.webapphr1_2023.Beans.DonacionMesDTO" %>
<%@ page import="com.example.webapphr1_2023.Beans.Usuarios" %>
<%@ page import="com.example.webapphr1_2023.Beans.DonacionTopDTO" %>
<%@ page import="com.example.webapphr1_2023.Beans.MascotasPerdidasEncontradasDTO" %>
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
                                <%
                                    String albergueSeleccionado = request.getParameter("albergueId");
                                %>
                                <select id="selectAlbergue" class="form-select form-select-sm" onchange="filtrarDonaciones()">
                                    <%
                                        List<Usuarios> albergues = (List<Usuarios>) request.getAttribute("listaAlbergues");
                                        if (albergues != null) {
                                            for (Usuarios albergue : albergues) {
                                                if (albergue.getId() > 0) {
                                                    String seleccionado = (albergueSeleccionado != null && albergueSeleccionado.equals(String.valueOf(albergue.getId()))) ? "selected" : "";
                                    %>
                                    <option value="<%= albergue.getId() %>" <%= seleccionado %>><%= albergue.getNombreAlbergue() %></option>
                                    <%
                                                }
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="card-body">
                                <div class="chart-container">
                                    <canvas id="donacionesChart"></canvas>
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
                            <div class="card-header">Mascotas Perdidas vs Encontradas</div>
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


<!-- Librerías JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- Scripts dinámicos -->
<%
    List<DonacionMesDTO> listaDonaciones = (List<DonacionMesDTO>) request.getAttribute("listaDonaciones");
    StringBuilder meses = new StringBuilder("[");
    StringBuilder cantidades = new StringBuilder("[");
    if (listaDonaciones != null && !listaDonaciones.isEmpty()) {
        for (int i = 0; i < listaDonaciones.size(); i++) {
            DonacionMesDTO donacion = listaDonaciones.get(i);
            meses.append("\"").append(donacion.getMes()).append("\"");
            cantidades.append(donacion.getCantidadDonaciones());
            if (i < listaDonaciones.size() - 1) {
                meses.append(",");
                cantidades.append(",");
            }
        }
    }
    meses.append("]");
    cantidades.append("]");
%>
<%
    List<DonacionTopDTO> topDonantes = (List<DonacionTopDTO>) request.getAttribute("topDonantes");
    StringBuilder nombresUsuarios = new StringBuilder("[");
    StringBuilder cantidadesDonadas = new StringBuilder("[");

    if (topDonantes != null && !topDonantes.isEmpty()) {
        for (int i = 0; i < topDonantes.size(); i++) {
            DonacionTopDTO donante = topDonantes.get(i);
            nombresUsuarios.append("\"").append(donante.getNombreUsuario()).append("\"");
            cantidadesDonadas.append(donante.getCantidadDonaciones());

            if (i < topDonantes.size() - 1) {
                nombresUsuarios.append(",");
                cantidadesDonadas.append(",");
            }
        }
    }
    nombresUsuarios.append("]");
    cantidadesDonadas.append("]");
%>
<%
    List<MascotasPerdidasEncontradasDTO> mascotasData = (List<MascotasPerdidasEncontradasDTO>) request.getAttribute("mascotasData");

    StringBuilder labels = new StringBuilder("[");
    StringBuilder mascotasPerdidas = new StringBuilder("[");
    StringBuilder mascotasEncontradas = new StringBuilder("[");

    if (mascotasData != null && !mascotasData.isEmpty()) {
        for (int i = 0; i < mascotasData.size(); i++) {
            MascotasPerdidasEncontradasDTO data = mascotasData.get(i);
            labels.append("\"").append(data.getPeriodo()).append("\"");
            mascotasPerdidas.append(data.getMascotasPerdidas());
            mascotasEncontradas.append(data.getMascotasEncontradas());

            if (i < mascotasData.size() - 1) {
                labels.append(",");
                mascotasPerdidas.append(",");
                mascotasEncontradas.append(",");
            }
        }
    }
    labels.append("]");
    mascotasPerdidas.append("]");
    mascotasEncontradas.append("]");
%>
<%
    // Recuperar valores del request
    Map<String, Integer> estadisticasUsuarios = (Map<String, Integer>) request.getAttribute("estadisticasUsuarios");
    int usuariosRol1Baneados = estadisticasUsuarios != null ? estadisticasUsuarios.get("usuariosRol1Baneados") : 0;
    int usuariosRol1Activos = estadisticasUsuarios != null ? estadisticasUsuarios.get("usuariosRol1Activos") : 0;
    int usuariosRolalbergue = estadisticasUsuarios != null ? estadisticasUsuarios.get("usuariosRolalbergue") : 0;
%>
<script>
    function filtrarDonaciones() {
        const albergueSeleccionado = document.getElementById("selectAlbergue").value;
        window.location.href = `<%= request.getContextPath() %>/AdministradorServlet?action=indicadores&albergueId=` + albergueSeleccionado;
    }

    const meses = <%= meses.toString() %>;
    const cantidades = <%= cantidades.toString() %>;

    const ctx = document.getElementById('donacionesChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: meses,
            datasets: [{
                label: 'Donaciones en los últimos 3 meses',
                data: cantidades,
                backgroundColor: '#6b8e23'
            }]
        },
        options: { responsive: true, scales: { y: { beginAtZero: true } } }
    });
    // Top 10 Donantes
    const nombresUsuarios = <%= nombresUsuarios.toString() %>;
    const cantidadesDonadas = <%= cantidadesDonadas.toString() %>;

    const topDonantesChart = new Chart(document.getElementById('topDonantesChart'), {
        type: 'bar',
        data: {
            labels: nombresUsuarios, // Nombres de los usuarios
            datasets: [{
                label: 'Cantidad Donada',
                data: cantidadesDonadas, // Cantidad donada
                backgroundColor: '#ffa07a' // Color salmón claro
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

// Mascotas Perdidas vs Encontradas
    const labels = <%= labels.toString() %>;
    const mascotasPerdidas = <%= mascotasPerdidas.toString() %>;
    const mascotasEncontradas = <%= mascotasEncontradas.toString() %>;

    const ctxm = document.getElementById('mascotasPerdidasEncontradasChart').getContext('2d');
    new Chart(ctxm, {
        type: 'bar',
        data: {
            labels: labels, // Periodos dinámicos
            datasets: [
                {
                    label: 'Mascotas Perdidas',
                    data: mascotasPerdidas, // Datos dinámicos
                    backgroundColor: '#f0e68c'  // Color amarillo suave
                },
                {
                    label: 'Mascotas Encontradas',
                    data: mascotasEncontradas, // Datos dinámicos
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
            labels: ['Usuarios Albergue', 'Usuarios Activos', 'Usuarios Baneados'],
            datasets: [{
                label: 'Cantidad',
                data: [
                    <%= usuariosRolalbergue %>,
                    <%= usuariosRol1Activos %>,
                    <%= usuariosRol1Baneados %>
                ],
                backgroundColor: ['#ffdab9', '#98fb98', '#ffb6c1'] // Colores personalizados
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                }
            }
        }
    });
</script>
<script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
</body>
</html>
