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
import jakarta.servlet.http.Part;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.List;

@WebServlet(name ="UsuarioServlet" , value = "/Usuario")
@MultipartConfig
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        UsuariosDao userDao = new UsuariosDao();
        DonacionesDao donacionesDao = new DonacionesDao();
        SolicitudDao.PostulacionDao postulacionDao = new SolicitudDao.PostulacionDao();

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
            case "eventos":
                int pagina = request.getParameter("pagina") == null ? 1 : Integer.parseInt(request.getParameter("pagina"));
                int offset = (pagina - 1) * 6;

                // Crear una instancia de EventosDao
                EventosDao eventosDao = new EventosDao();
                List<Eventos> eventos = eventosDao.obtenerEventosActivosPaginados(offset, 6);

                int totalEventos = eventosDao.contarEventosActivos();
                int totalPaginas = (int) Math.ceil((double) totalEventos / 6);

                request.setAttribute("eventos", eventos);
                request.setAttribute("paginaActual", pagina);
                request.setAttribute("totalPaginas", totalPaginas);


                vista = "src/main/webapp/Usuario_final/eventos.jsp";
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
                int userId = 1; // Valor estático para userId
                List<Donaciones> donaciones = donacionesDao.obtenerDonacionesPorUsuario(userId);
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

            case "misSolicitudes":
                int usuarioId = 1; // ID fijo del usuario
                SolicitudDao solicitudDao = new SolicitudDao();

                // Obtener todas las solicitudes para el usuario
                List<Object[]> solicitudes = solicitudDao.obtenerSolicitudesPorUsuario(usuarioId);

                // Pasar la lista de solicitudes a la JSP
                request.setAttribute("solicitudes", solicitudes);

                // Redirigir a la vista de "Mis Solicitudes"
                vista = "/Usuario_final/mis_solicitudes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "mostrarSolicitud":
                int usuarioIds = 1; // ID del usuario
                Postulacion postulacion = postulacionDao.obtenerSolicitudPorUsuario(usuarioIds);
                request.setAttribute("postulacion", postulacion);

                vista = "/Usuario_final/ver_solicitud.jsp";
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
        String action = request.getParameter("action");
        PublicacionDao publicacionDao = new PublicacionDao();
        SolicitudDao.PostulacionDao postulacionDao = new SolicitudDao.PostulacionDao();
        SolicitudDao solicitudDao = new SolicitudDao();

        switch (action) {
            case "reportarPOST":
                Publicacion publicacion = new Publicacion();
                int id_Usuario =5;
                Usuarios usuario = new Usuarios();
                usuario.setId(id_Usuario);


                String nombreMascota = request.getParameter("nombre");
                if (nombreMascota.trim().isEmpty() || nombreMascota == null || nombreMascota.trim().isBlank()){
                    System.out.println("Error, se ha enviado un nombre vacío ");
                }
                String edad = request.getParameter("edad");
                String raza = request.getParameter("raza");
                String tamano = request.getParameter("tamano");
                String distintivo = request.getParameter("distintivo");
                String nombreContacto = request.getParameter("nombre_contacto");
                String lugarPerdida = request.getParameter("lugar_perdida");
                String horaPerdida = request.getParameter("hora_perdida");
                String celularContacto = request.getParameter("celular_contacto");
                String descripcion = request.getParameter("descripcion");
                String descripcionAdicional = request.getParameter("descripcion_adicional");
                String recompensa = request.getParameter("recompensa");

                byte[] archivoImagen = obtenerImagenComoByteArray(request.getPart("imagen").getInputStream());

                publicacion.setNombre(nombreMascota);
                publicacion.setEdad(Integer.parseInt(edad));
                publicacion.setRaza(raza);
                publicacion.setTamano(tamano);
                publicacion.setDistintivo(distintivo);
                publicacion.setNombreContacto(nombreContacto);
                publicacion.setLugarPerdida(lugarPerdida);
                publicacion.setHoraPerdida(horaPerdida);
                publicacion.setTelefono(celularContacto);
                publicacion.setDescripcion(descripcion);
                publicacion.setFoto(archivoImagen);
                publicacion.setDescripcionAdicional(descripcionAdicional);
                publicacion.setRecompensa(recompensa);
                publicacion.setUsuario(usuario);
                publicacionDao.reportarMascota(publicacion);
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                break;
            case "registrarSolicitud":
                try {
                    // Crear una nueva instancia de Postulacion y rellenar los datos desde el formulario
                    Postulacion postulacion = new Postulacion();
                    postulacion.setCantidadCuartos(Integer.parseInt(request.getParameter("cantidad_cuartos")));
                    postulacion.setMetrajeVivienda(Double.parseDouble(request.getParameter("metraje_vivienda")));
                    postulacion.setCantidadMascotas(Integer.parseInt(request.getParameter("cantidad_mascotas")));
                    postulacion.setTipoMascotas(request.getParameter("tipo_mascotas"));
                    postulacion.setTieneHijos(Boolean.parseBoolean(request.getParameter("tiene_hijos")));
                    postulacion.setViveConDependientes(Boolean.parseBoolean(request.getParameter("vive_con_dependientes")));
                    postulacion.setTrabajaRemoto(Boolean.parseBoolean(request.getParameter("trabaja_remoto")));
                    postulacion.setPersonaReferencia(request.getParameter("persona_referencia"));
                    postulacion.setTelefonoReferencia(request.getParameter("telefono_referencia"));
                    postulacion.setTiempoTemporal(Integer.parseInt(request.getParameter("tiempo_temporal")));

                    // Obtener las fechas como cadenas en formato yyyy-MM-dd
                    String fechaInicio = request.getParameter("fecha_inicio_temporal");
                    String fechaFin = request.getParameter("fecha_fin_temporal");

                    // Verifica que las fechas no sean nulas o vacías y convierte el formato
                    if (fechaInicio != null && !fechaInicio.isEmpty()) {
                        // Convierte la fecha a formato yy-MM-dd (tomando solo los últimos 2 dígitos del año)
                        String[] parts = fechaInicio.split("-");
                        String fechaInicioFormateada = parts[1] + "-" + parts[2] + "-" + parts[0].substring(2); // Formato: yy-mm-dd
                        postulacion.setFechaInicioTemporal(Date.valueOf(fechaInicioFormateada)); // Asigna la fecha formateada
                    }

                    if (fechaFin != null && !fechaFin.isEmpty()) {
                        // Convierte la fecha a formato yy-MM-dd (tomando solo los últimos 2 dígitos del año)
                        String[] parts = fechaFin.split("-");
                        String fechaFinFormateada = parts[1] + "-" + parts[2] + "-" + parts[0].substring(2); // Formato: yy-mm-dd
                        postulacion.setFechaFinTemporal(Date.valueOf(fechaFinFormateada)); // Asigna la fecha formateada
                    }

                    // Establecer otros campos
                    postulacion.setTieneMascotas(request.getParameter("tiene_mascotas"));
                    postulacion.setNombre(request.getParameter("nombre"));
                    postulacion.setApellido(request.getParameter("apellido"));
                    postulacion.setEdad(request.getParameter("edad"));
                    postulacion.setGenero(request.getParameter("genero"));
                    postulacion.setCelular(request.getParameter("celular"));
                    postulacion.setDireccion(request.getParameter("direccion"));

                    // Establecer Distrito y Estado
                    Distrito distrito = new Distrito(); // Suponiendo que tienes una clase Distrito y su ID
                    distrito.setIdDistrito(3); // Asignar el ID correspondiente

                    PostulacionEstado estado = new PostulacionEstado(); // Suponiendo que tienes una clase PostulacionEstado y su ID
                    estado.setIdPostulacionEstado(3); // Asignar el estado 'pendiente'

                    postulacion.setDistrito(distrito);
                    postulacion.setPostulacionEstado(estado);

                    // Llamar al DAO para insertar la solicitud
                    postulacionDao.insertarPostulacion(postulacion, 1); // 1 es el ID del usuario (puede ser dinámico)

                    // Redirigir a la página de "Mis Solicitudes"
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=misSolicitudes");
                } catch (NumberFormatException | NullPointerException e) {
                    // Captura errores de formato y parámetros nulos
                    request.setAttribute("mensaje", "Ocurrió un error al procesar la solicitud. Verifique los datos ingresados.");
                    request.getRequestDispatcher("/Usuario_final/registrar_solicitud.jsp").forward(request, response);
                    e.printStackTrace(); // Esto es útil para depuración, pero en producción deberías manejarlo mejor
                }
                break;


            // Otros casos...
            default:
                // Acción por defecto
                response.sendRedirect(request.getContextPath() + "/Usuario_final/home.jsp");
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