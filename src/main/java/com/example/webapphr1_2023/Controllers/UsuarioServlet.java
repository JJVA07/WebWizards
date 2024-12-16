package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.*;
import com.example.webapphr1_2023.Daos.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

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
                request.setAttribute("paginaActiva", "mis_eventos");
                List<Eventos> eventosInscritos = eventosDao.obtenerEventosInscritosPorUsuario(idUsuario);

                // Verifica si hay eventos inscritos y los envía a la vista
                if (eventosInscritos != null && !eventosInscritos.isEmpty()) {
                    request.setAttribute("eventos", eventosInscritos);
                } else {
                    request.setAttribute("mensaje", "No estás inscrito en ningún evento.");
                }

                // Redirige a mis_eventos.jsp
                request.setAttribute("paginaActiva", "mis_eventos");
                rd = request.getRequestDispatcher("/Usuario_final/mis_eventos.jsp");
                rd.forward(request, response);
                break;
            case "detallesEvento":
                try {
                    int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                    Eventos evento = eventosDao.obtenerDetallesEvento(idEvento);

                    // Verificar si el usuario está inscrito
                    boolean yaInscrito = eventosDao.verificarInscripcion(idUsuario, idEvento);

                    request.setAttribute("evento", evento);
                    request.setAttribute("yaInscrito", yaInscrito);

                    vista = "/Usuario_final/evento_albergue.jsp";
                } catch (NumberFormatException e) {
                    vista = "/Usuario?action=eventos";
                    request.setAttribute("mensaje", "ID de evento inválido.");
                }
                request.setAttribute("paginaActiva", "eventos");
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "eventos":
                int pagina = request.getParameter("pagina") == null ? 1 : Integer.parseInt(request.getParameter("pagina"));
                int offset = (pagina - 1) * 6;
                int idUsuarioActual = usuarioSesion.getId(); // Obtener el ID del usuario actual

                List<Eventos> eventasos = eventosDao.obtenerEventosActivosPaginados(idUsuarioActual, offset, 6);

                int totalEventos = eventosDao.contarEventosActivos();
                int totalPaginas = (int) Math.ceil((double) totalEventos / 6);

                request.setAttribute("eventos", eventasos);
                request.setAttribute("paginaActual", pagina);
                request.setAttribute("totalPaginas", totalPaginas);
                request.setAttribute("paginaActiva", "eventos");

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
                //Donaciones donacion = donacionesDao.vistaDetallesDonacionPorUsuarioFijo();
                //request.setAttribute("donacion", donacion);

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
                request.setAttribute("paginaActiva", "mis_publicaciones");
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "noticias":
                NoticiasDao noticiasDao = new NoticiasDao();
                List<Object[]> noticias = noticiasDao.obtenerNoticiasMezcladas();

                // Pasar la lista de noticias a la JSP
                request.setAttribute("noticias", noticias);

                // Redirige a noticias.jsp
                request.setAttribute("paginaActiva", "noticias");
                rd = request.getRequestDispatcher("/Usuario_final/noticias.jsp");
                rd.forward(request, response);
                break;
            case "editarPublicacion":
                try {
                    int idPublicacionEditar = Integer.parseInt(request.getParameter("id"));
                    Publicacion publicacionEditar = publicacionDao.obtenerPublicacionPorId(idPublicacionEditar);

                    if (publicacionEditar != null) {
                        request.setAttribute("publicacion", publicacionEditar);
                        rd = request.getRequestDispatcher("/Usuario_final/editar_publicacion.jsp");
                        rd.forward(request, response);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Error: ID de publicación inválido.");
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                }
                break;



            case "eliminarPublicacion":
                int idPublicacionEliminar = Integer.parseInt(request.getParameter("idPublicacion"));
                publicacionDao.eliminarPublicacion(idPublicacionEliminar);
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
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
        EventosDao eventosDao = new EventosDao();
        Publicacion publicacion = new Publicacion();
        switch (action) {
            case "reportarPOST":

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
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
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
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                break;
            case "adoptarMascota":
                try {
                    Postulacion postulacion = new Postulacion();
                    postulacion.setUsuario(usuarioSesion);

                    // Obtener datos del formulario
                    String idMascotaParam = request.getParameter("idMascota");
                    if (idMascotaParam != null && !idMascotaParam.isEmpty()) {
                        Mascotas mascota = new Mascotas();
                        mascota.setIdMascotas(Integer.parseInt(idMascotaParam));
                        postulacion.setMascota(mascota);
                    } else {
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
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
                    postulacion.setViveConDependientes(Boolean.parseBoolean(request.getParameter("vive_con_dependientes")));
                    postulacion.setTrabajaRemoto(Boolean.parseBoolean(request.getParameter("trabaja_remoto")));
                    postulacion.setTieneMascotas(request.getParameter("Tiene_mascotas"));
                    postulacion.setTieneHijos(Boolean.parseBoolean(request.getParameter("tiene_hijos")));

                    // Llamar al método del DAO
                    postulacionDao.postularAdopcion(postulacion);

                    // Redirigir a mis solicitudes después del registro exitoso
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misSolicitudes");

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
                }
                break;

            case "inscribirseEvento":
                try {
                    int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                    int idUsuarioPost = usuarioSesion.getId();

                    // Verificar si el usuario ya está inscrito
                    boolean yaInscritoPost = eventosDao.verificarInscripcion(idUsuarioPost, idEvento);

                    if (!yaInscritoPost) {
                        // Registrar la inscripción y reducir una vacante
                        eventosDao.inscribirUsuarioEnEvento(idUsuarioPost, idEvento);
                    }

                    // Redirigir a la página de "Mis Eventos"
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misEventos");
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=eventos");
                }
                break;


            case "actualizarPublicacion":
                try {
                    int idPublicacion = Integer.parseInt(request.getParameter("idPublicacion"));

                    // Obtener la publicación existente
                    Publicacion publicacionActual = publicacionDao.obtenerPublicacionPorId(idPublicacion);

                    if (publicacionActual != null) {
                        // Validar y actualizar campos comunes
                        String descripcion = request.getParameter("descripcion");
                        if (descripcion != null && !descripcion.trim().isEmpty()) {
                            publicacionActual.setDescripcion(descripcion);
                        }

                        // Validar si una nueva imagen fue subida
                        Part imagenPart = request.getPart("imagen");
                        if (imagenPart != null && imagenPart.getSize() > 0) {
                            InputStream inputStream = imagenPart.getInputStream();
                            publicacionActual.setFoto(obtenerImagenComoByteArray(inputStream)); // Actualizar con nueva imagen
                        }

                        // Actualización específica para cada tipo de publicación
                        int tipoPublicacion = publicacionActual.getTipoPublicacion().getIdTipoPublicacion();

                        if (tipoPublicacion == 1) { // Mascota perdida
                            String nombre = request.getParameter("nombre");
                            String edadParam = request.getParameter("edad");
                            String raza = request.getParameter("raza");
                            String tamano = request.getParameter("tamano");
                            String distintivo = request.getParameter("distintivo");

                            if (nombre != null && !nombre.trim().isEmpty()) publicacionActual.setNombre(nombre);
                            if (edadParam != null && !edadParam.trim().isEmpty()) publicacionActual.setEdad(Integer.parseInt(edadParam));
                            if (raza != null && !raza.trim().isEmpty()) publicacionActual.setRaza(raza);
                            if (tamano != null && !tamano.trim().isEmpty()) publicacionActual.setTamano(tamano);
                            if (distintivo != null && !distintivo.trim().isEmpty()) publicacionActual.setDistintivo(distintivo);

                        } else if (tipoPublicacion == 2) { // Denuncia
                            String nombreMaltratador = request.getParameter("nombreMaltratador");
                            String tipoMaltrato = request.getParameter("tipoMaltrato");
                            String direccionMaltrato = request.getParameter("direccionMaltrato");
                            String denunciaPolicialParam = request.getParameter("denunciaPolicial");

                            if (nombreMaltratador != null && !nombreMaltratador.trim().isEmpty())
                                publicacionActual.setNombreMaltratador(nombreMaltratador);
                            if (tipoMaltrato != null && !tipoMaltrato.trim().isEmpty())
                                publicacionActual.setTipoMaltrato(tipoMaltrato);
                            if (direccionMaltrato != null && !direccionMaltrato.trim().isEmpty())
                                publicacionActual.setDireccionMaltrato(direccionMaltrato);
                            if (denunciaPolicialParam != null)
                                publicacionActual.setDenunciaPolicial(Boolean.parseBoolean(denunciaPolicialParam));
                        }

                        // Llamar al método del DAO para actualizar la publicación
                        publicacionDao.actualizarPublicacion(publicacionActual);

                        // Redirigir a mis publicaciones
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                    } else {
                        // Manejo en caso de que no se encuentre la publicación
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones&error=notFound");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones&error=updateFailed");
                }
                break;





            case "eliminarPublicacion":
                System.out.println("Intentando eliminar publicación");
                String idParam = request.getParameter("idPublicacion");
                System.out.println("ID Publicacion: " + idParam);
                try {
                    int idPublicacionEliminar = Integer.parseInt(idParam);
                    PublicacionDao publicacionDaoEliminar = new PublicacionDao();
                    publicacionDaoEliminar.eliminarPublicacion(idPublicacionEliminar);
                    System.out.println("Publicación eliminada exitosamente.");

                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones&error=failedToDelete");
                }
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