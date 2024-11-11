<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Editar Información</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: #581925;">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="Albergue.jsp">Albergue</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar-->
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
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapseCrearPublicacion" aria-expanded="false" aria-controls="collapseCrearPublicacion">
                        <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                        Crear Publicación
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="Albergue_adopcion.jsp">Adopción</a>
                            <a class="nav-link" href="Albergue_donacion.jsp">Donación</a>
                            <a class="nav-link" href="Albergue_eventos.jsp">Eventos Benéficos</a>
                        </nav>
                    </div>

                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        Publicaciones
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="Adopciones_publicaciones.jsp">Adopciones</a>
                            <a class="nav-link" href="Donaciones_publicaciones.jsp">Donaciones</a>
                            <a class="nav-link" href="Hogares_publicaciones.jsp">Hogares Temporales</a>
                            <a class="nav-link" href="Eventos_publicaciones.jsp">Eventos Benéficos</a>
                        </nav>
                    </div>

                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                       data-bs-target="#collapseTemporal" aria-expanded="false" aria-controls="collapseTemporal">
                        <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                        Mis Actividades
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseTemporal" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="Adopciones_tabla.jsp">Adopciones</a>
                            <a class="nav-link" href="Donaciones_tabla.jsp">Donaciones</a>
                            <a class="nav-link" href="Hogares_tabla.jsp">Hogares Temporales</a>
                            <a class="nav-link" href="Eventos_tabla.jsp">Eventos Benéficos</a>
                        </nav>
                    </div>
                </div>
            </div>
        </nav>
    </div>

    <div id="layoutSidenav_content">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <div class="form-container">
                        <h2 class="mb-4">Editar Información</h2>
                        <form id="editForm">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="shelterName" class="form-label">Nombre del Albergue:</label>
                                    <input type="text" class="form-control" id="shelterName" name="shelterName" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="address" class="form-label">Dirección:</label>
                                    <input type="text" class="form-control" id="address" name="address" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="manager" class="form-label">Encargado:</label>
                                    <input type="text" class="form-control" id="manager" name="manager" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="donationPoint" class="form-label">Punto de acopio de donaciones:</label>
                                    <input type="text" class="form-control" id="donationPoint" name="donationPoint" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Teléfono:</label>
                                    <input type="tel" class="form-control" id="phone" name="phone" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="socialUrl" class="form-label">URL de redes sociales:</label>
                                    <input type="url" class="form-control" id="socialUrl" name="socialUrl" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="district" class="form-label">Distrito:</label>
                                    <input type="text" class="form-control" id="district" name="district" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="donationContact" class="form-label">Número de contacto de donaciones:</label>
                                    <input type="tel" class="form-control" id="donationContact" name="donationContact" required>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn btn-secondary me-2 mb-3">Guardar Cambios</button>
                                <button type="button" class="btn btn-secondary mb-3" onclick="window.history.back()">Cancelar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
<script>
    window.addEventListener('load', function() {
        document.getElementById('shelterName').value = localStorage.getItem('shelterName') || '';
        document.getElementById('manager').value = localStorage.getItem('manager') || '';
        document.getElementById('phone').value = localStorage.getItem('phone') || '';
        document.getElementById('district').value = localStorage.getItem('district') || '';
        document.getElementById('address').value = localStorage.getItem('address') || '';
        document.getElementById('donationPoint').value = localStorage.getItem('donationPoint') || '';
        document.getElementById('socialUrl').value = localStorage.getItem('socialUrl') || '';
        document.getElementById('donationContact').value = localStorage.getItem('donationContact') || '';
    });

    document.getElementById('editForm').addEventListener('submit', function(e) {
        e.preventDefault();
        localStorage.setItem('shelterName', document.getElementById('shelterName').value);
        localStorage.setItem('manager', document.getElementById('manager').value);
        localStorage.setItem('phone', document.getElementById('phone').value);
        localStorage.setItem('district', document.getElementById('district').value);
        localStorage.setItem('address', document.getElementById('address').value);
        localStorage.setItem('donationPoint', document.getElementById('donationPoint').value);
        localStorage.setItem('socialUrl', document.getElementById('socialUrl').value);
        localStorage.setItem('donationContact', document.getElementById('donationContact').value);
        alert('Cambios guardados con éxito');
        window.location.href = 'mi_cuenta.jsp';
    });
</script>
</body>
</html>
