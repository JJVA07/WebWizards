
<%@ page import="com.example.webapphr1_2023.Beans.Publicacion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Base64" %>
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
        <h1 class="mt-4">Detalles de la Mascota Aprobada</h1>

        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <!-- Información (Izquierda) -->
              <div class="col-md-6">
                <%
                  Publicacion publicacion = (Publicacion) request.getAttribute("publicacionDetalles");
                  if (publicacion != null) {
                %>
                <p><strong>Nombre:</strong> <%= publicacion.getNombre() %></p>
                <p><strong>Edad:</strong> <%= publicacion.getEdad() %> años</p>
                <p><strong>Raza:</strong> <%= publicacion.getRaza() %></p>
                <p><strong>Tamaño:</strong> <%= publicacion.getTamano() %></p>
                <p><strong>Contacto:</strong> <%= publicacion.getTelefono() %></p>
                <p><strong>Distintivo:</strong> <%= publicacion.getDistintivo() %></p>
                <p><strong>Descripción:</strong> <%= publicacion.getDescripcionAdicional() %></p>
                <p><strong>Lugar:</strong> <%= publicacion.getLugarPerdida() %></p>
                <p><strong>Hora:</strong> <%= publicacion.getHoraPerdida() %></p>
                <p><strong>Contacto Nombre:</strong> <%= publicacion.getNombreContacto() %></p>
                <p><strong>Recompensa:</strong> <%= publicacion.getRecompensa() %></p>
                <% } else { %>
                <p class="text-danger">No se encontraron detalles para esta mascota.</p>
                <% } %>
              </div>

              <!-- Imagen (Derecha) -->
              <div class="col-md-6 text-center">
                <%
                  if (publicacion != null && publicacion.getFoto() != null) {
                    // Convertir imagen (byte array) a Base64
                    String base64Image = Base64.getEncoder().encodeToString(publicacion.getFoto());
                %>
                <img id="imagen" class="img-fluid rounded mb-3"
                     style="max-width: 300px; height: auto;"
                     src="data:image/jpeg;base64,<%= base64Image %>"
                     alt="Imagen de la mascota" />
                <% } else { %>
                <img id="imagen" class="img-fluid rounded mb-3"
                     style="max-width: 300px; height: auto;"
                     src="<%= request.getContextPath() %>/assets/img/default_mascota.jpg"
                     alt="Imagen de la mascota" />
                <% } %>

                <!-- Notas adicionales -->
                <div class="mt-4">
                  <h5>Notas Adicionales</h5>
                  <form action="<%= request.getContextPath() %>/CoordinadorServlet" method="POST">
                    <input type="hidden" name="action" value="actualizarComentario">
                    <input type="hidden" name="idPublicacion" value="<%= publicacion != null ? publicacion.getIdPublicacion() : "" %>">
                    <textarea name="comentario_coordinador" class="form-control mb-3" rows="3" placeholder="Escribe cualquier información adicional aquí..."><%= publicacion != null ? publicacion.getComentario_coordinador() : "" %></textarea>
                    <button type="submit" class="btn btn-secondary btn-lg">Actualizar</button>
                  </form>
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
            <a href="mailto:info@alberguegosu.com" style="color: white;">Correo: info@alberguegosu.com</a> |
            <a href="tel:+1234567890" style="color: white;">Teléfono: +123 456 7890</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>

<script>
  // Opcional: Agregar funcionalidad al botón de "Notas Adicionales"
  document.getElementById('notas').addEventListener('input', function () {
    console.log("Notas adicionales:", this.value);
  });
</script>
</body>
</html>



