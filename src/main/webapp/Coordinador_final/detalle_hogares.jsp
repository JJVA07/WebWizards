<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Detalle Hogares Aprobados</title>
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
        <h1 class="mt-4">Detalles del Hogar Aprobado</h1>

        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <!-- Información del hogar en dos columnas -->
              <div class="col-md-6">
                <div class="row">
                  <!-- Primera columna de información -->
                  <div class="col-md-6">
                    <p><strong>Nombre:</strong> <span id="nombre"></span></p>
                    <p><strong>Apellido:</strong> <span id="apellido"></span></p>
                    <p><strong>Edad:</strong> <span id="edad"></span></p>
                    <p><strong>Género:</strong> <span id="genero"></span></p>
                    <p><strong>Celular:</strong> <span id="celular"></span></p>
                    <p><strong>Dirección:</strong> <span id="direccion"></span></p>
                    <p><strong>Distrito:</strong> <span id="distrito"></span></p>
                  </div>
                  <!-- Segunda columna de información -->
                  <div class="col-md-6">
                    <p><strong>Cantidad de cuartos:</strong> <span id="cuartos"></span></p>
                    <p><strong>Metraje de vivienda:</strong> <span id="metraje"></span> m²</p>
                    <p><strong>Tiene mascotas:</strong> <span id="tieneMascotas"></span></p>
                    <p><strong>Tipo de mascotas:</strong> <span id="tipoMascotas"></span></p>
                    <p><strong>Tiene hijos:</strong> <span id="tieneHijos"></span></p>
                    <p><strong>Vive solo o con dependientes:</strong> <span id="viveSolo"></span></p>
                    <p><strong>Trabaja:</strong> <span id="trabaja"></span></p>
                  </div>
                </div>
              </div>

              <!-- Fotos a la derecha -->
              <div class="col-md-6 text-center">
                <img id="imagenHogar" class="img-fluid rounded mb-3" style="max-width: 300px; height: auto;" alt="Imagen del hogar" />
                <img id="imagenPersona" class="img-fluid rounded mb-3" style="max-width: 300px; height: auto;" alt="Imagen de la persona" />
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
    { imagenPersona: "<%= request.getContextPath() %>/assets/img/persona1.jpg", imagenHogar: "<%= request.getContextPath() %>/assets/img/casa1.jpg", nombre: "Ana", apellido: "García", edad: 34, genero: "Femenino", celular: "987654321", direccion: "Calle 123", distrito: "Ancon", cuartos: 3, metraje: 120, tieneMascotas: "Sí", cantidadMascotas: 2, tipoMascotas: "Perros", tieneHijos: "Sí", viveSolo: "Con dependientes", trabaja: "Remoto", referencia: "Luis Pérez", contactoReferencia: "987654320", tiempoTemporal: "6 meses", rangoFechas: "01/01/2024 - 30/06/2024" },
    // Agrega más objetos según sea necesario
  ];

  const hogar = data[index];

  document.getElementById('imagenHogar').src = hogar.imagenHogar;
  document.getElementById('imagenPersona').src = hogar.imagenPersona;
  document.getElementById('nombre').textContent = hogar.nombre;
  document.getElementById('apellido').textContent = hogar.apellido;
  document.getElementById('edad').textContent = hogar.edad;
  document.getElementById('genero').textContent = hogar.genero;
  document.getElementById('celular').textContent = hogar.celular;
  document.getElementById('direccion').textContent = hogar.direccion;
  document.getElementById('distrito').textContent = hogar.distrito;
  document.getElementById('cuartos').textContent = hogar.cuartos;
  document.getElementById('metraje').textContent = hogar.metraje;
  document.getElementById('tieneMascotas').textContent = hogar.tieneMascotas;
  document.getElementById('tipoMascotas').textContent = hogar.tipoMascotas;
  document.getElementById('tieneHijos').textContent = hogar.tieneHijos;
  document.getElementById('viveSolo').textContent = hogar.viveSolo;
  document.getElementById('trabaja').textContent = hogar.trabaja;
</script>
</body>
</html>
