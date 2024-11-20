<div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color:rgb(58, 49, 70)">
        <div class="sb-sidenav-menu">
            <div class="nav">
                <a class="nav-link" href="<%= request.getContextPath() %>/mascotas_perdidas.jsp">
                    <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                    Mascotas Perdidas
                </a>
                <a class="nav-link" href="<%= request.getContextPath() %>/mascotas_aprobadas.jsp">
                    <div class="sb-nav-link-icon"><i class="fa-solid fa-check"></i></div>
                    Mascotas Aprobadas
                </a>
                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseHogaresTemporales" aria-expanded="false" aria-controls="collapseHogaresTemporales">
                    <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                    Hogares Temporales
                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                </a>
                <div class="collapse" id="collapseHogaresTemporales" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                    <nav class="sb-sidenav-menu-nested nav">
                        <a class="nav-link" href="hogares_aprobados.jsp">Hogares Aprobados</a>
                        <a class="nav-link" href="solicitud_hogares.jsp">Solicitud de Hogares</a>
                        <a class="nav-link" href="solicitudes_agendadas.jsp">Solicitudes Agendadas</a>
                    </nav>
                </div>
            </div>
        </div>
    </nav>
</div>