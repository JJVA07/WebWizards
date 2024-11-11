<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Donar</title>

        <!-- Librerías CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet">

        <!-- SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    </head>

    <body class="sb-nav-fixed" style="background-color: white;">
        <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
            <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
                    </ul>
                </li>
                <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="/WEB-INF/sidebar.jsp" />
            </div>

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h2 class="mt-4 text-center">FORMULARIO DE DONACIÓN</h2>
                        <form id="postulacionForm" action="#" method="POST"
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
                                    } else {
                                    %>
                                    <option value="" disabled>No hay albergues disponibles</option>
                                    <%
                                        }
                                    %>
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

                            <!-- Fecha de Entrega -->
                            <div class="form-group mb-3">
                                <label for="fecha">Fecha de Entrega:</label>
                                <input type="date" id="fecha" name="fecha" class="form-control" required>
                            </div>

                            <!-- Lugar de Entrega -->
                            <div class="form-group mb-3">
                                <label for="lugar-entrega">Lugar de Entrega:</label>
                                <input type="text" id="lugar-entrega" name="lugar-entrega" class="form-control" placeholder="Especifica el lugar de entrega" required>
                            </div>

                            <!-- Botón con ícono de Font Awesome -->
                            <div class="text-center mt-2">
                                <button type="button" class="btn postular-btn" style="background: none; border: none;">
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

        <!-- Aquí tus scripts JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="/js/scripts.js"></script>
        <script>
            document.getElementById('tipo-donacion').addEventListener('change', function () {
                const selectedOption = this.value;
                const extraInputContainer = document.getElementById('extraInputContainer');
                const extraInputLabel = document.getElementById('extraInputLabel');

                if (selectedOption === 'croquetas') {
                    extraInputLabel.textContent = 'Cantidad en kg:';
                    extraInputContainer.style.display = 'block';
                } else if (selectedOption === 'transferencias') {
                    extraInputLabel.textContent = 'Monto de la donación:';
                    extraInputContainer.style.display = 'block';
                } else {
                    extraInputContainer.style.display = 'none';
                }
            });

            document.querySelector('.postular-btn').addEventListener('click', function (e) {
                e.preventDefault();
                const form = document.getElementById('postulacionForm');

                if (form.checkValidity()) {
                    Swal.fire({
                        title: '¿Estás seguro de tu donación?',
                        showDenyButton: true,
                        confirmButtonText: '<i class="fa-solid fa-check" style="color: #008000; font-size: 1.5rem;"></i>',
                        denyButtonText: '<i class="fa-solid fa-x" style="color: #e53434; font-size: 1.5rem;"></i>',
                        buttonsStyling: false,
                        customClass: {
                            confirmButton: 'btn btn-light mx-2',
                            denyButton: 'btn btn-light mx-2'
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: 'Donación enviada',
                                icon: 'success',
                                confirmButtonText: 'OK',
                                customClass: { confirmButton: 'btn btn-success' }
                            }).then(() => {
                                window.location.href = "mis_donaciones.html";
                            });
                        } else if (result.isDenied) {
                            Swal.fire({
                                title: 'Donación cancelada',
                                icon: 'info',
                                confirmButtonText: 'OK',
                                customClass: { confirmButton: 'btn btn-secondary' }
                            });
                        }
                    });
                } else {
                    form.reportValidity();
                }
            });
        </script>
    </body>
</html>
