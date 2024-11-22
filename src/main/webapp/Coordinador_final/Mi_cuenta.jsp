<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Mi Cuenta</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed" style="background-color: white;">
<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Perfil</h1>

                <!-- Iniciamos la rejilla de Bootstrap -->
                <div class="row align-items-center">
                    <!-- Columna de la imagen del usuario -->
                    <div class="col-lg-6 d-flex flex-column align-items-center">
                        <img src="<%= request.getContextPath() %>/assets/img/usuario.jpg"
                             class="img-fluid mb-3"
                             alt="Imagen del usuario"
                             style="max-width: 50%; height: auto; width: 65%;" />
                    </div>

                    <!-- Columna del formulario de información -->
                    <div class="col-lg-6">
                        <form action="#" method="post"
                              class="p-3 border rounded bg-light mx-auto mb-3"
                              style="width: 90%; max-width: 1400px; background-color: rgb(200, 200, 200) !important;">

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
                                <label for="celular" class="form-label">Celular Personal:</label>
                                <input type="tel" id="celular" name="celular" class="form-control" value="987654321" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="email" class="form-label">Correo Electrónico:</label>
                                <input type="email" id="email" name="email" class="form-control" value="a20206311@pucp.edu.pe" readonly>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white;">© Huella Viva</div>
                    <div>
                        <span style="color: white;">Correo:</span>
                        <a href="mailto:info@alberguegosu.com" style="color: white;">info@alberguegosu.com</a>
                        <div></div>
                        <span style="color: white;">Teléfono:</span>
                        <a href="tel:+1234567890" style="color: white;">+123 456 7890</a>
                        <div></div>
                        <span style="color: white;">Ubicación:</span>
                        <span style="color: white;">Calle Ejemplo 123, Ciudad, País</span>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
