<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: #000000">
      <div class="sb-sidenav-menu">
        <div class="nav">
          <div class="sb-sidenav-menu-heading">Menú</div>
          <a class="nav-link active" href="<%= request.getContextPath() %>/AdministradorServlet?action=indicadores">
            <div class="sb-nav-link-icon"><i class="fas fa-chart-bar"></i></div>
            Visualización de Indicadores
          </a>
          <a class="nav-link" href="<%= request.getContextPath() %>/AdministradorServlet?action=solicitudes">
            <div class="sb-nav-link-icon"><i class="fas fa-tasks"></i></div>
            Gestión de Solicitudes
          </a>
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseluagres" aria-expanded="false" aria-controls="collapseluagres">
            <div class="sb-nav-link-icon"><i class="fas fa-map-marker-alt"></i></div>
            Administración de Lugares
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapseluagres" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="<%= request.getContextPath() %>/AdministradorServlet?action=crearlugares">Creación de Lugares Habilitados</a>
              <a class="nav-link" href="<%= request.getContextPath() %>/AdministradorServlet?action=lugares">Lugares Habilitados</a>
            </nav>
          </div>
          <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsecoordinadores" aria-expanded="false" aria-controls="collapsecoordinadores">
            <div class="sb-nav-link-icon"><i class="fas fa-user-plus"></i></div>Administración de Coordinadores
            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
          </a>
          <div class="collapse" id="collapsecoordinadores" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
            <nav class="sb-sidenav-menu-nested nav">
              <a class="nav-link" href="<%= request.getContextPath() %>/AdministradorServlet?action=crearcoordinadores">Creación de Coordinadores</a>
              <a class="nav-link" href="<%= request.getContextPath() %>/AdministradorServlet?action=coordinadores">Gestión de Coordinadores</a>
            </nav>
          </div>
        </div>
      </div>
    </nav>
  </div>
