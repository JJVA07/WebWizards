<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>

<%@ page import="com.example.webapphr1_2023.Beans.Usuarios" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestión de Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #e6ddcc;">
<jsp:include page="/WEB-INF/navbar_admi.jsp" />
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar_admi.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Gestión General</h1>

                <!-- Tabla 1: Coordinadores -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> Coordinadores Registrados
                    </div>
                    <div class="card-body">
                        <table id="tableCoordinadores" class="table table-bordered">
                            <thead style="background-color: #ffc107; color: black;">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                <th>Teléfono</th>
                                <th>Correo</th>
                                <th>Zona</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Usuarios> listaCoordinadores = (List<Usuarios>) request.getAttribute("listaCoordinadores");
                                if (listaCoordinadores != null) {
                                    for (Usuarios u : listaCoordinadores) { %>
                            <tr>
                                <td><%= u.getNombre() %></td>
                                <td><%= u.getApellido() %></td>
                                <td><%= u.getDni() %></td>
                                <td><%= u.getTelefono() %></td>
                                <td><%= u.getCorreo() %></td>
                                <td><%= u.getZonaAsignada() %></td>
                                <td>
                                    <select class="action-select">
                                        <option value="" disabled selected>Seleccionar acción</option>
                                        <option value="editar">Editar</option>
                                        <option value="aprobar">Aprobar</option>
                                        <option value="rechazar">Rechazar</option>
                                    </select>
                                </td>
                            </tr>
                            <%      }
                            } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tabla 2: Usuarios -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> Usuarios Registrados
                    </div>
                    <div class="card-body">
                        <table id="tableUsuarios" class="table table-bordered">
                            <thead style="background-color: #ffc107; color: black;">
                            <tr>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>DNI</th>
                                <th>Teléfono</th>
                                <th>Correo</th>
                                <th>Comentarios</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Usuarios> listaUsuarios = (List<Usuarios>) request.getAttribute("listaUsuarios");
                                if (listaUsuarios != null) {
                                    for (Usuarios u : listaUsuarios) { %>
                            <tr>
                                <td><%= u.getNombre() %></td>
                                <td><%= u.getApellido() %></td>
                                <td><%= u.getDni() %></td>
                                <td><%= u.getTelefono() %></td>
                                <td><%= u.getCorreo() %></td>
                                <td><input type="text" class="form-control" placeholder="Agregar comentario"></td>
                                <td>
                                    <button class="btn btn-danger" onclick="eliminarRegistro('<%= u.getDni() %>')">Eliminar</button>
                                </td>
                            </tr>
                            <%      }
                            } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Tabla 3: Albergues -->
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-table me-1"></i> Albergues Registrados
                    </div>
                    <div class="card-body">
                        <table id="tableAlbergues" class="table table-bordered">
                            <thead style="background-color: #ffc107; color: black;">
                            <tr>
                                <th>Nombre del Albergue</th>
                                <th>Encargado</th>
                                <th>Teléfono</th>
                                <th>Correo</th>
                                <th>Comentarios</th>
                                <th>Acciones</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                List<Usuarios> listaAlbergues = (List<Usuarios>) request.getAttribute("listaAlbergues");
                                if (listaAlbergues != null) {
                                    for (Usuarios u : listaAlbergues) { %>
                            <tr>
                                <td><%= u.getNombreAlbergue() %></td>
                                <td><%= u.getNombre() %></td>
                                <td><%= u.getTelefono() %></td>
                                <td><%= u.getCorreo() %></td>
                                <td><input type="text" class="form-control" placeholder="Agregar comentario"></td>
                                <td>
                                    <button class="btn btn-danger" onclick="eliminarRegistro('<%= u.getNombreAlbergue() %>')">Eliminar</button>
                                </td>
                            </tr>
                            <%      }
                            } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Librerías JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        new simpleDatatables.DataTable("#tableCoordinadores");
        new simpleDatatables.DataTable("#tableUsuarios");
        new simpleDatatables.DataTable("#tableAlbergues");
    });

    function eliminarRegistro(id) {
        alert("Registro con ID " + id + " eliminado.");
    }
</script>
</body>
</html>
