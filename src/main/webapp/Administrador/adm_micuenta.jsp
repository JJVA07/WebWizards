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
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/css/styles_2.css" rel="stylesheet">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            /* Estilos personalizados para la sección de perfil */
            #mi-perfil {
                background-color: #fdfcfb;
                padding: 40px;
                border-radius: 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                max-width: 800px;
                margin: 0 auto;
            }

            #mi-perfil h2 {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                font-size: 2rem;
                color: #3e3e3e;
                border-bottom: 2px solid #eab85c;
                padding-bottom: 10px;
                margin-bottom: 30px;
            }

            .profile-container {
                display: flex;
                align-items: flex-start;
                gap: 40px;
            }

            .profile-picture img {
                border-radius: 50%;
                border: 4px solid #eab85c;
                width: 150px;
                height: 150px;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .profile-picture img:hover {
                transform: scale(1.05);
            }

            .profile-picture button {
                background-color: #eab85c;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease;
                font-size: 1rem;
                margin-top: 10px;
            }

            .profile-picture button:hover {
                background-color: #d19b4a;
            }

            .profile-info form {
                width: 100%;
            }

            .profile-info label {
                font-weight: bold;
                color: #3e3e3e;
                font-size: 1rem;
                display: block;
                margin-bottom: 6px;
            }

            .profile-info input[type="text"], 
            .profile-info input[type="email"], 
            .profile-info input[type="password"] {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border-radius: 5px;
                border: 1px solid #ccc;
                font-size: 1rem;
                background-color: #f9f9f9;
                transition: border 0.3s ease;
            }

            .profile-info input[type="text"]:focus, 
            .profile-info input[type="email"]:focus, 
            .profile-info input[type="password"]:focus {
                border: 1px solid #eab85c;
                outline: none;
                background-color: #fff;
            }

            .profile-info button {
                background-color: #3e3e3e;
                color: white;
                border: none;
                padding: 12px 24px;
                font-size: 1rem;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease, transform 0.2s ease;
            }

            .profile-info button:hover {
                background-color: #5b5b5b;
                transform: translateY(-2px);
            }

            /* Resaltar campos de contraseña */
            .profile-info input[type="password"] {
                background-color: #f1f7fd;
                border-color: #d9e3f0;
            }

            .profile-info input[type="password"]:focus {
                background-color: #fff;
                border-color: #82b1ff;
            }
        </style>
    </head>
    <body class="sb-nav-fixed" style="background-color: #e6ddcc;">

    <jsp:include page="/WEB-INF/navbar_admi.jsp" />

    <div id="layoutSidenav">
        <jsp:include page="/WEB-INF/sidebar_admi.jsp" />
            <div id="layoutSidenav_content">
                <main>
                    <div id="mi-perfil" class="section">
                        <h2>Mi Perfil</h2>
                        <div class="profile-container">
                            <div class="profile-picture" style="text-align: center;">
                                <img src="https://via.placeholder.com/150" alt="Foto de Perfil" id="profileImage">
                                <button onclick="editProfilePicture()">Cambiar Foto</button>
                            </div>
                            <div class="profile-info">
                                <form id="profileForm">
                                    <div>
                                        <label for="nombre">Nombre:</label>
                                        <input type="text" id="nombre" name="nombre" value="Juan Pérez">
                                    </div>
                                    <div>
                                        <label for="correo">Correo Electrónico:</label>
                                        <input type="email" id="correo" name="correo" value="juan.perez@example.com">
                                    </div>
                                    <div>
                                        <label for="password">Nueva Contraseña:</label>
                                        <input type="password" id="password" name="password" placeholder="Nueva Contraseña">
                                    </div>
                                    <div>
                                        <label for="confirmPassword">Confirmar Contraseña:</label>
                                        <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirmar Contraseña">
                                    </div>
                                    <button type="button" onclick="editProfile()">Editar Información</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>

            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script>
            function editProfile() {
                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirmPassword').value;

                if (password !== "" && password !== confirmPassword) {
                    alert('Las contraseñas no coinciden.');
                    return;
                }

                alert('Información del perfil actualizada correctamente.');
                // Aquí iría la lógica para enviar la información actualizada al servidor.
            }

            function editProfilePicture() {
                alert('Función para cambiar la foto de perfil.');
            }
        </script>
    <script src="<%= request.getContextPath() %>/assets/js/scripts.js"></script>
    </body>
</html>
