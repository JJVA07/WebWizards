<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Formulario Mascotas Perdidas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <link href="../css/styles_2.css" rel="stylesheet" />
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
                        
                        <a class="nav-link active" href="#" data-bs-toggle="collapse" data-bs-target="#collapseCrearPublicacion" aria-expanded="true" aria-controls="collapseCrearPublicacion">
                            <div class="sb-nav-link-icon"><i class="fas fa-edit"></i></div>
                            Crear Publicación
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse show" id="collapseCrearPublicacion" aria-labelledby="headingFour" data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link active" href="mascotas_perdidas.html">Mascotas Perdidas</a>
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
                <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100 mb-4">
                    <div class="col-lg-10">
                        <h1 class="mt-4 text-center">¡No te rindas, tu compañero te está esperando!</h1>
                        <form action="procesar_reportar.html" method="post" class="p-4 border rounded bg-light mx-auto mb-4"
                        style="width: 100%; max-width: 1600px; background-color: rgb(200, 200, 200) !important;" enctype="multipart/form-data">
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="nombre" class="form-label">Nombre de la Mascota:</label>
                                    <input type="text" id="nombre" name="nombre" class="form-control" pattern="[A-Za-z\s]+" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="edad" class="form-label">Edad:</label>
                                    <input type="number" id="edad" name="edad" class="form-control" min="0" required>
                                </div>
                            </div>
                        
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="raza" class="form-label">Raza:</label>
                                    <input type="text" id="raza" name="raza" class="form-control" pattern="[A-Za-z\s]+" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="tamano" class="form-label">Tamaño:</label>
                                    <select id="tamano" name="tamano" class="form-control" required>
                                        <option value="">Seleccionar...</option>
                                        <option value="pequeño">Pequeño</option>
                                        <option value="mediano">Mediano</option>
                                        <option value="grande">Grande</option>
                                    </select>
                                </div>
                            </div>
                        
                            <div class="mb-3">
                                <label for="distintivo" class="form-label">Distintivo:</label>
                                <input type="text" id="distintivo" name="distintivo" class="form-control" pattern="[A-Za-z\s]+" required>
                            </div>
                        
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="nombre_contacto" class="form-label">Nombre de Contacto:</label>
                                    <input type="text" id="nombre_contacto" name="nombre_contacto" class="form-control" pattern="[A-Za-z\s]+" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="lugar_perdida" class="form-label">Lugar de Pérdida:</label>
                                    <input type="text" id="lugar_perdida" name="lugar_perdida" class="form-control" required>
                                </div>
                            </div>
                        
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="hora_perdida" class="form-label">Hora Aproximada de Pérdida:</label>
                                    <input type="time" id="hora_perdida" name="hora_perdida" class="form-control" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="celular_contacto" class="form-label">Celular de Contacto:</label>
                                    <input type="tel" id="celular_contacto" name="celular_contacto" class="form-control" pattern="\d{9,12}" required>
                                </div>
                            </div>
                        
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="celular_referencia" class="form-label">Celular de Referencia:</label>
                                    <input type="tel" id="celular_referencia" name="celular_referencia" class="form-control" pattern="\d{9,12}">
                                </div>
                            </div>
                        
                            <div class="mb-3">
                                <label for="descripcion" class="form-label">Descripción de la Mascota:</label>
                                <textarea id="descripcion" name="descripcion" class="form-control" rows="3" required></textarea>
                            </div>
                        
                            <div class="mb-3">
                                <label for="imagen" class="form-label">Subir Archivo de Imagen:</label>
                                <input type="file" id="imagen" name="imagen" class="form-control" accept="image/*" required>
                            </div>
                        
                            <div class="mb-3">
                                <label for="descripcion_adicional" class="form-label">Descripción Adicional:</label>
                                <textarea id="descripcion_adicional" name="descripcion_adicional" class="form-control" rows="3"></textarea>
                            </div>
                        
                            <div class="mb-3">
                                <label for="recompensa" class="form-label">Recompensa:</label>
                                <input type="text" id="recompensa" name="recompensa" class="form-control" pattern="\d*">
                            </div>
                        
                            <div class="form-group d-flex justify-content-center">
                                <button type="submit" class="btn btn-danger" style="padding: 12px 24px; font-size: 1.1rem;">
                                    Reportar
                                </button>
                            </div>
                        </form>
                        
                        
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
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="../js/scripts.js"></script>
</body>
</html>
