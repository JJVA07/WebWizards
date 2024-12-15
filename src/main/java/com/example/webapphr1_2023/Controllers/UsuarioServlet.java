package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.*;
import com.example.webapphr1_2023.Daos.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet(name ="UsuarioServlet" , value = "/Usuario")
@MultipartConfig
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Verificar si la sesión existe y el usuario está autenticado
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Obtener el ID del usuario desde la sesión
        Usuarios usuarioSesion = (Usuarios) session.getAttribute("usuario");
        int idUsuario = usuarioSesion.getId();

        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;

        // DAOs necesarios
        UsuariosDao userDao = new UsuariosDao();
        DonacionesDao donacionesDao = new DonacionesDao();
        EventosDao eventosDao = new EventosDao();
        SolicitudDao.PostulacionDao postulacionDao = new SolicitudDao.PostulacionDao();
        PublicacionDao publicacionDao = new PublicacionDao();

        switch (action) {
            case "pagPrincipal":
                vista = "/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "adopcion":
                // Instancia de MascotaDao para obtener las mascotas en adopción
                MascotaDao mascotaDao = new MascotaDao();
                List<Mascotas> mascotas = mascotaDao.obtenerMascotasEnAdopcion();

                // Pasar la lista de mascotas a la vista
                request.setAttribute("mascotas", mascotas);
                request.setAttribute("paginaActiva", "adopcion");
                vista = "/Usuario_final/adopcion.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "misEventos":

                List<Eventos> eventos = eventosDao.obtenerEventosPorUsuario(idUsuario);

                // Verifica si se obtuvieron eventos
                if (eventos != null && !eventos.isEmpty()) {
                    request.setAttribute("eventos", eventos);
                } else {
                    request.setAttribute("mensaje", "No tienes eventos registrados.");
                }

                // Redirigir a la vista de 'Mis Eventos'
                vista = "/Usuario_final/mis_eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "detallesEvento":
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                Eventos evento = eventosDao.obtenerDetallesEvento(idEvento);
                request.setAttribute("evento", evento);
                vista = "/Usuario_final/evento_detalles.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "eventos");
                rd.forward(request, response);
                break;
            case "eventos":
                int pagina = request.getParameter("pagina") == null ? 1 : Integer.parseInt(request.getParameter("pagina"));
                int offset = (pagina - 1) * 6;
                List<Eventos> eventasos = eventosDao.obtenerEventosActivosPaginados(offset, 6);

                int totalEventos = eventosDao.contarEventosActivos();
                int totalPaginas = (int) Math.ceil((double) totalEventos / 6);

                // Imprimir logs para verificar los datos enviados
                System.out.println("Eventos obtenidos: " + eventasos.size());
                System.out.println("Página actual: " + pagina);
                System.out.println("Total páginas: " + totalPaginas);

                // Asegurarte de enviar correctamente los datos al JSP
                request.setAttribute("eventos", eventasos);
                request.setAttribute("paginaActual", pagina);
                request.setAttribute("totalPaginas", totalPaginas);

                rd = request.getRequestDispatcher("/Usuario_final/eventos.jsp");
                rd.forward(request, response);
                break;
            case "mostrarSolicitud":
                Postulacion postulacion = postulacionDao.obtenerSolicitudPorUsuario(idUsuario);
                request.setAttribute("postulacion", postulacion);

                vista = "/Usuario_final/ver_solicitud.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "misSolicitudes":
                SolicitudDao solicitudDao = new SolicitudDao();

                // Obtener todas las solicitudes para el usuario
                List<Object[]> solicitudes = solicitudDao.obtenerSolicitudesPorUsuario(idUsuario);

                // Pasar la lista de solicitudes a la JSP
                request.setAttribute("solicitudes", solicitudes);

                // Redirigir a la vista de "Mis Solicitudes"
                vista = "/Usuario_final/mis_solicitudes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "donar":
                String nombreAlbergue = request.getParameter("nombreAlbergue");
                if (nombreAlbergue != null) {
                    // AJAX request to get punto de acopio
                    List<String> puntosAcopio = userDao.obtenerPuntosAcopioPorAlbergue(nombreAlbergue);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Convertir la lista en formato JSON manualmente
                    StringBuilder json = new StringBuilder("[");
                    for (int i = 0; i < puntosAcopio.size(); i++) {
                        json.append("\"").append(puntosAcopio.get(i)).append("\"");
                        if (i < puntosAcopio.size() - 1) {
                            json.append(",");
                        }
                    }
                    json.append("]");

                    response.getWriter().write(json.toString());
                } else {
                    // Cargar la vista de donación si no se especifica "nombreAlbergue"
                    List<String> albergues = userDao.obtenerNombresAlbergues();
                    List<String> tiposDonacion = donacionesDao.obtenerTiposDonacion();

                    request.setAttribute("albergues", albergues);
                    request.setAttribute("tiposDonacion", tiposDonacion);

                    vista = "/Usuario_final/donar.jsp";
                    request.setAttribute("paginaActiva", "donar");
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                }
                break;
            case "detalleMascota":
                try {
                    int idMascota = Integer.parseInt(request.getParameter("id"));
                    MascotaDao mascotaDaoDetalles = new MascotaDao();
                    Mascotas mascotaDetalles = mascotaDaoDetalles.obtenerMascotaPorId(idMascota);
                    if (mascotaDetalles == null) {
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
                    }
                    else{
                        request.setAttribute("mascota", mascotaDetalles);
                        vista = "/Usuario_final/formulario_adopcion.jsp";
                        request.setAttribute("paginaActiva", "adopcion");
                        rd = request.getRequestDispatcher(vista);
                        rd.forward(request, response);
                    }
                }
                catch(NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
                }
                break;

            case "formularioPerdida":
                vista = "/Usuario_final/mascotas_perdidas.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "mascotas_perdidas");
                rd.forward(request,response);
                break;
            case "formularioDenuncia":
                vista = "/Usuario_final/denuncias.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "denuncias");
                rd.forward(request,response);
                break;

            case "mostrarDonaciones":
                List<Donaciones> donaciones = donacionesDao.obtenerDonacionesPorUsuario(idUsuario);
                request.setAttribute("donaciones", donaciones);

                // Ruta actualizada para el archivo mis_donaciones.jsp
                vista = "/Usuario_final/mis_donaciones.jsp";
                request.setAttribute("paginaActiva", "mis_donaciones");
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "detalleDonacion":
                Donaciones donacion = donacionesDao.vistaDetallesDonacionPorUsuarioFijo();
                request.setAttribute("donacion", donacion);

                rd = request.getRequestDispatcher("/Usuario_final/donacion_detalle.jsp");
                rd.forward(request, response);
                break;
            case "miCuenta":
                System.out.println("ID del usuario en sesión: " + idUsuario);

                Usuarios usuario = userDao.obtenerUsuarioPorId(idUsuario);
                request.setAttribute("usuario", usuario);
                rd = request.getRequestDispatcher("/Usuario_final/mi_cuenta.jsp");
                rd.forward(request, response);
                break;

            case "misPublicaciones":
                List<Publicacion> publicaciones = publicacionDao.obtenerPublicacionesPorUsuario(idUsuario);

                // Si hay publicaciones, se pasan a la vista
                if (publicaciones != null && !publicaciones.isEmpty()) {
                    request.setAttribute("publicaciones", publicaciones);
                } else {
                    request.setAttribute("mensaje", "No tienes publicaciones registradas.");
                }

                // Ruta a la vista de publicaciones
                vista = "/Usuario_final/mis_publicaciones.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            default:
                // Acción por defecto en caso de que no haya coincidencias con las acciones especificadas
                vista = "/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // Verificar sesión y obtener el usuario autenticado
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        // Obtener el objeto Usuario desde la sesión
        Usuarios usuarioSesion = (Usuarios) session.getAttribute("usuario");

        String action = request.getParameter("action");
        PublicacionDao publicacionDao = new PublicacionDao();
        PostulacionDao postulacionDao = new PostulacionDao();

        switch (action) {
            case "reportarPOST":
                Publicacion publicacion = new Publicacion();

                // Asignar usuario desde la sesión
                publicacion.setUsuario(usuarioSesion);

                String nombreMascota = request.getParameter("nombre");
                if (nombreMascota == null || nombreMascota.trim().isEmpty()) {
                    System.out.println("Error, se ha enviado un nombre vacío.");
                }

                publicacion.setNombre(nombreMascota);
                publicacion.setEdad(Integer.parseInt(request.getParameter("edad")));
                publicacion.setRaza(request.getParameter("raza"));
                publicacion.setTamano(request.getParameter("tamano"));
                publicacion.setDistintivo(request.getParameter("distintivo"));
                publicacion.setNombreContacto(request.getParameter("nombre_contacto"));
                publicacion.setLugarPerdida(request.getParameter("lugar_perdida"));
                publicacion.setHoraPerdida(request.getParameter("hora_perdida"));
                publicacion.setTelefono(request.getParameter("celular_contacto"));
                publicacion.setDescripcion(request.getParameter("descripcion"));
                publicacion.setFoto(obtenerImagenComoByteArray(request.getPart("imagen").getInputStream()));
                publicacion.setDescripcionAdicional(request.getParameter("descripcion_adicional"));
                publicacion.setRecompensa(request.getParameter("recompensa"));

                publicacionDao.reportarMascota(publicacion);
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet?action=misPublicaciones");
                break;

            case "denunciaPost":
                Publicacion denuncia = new Publicacion();
                denuncia.setUsuario(usuarioSesion);

                denuncia.setNombreMaltratador(request.getParameter("nombre_maltratador"));
                denuncia.setTipoMaltrato(request.getParameter("tipo_maltrato"));
                denuncia.setTamano(request.getParameter("tamano_mascota"));
                denuncia.setRaza(request.getParameter("raza_mascota"));
                denuncia.setDireccionMaltrato(request.getParameter("direccion_maltrato"));
                denuncia.setDenunciaPolicial(Boolean.valueOf(request.getParameter("denuncia_policial")));
                denuncia.setDescripcion(request.getParameter("informacion_extra"));
                denuncia.setFoto(obtenerImagenComoByteArray(request.getPart("archivo").getInputStream()));

                publicacionDao.denunciarMaltrato(denuncia);
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet?action=misPublicaciones");
                break;
            case "adoptarMascota":
                Postulacion postulacion = new Postulacion();
                postulacion.setUsuario(usuarioSesion);

                String idMascotaParam = request.getParameter("idMascota");
                if (idMascotaParam != null && !idMascotaParam.isEmpty()) {
                    Mascotas mascota = new Mascotas();
                    mascota.setIdMascotas(Integer.parseInt(idMascotaParam));
                    postulacion.setMascota(mascota);
                } else {
                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet?action=adopcion");
                    return;
                }

                postulacion.setNombre(request.getParameter("Nombre"));
                postulacion.setApellido(request.getParameter("Apellido"));
                postulacion.setGenero(request.getParameter("Genero"));
                postulacion.setEdad(request.getParameter("Edad"));
                postulacion.setDireccion(request.getParameter("Direccion"));
                postulacion.setMetrajeVivienda(Double.valueOf(request.getParameter("metraje_vivienda")));
                postulacion.setCantidadCuartos(Integer.valueOf(request.getParameter("cantidad_cuartos")));
                postulacion.setCelular(request.getParameter("celular"));
                postulacion.setTelefonoReferencia(request.getParameter("telefono_referencia"));
                postulacion.setViveConDependientes(Boolean.valueOf(request.getParameter("vive_con_dependientes")));
                postulacion.setTrabajaRemoto(Boolean.valueOf(request.getParameter("trabaja_remoto")));
                postulacion.setTieneMascotas(Boolean.valueOf(request.getParameter("Tiene_mascotas")));
                postulacion.setTieneHijos(Boolean.valueOf(request.getParameter("tiene_hijos")));

                postulacionDao.postularAdopcion(postulacion);
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet?action=misSolicitudes");
                break;
        }
    }
    public static byte[] obtenerImagenComoByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }



}