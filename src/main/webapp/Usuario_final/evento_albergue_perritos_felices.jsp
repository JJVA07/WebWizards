<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Evento albergue perritos felices</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body class="sb-nav-fixed " style="background-color: white;">
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
                <nav class="sb-sidenav accordion sb-sidenav-dark"  id="sidenavAccordion" style="background-color: rgb(27, 94, 87)">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                          
                            <div class="sb-sidenav-menu-heading">MENU</div>
                            
                            <a class="nav-link active collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="false" aria-controls="collapsePublicaciones">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-calendar"></i></div>
                                Eventos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse show" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link active" href="eventos.html">Eventos</a>
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
                            
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseDonaciones" aria-expanded="false" aria-controls="collapseDonaciones">
                                <div class="sb-nav-link-icon"><i class="fas fa-donate"></i></div>
                                Donaciones
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseDonaciones" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="donar.html">Donar</a>
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
                        <div class="container-fluid px-5">
                            <h2 class="mt-5 text-center">BIENVENIDOS A NUESTRO PRIMER EVENTO COMO ALBERGUE</h2>
                    
                            <div class="card mb-3 mt-4 w-100">
                                <div class="row g-0">
                                    <!-- Columna de la imagen -->
                                    <div class="col-md-5 d-flex flex-column align-items-center justify-content-center">
                                        <img src="../assets/img/eventos1.jpeg" class="img-fluid rounded-start" style="height: auto; width: 100%; object-fit: cover;">
                                        
                                        <!-- Sección del Nombre del evento, Costo y Fecha del evento -->
                                        <div class="card-body text-center">
                                            
                                            <h5 class="card-title">Costo</h5>
                                            <p class="card-text">s/. 15</p>
                                            <h5 class="card-title">Fecha del evento</h5>
                                            <p class="card-text">12 de diciembre del 2024</p>
                                            <h5 class="card-title">Vacantes disponibles</h5>
                                            <p class="card-text">20 personas</p>
                                        </div>
                                    </div>
                            
                                    <!-- Columna del texto -->
                                    <div class="col-md-7">
                                        <div class="card-body">
                                            <!-- Limitar el ancho del texto al tamaño de la imagen -->
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <h5 class="card-title">Nombre del evento</h5>
                                                    <p class="card-text">Patatón 2024</p>
                                                    <h5 class="card-title">Lugar del evento</h5>
                                                    <p class="card-text">Campus PUCP, Lima</p>
                                                    
                                                    <h5 class="card-title">Hora del evento</h5>
                                                    <p class="card-text">1:00 pm</p>
                                                    
                                                    <!-- Aquí se reubica el Nombre del albergue organizador -->
                                                    <h5 class="card-title">Nombre del albergue organizador</h5>
                                                    <p class="card-text">Albergue Patitas Felices</p>
                            
                                                    <h5 class="card-title">Aforo</h5>
                                                    <p class="card-text">50 personas</p>
                                                    
                                                    
                                                    <h5 class="card-title">Número de contacto</h5>
                                                    <p class="card-text">987654321</p>
                                                    
                                                    <h5 class="card-title">Artistas o proveedores invitados</h5>
                                                    <p class="card-text">Grupo Musical "Los Gatos Locos"</p>
                                                </div>
                            
                                                <div class="col-md-6">
                                                    <h5 class="card-title">Descripción del evento</h5>
                                                    <p class="card-text">El evento Patatón 2024 es una jornada especial organizada por el Albergue Patitas Felices para recaudar fondos destinados a la compra de alimentos, medicinas y mejoras para los animales del albergue. Contaremos con presentaciones musicales, concursos de disfraces para mascotas y stands de comida.</p>
                                                    
                                                    <h5 class="card-title">Propósito del evento</h5>
                                                    <p class="card-text">Todo lo recaudado se destinará exclusivamente a la compra de alimentos y medicamentos para los animales del albergue, así como a la mejora de sus instalaciones.</p>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                    
                            <!-- Botón para editar -->
                            <div class="text-center mb-4">
                                <a  class="btn btn-secondary postular-btn" style="color: white; font-size: 1.2rem; text-decoration: none;">
                                    Inscribirse
                                </a>
                            </div>
                            
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
   </body>
</html>

<script>
    document.querySelector('.postular-btn').addEventListener('click', function (e) {
        e.preventDefault(); // Evita el comportamiento predeterminado del enlace

        Swal.fire({
            title: '¿Estás seguro de tu inscripción?',
            showDenyButton: true,
            showCancelButton: false,
            confirmButtonText: '<i class="fa-solid fa-check" style="color: #008000; font-size: 1.5rem; background: transparent;"></i>',
            denyButtonText: '<i class="fa-solid fa-x" style="color: #e53434; font-size: 1.5rem; background: transparent;"></i>',
            buttonsStyling: false,
            focusConfirm: false, // Desactivar foco automático en el botón de confirmación
            customClass: {
                confirmButton: 'btn btn-light mx-2 border-0',
                denyButton: 'btn btn-light mx-2 border-0'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire({
                    title: 'Se ha completado la inscripción',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    buttonsStyling: false,
                    customClass: {
                        confirmButton: 'btn btn-success'
                    }
                }).then(() => {
                    // Redirige a la nueva página después del éxito
                    window.location.href = "mis_eventos.html";
                });
            } else if (result.isDenied) {
                Swal.fire({
                    title: 'No se realizó la inscripción',
                    icon: 'info',
                    confirmButtonText: 'OK',
                    buttonsStyling: false,
                    customClass: {
                        confirmButton: 'btn btn-secondary'
                    }
                });
            }
        });
    });
</script>

