<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Albergue - Donación</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="sb-nav-fixed">
<%@ include file="/WEB-INF/navbar_albergue.jsp" %>

<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_albergue.jsp" %>

    <div id="layoutSidenav_content">
        <div class="container-fluid">
            <div class="d-sm-flex align-items-center justify-content-between mb-4">
                <h1 class="h3 mb-0 text-gray-800">Crear Publicación - Donación</h1>
            </div>

            <!-- Formulario -->
            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <form id="donation-form" action="AlbergueServlet?action=donacion_post" method="post" class="needs-validation" novalidate>
                                <input type="hidden" name="action" value="donacion_post" />
                                <div class="row">
                                    <!-- Primera columna -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="telefono" class="form-label">Teléfono de contacto del albergue:</label>
                                            <input type="number" id="telefono" name="telefono"
                                                   class="form-control" min="100000000" max="999999999999999"
                                                   title="Ingrese un número válido (9-15 dígitos)" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese un número de teléfono válido (9-15 dígitos).
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="nombre-contacto" class="form-label">Nombre de contacto del albergue:</label>
                                            <input type="text" id="nombre-contacto" name="nombre_contacto_albergue"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese el nombre de contacto.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="punto-acopio" class="form-label">Punto de acopio:</label>
                                            <input type="text" id="punto-acopio" name="punto_acopio_donaciones"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese el punto de acopio.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="tipo-donacion" class="form-label">Tipos de donaciones:</label>
                                            <input type="text" id="tipo-donacion" name="tipo_donacion"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese los tipos de donaciones.
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Segunda columna -->
                                    <div class="col-md-6">
                                        <div class="form-group mb-3">
                                            <label for="cantidad-donaciones" class="form-label">Cantidad de donaciones:</label>
                                            <input type="number" id="cantidad-donaciones" name="cantidad_donacion"
                                                   class="form-control" min="1" required>
                                            <div class="invalid-feedback">
                                                Por favor ingrese una cantidad válida.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="fechas-recepcion" class="form-label">Fecha programada para recepción:</label>
                                            <input type="date" id="fechas-recepcion" name="fechas_programadas_recepcion"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor seleccione una fecha válida.
                                            </div>
                                        </div>

                                        <div class="form-group mb-3">
                                            <label for="horas-recepcion" class="form-label">Hora programada para recepción:</label>
                                            <input type="time" id="horas-recepcion" name="hora_recepcion"
                                                   class="form-control" required>
                                            <div class="invalid-feedback">
                                                Por favor seleccione una hora válida.
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Botón Enviar -->
                                <div class="form-group mt-3 text-center">
                                    <button type="submit" class="btn btn-secondary">Enviar</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
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
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath() %>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/datatables-simple-demo.js"></script>
</body>
</html>