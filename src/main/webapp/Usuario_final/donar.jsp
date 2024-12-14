<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Home</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <body class="sb-nav-fixed" style="background-color: white;">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
            <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
                    </ul>
                </li>
                <a class="nav-link" id="navbarDropdown2" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <!-- Incluir el sidebar común -->
            <jsp:include page="/WEB-INF/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4 text-center">FORMULARIO DE DONACIÓN</h2>
                        <form id="postulacionForm" action="<%= request.getContextPath() %>/Usuario?action=guardarDonacion" method="POST"
                              class="p-4 border rounded bg-light mx-auto mb-4"
                              style="width: 100%; max-width: 1600px; background-color: rgb(200, 200, 200) !important;">

                            <!-- Selección de Albergue -->
                            <div class="form-group mb-3">
                                <label for="albergue">Selecciona el Albergue:</label>
                                <select id="albergue" name="albergue" class="form-select" required>
                                    <option value="" disabled selected>Selecciona un albergue</option>
                                    <%
                                        List<String> albergues = (List<String>) request.getAttribute("albergues");
                                        if (albergues != null && !albergues.isEmpty()) {
                                            for (String albergue : albergues) {
                                    %>
                                    <option value="<%= albergue %>"><%= albergue %></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group mb-3">
                                <label for="lugar-entrega">Lugar de Entrega:</label>
                                <select id="lugar-entrega" name="lugar-entrega" class="form-select" required>
                                    <option value="" disabled selected>Seleccione un lugar de entrega</option>
                                </select>
                            </div>

                            <!-- Selección del Tipo de Donación -->
                            <div class="form-group mb-3">
                                <label for="tipo-donacion">Tipo de Donación:</label>
                                <select id="tipo-donacion" name="tipo-donacion" class="form-select" required>
                                    <option value="" disabled selected>Selecciona una opción</option>
                                    <%
                                        List<String> tiposDonacion = (List<String>) request.getAttribute("tiposDonacion");
                                        if (tiposDonacion != null && !tiposDonacion.isEmpty()) {
                                            for (String tipo : tiposDonacion) {
                                    %>
                                    <option value="<%= tipo %>"><%= tipo %></option>
                                    <%
                                        }
                                    } else {
                                    %>
                                    <option value="" disabled>No hay tipos de donación disponibles</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <!-- Campos adicionales -->
                            <div id="extraInputContainer" class="form-group mb-3">
                                <label for="nombre-producto">Nombre del Producto:</label>
                                <input type="text" id="nombre-producto" name="nombre-producto" class="form-control" required maxlength="100" />

                                <label for="cantidad" class="mt-3">Cantidad y Unidades:</label>
                                <div class="d-flex">
                                    <input type="number" id="cantidad" name="cantidad" class="form-control me-2" min="0" required />
                                    <select id="unidades" name="unidades" class="form-select" required>
                                        <option value="" disabled selected>Unidades</option>
                                        <option value="caja(s)">Caja(s)</option>
                                        <option value="kilogramos">Kilogramos</option>
                                        <option value="mililitros">Mililitros</option>
                                        <option value="litros">Litros</option>
                                        <option value="gramos">Gramos</option>
                                        <option value="miligramos">Miligramos</option>
                                        <option value="unidades">Unidades</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Fecha de Entrega -->
                            <div class="form-group mb-3">
                                <label for="fecha">Fecha de Entrega:</label>
                                <input type="date" id="fecha" name="fecha" class="form-control" required>
                            </div>
                            <!-- Botón con ícono de Font Awesome -->
                            <div class="text-center mt-2">
                                <button type="submit" class="btn" style="background: none; border: none;">
                                    <i class="fa-solid fa-envelope-circle-check" style="color: #808080; font-size: 3rem;"></i>
                                </button>
                            </div>

                        </form>
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
        <script src="<%= request.getContextPath() %>/js/scripts.js"></script>
        <script>
            document.getElementById('albergue').addEventListener('change', function() {
                const nombreAlbergue = this.value;
                const lugarEntregaSelect = document.getElementById('lugar-entrega');

                // Hacer una solicitud AJAX para obtener los puntos de acopio
                fetch(`<%= request.getContextPath() %>/Usuario?action=donar&ajaxAction=getPuntosAcopio&nombreAlbergue=` + encodeURIComponent(nombreAlbergue))
                    .then(response => response.json())
                    .then(data => {
                        lugarEntregaSelect.innerHTML = `<option value="" disabled selected>Seleccione un lugar de entrega</option>`;
                        if (data.length > 0) {
                            data.forEach(punto => {
                                const option = document.createElement('option');
                                option.value = punto;
                                option.textContent = punto;
                                lugarEntregaSelect.appendChild(option);
                            });
                        } else {
                            lugarEntregaSelect.innerHTML = `<option value="" disabled>No hay puntos de acopio disponibles</option>`;
                        }
                    })
                    .catch(error => {
                        console.error('Error al obtener los puntos de acopio:', error);
                    });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<%= request.getContextPath() %>/js/scripts.js"></script>

    </body>
</html>
