<%@ page import="com.example.webapphr1_2023.Beans.Postulacion" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Hogares Aprobados</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #ffffff;">

<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
  <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Hogares Aprobados</h1>
        <ol class="breadcrumb mb-4">
          <li class="breadcrumb-item active">Lista de Hogares</li>
        </ol>

        <!-- Tabla de hogares aprobados -->
        <div class="card mb-4">
          <div class="card-header">
            <i class="fa-solid fa-dog"></i> Hogares Aprobados
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Apellido</th>
                  <th>Edad</th>
                  <th>Dirección</th>
                  <th>Distrito</th>
                  <th>Contacto</th>
                  <th>Opciones</th>
                </tr>
                </thead>
                <tbody>
                <%-- Iterar sobre la lista dinámica --%>
                <%
                  List<Postulacion> listaSolicitudeshogaraprobados = (List<Postulacion>) request.getAttribute("listaSolicitudeshogaraprobados");
                  if (listaSolicitudeshogaraprobados != null && !listaSolicitudeshogaraprobados.isEmpty()) {
                    for (Postulacion solicitud : listaSolicitudeshogaraprobados) {
                %>
                <tr>
                  <td><%= solicitud.getNombre() %></td>
                  <td><%= solicitud.getApellido() %></td>
                  <td><%= solicitud.getEdad() %></td>
                  <td><%= solicitud.getDireccion() %></td>
                  <td><%= solicitud.getDistrito().getNombre() %></td>
                  <td><%= solicitud.getCelular() %></td>
                  <td>
                    <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Opciones
                      </button>
                      <ul class="dropdown-menu">
                        <li>
                          <a class="dropdown-item" href="<%= request.getContextPath() %>/CoordinadorServlet?action=detalleHogarAprobado&id=<%= solicitud.getIdPostulacion() %>">Revisar</a>
                        </li>
                        <li>
                          <a class="dropdown-item" href="<%= request.getContextPath() %>/CoordinadorServlet?action=eliminarPublicacion&id=<%= solicitud.getIdPostulacion() %>">Eliminar</a>
                        </li>
                      </ul>
                    </div>
                  </td>
                </tr>
                <%
                  }
                } else {
                %>
                <tr>
                  <td colspan="7" class="text-center">No se encontraron hogares aprobados.</td>
                </tr>
                <%
                  }
                %>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- Fin de tabla -->
      </div>
    </main>

    <footer class="py-4 mt-auto" style="background-color: black;">
      <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
          <div class="text-muted">© Huella Viva</div>
          <div>
            <a href="mailto:info@alberguegosu.com" style="color: white;">info@alberguegosu.com</a> |
            <a href="tel:+1234567890" style="color: white;">+123 456 7890</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>

<script>
  // Inicializar DataTables
  document.addEventListener('DOMContentLoaded', function () {
    var dataTable = new simpleDatatables.DataTable("#dataTable", {
      searchable: true,
      fixedHeight: true,
      perPage: 5
    });
  });
</script>
</body>
</html>
