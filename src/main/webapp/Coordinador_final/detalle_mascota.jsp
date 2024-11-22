<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Detalles de la Mascota</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #ffffff;">

<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
    <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4" id="nombreMascota">Detalles de la Mascota</h1>

                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <!-- Información de la mascota (Izquierda) -->
                            <div class="col-md-6">
                                <p><strong>Nombre:</strong> <span id="nombre"></span></p>
                                <p><strong>Edad:</strong> <span id="edad"></span> años</p>
                                <p><strong>Raza:</strong> <span id="raza"></span></p>
                                <p><strong>Tamaño:</strong> <span id="tamaño"></span></p>
                                <p><strong>Contacto:</strong> <span id="contacto"></span></p>
                                <p><strong>Distintivo:</strong> <span id="distintivo"></span></p>
                                <p><strong>Lugar:</strong> <span id="lugar"></span></p>
                                <p><strong>Hora:</strong> <span id="hora"></span></p>
                                <p><strong>Contacto Nombre:</strong> <span id="contacto_nombre"></span></p>
                                <p><strong>Recompensa:</strong> <span id="recompensa"></span></p>
                            </div>

                            <!-- Imagen y descripción (Derecha) -->
                            <div class="col-md-6 text-center">
                                <img id="imagen" class="img-fluid rounded mb-3"
                                     style="max-width: 300px; height: auto;"
                                     alt="Imagen de la mascota" />

                                <!-- Recuadro para la descripción -->
                                <div class="border p-3 mt-3 rounded" style="background-color: #f8f9fa;">
                                    <h5>Descripción</h5>
                                    <p id="descripcion"></p>
                                </div>

                                <!-- Botones debajo de la imagen y la descripción -->
                                <div class="d-flex justify-content-center gap-5 mt-3">
                                    <button class="btn btn-success btn-lg" data-bs-toggle="modal" data-bs-target="#modalCheck">
                                        <i class="fa-solid fa-check fa-2x"></i>
                                    </button>
                                    <button class="btn btn-danger btn-lg" data-bs-toggle="modal" data-bs-target="#modalRechazar">
                                        <i class="fa-solid fa-xmark fa-2x"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>

        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">Contáctanos: Somos un albergue gosu...</div>
                    <div>
                        <a href="#" style="color: white;">Correo: info@alberguegosu.com</a>
                        <a href="#" style="color: white;">Teléfono: +123 456 7890</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<!-- Modal Check -->
<div class="modal fade" id="modalCheck" tabindex="-1" aria-labelledby="modalCheckLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalCheckLabel">¿Estás seguro de aprobar?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Esta acción aprobará la mascota.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-success" onclick="check()">Confirmar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal Rechazar -->
<div class="modal fade" id="modalRechazar" tabindex="-1" aria-labelledby="modalRechazarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalRechazarLabel">¿Estás seguro de rechazar?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Esta acción rechazará la mascota.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-danger" onclick="rechazar()">Confirmar</button>
            </div>
        </div>
    </div>
</div>

<script>
    const urlParams = new URLSearchParams(window.location.search);
    const index = urlParams.get('index');

    const data = [
        { imagen: "<%= request.getContextPath() %>/assets/img/perdido1.jpg", nombre: "Firulais", edad: 3, raza: "Labrador", tamaño: "Grande", contacto: "974769424", distintivo: "Collar rojo", descripcion: "Se perdió en el parque", lugar: "Parque Central", hora: "10:30 AM", contacto_nombre: "Carlos Pérez", recompensa: "50 USD" },
        // Más datos...
    ];

    const mascota = data[index];

    document.getElementById('imagen').src = mascota.imagen;
    document.getElementById('nombre').textContent = mascota.nombre;
    document.getElementById('edad').textContent = mascota.edad;
    document.getElementById('raza').textContent = mascota.raza;
    document.getElementById('tamaño').textContent = mascota.tamaño;
    document.getElementById('contacto').textContent = mascota.contacto;
    document.getElementById('distintivo').textContent = mascota.distintivo;
    document.getElementById('descripcion').textContent = mascota.descripcion;
    document.getElementById('lugar').textContent = mascota.lugar;
    document.getElementById('hora').textContent = mascota.hora;
    document.getElementById('contacto_nombre').textContent = mascota.contacto_nombre;
    document.getElementById('recompensa').textContent = mascota.recompensa;

    function check() {
        alert("Mascota aprobada.");
    }

    function rechazar() {
        alert("Mascota rechazada.");
    }
</script>
</body>
</html>
