<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Inicio de Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <style>
        html,
        body {
            height: 100%;
            margin: 0;
            background-image: url('<%= request.getContextPath() %>/assets/img/fondo_inicio.jpg');
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
        /* Estilos personalizados para los botones */
        .btn-custom-usuario {
            background-color: #db5a32;
            color: white;
        }

        .btn-custom-usuario:hover {
            background-color: #d64f25;
            color: white;
        }

        .btn-custom-albergue {
            background-color: #88d147;
            color: white;
        }

        .btn-custom-albergue:hover {
            background-color: #7ed135;
            color: white;
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
                                <h3 class="text-center font-weight-light my-2">Inicio de Sesión</h3>
                            </div>
                            <div class="card-body">
                                <form action="<%=request.getContextPath()%>/LoginServlet" method="post">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail" name="email" type="email" placeholder="name@example.com" required />
                                        <label for="inputEmail">Correo Electrónico</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" name="password" type="password" placeholder="Password" required />
                                        <label for="inputPassword">Contraseña</label>

                                    </div>
                                    <% if (request.getParameter("error") != null) { %>
                                    <div >Error en usuario o contraseña</div>
                                    <% } %>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                        <label class="form-check-label" for="inputRememberPassword">Recordar Contraseña</label>
                                    </div>
                                    <div class="d-flex flex-column align-items-center justify-content-center mt-4 mb-0">
                                        <button type="submit" class="btn btn-secondary w-100 text-center">Ingresar</button>
                                        <br>
                                        <a class="small mb-2 forgot-password" href="<%= request.getContextPath() %>/olvidaste_contraseña.jsp">¿Olvidaste tu contraseña?</a>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small">
                                    <!-- Link para abrir el modal -->
                                    <a class="register-link" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">¿Necesitas una cuenta? ¡Regístrate!</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>

<!-- Modal para elegir tipo de registro -->
<div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="registerModalLabel">Elige el tipo de registro</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>¿Cómo te gustaría registrarte?</p>
                <div class="d-grid gap-2">
                    <!-- Opciones de registro -->
                    <a href="<%= request.getContextPath() %>/registro_usuario.jsp" class="btn btn-custom-usuario mx-2">Registrarme como Usuario</a>
                    <a href="<%= request.getContextPath() %>/registro_albergue.jsp" class="btn btn-custom-albergue mx-2">Registrarme como Albergue</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>

</html>
