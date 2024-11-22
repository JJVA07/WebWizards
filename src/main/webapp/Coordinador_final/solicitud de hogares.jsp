<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Solicitud de Hogares</title>
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
                <h1 class="mt-4">Solicitud de Hogares</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Revisar Solicitudes</li>
                </ol>

                <!-- Tabla de Solicitudes de Hogares -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fa-solid fa-heart"></i>
                        Solicitudes de Hogares
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
                                    <th>Faltas</th>
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
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>

<script>
    // Inicializar DataTables con paginación
    document.addEventListener('DOMContentLoaded', function() {
        var dataTable = new simpleDatatables.DataTable("#dataTable", {
            searchable: true,
            fixedHeight: true,
            perPage: 5
        });
    });

    // Datos de ejemplo de hogares temporales
    const data = [
        { nombre: "Ana", apellido: "García", edad: 34, direccion: "Calle 123", distrito: "Ancon", contacto: "987654321", faltas: 2 },
        { nombre: "Luis", apellido: "Martínez", edad: 42, direccion: "Av. Libertad", distrito: "Santa Rosa", contacto: "912345678", faltas: 3 },
        { nombre: "Carlos", apellido: "Sánchez", edad: 39, direccion: "Calle 45", distrito: "Puente Piedra", contacto: "924567890", faltas: 1 },
        { nombre: "María", apellido: "Rodríguez", edad: 28, direccion: "Av. Primavera", distrito: "Comas", contacto: "987654322", faltas: 0 },
        { nombre: "Patricia", apellido: "Ramírez", edad: 36, direccion: "Calle del Sol", distrito: "Los Olivos", contacto: "916543210", faltas: 0 },
        { nombre: "Fernando", apellido: "López", edad: 50, direccion: "Av. Pardo", distrito: "San Martín de Porres", contacto: "935678910", faltas: 3 },
        { nombre: "Daniela", apellido: "Hernández", edad: 29, direccion: "Calle Las Palmeras", distrito: "Independencia", contacto: "912345679", faltas: 2 }
    ];

    const tableBody = document.getElementById("tableBody");

    // Recorrer los datos y generar las filas dinámicamente
    data.forEach((item, index) => {
        const row = document.createElement("tr");
        row.innerHTML = `
            <td>${item.nombre}</td>
            <td>${item.apellido}</td>
            <td>${item.edad}</td>
            <td>${item.direccion}</td>
            <td>${item.distrito}</td>
            <td>${item.contacto}</td>
            <td>${item.faltas}</td>
            <td>
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${index}" data-bs-toggle="dropdown" aria-expanded="false">
                        Opciones
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton${index}">
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/detalle_solicitud_hogares.jsp?index=${index}">Revisar</a></li>
                        ${item.faltas == 3 ? '<li><a class="dropdown-item" href="#">Banear</a></li>' : ''}
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
