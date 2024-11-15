<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapphr1_2023.Beans.Mascotas" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Tabla - Adopciones</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/navbar_albergue.jsp" %>

<div id="layoutSidenav">
  <%@ include file="/WEB-INF/sidebar_albergue.jsp" %>
  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Mis Adopciones</h1>
        <div class="card mb-4">
          <div class="card-header">
            <i class="fas fa-table me-1"></i>
            Historial de Adopciones
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table id="datatablesSimple" class="table table-bordered text-center align-middle" width="100%" cellspacing="0">
                <thead>
                <tr>
                  <th>Nombre</th>
                  <th>Edad</th>
                  <th>Sexo</th>
                  <th>Comentarios</th>
                  <th>Descripción</th>
                  <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <%
                  // Obtiene la lista de adopciones pasada desde el servlet
                  List<Mascotas> adopciones = (List<Mascotas>) request.getAttribute("misAdopciones");

                  // Verifica si la lista tiene elementos
                  if (adopciones != null && !adopciones.isEmpty()) {
                    for (Mascotas mascota : adopciones) {
                %>
                <tr>
                  <td><%= mascota.getNombreMascota() %></td>
                  <td><%= mascota.getEdad() %> años</td>
                  <td><%= mascota.getGenero() %></td>
                  <td><%= mascota.getComentarioCoordinador() != null ? mascota.getComentarioCoordinador() : "Sin comentarios" %></td>
                  <td><%= mascota.getDescripcion() != null ? mascota.getDescripcion() : "Sin descripción" %></td>
                  <td>
                    <div class="dropdown">
                      <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        Acciones
                      </button>
                      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="#">Editar</a></li>
                        <li><a class="dropdown-item text-danger" href="#">Borrar</a></li>
                      </ul>
                    </div>
                  </td>
                </tr>
                <%
                  }
                } else {
                %>
                <tr>
                  <td colspan="6">No hay adopciones registradas.</td>
                </tr>
                <% } %>
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
