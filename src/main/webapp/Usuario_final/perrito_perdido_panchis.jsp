<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>editar_perrito_perdido</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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

                            <a class="nav-link active" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePublicaciones" aria-expanded="true" aria-controls="collapsePublicaciones">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Publicaciones
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse show" id="collapsePublicaciones" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="noticias.html">Noticias</a>
                                    <a class="nav-link active" href="mis_publicaciones.html">Mis Publicaciones</a>
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
                            <h1 class="mt-5 text-center">¡Perrito perdido!</h1>
                    
                            <div class="card mb-3 mt-4 w-100">
                                <div class="row g-0">
                                    <!-- Columna de la imagen -->
                                    <div class="col-md-5 d-flex flex-column align-items-center justify-content-center">
                                        <img src="../assets/img/perro3.jpg" class="img-fluid rounded-start" style="height: auto; width: 100%; object-fit: cover;">
                                        
                                        <!-- Sección del Nombre de la mascota, Recompensa y Fecha de pérdida -->
                                        <div class="card-body text-center">
                                            
                                            <h5 class="card-title">Recompensa</h5>
                                            <p class="card-text">s/. 1000</p>
                                            <h5 class="card-title">Fecha de pérdida</h5>
                                            <p class="card-text">2 de octubre del 2024</p>
                                        </div>
                                    </div>
                    
                                    <!-- Columna del texto -->
                                    <div class="col-md-7">
                                        <div class="card-body">
                                            <!-- Limitar el ancho del texto al tamaño de la imagen -->
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <h5 class="card-title">Nombre de la mascota</h5>
                                                    <p class="card-text">Panchis</p>
                                                    
                                                    <h5 class="card-title">Lugar de pérdida</h5>
                                                    <p class="card-text">Última vez fue visto corriendo hacia los parques cercanos a la Avenida Javier Prado, y es probable que esté buscando un lugar para refugiarse.</p>
                                                    
                                                    <!-- Aquí se reubica el Nombre de contacto -->
                                                    <h5 class="card-title">Nombre de contacto</h5>
                                                    <p class="card-text">Ramón Castilla</p>

                                                    <h5 class="card-title">Número de contacto </h5>
                                                    <p class="card-text">987654321</p>
                                                    
                                                    <h5 class="card-title">Número de referencia </h5>
                                                    <p class="card-text">987654321</p>
                    
                                                </div>
                    
                                                <div class="col-md-6">
                                                    <h5 class="card-title">Distintivo</h5>
                                                    <p class="card-text">Presenta un collar rojo con su nombre y contacto</p>
                                                    
                                                    <h5 class="card-title">Descripción de la mascota</h5>
                                                    <p class="card-text">Tiene un pelaje suave y esponjoso, de color marrón claro con algunas manchas blancas en el pecho y las patitas. Sus ojitos son grandes y expresivos, de un color marrón oscuro, y siempre tiene una mirada curiosa.</p>
                    
                                                    <h5 class="card-title">Descripción adicional</h5>
                                                    <p class="card-text">Responde al nombre de "Max", aunque a veces es un poco travieso y no siempre obedece a la primera. Es muy cariñoso y amigable con las personas, pero puede estar asustado y desorientado por haberse perdido.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    
                            <!-- Botón para editar -->
                            <div class="text-center mb-4">
                                <a href="editar_panchis.html" class="btn btn-aprove">
                                    <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
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
