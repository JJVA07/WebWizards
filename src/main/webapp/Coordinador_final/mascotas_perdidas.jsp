<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Mascotas Perdidas</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: #ffffff;">
<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Mascotas Perdidas</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Revisar Mascotas Perdidas</li>
                </ol>

                <!-- Tabla de mascotas perdidas -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fa-solid fa-dog"></i>
                        Mascotas Perdidas
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Edad/años</th>
                                    <th>Raza</th>
                                    <th>Tamaño</th>
                                    <th>Contacto</th>
                                    <th>Opciones</th>
                                </tr>
                                </thead>
                                <tbody id="tableBody">
                                <!-- Filas generadas dinámicamente -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Contáctanos: Somos un albergue gosu...</div>
                    <div>
                        <a href="mailto:info@alberguegosu.com" style="color: white;">Correo: info@alberguegosu.com</a> |
                        <a href="tel:+1234567890" style="color: white;">Teléfono: +123 456 7890</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>

<script>
    // Inicializar DataTables con paginación
    document.addEventListener('DOMContentLoaded', function() {
        var dataTable = new simpleDatatables.DataTable("#dataTable", {
            searchable: true,
            fixedHeight: true,
            perPage: 5
        });
    });

    // Datos de ejemplo de mascotas perdidas
    const data = [
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido1.jpg", nombre: "Firulais", edad: 3, raza: "Labrador", tamaño: "Grande", contacto: "974769424" },
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido2.jpg", nombre: "Rex", edad: 2, raza: "Pastor Alemán", tamaño: "Grande", contacto: "912345678" },
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido3.jpg", nombre: "Dobby", edad: 1, raza: "Chihuahua", tamaño: "Pequeño", contacto: "987654321" },
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido4.jpg", nombre: "Toby", edad: 4, raza: "Bulldog", tamaño: "Mediano", contacto: "956123789" },
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido5.jpg", nombre: "Bruno", edad: 3, raza: "Boxer", tamaño: "Grande", contacto: "932178945" },
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido6.jpg", nombre: "Nina", edad: 1, raza: "Shih Tzu", tamaño: "Pequeño", contacto: "986543210" }
    ];

    const tableBody = document.getElementById("tableBody");

    // Recorrer los datos y generar las filas dinámicamente
    data.forEach((item, index) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${item.nombre}</td>
            <td>${item.edad}</td>
            <td>${item.raza}</td>
            <td>${item.tamaño}</td>
            <td>${item.contacto}</td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${index}" data-bs-toggle="dropdown" aria-expanded="false">
                        Opciones
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton${index}">
                        <li>
                            <a class="dropdown-item" href="<%= request.getContextPath() %>/detalle_mascota.jsp?index=${index}">Revisar</a>
                        </li>
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
