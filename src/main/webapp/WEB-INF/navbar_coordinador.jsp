<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(58, 49, 70);">
  <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/LoginServlet">Coordinador Zonal</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
        <i class="fas fa-user fa-fw"></i>
      </a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/CoordinadorServlet?action=cuenta">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="<%=request.getContextPath()%>/LoginServlet?action=logout">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" id="navbarDropdown" href="<%= request.getContextPath() %>/Coordinador_final/index_coordinador.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>
