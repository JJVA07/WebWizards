<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.webapphr1_2023.Beans.Postulacion" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Detalle Solicitudes Agendadas</title>
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
        <h1 class="mt-4">Detalles Solicitudes Agendadas</h1>

        <div class="card mb-4">
          <div class="card-body">
            <%
              Postulacion postulacion = (Postulacion) request.getAttribute("postulacionDetalles");
              if (postulacion != null) {
            %>
            <div class="row">
              <!-- Información del hogar en dos columnas (Izquierda) -->
              <div class="col-md-6">
                <div class="row">
                  <!-- Primera columna de información -->
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
                    <p><strong>Tiene mascotas:</strong> <%= postulacion.getTieneMascotas() != null && postulacion.getTieneMascotas() ? "Sí" : "No" %></p>
                    <p><strong>Cantidad de mascotas:</strong> <%= postulacion.getCantidadMascotas() %></p>
                    <p><strong>Tipo de mascotas:</strong> <%= postulacion.getTipoMascotas() %></p>
                    <p><strong>Tiene hijos:</strong> <%= postulacion.getTieneHijos() != null && postulacion.getTieneHijos() ? "Sí" : "No" %></p>
                    <p><strong>Vive solo o con dependientes:</strong> <%= postulacion.getViveConDependientes() != null && postulacion.getViveConDependientes() ? "Con dependientes" : "Solo" %></p>
                    <p><strong>Trabaja:</strong> <%= postulacion.getTrabajaRemoto() != null && postulacion.getTrabajaRemoto() ? "Remoto" : "Presencial" %></p>
                  </div>

                  <!-- Segunda columna de información -->
                  <div class="col-md-6">
                    <p><strong>Persona de referencia:</strong> <%= postulacion.getPersonaReferencia() %></p>
                    <p><strong>Número de contacto de referencia:</strong> <%= postulacion.getTelefonoReferencia() %></p>
                    <p><strong>Tiempo de temporal:</strong> <%= postulacion.getTiempoTemporal() %> meses</p>
                    <p><strong>Rango de Fechas:</strong>
                      <%= postulacion.getFechaInicioTemporal() != null ? postulacion.getFechaInicioTemporal().toString() : "" %> -
                      <%= postulacion.getFechaFinTemporal() != null ? postulacion.getFechaFinTemporal().toString() : "" %>
                    </p>
                    <!-- Formulario para registrar Fecha_inopinada y Hora_inopinada -->
                    <form method="post" action="<%= request.getContextPath() %>/CoordinadorServlet?action=solicitudes_agendadas">
                      <input type="hidden" name="idPostulacion" value="<%= postulacion.getIdPostulacion() %>" />
                      <div class="mb-3">
                        <label for="fechaInopinada" class="form-label"><strong>Fecha de Visita</strong></label>
                        <input type="date" id="fechaInopinada" name="fechaInopinada" class="form-control" required />
                      </div>
                      <div class="mb-3">
                        <label for="horaInopinada" class="form-label"><strong>Hora de Visita</strong></label>
                        <input type="time" id="horaInopinada" name="horaInopinada" class="form-control" required />
                      </div>
                      <button type="submit" class="btn btn-primary">Registrar Visita</button>
                    </form>
                  </div>
                </div>
              </div>

              <!-- Fotos a la derecha (Foto del hogar) -->
              <div class="col-md-6 text-center">
                <img class="img-fluid rounded mb-3"
                     src="<%= postulacion.getFotosLugar() != null ? "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(postulacion.getFotosLugar()) : request.getContextPath() + "/assets/img/default_hogar.jpg" %>"
                     alt="Imagen del hogar" style="max-width: 300px; height: auto;" />
              </div>
            </div>
            <% } else { %>
            <p class="text-danger">No se encontraron detalles para esta solicitud agendada.</p>
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
