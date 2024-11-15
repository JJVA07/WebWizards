<%-- sidebar.jsp --%>
<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: #581925;">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <!-- Crear Publicación -->
        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
           data-bs-target="#collapseCrearPublicacion" aria-expanded="false" aria-controls="collapseCrearPublicacion">
          <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
          Crear Publicacion
          <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
        </a>
        <div class="collapse" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
          <nav class="sb-sidenav-menu-nested nav">
            <a class="nav-link" href="Albergue_adopcion.jsp">Adopcion</a>
            <a class="nav-link" href="Albergue_donacion.jsp">Donacion</a>
            <a class="nav-link" href="Albergue_eventos.jsp">Eventos Beneficos</a>
          </nav>
        </div>

        <!-- Publicaciones -->
        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
           data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
          <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
          Publicaciones
          <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
        </a>
        <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
          <nav class="sb-sidenav-menu-nested nav">
            <a class="nav-link" href="Adopciones_publicaciones.jsp">Adopciones</a>
            <a class="nav-link" href="Donaciones_publicaciones.jsp">Donaciones</a>
            <a class="nav-link" href="Hogares_publicaciones.jsp">Hogares Temporales</a>
            <a class="nav-link" href="Eventos_publicaciones.jsp">Eventos Beneficos</a>
          </nav>
        </div>

        <!-- Mis Actividades -->
        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
           data-bs-target="#collapseTemporal" aria-expanded="false" aria-controls="collapseTemporal">
          <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
          Mis Actividades
          <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
        </a>
        <div class="collapse" id="collapseTemporal" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
          <nav class="sb-sidenav-menu-nested nav">
            <a class="nav-link" href="${pageContext.request.contextPath}/AlbergueServlet?action=mis_adopciones">Adopciones</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/AlbergueServlet?action=mis_donaciones">Donaciones</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/AlbergueServlet?action=lista_temporal">Hogares Temporales</a>
            <a class="nav-link" href="${pageContext.request.contextPath}/AlbergueServlet?action=lista_eventos">Eventos Beneficos</a>
          </nav>
        </div>
      </div>
    </div>
  </nav>
</div>
