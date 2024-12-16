<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.webapphr1_2023.Beans.Eventos" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    List<Eventos> eventos = (List<Eventos>) request.getAttribute("eventos");
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm a");
%>

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

<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/LoginServlet?action=logout">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link " id="navbarDropdown2" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Mis eventos</h1>

                <% if (eventos != null && !eventos.isEmpty()) { %>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> Historial de eventos
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead class="table-header" style="background-color:rgb(27, 94, 87); color: white;">
                            <tr>
                                <th>NOMBRE DEL EVENTO</th> <!-- Nueva columna -->
                                <th>FECHA</th>
                                <th>HORA</th>
                                <th>ALBERGUE</th>
                                <th>AFORO</th>
                                <th>DETALLE</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% for (Eventos evento : eventos) { %>
                            <tr>
                                <td><%= evento.getNombreEvento() %></td> <!-- Mostrar nombre del evento -->
                                <td><%= dateFormat.format(evento.getFecha()) %></td>
                                <td><%= timeFormat.format(evento.getHora()) %></td>
                                <td><%= evento.getAlbergue().getNombreAlbergue() %></td>
                                <td><%= evento.getAforo() %> personas</td>
                                <td>
                                    <a href="<%= request.getContextPath() %>/Usuario?action=detallesEvento&idEvento=<%= evento.getIdEventos() %>"
                                       class="btn btn-sm btn-secondary">
                                        <i class="fas fa-info-circle"></i> Más detalles
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
                <% } else { %>
                <div class="alert alert-info text-center mt-4">
                    <strong>No tienes eventos registrados actualmente.</strong>
                </div>
                <% } %>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>

</body>
</html>
