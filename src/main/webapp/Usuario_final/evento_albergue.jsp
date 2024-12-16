<%@ page import="java.util.Base64" %>
<%@ page import="com.example.webapphr1_2023.Beans.Eventos" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Eventos evento = (Eventos) request.getAttribute("evento");
    boolean yaInscrito = (boolean) (request.getAttribute("yaInscrito") != null ? request.getAttribute("yaInscrito") : false);
    int vacantesDisponibles = evento != null ? Integer.parseInt(evento.getVacantesDisponibles()) : 0;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title><%= evento != null ? evento.getNombreEvento() : "Detalles del Evento" %></title>
    <title>Detalle de evento</title>
    <!-- CSS externo y librerías -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

</head>

<body class="sb-nav-fixed" style="background-color: white;">
<!-- Barra de navegación -->
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/LoginServlet?action=logout">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link " id="navbarDropdown2" href="<%= request.getContextPath() %>/Usuario?action=pagPrincipal" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-5">
                <h2 class="mt-5 text-center">Detalles del Evento</h2>

                <% if (evento == null) { %>
                <div class="alert alert-danger text-center mt-4">
                    No se encontraron detalles para este evento.
                </div>
                <% } else { %>
                <div class="card mb-3 mt-4 w-100">
                    <div class="row g-0">
                        <!-- Imagen -->
                        <div class="col-md-5">
                            <img src="data:image/jpeg;base64,<%= evento.getFoto() != null ? Base64.getEncoder().encodeToString(evento.getFoto()) : "" %>"
                                 class="img-fluid rounded-start" alt="Evento">
                            <div class="text-center mt-3">
                                <h5 class="fw-bold">Vacantes disponibles: <%= vacantesDisponibles %></h5>
                            </div>
                        </div>
                        <!-- Información -->
                        <div class="col-md-7">
                            <div class="card-body">
                                <h4><%= evento.getNombreEvento() %></h4>
                                <p><strong>Fecha:</strong> <%= evento.getFecha() %></p>
                                <p><strong>Hora:</strong> <%= evento.getHora() %></p>
                                <p><strong>Lugar:</strong> <%= evento.getLugarEvento() %></p>
                                <p><strong>Descripción:</strong> <%= evento.getDescripcion() %></p>
                                <p><strong>Propósito:</strong> <%= evento.getRazon() %></p>
                                <p><strong>Artistas Invitados:</strong> <%= evento.getArtistasInvitados() != null ? evento.getArtistasInvitados() : "No especificado" %></p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Botón de inscripción con SweetAlert2 -->
                <div class="text-center">
                    <% if (!yaInscrito && vacantesDisponibles > 0) { %>
                    <form id="inscribirseForm" method="post" action="<%= request.getContextPath() %>/Usuario">
                        <input type="hidden" name="action" value="inscribirseEvento">
                        <input type="hidden" name="idEvento" value="<%= evento.getIdEventos() %>">
                        <button type="button" id="inscribirseBtn" class="btn btn-success">
                            Inscribirse
                        </button>
                    </form>
                    <% } else if (yaInscrito) { %>
                    <button type="button" class="btn btn-secondary disabled">Ya estás inscrito</button>
                    <% } else { %>
                    <button type="button" class="btn btn-secondary disabled">Sin vacantes</button>
                    <% } %>
                </div>


                <% } %>
            </div>
        </main>

        <footer class="py-4 mt-auto bg-dark text-white">
            <div class="container-fluid px-4 text-center">
                <div>© Huella Viva | Correo: info@alberguegosu.com | Teléfono: +123 456 7890</div>
            </div>
        </footer>
    </div>
</div>

<!-- Script para SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('inscribirseBtn')?.addEventListener('click', function () {
        Swal.fire({
            title: '¿Confirmar inscripción?',
            text: "¿Deseas inscribirte a este evento?",
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Sí, inscribirme',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                // Enviar el formulario al servlet
                document.getElementById('inscribirseForm').submit();
            }
        });
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
</body>
</html>
