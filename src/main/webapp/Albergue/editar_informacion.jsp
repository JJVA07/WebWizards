<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Editar Información</title>
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
                    <!-- Sidebar navigation links go here -->
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
                        <!-- Enviar el formulario al servlet para actualizar -->
                        <form action="AlbergueServlet?action=actualizar" method="post">
                            <!-- Campo oculto para el ID del albergue -->
                            <input type="hidden" name="id" value="${albergue.id}" />

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="shelterName" class="form-label">Nombre del Albergue:</label>
                                    <input type="text" class="form-control" id="shelterName" name="nombre_albergue" value="${albergue.nombreAlbergue}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="address" class="form-label">Dirección:</label>
                                    <input type="text" class="form-control" id="address" name="direccion" value="${albergue.direccion}" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="manager" class="form-label">Encargado:</label>
                                    <input type="text" class="form-control" id="manager" name="manager" value="${albergue.encargado}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="donationPoint" class="form-label">Punto de acopio de donaciones:</label>
                                    <input type="text" class="form-control" id="donationPoint" name="punto_acopio_donaciones" value="${albergue.puntoAcopioDonaciones}" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Teléfono:</label>
                                    <input type="tel" class="form-control" id="phone" name="telefono" value="${albergue.telefono}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="socialUrl" class="form-label">URL de redes sociales:</label>
                                    <input type="url" class="form-control" id="socialUrl" name="url_redes_sociales" value="${albergue.urlFbig}" required>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="district" class="form-label">Distrito:</label>
                                    <input type="text" class="form-control" id="district" name="district" value="${albergue.distrito.nombre}" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="donationContact" class="form-label">Número de contacto de donaciones:</label>
                                    <input type="tel" class="form-control" id="donationContact" name="numero_contacto_donaciones" value="${albergue.numeroDonaciones}" required>
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
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;"> +123 456 7890</a>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;"> Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
