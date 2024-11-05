<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Recuperar Contraseña</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        html,
        body {
            height: 100%;
            margin: 0;
            background-image: url('assets/img/fondo_inicio.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }

        #layoutAuthentication {
            display: flex;
            flex-direction: column;
            height: 100%;
        }

        #layoutAuthentication_content {
            flex: 1 0 auto;
        }

        #layoutAuthentication_footer {
            flex-shrink: 0;
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
    <div id="layoutAuthentication">
        <div id="layoutAuthentication_content">
            <main>
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-5">
                            <div class="card shadow-lg border-0 rounded-lg mt-5">
                                <div class="card-header">
                                    <h3 class="text-center font-weight-light my-2">Recuperar Contraseña</h3>
                                    <p class="text-center">Introduce tu correo electrónico para enviar el enlace de recuperación</p>
                                </div>
                                <div class="card-body">
                                    <form>
                                        <!-- Campo de correo electrónico -->
                                        <div class="form-floating mb-3">
                                            <input class="form-control" id="inputEmail" type="email" placeholder="name@example.com" required />
                                            <label for="inputEmail">Correo Electrónico</label>
                                        </div>
                                        <!-- Botón para enviar el enlace de recuperación -->
                                        <div class="d-grid gap-2">
                                            <button class="btn btn-secondary btn-block" type="submit">Enviar Enlace de Recuperación</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="card-footer text-center py-3">
                                    <div class="small">
                                        <a class="small mb-2 forgot-password" href="inicio_sesion.html">Volver al Inicio de Sesión</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
