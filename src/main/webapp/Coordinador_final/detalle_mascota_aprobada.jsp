<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Detalles de la Mascota Aprobada</title>
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
              <!-- Información (Izquierda) -->
              <div class="col-md-6">
                <p><strong>Nombre:</strong> <span id="nombre"></span></p>
                <p><strong>Edad:</strong> <span id="edad"></span> años</p>
                <p><strong>Raza:</strong> <span id="raza"></span></p>
                <p><strong>Tamaño:</strong> <span id="tamaño"></span></p>
                <p><strong>Contacto:</strong> <span id="contacto"></span></p>
                <p><strong>Distintivo:</strong> <span id="distintivo"></span></p>
                <p><strong>Descripción:</strong> <span id="descripcion"></span></p>
                <p><strong>Lugar:</strong> <span id="lugar"></span></p>
                <p><strong>Hora:</strong> <span id="hora"></span></p>
                <p><strong>Contacto Nombre:</strong> <span id="contacto_nombre"></span></p>
                <p><strong>Recompensa:</strong> <span id="recompensa"></span></p>
              </div>

              <!-- Imagen y Notas Adicionales (Derecha) -->
              <div class="col-md-6 text-center">
                <img id="imagen" class="img-fluid rounded mb-3"
                     style="max-width: 300px; height: auto;"
                     alt="Imagen de la mascota" />

                <!-- Notas Adicionales debajo de la foto -->
                <div class="mt-4">
                  <h5>Notas Adicionales</h5>
                  <textarea id="notas" class="form-control mb-3" rows="3"
                            placeholder="Escribe cualquier información adicional aquí..."></textarea>
                </div>

                <!-- Botón de Actualizar -->
                <button class="btn btn-secondary btn-lg" id="btnActualizar">
                  Actualizar
                </button>
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

<script>
  const urlParams = new URLSearchParams(window.location.search);
  const index = urlParams.get('index');

  const data = [
    { imagen: "<%= request.getContextPath() %>/assets/img/perdido1.jpg", nombre: "Firulais", edad: 3, raza: "Labrador", tamaño: "Grande", contacto: "974769424", distintivo: "Collar rojo", descripcion: "Se perdió en el parque", lugar: "Parque Central", hora: "10:30 AM", contacto_nombre: "Carlos Pérez", recompensa: "50 USD" },
    { imagen: "<%= request.getContextPath() %>/assets/img/perdido2.jpg", nombre: "Rex", edad: 2, raza: "Pastor Alemán", tamaño: "Grande", contacto: "912345678", distintivo: "Orejas caídas", descripcion: "Escapó de casa", lugar: "Avenida Principal", hora: "9:00 AM", contacto_nombre: "Lucía Gómez", recompensa: "No" },
    { imagen: "<%= request.getContextPath() %>/assets/img/perdido3.jpg", nombre: "Dobby", edad: 1, raza: "Chihuahua", tamaño: "Pequeño", contacto: "987654321", distintivo: "Sin collar", descripcion: "Desapareció cerca del mercado", lugar: "Mercado Central", hora: "11:00 AM", contacto_nombre: "Pedro Sánchez", recompensa: "20 USD" },
    { imagen: "<%= request.getContextPath() %>/assets/img/perdido4.jpg", nombre: "Toby", edad: 4, raza: "Bulldog", tamaño: "Mediano", contacto: "956123789", distintivo: "Manchas en la oreja", descripcion: "Se perdió durante un paseo", lugar: "Plaza de Armas", hora: "4:00 PM", contacto_nombre: "Ana López", recompensa: "30 USD" },
    { imagen: "<%= request.getContextPath() %>/assets/img/perdido5.jpg", nombre: "Bruno", edad: 3, raza: "Boxer", tamaño: "Grande", contacto: "932178945", distintivo: "Cicatriz en la pata derecha", descripcion: "No volvió después del paseo", lugar: "Parque de la Amistad", hora: "7:00 PM", contacto_nombre: "Miguel Quispe", recompensa: "No" },
    { imagen: "<%= request.getContextPath() %>/assets/img/perdido6.jpg", nombre: "Nina", edad: 1, raza: "Shih Tzu", tamaño: "Pequeño", contacto: "986543210", distintivo: "Correa color celeste", descripcion: "Se soltó de la correa", lugar: "Centro Comercial", hora: "3:30 PM", contacto_nombre: "Camila Flores", recompensa: "20 USD" },
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
</script>
</body>
</html>
