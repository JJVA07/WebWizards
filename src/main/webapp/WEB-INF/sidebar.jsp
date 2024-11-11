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

                <!-- Eventos -->
                <a class="nav-link <%= "eventos".equals(paginaActiva) ? "active" : "" %> collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseEventos"
                   aria-expanded="<%= "eventos".equals(paginaActiva) ? "true" : "false" %>" aria-controls="collapseEventos">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar"></i></div>
                    Eventos
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse <%= "eventos".equals(paginaActiva) ? "show" : "" %>" id="collapseEventos" aria-labelledby="headingEventos" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link <%= "eventos".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/eventos.jsp">Eventos</a>
                        <a class="nav-link <%= "mis_eventos".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/mis_eventos.jsp">Mis eventos</a>
                    </nav>
                </div>

                <!-- Publicaciones -->
                <a class="nav-link <%= "publicaciones".equals(paginaActiva) ? "active" : "" %> collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones"
                   aria-expanded="<%= "publicaciones".equals(paginaActiva) ? "true" : "false" %>" aria-controls="collapsePublicaciones">
                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                    Publicaciones
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse <%= "publicaciones".equals(paginaActiva) ? "show" : "" %>" id="collapsePublicaciones" aria-labelledby="headingPublicaciones" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link <%= "noticias".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/noticias.jsp">Noticias</a>
                        <a class="nav-link <%= "mis_publicaciones".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/mis_publicaciones.jsp">Mis Publicaciones</a>
                    </nav>
                </div>

                <!-- Dueño Temporal -->
                <a class="nav-link <%= "dueno_temporal".equals(paginaActiva) ? "active" : "" %> collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTemporal"
                   aria-expanded="<%= "dueno_temporal".equals(paginaActiva) ? "true" : "false" %>" aria-controls="collapseTemporal">
                    <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                    Dueño Temporal
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse <%= "dueno_temporal".equals(paginaActiva) ? "show" : "" %>" id="collapseTemporal" aria-labelledby="headingTemporal" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link <%= "registrar_solicitud".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/registrar_solicitud.jsp">Registrar Solicitud</a>
                        <a class="nav-link <%= "mis_solicitudes".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/mis_solicitudes.jsp">Mis Solicitudes</a>
                    </nav>
                </div>

                <!-- Donaciones -->
                <a class="nav-link <%= "donaciones".equals(paginaActiva) ? "active" : "" %> collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDonaciones"
                   aria-expanded="<%= "donaciones".equals(paginaActiva) ? "true" : "false" %>" aria-controls="collapseDonaciones">
                    <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                    Donaciones
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse <%= "donaciones".equals(paginaActiva) ? "show" : "" %>" id="collapseDonaciones" aria-labelledby="headingDonaciones" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link <%= "donar".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/donar.jsp">Donar</a>
                        <a class="nav-link <%= "mis_donaciones".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/mis_donaciones.jsp">Mis Donaciones</a>
                    </nav>
                </div>

                <!-- Crear Publicación -->
                <a class="nav-link <%= "crear_publicacion".equals(paginaActiva) ? "active" : "" %> collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCrearPublicacion"
                   aria-expanded="<%= "crear_publicacion".equals(paginaActiva) ? "true" : "false" %>" aria-controls="collapseCrearPublicacion">
                    <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                    Crear Publicación
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse <%= "crear_publicacion".equals(paginaActiva) ? "show" : "" %>" id="collapseCrearPublicacion" aria-labelledby="headingCrearPublicacion" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link <%= "mascotas_perdidas".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/mascotas_perdidas.jsp">Mascotas Perdidas</a>
                        <a class="nav-link <%= "denuncias".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/denuncias.jsp">Denuncias</a>
                    </nav>
                </div>

                <!-- Adopción -->
                <a class="nav-link <%= "adopcion".equals(paginaActiva) ? "active" : "" %>" href="<%= request.getContextPath() %>/Usuario?action=adopcion">
                    <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                    Adopción
                </a>
            </div>
        </div>
    </nav>
</div>
