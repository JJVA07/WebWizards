<%@ page import="java.util.Base64" %>
<%@ page import="com.example.webapphr1_2023.Beans.Eventos" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Detalles del Evento</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">

<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <i class="fas fa-user fa-fw"></i>
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>

<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-5">
                <h2 class="mt-5 text-center">Detalles del Evento</h2>
                <%
                    Eventos evento = (Eventos) request.getAttribute("evento");
                    String base64Image = Base64.getEncoder().encodeToString(evento.getFoto());
                %>
                <div class="card mb-3 mt-4 w-100">
                    <div class="row g-0">
                        <div class="col-md-5 d-flex flex-column align-items-center justify-content-center">
                            <img src="data:image/jpeg;base64,<%= base64Image %>" class="img-fluid rounded-start" style="height: auto; width: 100%; object-fit: cover;">
                            <div class="card-body text-center">
                                <h5 class="card-title">Costo</h5>
                                <p class="card-text">S/. <%= evento.getDonaciones().getCantidadDonacion() %> </p>
                                <h5 class="card-title">Fecha del evento</h5>
                                <p class="card-text"><%= evento.getFecha() %></p>
                                <h5 class="card-title">Vacantes disponibles</h5>
                                <p class="card-text"><%= evento.getVacantesDisponibles() %> personas</p>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <div class="card-body">
                                <h5 class="card-title">Nombre del evento</h5>
                                <p class="card-text"><%= evento.getNombreEvento() %></p>
                                <h5 class="card-title">Lugar del evento</h5>
                                <p class="card-text"><%= evento.getLugarEvento() %></p>
                                <h5 class="card-title">Hora del evento</h5>
                                <p class="card-text"><%= evento.getHora() %></p>
                                <h5 class="card-title">Artistas o proveedores invitados</h5>
                                <p class="card-text"><%= evento.getArtistasInvitados() %></p>
                                <h5 class="card-title">Descripción del evento</h5>
                                <p class="card-text"><%= evento.getDescripcion() %></p>
                                <h5 class="card-title">Propósito del evento</h5>
                                <p class="card-text"><%= evento.getRazon() %></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center mb-4">
                    <a href="#" class="btn btn-secondary postular-btn" style="color: white; font-size: 1.2rem; text-decoration: none;">
                        Inscribirse
                    </a>
                </div>
            </div>
            <div class="text-center mb-4">
                    <a href="#" class="btn btn-secondary postular-btn" style="color: white; font-size: 1.2rem; text-decoration: none;">
                        Inscribirse
                    </a>

            </div>
        </main>
        <footer class="py-4 mt-auto" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a> <a href="#" style="color: white;">info@alberguegosu.com</a>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;">+123 456 7890</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.querySelector('.postular-btn').addEventListener('click', function (e) {
        e.preventDefault();
        Swal.fire({
            title: '¿Estás seguro de tu inscripción?',
            showDenyButton: true,
            confirmButtonText: 'Sí',
            denyButtonText: 'No',
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('Inscripción completada!', '', 'success')
                    .then(() => { window.location.href = "<%= request.getContextPath() %>/Evento?action=misEventos"; });
            } else if (result.isDenied) {
                Swal.fire('Inscripción cancelada', '', 'info')
            }
        });
    });
</script>
</body>
</html>
