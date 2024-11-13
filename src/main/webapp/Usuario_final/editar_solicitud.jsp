<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Solicitud</title>
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
                    <div class="container mt-5">
                        <h1 class="text-center mb-4">¡Edite su solicitud!</h1>
                        
                        <form id="postulacionForm" action="#" method="POST"
                        class="p-4 border rounded bg-light mx-auto mb-4" 
                        style="width: 100%; max-width: 1800px; background-color: rgb(200, 200, 200) !important;">
                            <div class="row">
                                <!-- Primera columna -->
                                <div class="col-md-6">
                                    <h4>Datos inscritos</h4>

                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre:</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control" value="Fernando" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="apellido" class="form-label">Apellido:</label>
                                        <input type="text" id="apellido" name="apellido" class="form-control" value="Godoy" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="edad" class="form-label">Edad:</label>
                                        <input type="number" id="edad" name="edad" class="form-control" value="24" readonly>
                                    </div>

                                    <div class="mb-3">
                                        <label for="genero" class="form-label">Género:</label>
                                        <input type="text" id="genero" name="genero" class="form-control" value="Masculino" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="celular_personal" class="form-label">Celular Personal:</label>
                                        <input type="tel" id="celular_personal" name="celular_personal" class="form-control" required>
                                    </div>

                                    <div class="mb-3">
                                        <label for="celular_referencia" class="form-label">Celular de Referencia:</label>
                                        <input type="tel" id="celular_referencia" name="celular_referencia" class="form-control" required>
                                    </div>
                                </div>

                                <!-- Segunda columna -->
                                <div class="col-md-6">
                                    <h4>Datos Editables</h4>

                                    <div class="mb-3">
                                        <label for="cuartos" class="form-label">Cantidad de Cuartos:</label>
                                        <input type="number" id="cuartos" name="cuartos" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="vivienda" class="form-label">¿Vive solo o con dependientes?</label>
                                        <select id="vivienda" name="vivienda" class="form-select" required>
                                            <option value="">Ingrese opción</option>
                                            <option value="solo">Solo</option>
                                            <option value="dependientes">Con dependientes</option>
                                        </select>
                                    </div>
                        
                                    <div class="mb-3">
                                        <label for="trabajo" class="form-label">¿Trabaja remoto o presencial?</label>
                                        <select id="trabajo" name="trabajo" class="form-select" required>
                                            <option value="">Ingrese opción</option>
                                            <option value="remoto">Remoto</option>
                                            <option value="presencial">Presencial</option>
                                        </select>
                                    </div>
                        
                                    <div class="mb-3 ">
                                        <label for="mascota" class="form-label">¿Tiene mascota?</label>
                                        <select id="mascota" name="mascota" class="form-select" required>
                                            <option value="">Ingrese opción</option>
                                            <option value="si">Sí</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                        
                                    <div class="mb-3 ">
                                        <label for="hijos" class="form-label">¿Tiene hijos?</label>
                                        <select id="hijos" name="hijos" class="form-select" required>
                                            <option value="">Ingrese opción</option>
                                            <option value="si">Sí</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>

                                    <div class="mb-3 ">
                                        <label for="imagen" class="form-label">Subir Imagen Referencial:</label>
                                        <input type="file" id="imagen" name="imagen" class="form-control" accept="image/*" required>
                                    </div>
                                    
                                </div>
                            </div>

                            <div class="text-center mt-4 mb-4">
                                <i 
                                  class="fa-regular fa-floppy-disk" 
                                  style="color: #808080; font-size: 3rem; cursor: pointer;" 
                                  onclick="window.location.href='mis_solicitudes.html';">
                                </i>
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
    </body>
</html>
