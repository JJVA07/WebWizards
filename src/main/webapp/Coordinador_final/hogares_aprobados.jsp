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
                <tbody id="tableBody">
                <!-- Filas dinámicas -->
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

  // Datos de ejemplo para la tabla
  const data = [
    { nombre: "Ana", apellido: "García", edad: 34, direccion: "Calle 123", distrito: "Ancon", celular: "987654321" },
    { nombre: "Luis", apellido: "Martínez", edad: 42, direccion: "Av. Libertad", distrito: "Santa Rosa", celular: "912345678" },
    { nombre: "Carlos", apellido: "Sánchez", edad: 39, direccion: "Calle 45", distrito: "Puente Piedra", celular: "924567890" },
    { nombre: "María", apellido: "Rodríguez", edad: 28, direccion: "Av. Primavera", distrito: "Comas", celular: "987654322" },
    { nombre: "Patricia", apellido: "Ramírez", edad: 36, direccion: "Calle del Sol", distrito: "Los Olivos", celular: "916543210" },
    { nombre: "Fernando", apellido: "López", edad: 50, direccion: "Av. Pardo", distrito: "San Martín de Porres", celular: "935678910" },
    { nombre: "Daniela", apellido: "Hernández", edad: 29, direccion: "Calle Las Palmeras", distrito: "Independencia", celular: "912345679" }
  ];

  // Agregar datos dinámicamente a la tabla
  const tableBody = document.getElementById("tableBody");
  data.forEach((item, index) => {
    const row = document.createElement("tr");
    row.innerHTML = `
            <td>${item.nombre}</td>
            <td>${item.apellido}</td>
            <td>${item.edad}</td>
            <td>${item.direccion}</td>
            <td>${item.distrito}</td>
            <td>${item.celular}</td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${index}" data-bs-toggle="dropdown" aria-expanded="false">
                        Opciones
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton${index}">
                        <li><a class="dropdown-item" href="detalle_hogares.jsp?index=${index}">Revisar</a></li>
                        <li><a class="dropdown-item" href="#">Eliminar</a></li>
                    </ul>
                </div>
            </td>
        `;
    tableBody.appendChild(row);
  });
</script>
</body>
</html>
