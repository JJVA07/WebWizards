<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Formulario Creación de Coordinadores</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            body {
                background-color: #e6ddcc;
                font-family: Arial, sans-serif;
            }

            h2 {
                color: black;
                text-align: center;
            }

            /* Estilo para el formulario de creación de coordinadores */
            form {
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-gap: 20px;
                width: 100%; /* Formulario a pantalla completa */
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            label {
                font-weight: bold;
                color: black; /* Letras negras */
                display: flex;
                align-items: center;
            }

            input[type="text"],
            input[type="email"],
            input[type="date"] {
                width: 100%;
                padding: 10px;
                font-size: 1rem;
                border: 1px solid #ccc;
                border-radius: 5px;
                background-color: #f9f9f9;
                transition: border 0.3s ease;
            }

            input:focus {
                border: 1px solid #4a4a8c;
                outline: none;
                background-color: #fff;
            }

            button[type="submit"] {
                grid-column: 1 / 3; /* Botón ocupa todo el ancho */
                padding: 10px 15px;
                background-color: #6c757d; /* Botón gris (plomo) */
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                font-size: 1rem;
                text-align: center;
                transition: background-color 0.3s ease;
            }

            button[type="submit"]:hover {
                background-color: #5a6268;
            }

            .container-fluid {
                width: 100%;
                padding: 0 50px; /* Espacio alrededor del formulario */
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
    <jsp:include page="/WEB-INF/navbar_admi.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/sidebar_admi.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100 mb-4">
                        <div class="col-lg-12">
                            <h2 class="mt-3">Creación de Coordinadores</h2>
                            <form action="<%= request.getContextPath() %>/AdministradorServlet?action=crearCoordinador" method="POST">
                                <label for="nombre">Nombre:</label>
                                <input type="text" id="nombre" name="nombre" required>

                                <label for="apellido">Apellido:</label>
                                <input type="text" id="apellido" name="apellido" required>

                                <label for="dni">DNI:</label>
                                <input type="text" id="dni" name="dni" required>

                                <label for="telefono">Teléfono:</label>
                                <input type="text" id="telefono" name="telefono" required>

                                <label for="correo">Correo Electrónico:</label>
                                <input type="email" id="correo" name="correo" required>

                                <label for="zona">Zona Asignada:</label>
                                <input type="text" id="zona" name="zona" required>


                                <button type="submit" class="btn btn-secondary btn-block w-100">Crear Coordinador</button>
                            </form>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
    </body>
</html>
