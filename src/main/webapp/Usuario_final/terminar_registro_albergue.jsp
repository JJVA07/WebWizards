<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Formulario de registro de albergue" />
    <meta name="author" content="Tu nombre" />
    <title>Termine su Registro</title>
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

        .register-link {
            color: #dd9013;
            text-decoration: underline;
        }

        /* Cambio de color al hacer hover */
        .register-link:hover {
            color: #c06c05; /* Naranja oscuro */
        }
    </style>
</head>

<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card shadow-lg border-0 rounded-lg">
                    <div class="card-header">
                        <h3 class="text-center font-weight-light my-2">Termine su Registro</h3>
                    </div>
                    <div class="card-body">
                        <form>
                            <div class="row">
                                <!-- Año de creación -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputAnoCreacion" type="number" placeholder="Año de creación" required />
                                        <label for="inputAnoCreacion">Año de Creación</label>
                                    </div>
                                </div>

                                <!-- Punto de acopio de donaciones -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputAcopioDonaciones" type="text" placeholder="Punto de acopio de donaciones" required />
                                        <label for="inputAcopioDonaciones">Punto de Acopio de Donaciones</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Cantidad de animales albergados -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputCantidadAnimales" type="number" placeholder="Cantidad de animales albergados" required />
                                        <label for="inputCantidadAnimales">Cantidad de Animales Albergados</label>
                                    </div>
                                </div>

                                <!-- Dirección de donación -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputDireccionDonacion" type="text" placeholder="Dirección de donación" required />
                                        <label for="inputDireccionDonacion">Dirección de Donación</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Cantidad de espacios para nuevos animales -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEspaciosNuevos" type="number" placeholder="Cantidad de espacios para nuevos animales" required />
                                        <label for="inputEspaciosNuevos">Cantidad de Espacios para Nuevos Animales</label>
                                    </div>
                                </div>

                                <!-- Nombre de contacto de donaciones -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputContactoDonaciones" type="text" placeholder="Nombre de contacto de donaciones" required />
                                        <label for="inputContactoDonaciones">Nombre de Contacto de Donaciones</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- URL de Facebook/Instagram -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputUrlSocial" type="url" placeholder="https://facebook.com/..." required />
                                        <label for="inputUrlSocial">URL de Facebook/Instagram</label>
                                    </div>
                                </div>

                                <!-- Número de contacto de donaciones -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputNumeroContacto" type="tel" placeholder="Número de contacto de donaciones" required />
                                        <label for="inputNumeroContacto">Número de Contacto de Donaciones</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Dirección -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputDireccion" type="text" placeholder="Dirección" required />
                                        <label for="inputDireccion">Dirección</label>
                                    </div>
                                </div>

                                <!-- Número de Yape/Plin -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputNumeroYape" type="tel" placeholder="Número de Yape/Plin" required />
                                        <label for="inputNumeroYape">Número de Yape/Plin</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <!-- Distrito -->
                                <div class="col-md-6">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputDistrito" type="text" placeholder="Distrito" required />
                                        <label for="inputDistrito">Distrito</label>
                                    </div>
                                </div>

                                <!-- Adjunte código QR -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="inputCodigoQR" class="form-label">Adjunte Código QR</label>
                                        <input class="form-control" id="inputCodigoQR" type="file" accept="image/*" required />
                                    </div>
                                </div>
                            </div>

                            <!-- Botón de Registrarse -->
                            <div class="d-grid">
                                <a href="inicio_sesion.html" class="btn btn-secondary btn-block">Registrarse</a>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center py-3">
                        <div class="small">
                            <a class="register-link" href="inicio_sesion.html">¿Ya tienes una cuenta? Inicia sesión aquí</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
