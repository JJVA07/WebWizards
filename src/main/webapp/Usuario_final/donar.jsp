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
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/styles_2.css" rel="stylesheet" />

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: white;">
    <nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="Home.html">Usuario Final</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto me-3 me-lg-4">
            <li class="nav-item dropdown">
                
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="mi_cuenta.html">Mi cuenta</a></li>
                    <li><hr class="dropdown-divider" /></li>
                    <li><a class="dropdown-item" href="inicio_sesion.html">Cerrar Sesión</a></li>
                </ul>
            </li>
            <a class="nav-link " id="navbarDropdown" href="home.html" role="button" ><i class="fa-solid fa-paw"></i></a>
        </ul>
    </nav>

    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark"  id="sidenavAccordion" style="background-color:rgb(27, 94, 87)">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                      
                        <div class="sb-sidenav-menu-heading">MENU</div>
                        <a class="nav-link  collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar"></i></div>
                            Eventos
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link " href="eventos.html">Eventos</a>
                                <a class="nav-link" href="mis_eventos.html">Mis eventos</a>
                            </nav>
                        </div>

                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Publicaciones
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="noticias.html">Noticias</a>
                                <a class="nav-link" href="mis_publicaciones.html">Mis Publicaciones</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTemporal" aria-expanded="false" aria-controls="collapseTemporal">
                            <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                            Dueño Temporal
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseTemporal" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="registrar_solicitud.html">Registrar Solicitud</a>
                                <a class="nav-link" href="mis_solicitudes.html">Mis Solicitudes</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed active" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDonaciones" aria-expanded="false" aria-controls="collapseDonaciones">
                            <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                            Donaciones
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse show" id="collapseDonaciones" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link active" href="donar.html">Donar</a>
                                <a class="nav-link" href="mis_donaciones.html">Mis Donaciones</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCrearPublicacion" aria-expanded="false" aria-controls="collapseCrearPublicacion">
                            <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                            Crear Publicación
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="mascotas_perdidas.html">Mascotas Perdidas</a>
                                <a class="nav-link" href="denuncias.html">Denuncias</a>
                            </nav>
                        </div>
                        
                        <a class="nav-link" href="adopcion.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-heart"></i></div>
                            Adopción
                        </a>
                    </div>
                </div>
            </nav>
        </div>

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h2 class="mt-4 text-center">FORMULARIO DE DONACIÓN</h2>
                    <form id="postulacionForm" action="#" method="POST"
                        class="p-4 border rounded bg-light mx-auto mb-4"
                        style="width: 100%; max-width: 1600px; background-color: rgb(200, 200, 200) !important;">
                        <!-- Formulario completo, no alterado -->
                         <!-- Nuevo campo: Seleccionar Albergue -->
                        <div class="form-group mb-3">
                            <label for="albergue">Selecciona el Albergue:</label>
                            <select id="albergue" name="albergue" class="form-select" required>
                                <option value="" disabled selected>Selecciona un albergue</option>
                                <option value="albergue1">Albergue Perritos Felices</option>
                                <option value="albergue2">Albergue Huellas de Amor</option>
                                <option value="albergue3">Albergue Refugio Animal</option>
                            </select>
                        </div>
                        
                        <div class="form-group mb-3">
                            <label for="tipo-donacion">Tipo de Donación:</label>
                            <select id="tipo-donacion" name="tipo-donacion" class="form-select" required>
                                <option value="" disabled selected>Selecciona una opción</option>
                                <optgroup label="Alimentos">
                                    <option value="croquetas">Croquetas (Perros/Gatos)</option>
                                    <option value="alimento-humedo">Alimento Húmedo</option>
                                </optgroup>
                                <optgroup label="Donaciones Monetarias">
                                    <option value="transferencias">Transferencias</option>
                                </optgroup>
                            </select>
                        </div>
                        
                        <div class="form-group mb-3">
                            <label for="fecha">Fecha de Entrega:</label>
                            <input type="date" id="fecha" name="fecha" class="form-control" required>
                        </div>
                        
                        <!-- Nuevo campo: Lugar de Entrega -->
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
            <footer class="py-4 mt-auto mt-3" style="background-color: black; ">
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
    <script src="../js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="../assets/demo/chart-area-demo.js"></script>
    <script src="../assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <script>
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