<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Mis Publicaciones</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="<%= request.getContextPath() %>/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="sb-nav-fixed" style="background-color: white;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <a class="navbar-brand ps-3" href="<%= request.getContextPath() %>/home.jsp">Usuario Final</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/mi_cuenta.jsp">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/inicio_sesion.jsp">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link" href="<%= request.getContextPath() %>/home.jsp" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>
<div id="layoutSidenav">
    <!-- Inclusión del Sidebar -->
    <jsp:include page="/WEB-INF/sidebar.jsp" />

    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 text-center">MIS PUBLICACIONES</h2>
                <div class="row justify-content-center mt-3">
                    <div class="col-sm-12 col-md-6 col-lg-4 d-flex justify-content-center">
                        <div class="card mb-4" style="width: 100%;">
                            <img src="<%= request.getContextPath() %>/assets/img/perro3.jpg" class="card-img-top img-fluid" alt="Perrito perdido" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title">Perrito perdido</h5>
                                <p class="card-text text-justify">Se me perdió un cachorro lindo y peludo por la Avenida Javier Prado.</p>
                                <div class="text-center">
                                    <a href="<%= request.getContextPath() %>/perrito_perdido_panchis.jsp" class="btn btn-aprove">
                                        <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                    </a>
                                    <a href="#" class="btn btn-trash eliminar-btn">
                                        <i class="fa-solid fa-trash" style="color: #e53434; font-size: 2rem;"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-12 col-md-6 col-lg-4 d-flex justify-content-center">
                        <div class="card mb-4" style="width: 100%;">
                            <img src="<%= request.getContextPath() %>/assets/img/denuncia_fer.jpg" class="card-img-top img-fluid" alt="Denuncia por maltrato" style="height: 200px; object-fit: cover;">
                            <div class="card-body">
                                <h5 class="card-title">Denuncia por maltrato</h5>
                                <p class="card-text text-justify">Se observó al vecino Fernando golpeando perritos.</p>
                                <div class="text-center">
                                    <a href="<%= request.getContextPath() %>/perrito_perdido_panchis.jsp" class="btn btn-aprove">
                                        <i class="fa-solid fa-pen-to-square" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                    </a>
                                    <a href="#" class="btn btn-trash eliminar-btn">
                                        <i class="fa-solid fa-trash" style="color: #e53434; font-size: 2rem;"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <div class="d-flex justify-content-center mt-3">
            <nav aria-label="Page navigation example">
                <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#" style="color: black;">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: black;">1</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: black;">2</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: black;">3</a></li>
                    <li class="page-item"><a class="page-link" href="#" style="color: black;">&raquo;</a></li>
                </ul>
            </nav>
        </div>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo: </a><a href="#" style="color: white;">info@alberguegosu.com</a>
                        <div></div>
                        <a style="color: white;">Teléfono: </a><a href="#" style="color: white;">+123 456 7890</a>
                        <div></div>
                        <a style="color: white;">Ubicación: </a><a href="#" style="color: white;">Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath() %>/js/scripts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.querySelectorAll('.eliminar-btn').forEach(button => {
        button.addEventListener('click', function (e) {
            e.preventDefault();
            Swal.fire({
                title: '¿Estás seguro de eliminar?',
                showDenyButton: true,
                confirmButtonText: '<i class="fa-solid fa-check" style="color: #008000; font-size: 1.5rem;"></i>',
                denyButtonText: '<i class="fa-solid fa-x" style="color: #e53434; font-size: 1.5rem;"></i>',
                buttonsStyling: false,
                customClass: {
                    confirmButton: 'btn btn-light mx-2',
                    denyButton: 'btn btn-light mx-2'
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: 'Eliminado!',
                        icon: 'success',
                        confirmButtonText: 'OK',
                        customClass: { confirmButton: 'btn btn-success' }
                    });
                } else if (result.isDenied) {
                    Swal.fire({
                        title: 'No se eliminó',
                        icon: 'info',
                        confirmButtonText: 'OK',
                        customClass: { confirmButton: 'btn btn-secondary' }
                    });
                }
            });
        });
    });
</script>
</body>
</html>
