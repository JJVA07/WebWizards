<%@ page import="com.example.webapphr1_2023.Beans.Eventos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Tabla - Eventos benéficos</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: #581925;">
  <a class="navbar-brand ps-3" href="Albergue.jsp">Albergue</a>
  <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
  <ul class="navbar-nav ms-auto me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
      <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
        <li><a class="dropdown-item" href="mi_cuenta.jsp">Mi cuenta</a></li>
        <li><hr class="dropdown-divider" /></li>
        <li><a class="dropdown-item" href="#!">Cerrar Sesión</a></li>
      </ul>
    </li>
    <a class="nav-link" id="navbarDropdown" href="Albergue.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
  </ul>
</nav>

<div id="layoutSidenav">
  <div id="layoutSidenav_nav">
    <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion" style="background-color: #581925;">
      <div class="sb-sidenav-menu">
        <div class="nav">
          <!-- Aquí irían tus enlaces de navegación -->
        </div>
      </div>
    </nav>
  </div>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Mis Eventos Benéficos</h1>
        <div class="card mb-4">
          <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Historial de Eventos Benéficos
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table id="datatablesSimple" class="table table-bordered text-center align-middle" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>Nombre del Evento</th>
                  <th>Lugar</th>
                  <th>Fecha del Evento</th>
                  <th>Hora del Evento</th>
                  <th>Aforo</th>
                  <th>Vacantes Disponibles</th>
                  <th>Artistas Invitados</th>
                  <th>Descripción</th>
                  <th>Razón del Evento</th>
                  <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <%
                  List<Eventos> eventos = (List<Eventos>) request.getAttribute("eventos");
                  if (eventos != null) {
                    for (Eventos evento : eventos) {
                %>
                <tr>
                  <td><%= evento.getNombreEvento() %></td>
                  <td><%= evento.getLugar().getNombreLugar() %></td>
                  <td><%= evento.getFecha() %></td>
                  <td><%= evento.getHora() %></td>
                  <td><%= evento.getAforo() %></td>
                  <td><%= evento.getVacantesDisponibles() %></td>
                  <td><%= evento.getArtistasInvitados() %></td>
                  <td><%= evento.getDescripcion() %></td>
                  <td><%= evento.getRazon() %></td>
                  <td>
                    <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        Acciones
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="AlbergueServlet?action=editarEvento&id=<%= evento.getAlbergue() %>">Editar</a></li>
                        <li><a class="dropdown-item text-danger" href="AlbergueServlet?action=borrarEvento&id=<%= evento.getAlbergue() %>">Borrar</a></li>
                      </ul>
                    </div>
                  </td>
                </tr>
                <%
                  }
                } else {
                %>
                <tr>
                  <td colspan="10">No hay eventos disponibles.</td>
                </tr>
                <%
                  }
                %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </main>
    <footer class="py-4 mt-auto mt-3" style="background-color: black;">
      <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
          <div class="text-muted" style="color: white !important;">© Huella Viva</div>
          <div>
            <a style="color: white;">Correo: </a> <a href="#" style="color: white;"> info@alberguegosu.com</a>
            <div></div>
            <a style="color: white;">Teléfono: </a><a href="#" style="color: white;"> +123 456 7890</a>
            <div></div>
            <a style="color: white;">Ubicación: </a><a href="#" style="color: white;"> Calle Ejemplo 123, Ciudad, País</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
</body>
</html>
