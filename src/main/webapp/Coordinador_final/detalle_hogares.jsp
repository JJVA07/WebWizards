<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapphr1_2023.Beans.Postulacion" %>
<%@ page import="java.util.Base64" %>
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
                    <%
                      Postulacion postulacion = (Postulacion) request.getAttribute("postulacionDetalles");
                      if (postulacion != null) {
                    %>
                    <p><strong>Nombre:</strong> <%= postulacion.getNombre() %></p>
                    <p><strong>Apellido:</strong> <%= postulacion.getApellido() %></p>
                    <p><strong>Edad:</strong> <%= postulacion.getEdad() %></p>
                    <p><strong>Género:</strong> <%= postulacion.getGenero() %></p>
                    <p><strong>Celular:</strong> <%= postulacion.getCelular() %></p>
                    <p><strong>Dirección:</strong> <%= postulacion.getDireccion() %></p>
                    <p><strong>Distrito:</strong> <%= postulacion.getDistrito().getNombre() %></p>
                    <p><strong>Cantidad de cuartos:</strong> <%= postulacion.getCantidadCuartos() %></p>
                    <p><strong>Metraje de vivienda:</strong> <%= postulacion.getMetrajeVivienda() %> m²</p>
                    <p><strong>Tiene mascotas:</strong> <%= postulacion.getTieneMascotas() != null && postulacion.getTieneMascotas() ? "Sí" : "No" %></p>

                  </div>
                  <!-- Segunda columna de información -->
                  <div class="col-md-6">

                    <p><strong>Cantidad de mascotas:</strong> <%= postulacion.getCantidadMascotas() %></p>
                    <p><strong>Tipo de mascotas:</strong> <%= postulacion.getTipoMascotas() %></p>
                    <p><strong>Tiene hijos:</strong> <%= postulacion.getTieneHijos() != null && postulacion.getTieneHijos() ? "Sí" : "No" %></p>
                    <p><strong>Vive solo o con dependientes:</strong> <%= postulacion.getViveConDependientes() != null && postulacion.getViveConDependientes() ? "Con dependientes" : "Solo" %></p>
                    <p><strong>Trabaja:</strong> <%= postulacion.getTrabajaRemoto() != null && postulacion.getTrabajaRemoto() ? "Remoto" : "Presencial" %></p>
                    <p><strong>Fecha de inicio temporal:</strong>
                      <%= postulacion.getFechaInicioTemporal() != null ? new java.text.SimpleDateFormat("dd/MM/yyyy").format(postulacion.getFechaInicioTemporal()) : "No especificada" %>
                    </p>
                    <p><strong>Fecha de fin temporal:</strong>
                      <%= postulacion.getFechaFinTemporal() != null ? new java.text.SimpleDateFormat("dd/MM/yyyy").format(postulacion.getFechaFinTemporal()) : "No especificada" %>
                    </p>
                  </div>
                </div>
              </div>

              <!-- Fotos a la derecha -->
              <div class="col-md-6 text-center">
                <img id="imagenHogar" class="img-fluid rounded mb-3"
                     src="<%= postulacion.getFotosLugar() != null ? "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(postulacion.getFotosLugar()) : request.getContextPath() + "/assets/img/default_hogar.jpg" %>"
                     alt="Imagen del hogar" style="max-width: 300px; height: auto;" />
              </div>
              <% } else { %>
              <p class="text-danger">No se encontraron detalles para este hogar aprobado.</p>
              <% } %>
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
</body>
</html>
