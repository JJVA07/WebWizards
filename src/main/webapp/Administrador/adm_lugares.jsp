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
        <title>Formulario Creación de Lugares Habilitados</title>
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
                margin-top: 0;
                padding-top: 20px;
            }

            /* Ajustar formulario para que ocupe todo el ancho lateral */
            form {
                display: grid;
                grid-template-columns: 1fr 1fr;
                grid-gap: 20px;
                width: 100%; /* El formulario ocupará todo el ancho disponible */
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            label {
                font-weight: bold;
                color: black;
                display: flex;
                align-items: center;
            }

            input[type="text"],
            input[type="number"] {
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
                grid-column: 1 / 3; /* Botón ocupará todo el ancho */
                padding: 10px 15px;
                background-color: #6c757d;
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

            /* Ocupamos todo el ancho disponible */
            .container-fluid {
                padding: 0; /* Eliminar padding lateral */
                width: 100%; /* Asegura que el contenedor ocupe todo el espacio */
            }

            /* Ajustar altura mínima */
            .main-content {
                min-height: 100vh; /* Altura mínima */
                display: flex;
                align-items: flex-start; /* Comienza desde el tope */
                justify-content: center; /* Centrar horizontalmente */
                padding-top: 0;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
    <jsp:include page="/WEB-INF/navbar_admi.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/sidebar_admi.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid main-content"> <!-- Contenedor que ocupa todo el ancho -->
                        <div class="col-lg-12"> <!-- Cambié a 12 columnas para que ocupe todo el ancho -->
                            <h2 class="mt-3">Creación de Lugares Habilitados</h2>
                            <form>
                                <label for="nombreLugar">Nombre del Lugar:</label>
                                <input type="text" id="nombreLugar" name="nombreLugar">
                                
                                <label for="direccion">Dirección:</label>
                                <input type="text" id="direccion" name="direccion">
                                
                                <label for="zonaLugar">Zona:</label>
                                <input type="text" id="zonaLugar" name="zonaLugar">
                                
                                <label for="capacidad">Capacidad:</label>
                                <input type="number" id="capacidad" name="capacidad">
                                
                                <button type="submit" class="btn btn-secondary btn-block w-100">Crear Lugar</button>
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
