<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Formulario Adopción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" id="navbarDropdown2" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>
<div id="layoutSidenav">
    <!-- Incluir el sidebar común -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Formulario de Adopción</h1>
                <div class="row align-items-center">
                    <div class="col-lg-6 d-flex flex-column align-items-center">
                        <div class="card shadow-sm mb-3" style="width: 75%; border-radius: 15px; overflow: hidden;">
                            <img src="<%= request.getContextPath() %>/assets/img/perro_adopcion1.jpeg" class="img-fluid" alt="Imagen del perro" />
                        </div>
                        <div class="text-center p-3" style="background-color: rgb(200, 200, 200) !important; border-radius: 10px;">
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
                    <div class="col-lg-6">
                        <form action="<%= request.getContextPath() %>/procesar_adopcion" method="post" class="p-3 border rounded bg-light" style="background-color: rgb(200, 200, 200) !important;">
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
            </div>
        </main>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a> <a href="#" style="color: white;">info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono:</a> <a href="#" style="color: white;">+123 456 7890</a>
                        <a style="color: white;">Ubicación:</a> <a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
