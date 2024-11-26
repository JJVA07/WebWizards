<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #842029;
            padding: 20px;
            text-align: center;
        }
        .error-box {
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #f5c2c7;
            background-color: #f8d7da;
            max-width: 600px;
            border-radius: 10px;
        }
        h1 {
            color: #842029;
        }
        a {
            text-decoration: none;
            color: #842029;
            font-weight: bold;
        }
        a:hover {
            color: #721c24;
        }
    </style>
</head>
<body>
<div class="error-box">
    <h1>¡Oops! Algo salió mal</h1>
    <p>No pudimos procesar tu solicitud. Esto podría deberse a un error en el servidor o a un parámetro inválido.</p>
    <p>Por favor, verifica la información e inténtalo nuevamente.</p>
    <p><a href="<%= request.getContextPath() %>/">Volver al inicio</a></p>
</div>
</body>
</html>
