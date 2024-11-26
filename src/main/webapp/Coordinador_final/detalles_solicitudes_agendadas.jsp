<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapphr1_2023.Beans.Postulacion" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <title>Detalle Solicitudes Agendadas</title>
  <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: #ffffff;">

<%@ include file="/WEB-INF/navbar_coordinador.jsp" %>

<div id="layoutSidenav">
  <%@ include file="/WEB-INF/sidebar_coordinador.jsp" %>

  <div id="layoutSidenav_content">
    <main>
      <div class="container-fluid px-4">
        <h1 class="mt-4">Detalles Solicitudes Agendadas</h1>

        <div class="card mb-4">
          <div class="card-body">
            <%
              Postulacion postulacion = (Postulacion) request.getAttribute("postulacionDetalles");
              if (postulacion != null) {
            %>
            <!-- Formulario para actualizar fecha y hora de visita -->
            <form action="<%= request.getContextPath() %>/CoordinadorServlet" method="post">
              <input type="hidden" name="action" value="updateVisita">
              <input type="hidden" name="id" value="<%= postulacion.getIdPostulacion() %>">

              <div class="row">
                <!-- Información del hogar -->
                <div class="col-md-6">
                  <div class="row">
                    <div class="col-md-6">
                      <p><strong>Nombre:</strong> <%= postulacion.getNombre() %></p>
                      <p><strong>Apellido:</strong> <%= postulacion.getApellido() %></p>
                      <p><strong>Edad:</strong> <%= postulacion.getEdad() %></p>
                      <p><strong>Género:</strong> <%= postulacion.getGenero() %></p>
                      <p><strong>Celular:</strong> <%= postulacion.getCelular() %></p>
                      <p><strong>Dirección:</strong> <%= postulacion.getDireccion() %></p>
                      <p><strong>Distrito:</strong> <%= postulacion.getDistrito().getNombre() %></p>
                      <p><strong>Cantidad de cuartos:</strong> <%= postulacion.getCantidadCuartos() %></p>
                      <p><strong>Metraje de vivienda:</strong> <%= postulacion.getMetrajeVivienda() %> m²</p>
                      <p><strong>Tiene mascotas:</strong> <%= postulacion.getTieneMascotas() ? "Sí" : "No" %></p>
                      <p><strong>Cantidad de mascotas:</strong> <%= postulacion.getCantidadMascotas() %></p>
                      <p><strong>Tipo de mascotas:</strong> <%= postulacion.getTipoMascotas() %></p>
                      <p><strong>Tiene hijos:</strong> <%= postulacion.getTieneHijos() ? "Sí" : "No" %></p>
                    </div>
                    <div class="col-md-6">
                      <p><strong>Vive solo o con dependientes:</strong> <%= postulacion.getViveConDependientes() ? "Con dependientes" : "Solo" %></p>
                      <p><strong>Trabaja:</strong> <%= postulacion.getTrabajaRemoto() ? "Remoto" : "Presencial" %></p>
                      <p><strong>Persona de referencia:</strong> <%= postulacion.getPersonaReferencia() %></p>
                      <p><strong>Número de contacto de referencia:</strong> <%= postulacion.getTelefonoReferencia() %></p>
                      <p><strong>Tiempo de temporal:</strong> <%= postulacion.getTiempoTemporal() %> meses</p>
                      <p><strong>Rango de Fechas:</strong>
                        <%= new SimpleDateFormat("dd/MM/yyyy").format(postulacion.getFechaInicioTemporal()) %> -
                        <%= new SimpleDateFormat("dd/MM/yyyy").format(postulacion.getFechaFinTemporal()) %>
                      </p>
                      <!-- Campos para Fecha y Hora de Visita -->
                      <div class="mb-3">
                        <label for="fechaVisita" class="form-label"><strong>Fecha de Visita</strong></label>
                        <input type="date" id="fechaVisita" name="fechaVisita" class="form-control"
                               value="<%= postulacion.getFechaInopinada() != null ? new SimpleDateFormat("yyyy-MM-dd").format(postulacion.getFechaInopinada()) : "" %>" required>
                      </div>
                      <div class="mb-3">
                        <label for="horaVisita" class="form-label"><strong>Hora de Visita</strong></label>
                        <input type="time" id="horaVisita" name="horaVisita" class="form-control"
                               value="<%= postulacion.getHoraInopinada() != null ? postulacion.getHoraInopinada() : "" %>" required>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- Imagen y botón de guardar -->
                <div class="col-md-6 text-center">
                  <img id="imagenHogar" class="img-fluid rounded mb-3"
                       src="<%= postulacion.getFotosLugar() != null ? "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(postulacion.getFotosLugar()) : request.getContextPath() + "/assets/img/default_hogar.jpg" %>"
                       alt="Imagen del hogar" style="max-width: 300px; height: auto;" />
                  <!-- Botón para guardar -->
                  <button type="submit" class="btn btn-primary mt-3">Guardar</button>
                </div>
              </div>
            </form>
            <% } else { %>
            <p class="text-danger">No se encontraron detalles para esta solicitud.</p>
            <% } %>
          </div>
        </div>
      </div>
    </main>

    <footer class="py-4 mt-auto" style="background-color: black;">
      <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
          <div class="text-muted">Contáctanos: Somos un albergue gosu...</div>
          <div>
            <a href="mailto:info@alberguegosu.com" style="color: white;">Correo: info@alberguegosu.com</a> |
            <a href="tel:+1234567890" style="color: white;">Teléfono: +123 456 7890</a>
          </div>
        </div>
      </div>
    </footer>

  </div>
</div>
</body>
</html>
