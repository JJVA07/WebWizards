<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/11/2024
  Time: 22:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Obtiene el nombre de la página activa desde la solicitud
    String paginaActiva = (String) request.getAttribute("paginaActiva");
%>
<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: rgb(27, 94, 87)">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <div class="sb-sidenav-menu-heading">MENU</div>
                <a class="nav-link <%= "eventos".equals(paginaActiva) ? "active" : "" %> collapsed"
                   href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones"
                   aria-expanded="<%= "eventos".equals(paginaActiva) ? "true" : "false" %>"
                   aria-controls="collapsePublicaciones">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar"></i></div>
                    Eventos
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse <%= "eventos".equals(paginaActiva) ? "show" : "" %>"
                     id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link <%= "eventos".equals(paginaActiva) ? "active" : "" %>"
                           href="<%= request.getContextPath() %>/eventos.jsp">Eventos</a>
                        <a class="nav-link <%= "mis_eventos".equals(paginaActiva) ? "active" : "" %>"
                           href="<%= request.getContextPath() %>/mis_eventos.jsp">Mis eventos</a>
                    </nav>
                </div>
                <!-- Resto de los elementos del menú con lógica similar -->
                <a class="nav-link <%= "adopcion".equals(paginaActiva) ? "active" : "" %>"
                   href="<%= request.getContextPath() %>/adopcion.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                    Adopción
                </a>
            </div>
        </div>
    </nav>
</div>

