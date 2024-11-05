<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Formulario Adopcion</title>
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
                        
                        <a class="nav-link active" href="adopcion.html">
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
                    <h1 class="mt-4">Formulario de Adopción</h1>
            
                    <!-- Iniciamos la rejilla de Bootstrap -->
                    <div class="row align-items-center">
                        <!-- Columna de la imagen del perro y descripción -->
                        <div class="col-lg-6 d-flex flex-column align-items-center">
                            <!-- Imagen del perro con mejoras en estilo y formato -->
                            <div class="card shadow-sm mb-3" style="width: 75%; border-radius: 15px; overflow: hidden;">
                                <img src="../assets/img/perro_adopcion1.jpeg" class="img-fluid" alt="Imagen del perro" />
                            </div>
                            <!-- Descripción con mejor formato y diseño -->
                            <div class="text-center p-3" style=" background-color: rgb(200, 200, 200) !important; border-radius: 10px;">
                                <h5 class="mb-3"><strong>Descripción del perro</strong></h5>
                                <p style="text-align: justify; line-height: 1.6;">
                                    Este adorable perro es conocido por su carácter cariñoso, leal y energía inagotable. Es perfecto para una familia activa que disfrute de juegos al aire libre. 
                                    <br><br>
                                    Se lleva muy bien con otros animales y es especialmente amistoso con los niños. 
                                    <br><br>
                                    <strong>Edad:</strong> 2 años <br>
                                    <strong>Tamaño:</strong> Mediano
                                </p>
                            </div>
                        </div>

            
                       <!-- Columna del formulario de adopción -->
                        <div class="col-lg-6" >
                            <form action="procesar_adopcion.html" method="post" class="p-3 border rounded bg-light" style=" background-color: rgb(200, 200, 200) !important;">
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="nombre">Nombre:</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="apellido">Apellido:</label>
                                        <input type="text" id="apellido" name="apellido" class="form-control" required>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="genero">Género:</label>
                                        <select id="genero" name="genero" class="form-control" required>
                                            <option value="masculino">Masculino</option>
                                            <option value="femenino">Femenino</option>
                                            <option value="otro">Otro</option>
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="edad">Edad:</label>
                                        <input type="number" id="edad" name="edad" class="form-control" required>
                                    </div>
                                </div> 

                                <div class="form-group mb-3">
                                    <label for="direccion">Dirección:</label>
                                    <input type="text" id="direccion" name="direccion" class="form-control" required>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="metraje">Metraje de Vivienda:</label>
                                        <input type="number" id="metraje" name="metraje" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="cuartos">Cantidad de Cuartos:</label>
                                        <input type="number" id="cuartos" name="cuartos" class="form-control" required>
                                    </div>
                                </div>

                                <!-- Alineamos los campos de celular en una misma fila -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label for="celular_personal">Celular Personal:</label>
                                        <input type="text" id="celular_personal" name="celular_personal" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="celular_referencia">Celular de Referencia:</label>
                                        <input type="text" id="celular_referencia" name="celular_referencia" class="form-control" required>
                                    </div>
                                </div>

                                <!-- Organizar preguntas en dos columnas -->
                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label>¿Vive solo o con dependientes?</label><br>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="vivienda" id="solo" value="solo" required>
                                            <label class="form-check-label" for="solo">Solo</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="vivienda" id="dependientes" value="dependientes">
                                            <label class="form-check-label" for="dependientes">Con dependientes</label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label>¿Trabaja remoto o presencial?</label><br>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="trabajo" id="remoto" value="remoto" required>
                                            <label class="form-check-label" for="remoto">Remoto</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="trabajo" id="presencial" value="presencial">
                                            <label class="form-check-label" for="presencial">Presencial</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="row mb-3">
                                    <div class="col-md-6">
                                        <label>¿Tiene mascotas?</label><br>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="mascotas" id="mascotas_si" value="si" required>
                                            <label class="form-check-label" for="mascotas_si">Sí</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="mascotas" id="mascotas_no" value="no">
                                            <label class="form-check-label" for="mascotas_no">No</label>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label>¿Tiene hijos?</label><br>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="hijos" id="hijos_si" value="si" required>
                                            <label class="form-check-label" for="hijos_si">Sí</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" name="hijos" id="hijos_no" value="no">
                                            <label class="form-check-label" for="hijos_no">No</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group mb-3">
                                    <button type="submit" class="btn btn-secondary btn-block w-100">Adoptar</button>
                                </div>
                            </form>
                        </div>


                </div>
            </main>
            <br>
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
