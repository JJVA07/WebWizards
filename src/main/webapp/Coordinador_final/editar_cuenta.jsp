<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Editar Cuenta</title>
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
                <h1 class="mt-4">Editar Perfil</h1>

                <!-- Rejilla Bootstrap -->
                <div class="row align-items-center">
                    <!-- Imagen del usuario -->
                    <div class="col-lg-6 d-flex flex-column align-items-center">
                        <img src="<%= request.getContextPath() %>/assets/img/usuario.jpg" class="img-fluid mb-3"
                             alt="Imagen del usuario" style="max-width: 50%; height: auto; width: 65%;" />
                    </div>

                    <!-- Formulario -->
                    <div class="col-lg-6">
                        <form action="<%= request.getContextPath() %>/procesar_edicion" method="post"
                              enctype="multipart/form-data" class="p-3 border rounded bg-light mx-auto mb-3"
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
                                <input type="text" id="genero" name="genero" class="form-control" value="No binario" readonly>
                            </div>

                            <div class="mb-3">
                                <label for="celular_personal" class="form-label">Celular Personal:</label>
                                <input type="tel" id="celular_personal" name="celular_personal" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="correo" class="form-label">Correo Electrónico:</label>
                                <input type="email" id="correo" name="correo" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="imagen" class="form-label">Subir Imagen Referencial:</label>
                                <input type="file" id="imagen" name="imagen" class="form-control" accept="image/*" required>
                            </div>

                            <!-- Botón Guardar -->
                            <div class="text-center mt-4 mb-4">
                                <button type="submit" class="btn" style="background: none; border: none;">
                                    <i class="fa-regular fa-floppy-disk" style="color: #808080; font-size: 4rem;"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a>
                        <a href="mailto:info@alberguegosu.com" style="color: white;">info@alberguegosu.com</a>
                        <br>
                        <a style="color: white;">Teléfono:</a>
                        <a href="tel:+1234567890" style="color: white;">+123 456 7890</a>
                        <br>
                        <a style="color: white;">Ubicación:</a>
                        <a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script>
    function redirigir() {
        window.location.href = "<%= request.getContextPath() %>/mi_cuenta.jsp";
    }
</script>
</body>
</html>
