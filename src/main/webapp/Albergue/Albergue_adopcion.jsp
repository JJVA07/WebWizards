<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Albergue - Adopción</title>
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
            <h1 class="h3 mb-4 text-gray-800">Crear Publicación - Adopción</h1>

            <div class="row">
                <div class="col-xl-12 col-lg-12">
                    <div class="card shadow mb-4">
                        <div class="card-body">
                            <form id="adopcion-form" action="AlbergueServlet?action=adopcion_post" method="post" enctype="multipart/form-data">
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="nombreMascota">Nombre de la mascota:</label>
                                        <input type="text" id="nombreMascota" name="nombreMascota" class="form-control" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="edad">Edad de la mascota:</label>
                                        <input type="number" id="edad" name="edad" class="form-control" min="1" step="1" required>
                                    </div>
                                </div>
                                <br>

                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="genero">Género de la mascota:</label>
                                        <select id="genero" name="genero" class="form-control" required>
                                            <option value="">Seleccione...</option>
                                            <option value="Macho">Macho</option>
                                            <option value="Hembra">Hembra</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="foto">Sube una foto:</label><br>
                                        <input type="file" id="foto" name="Foto" class="form-control-file" accept=".jpeg,.jpg,.png" required>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="descripcion">Descripción:</label>
                                        <textarea id="descripcion" name="descripcion" class="form-control" rows="5" required></textarea>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="raza">Raza de la mascota:</label>
                                        <input type="text" id="raza" name="raza" class="form-control" required>
                                    </div>
                                </div>

                                <br>
                                <div class="form-group text-center mt-2">
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
