<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Registrar Solicitud</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
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
                <a class="nav-link " id="navbarDropdown" href="home.html" role="button"><i class="fa-solid fa-paw"></i></a>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <jsp:include page="/WEB-INF/sidebar.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container mt-3">
                        <h1 class="text-center mb-3">¡Postule Ahora!</h1>
                        <p class="text-center fst-italic">*El rango mínimo de dueño temporal debe ser de 2 semanas consecutivas, caso contrario abstenerse*</p>
                        <!-- Corregir el action para redirigir al servlet con el case "registrarPostulacion" -->
                        <form id="postulacionForm" action="<%= request.getContextPath() %>/Usuario?action=registrarPostulacion" method="POST"
                              class="p-4 border rounded bg-light mx-auto mb-4"
                              style="width: 100%; max-width: 1800px; background-color: rgb(200, 200, 200) !important;">
                            <div class="row">
                                <!-- Primera columna -->
                                <div class="col-md-6">
                                    <h4 class="text-align">Datos solicitados</h4>
                                    <div class="mb-3">
                                        <label for="nombre" class="form-label">Nombre:</label>
                                        <input type="text" id="nombre" name="nombre" class="form-control"
                                               pattern="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{1,250}$" required
                                               title="Solo se permiten letras y espacios. Máximo 250 caracteres.">
                                    </div>
                                    <div class="mb-3">
                                        <label for="apellido" class="form-label">Apellido:</label>
                                        <input type="text" id="apellido" name="apellido" class="form-control"
                                               pattern="^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{1,250}$" required
                                               title="Solo se permiten letras y espacios. Máximo 250 caracteres.">
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-md-6">
                                            <label for="genero" class="form-label">Género:</label>
                                            <select id="genero" name="genero" class="form-select" required>
                                                <option value="">Selecciona una opción</option>
                                                <option value="masculino">Masculino</option>
                                                <option value="femenino">Femenino</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="edad" class="form-label">Edad:</label>
                                            <input type="number" id="edad" name="edad" class="form-control" min="1" max="100" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="direccion" class="form-label">Dirección:</label>
                                        <input type="text" id="direccion" name="direccion" class="form-control" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="metraje" class="form-label">Metraje de Vivienda (m²):</label>
                                        <input type="number" id="metraje" name="metraje" class="form-control" min="0" max="10000" required>
                                    </div>
                                    <div class="mb-3 row">
                                        <div class="col-md-6">
                                            <label for="mascotas" class="form-label">Tipo de Mascotas:</label>
                                            <select id="mascotas" name="mascotas" class="form-select" required>
                                                <option value="" disabled selected>Selecciona una opción</option>
                                                <option value="perro">Perro</option>
                                                <option value="gato">Gato</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="cantidad_mascotas" class="form-label">Cantidad de Mascotas:</label>
                                            <input type="number" id="cantidad_mascotas" name="cantidad_mascotas" class="form-control" min="0" max="1000" required
                                                   title="Ingresa un número entero mayor o igual a 0.">
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label for="tiempo_temporal" class="form-label">Tiempo temporal (semanas):</label>
                                        <input type="number" id="tiempo_temporal" name="tiempo_temporal" class="form-control" min="2" max="100" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="fecha_inicio" class="form-label">Fecha inicio:</label>
                                        <input type="date" id="fecha_inicio" name="fecha_inicio" class="form-control" min="2024-01-01" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="cuartos" class="form-label">Cantidad de Cuartos:</label>
                                        <input type="number" id="cuartos" name="cuartos" class="form-control" min="1" max="1000" required>
                                    </div>
                                </div>
                                <!-- Segunda columna -->
                                <div class="col-md-6">
                                    <h4 class="text">Responda</h4>
                                    <div class="mb-3">
                                        <label for="vivienda" class="form-label">¿Vive solo o con dependientes?</label>
                                        <select id="vivienda" name="vivienda" class="form-select" required>
                                            <option value="">Selecciona una opción</option>
                                            <option value="solo">Solo</option>
                                            <option value="dependientes">Con dependientes</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="trabajo" class="form-label">¿Trabaja remoto o presencial?</label>
                                        <select id="trabajo" name="trabajo" class="form-select" required>
                                            <option value="">Selecciona una opción</option>
                                            <option value="remoto">Remoto</option>
                                            <option value="presencial">Presencial</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="mascota" class="form-label">¿Tiene mascota?</label>
                                        <select id="mascota" name="mascota" class="form-select" required>
                                            <option value="">Selecciona una opción</option>
                                            <option value="si">Sí</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="hijos" class="form-label">¿Tiene hijos?</label>
                                        <select id="hijos" name="hijos" class="form-select" required>
                                            <option value="">Selecciona una opción</option>
                                            <option value="si">Sí</option>
                                            <option value="no">No</option>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="celular_personal" class="form-label">Celular Personal:</label>
                                        <input type="tel" id="celular_personal" name="celular_personal"
                                               class="form-control" pattern="[0-9]{9}" maxlength="9" required
                                               title="Ingresa un número de 9 dígitos.">
                                    </div>
                                    <div class="mb-3">
                                        <label for="celular_referencia" class="form-label">Celular de Referencia:</label>
                                        <input type="tel" id="celular_referencia" name="celular_referencia"
                                               class="form-control" pattern="[0-9]{9}" maxlength="9" required
                                               title="Ingresa un número de 9 dígitos.">
                                    </div>
                                    <div class="mb-3">
                                        <label for="persona_referencia" class="form-label">Persona de referencia:</label>
                                        <input type="text" id="persona_referencia" name="persona_referencia" class="form-control"
                                               pattern="[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]{1,250}" required
                                               title="Solo se permiten letras y espacios. Máximo 250 caracteres.">
                                    </div>
                                    <div class="mb-3">
                                        <label for="fecha_fin" class="form-label">Fecha fin:</label>
                                        <input type="date" id="fecha_fin" name="fecha_fin" class="form-control" min="2024-01-01" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="imagen" class="form-label">Subir Imagen Referencial:</label>
                                        <input type="file" id="imagen" name="imagen" class="form-control" accept=".jpg,.png" required>
                                    </div>
                                </div>
                            </div>
                            <div class="text-center mt-2 mb-2">
                                <button type="submit" class="btn postular-btn" style="background-color: #6c757d; border-radius: 10px; color: white; font-size: 1.2rem; padding: 10px 20px; border: none;">
                                    ¿Postular?
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
    </body>
</html>
