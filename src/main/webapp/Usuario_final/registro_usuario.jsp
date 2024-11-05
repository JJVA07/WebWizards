<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Formulario de registro de usuario" />
    <meta name="author" content="Tu nombre" />
    <title>Crear Cuenta de Usuario</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            background-image: url('assets/img/fondo_inicio.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }
        .forgot-password,
        .register-link {
            color: #dd9013;
            text-decoration: underline;
        }

        /* Cambio de color al hacer hover */
        .forgot-password:hover,
        .register-link:hover {
            color: #c06c05; /* Naranja oscuro */
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-lg border-0 rounded-lg">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-2">Crear Cuenta de Usuario</h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <!-- Nombre -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputNombre" type="text" placeholder="Juan" required />
                                <label for="inputNombre">Nombre</label>
                            </div>

                            <!-- Apellidos -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputApellidos" type="text" placeholder="Pérez" required />
                                <label for="inputApellidos">Apellidos</label>
                            </div>

                            <!-- Distrito -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputDistrito" type="text" placeholder="San Isidro" required />
                                <label for="inputDistrito">Distrito</label>
                            </div>

                            <!-- Dirección -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputDireccion" type="text" placeholder="Av. Principal 123" required />
                                <label for="inputDireccion">Dirección</label>
                            </div>

                            <!-- Correo Gmail -->
                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputEmail" type="email" placeholder="nombre@gmail.com" required />
                                <label for="inputEmail">Correo Electrónico (Gmail)</label>
                            </div>

                            <!-- Botón de enviar -->
                            <div class="d-grid">
                                <button class="btn btn-secondary btn-block" type="submit">Crear Cuenta</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center py-3">
                        <div class="small">
                            <a class="small mb-2 forgot-password" href="inicio_sesion.html">¿Ya tienes una cuenta? Inicia sesión aquí</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
