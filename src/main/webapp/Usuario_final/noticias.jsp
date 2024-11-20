<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Noticias</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="../css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="sb-nav-fixed " style="background-color: white;">
<nav class="sb-topnav navbar navbar-expand navbar-dark" style="background-color: rgb(27, 94, 87);">
    <!-- Navbar Brand-->
    <a class="navbar-brand ps-3" href="UsuariosServlet?action=noticias">Usuario Final</a>
    <!-- Sidebar Toggle-->
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
    <!-- Navbar-->
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/Usuario?action=miCuenta">Mi cuenta</a></li>
                <li><hr class="dropdown-divider" /></li>
                <li><a class="dropdown-item" href="inicio_sesion.html">Cerrar Sesión</a></li>
            </ul>
        </li>
        <a class="nav-link " id="navbarDropdown" href="home.html" role="button"><i class="fa-solid fa-paw"></i></a>
    </ul>
</nav>
<div id="layoutSidenav">
    <jsp:include page="/WEB-INF/sidebar.jsp" />
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4 text-center">NOTICIAS</h2>
                <ol class="breadcrumb mb-4 d-flex justify-content-center align-items-center">
                    <li class="breadcrumb-item active" style="color: black; text-align: center;">
                        ¡En esta sección podrás estar informado con las últimas noticias sobre nosotros!
                    </li>
                </ol>

                <!-- Contenedor para las tarjetas -->
                <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                    <c:forEach var="item" items="${publicaciones}">
                        <div class="col d-flex">
                            <div class="card flex-fill">
                                <img src="../assets/img/default.jpg" class="card-img-top" alt="..." style="height: 200px; object-fit: cover;">
                                <div class="card-body text-center">
                                    <h5 class="card-title">${item.descripcion}</h5>
                                    <p class="card-text">${item.fechaPublicacion}</p>
                                    <div class="d-flex justify-content-center">
                                        <a href="UsuariosServlet?action=${
                                                    item.origen == 'donacion'
                                                        ? 'verDonacion'
                                                        : (item.tipo == 'denuncia'
                                                            ? 'verDenuncia'
                                                            : 'verPerdida')
                                                }&id=${item.idPublicacion}"
                                           class="btn inscribirse-btn d-inline-flex align-items-center"
                                           style="text-align: center; padding: 5px 10px; border-radius: 8px; background-color: transparent; text-decoration: none;">
                                            <i class="fas fa-info-circle" style="color: #808080; font-size: 2rem; margin-right: 0.5rem;"></i>
                                            <span style="color: #808080; font-size: 1.2rem;">Más detalles</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Paginación -->
                <div class="d-flex justify-content-center mt-3">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item <c:if test='${pagina == 1}'>disabled</c:if>'">
                                <a class="page-link" href="UsuariosServlet?action=noticias&pagina=${pagina - 1}"
                                   aria-label="Previous" style="color: black;">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${totalPaginas}" var="i">
                                <li class="page-item <c:if test='${pagina == i}'>active</c:if>'">
                                    <a class="page-link" href="UsuariosServlet?action=noticias&pagina=${i}"
                                       style="color: black;">${i}</a>
                                </li>
                            </c:forEach>
                            <li class="page-item <c:if test='${pagina == totalPaginas}'>disabled</c:if>'">
                                <a class="page-link" href="UsuariosServlet?action=noticias&pagina=${pagina + 1}"
                                   aria-label="Next" style="color: black;">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </main>
        <footer class="py-4 mt-auto mt-3" style="background-color: black;">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted" style="color: white !important;">© Huella Viva</div>
                    <div>
                        <a style="color: white;">Correo:</a> <a href="#" style="color: white;">info@alberguegosu.com</a>
                        <div></div>
                        <a style="color: white;">Teléfono:</a><a href="#" style="color: white;"> +123 456 7890</a>
                        <div></div>
                        <a style="color: white;">Ubicación:</a><a href="#" style="color: white;"> Calle Ejemplo 123, Ciudad, País</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="../js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="../assets/demo/chart-area-demo.js"></script>
<script src="../assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="../js/datatables-simple-demo.js"></script>
</body>
</html>
