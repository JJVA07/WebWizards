<%@ page import="java.util.Base64" %>
<%@ page import="com.example.webapphr1_2023.Beans.Eventos" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setAttribute("paginaActiva", "eventos");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Eventos</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
</head>
<body class="sb-nav-fixed">
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 text-center">NUESTROS EVENTOS</h2>
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <!-- Generar dinámicamente las tarjetas de eventos -->
                    <%
                        List<Eventos> eventos = (List<Eventos>) request.getAttribute("eventos");
                        for (Eventos evento : eventos) {
                    %>
                    <div class="col d-flex justify-content-center">
                        <div class="card" style="width: 25rem;">
                            <img src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(evento.getFoto()) %>" class="card-img-top" alt="Evento" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title"><%= evento.getNombreEvento() %></h5>
                                <p class="card-text"><%= evento.getDescripcion() %></p>
                                <a href="#" class="btn btn-primary">Más detalles</a>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>

                <!-- Paginación -->
                <nav aria-label="Page navigation" class="mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item <%= (int) request.getAttribute("paginaActual") == 1 ? "disabled" : "" %>">
                            <a class="page-link" href="?action=eventos&pagina=<%= (int) request.getAttribute("paginaActual") - 1 %>">Anterior</a>
                        </li>
                        <%
                            int totalPaginas = (int) request.getAttribute("totalPaginas");
                            for (int i = 1; i <= totalPaginas; i++) {
                        %>
                        <li class="page-item <%= (int) request.getAttribute("paginaActual") == i ? "active" : "" %>">
                            <a class="page-link" href="?action=eventos&pagina=<%= i %>"><%= i %></a>
                        </li>
                        <% } %>
                        <li class="page-item <%= (int) request.getAttribute("paginaActual") == totalPaginas ? "disabled" : "" %>">
                            <a class="page-link" href="?action=eventos&pagina=<%= (int) request.getAttribute("paginaActual") + 1 %>">Siguiente</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </main>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
