<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Mis solicitudes</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                            
                            <a class="nav-link active" href="#" data-bs-toggle="collapse" data-bs-target="#collapseTemporal" aria-expanded="true" aria-controls="collapseTemporal">
                                <div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
                                Dueño Temporal
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse show" id="collapseTemporal" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="registrar_solicitud.html">Registrar Solicitud</a>
                                    <a class="nav-link active" href="mis_solicitudes.html">Mis Solicitudes</a>
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
                        <div class="container-fluid px-4">
                            <h2 class="mt-4 text-center">MIS SOLICITUDES</h2>
                            <div class="row justify-content-center mt-3">
                                <div class="col-sm-12 col-md-6 col-lg-4 d-flex justify-content-center">
                                    <div class="card mb-4" style="width: 100%;">
                                        
                                            <img src="../assets/img/hogar-temporal-sol1.jpg" class="card-img-top img-fluid" alt="Perrito perdido" style="height: 200px; object-fit: cover;">
                                        
                                        <div class="card-body">
                                            <h5 class="card-title">Solicitud a Albergue - Las Cachorritas</h5>
                                            <p class="card-text" style="text-align: justify;">
                                                Se realizó la solicitud para el albergue "Las Cachorritas" en el centro de Lima.
                                            </p>
                                            <div class="text-center">
                                                <a href="editar_solicitud.html" class="btn btn-aprove">
                                                    <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                                </a>
                                                <a href="#" class="btn btn-trash eliminar-btn">
                                                    <i class="fa-solid fa-trash" style="color: #e53434; font-size: 2rem;"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
        
                                <div class="col-sm-12 col-md-6 col-lg-4 d-flex justify-content-center">
                                    <div class="card mb-4" style="width: 100%;">
                                        <img src="../assets/img/hogar-temporal-sol2.jpg" class="card-img-top img-fluid" alt="Denuncia por maltrato" style="height: 200px; object-fit: cover;">
                                        <div class="card-body">
                                            <h5 class="card-title">Solicitud a Albergue - Las Gatitas</h5>
                                            <p class="card-text" style="text-align: justify;">
                                                Se realizó la solicitud para el albergue "Las Gatitas" en San Isidro.
                                            </p>
                                            <div class="text-center">
                                                <a href="editar_solicitud.html" class="btn btn-aprove">
                                                    <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                                </a>
                                                <a href="#" class="btn btn-trash eliminar-btn">
                                                    <i class="fa-solid fa-trash" style="color: #e53434; font-size: 2rem;"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                </main>
                
                <div class="d-flex justify-content-center mt-3">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Previous" style="color: black;">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#" style="color: black;">1</a></li>
                            <li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
                            <li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#" aria-label="Next" style="color: black;">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
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
            document.querySelectorAll('.eliminar-btn').forEach(button => {
                button.addEventListener('click', function (e) {
                    e.preventDefault();
                    Swal.fire({
                        title: '¿Estás seguro de eliminar?',
                        showDenyButton: true,
                        showCancelButton: false, // Quitamos el botón de cancelar
                        confirmButtonText: '<i class="fa-solid fa-check" style="color: #008000; font-size: 1.5rem;"></i>', // Ícono de check más grande
                        denyButtonText: '<i class="fa-solid fa-x" style="color: #e53434; font-size: 1.5rem;"></i>', // Ícono de "X" más grande
                        buttonsStyling: false,
                        buttonsStyling: false, // Evita los estilos por defecto
                        customClass: {
                            confirmButton: 'btn btn-light mx-2', // Personaliza el botón de confirmar
                            denyButton: 'btn btn-light mx-2' // Personaliza el botón de negar
                        }
                    }).then((result) => {
                        if (result.isConfirmed) {
                            Swal.fire({
                                title: 'Eliminado!',
                                icon: 'success',
                                confirmButtonText: 'OK',
                                buttonsStyling: false,
                                customClass: {
                                    confirmButton: 'btn btn-success'
                                }
                            });
                        } else if (result.isDenied) {
                            Swal.fire({
                                title: 'No se eliminó',
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
            });
        </script>
        
    </body>
    </html>
    