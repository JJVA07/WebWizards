package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.*;
import com.example.webapphr1_2023.Daos.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import com.example.webapphr1_2023.Daos.DonacionesDao;

import com.example.webapphr1_2023.Daos.UsuariosDao;
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
        PostulacionDao postulacionDao = new PostulacionDao();

        switch (action) {
            case "pagPrincipal":
                vista = "/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
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
                    } else {
                        request.setAttribute("mascota", mascotaDetalles);
                        vista = "/Usuario_final/formulario_adopcion.jsp";
                        request.setAttribute("paginaActiva", "adopcion");
                        rd = request.getRequestDispatcher(vista);
                        rd.forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
                }
                break;
            case "formularioPerdida":
                vista = "/Usuario_final/mascotas_perdidas.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "mascotas_perdidas");
                rd.forward(request, response);
                break;
            case "formularioDenuncia":
                vista = "/Usuario_final/denuncias.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "denuncias");
                rd.forward(request, response);
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
                // Obtener el ID desde la URL
                String idDonacionesParam = request.getParameter("idDonaciones");

                if (idDonacionesParam == null || idDonacionesParam.trim().isEmpty()) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el parámetro idDonaciones");
                    return;
                }

                try {
                    // Convertir el ID a entero
                    int idDonaciones = Integer.parseInt(idDonacionesParam);

                    // Buscar la donación en la base de datos
                    Donaciones donacion = donacionesDao.obtenerDonacionPorId(idDonaciones);

                    if (donacion == null) {
                        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Donación no encontrada");
                        return;
                    }

                    // Pasar la donación al JSP
                    request.setAttribute("donacion", donacion);

                    // Redirigir al JSP de detalles
                    rd = request.getRequestDispatcher("/Usuario_final/donacion_detalle.jsp");
                    rd.forward(request, response);

                } catch (NumberFormatException e) {
                    response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro idDonaciones no es válido");
                }
                break;

            case "listarpostulaciones":
                try {
                    // Obtén el usuarioId dinámicamente desde la sesión, si corresponde
                    HttpSession session = request.getSession();
                    int usuarioId = (session.getAttribute("usuarioId") != null)
                            ? (int) session.getAttribute("usuarioId")
                            : 1; // Valor por defecto para pruebas

                    int estadoId = 1; // Estado fijo de la postulación

                    // Instancia del DAO
                    postulacionDao = new PostulacionDao();

                    // Llamar al método del DAO
                    List<Postulacion> postulaciones = postulacionDao.obtenerPostulacionesPorUsuarioYEstado(usuarioId, estadoId);

                    // Verificar si se obtuvieron postulaciones
                    if (postulaciones != null && !postulaciones.isEmpty()) {
                        System.out.println("Postulaciones encontradas: " + postulaciones.size());
                        for (Postulacion p : postulaciones) {
                            System.out.println("Postulación: " + p.getNombre() + " " + p.getApellido());
                        }
                    } else {
                        System.out.println("No se encontraron postulaciones para usuarioId = " + usuarioId + " y estadoId = " + estadoId);
                    }

                    // Adjuntar la lista de postulaciones al request
                    request.setAttribute("postulaciones", postulaciones);

                    // Redirigir a la vista JSP
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/Usuario_final/mis_solicitudes.jsp");
                    dispatcher.forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Hubo un error al listar las postulaciones: " + e.getMessage());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
                }
                break;

            case "detallePostulacion":
                // Obtener el parámetro idPostulacion desde la URL
                String idPostulacionStr = request.getParameter("idPostulacion");
                if (idPostulacionStr != null && !idPostulacionStr.isEmpty()) {
                    try {
                        int idPostulacion = Integer.parseInt(idPostulacionStr);
                        Postulacion postulacion = postulacionDao.obtenerPostulacionPorId(idPostulacion);
                        String idParam = request.getParameter("idPostulacion");
                        System.out.println("ID recibido: " + idParam);

                        if (postulacion != null) {
                            request.setAttribute("postulacion", postulacion);
                            RequestDispatcher dispatcher = request.getRequestDispatcher("/Usuario_final/ver_solicitud.jsp");
                            dispatcher.forward(request, response);

                        } else {
                            response.sendRedirect("error.jsp?message=No se encontró la postulación");
                        }
                    } catch (NumberFormatException e) {
                        response.sendRedirect("error.jsp?message=ID de postulación no válido");
                    }
                } else {
                    response.sendRedirect("error.jsp?message=ID de postulación faltante");
                }
                break;

            default:
                // Manejar acciones no válidas
                response.sendRedirect("error.jsp?message=Acción no válida");
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        PublicacionDao publicacionDao = new PublicacionDao();
        DonacionesDao donacionesDao; // Declaración como variable miembro
        donacionesDao = new DonacionesDao();

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

            case "guardarDonacion":
                try {
                    // Recibir parámetros del formulario
                    String cantidad = request.getParameter("cantidad");
                    String unidades = request.getParameter("unidades");
                    String tipoDonacion = request.getParameter("tipo-donacion");
                    String marca = request.getParameter("nombre-producto");
                    String puntoEntrega = request.getParameter("lugar-entrega");
                    String nombreAlbergue = request.getParameter("albergue");
                    String fechaEntregaStr = request.getParameter("fecha");

                    // Validaciones básicas
                    if (cantidad == null || unidades == null || tipoDonacion == null || marca == null ||
                            puntoEntrega == null || nombreAlbergue == null || fechaEntregaStr == null ||
                            cantidad.trim().isEmpty() || unidades.trim().isEmpty() || tipoDonacion.trim().isEmpty() ||
                            marca.trim().isEmpty() || puntoEntrega.trim().isEmpty() || nombreAlbergue.trim().isEmpty() ||
                            fechaEntregaStr.trim().isEmpty()) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Todos los campos son obligatorios.");
                        return;
                    }

                    // Concatenar cantidad y unidades
                    String cantidadDonacion = cantidad + " " + unidades;

                    // Parsear la fecha de entrega
                    Date fechaEntrega = java.sql.Date.valueOf(fechaEntregaStr);

                    // Obtener el ID del albergue por su nombre
                    int usuariosAlbergueId = donacionesDao.obtenerIdAlberguePorNombre(nombreAlbergue);

                    if (usuariosAlbergueId == 0) {
                        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Albergue seleccionado no válido.");
                        return;
                    }

                    // Crear el objeto Donaciones
                    Donaciones nuevaDonacion = new Donaciones();
                    nuevaDonacion.setCantidadDonacion(cantidadDonacion); // Se guarda la concatenación
                    nuevaDonacion.setTipoDonacion(tipoDonacion);
                    nuevaDonacion.setMarca(marca);
                    nuevaDonacion.setPuntoEntrega(puntoEntrega);
                    nuevaDonacion.setFechaEntrega(fechaEntrega);

                    // Usuario que realiza la donación (fijo)
                    Usuarios usuarioDonador = new Usuarios();
                    usuarioDonador.setId(1); // Usuario fijo con ID 1
                    nuevaDonacion.setUsuario(usuarioDonador);

                    // Albergue receptor
                    Usuarios usuarioAlbergue = new Usuarios();
                    usuarioAlbergue.setId(usuariosAlbergueId);
                    nuevaDonacion.setUsuarioAlbergue(usuarioAlbergue);

                    // Guardar la donación en la base de datos
                    boolean exito = donacionesDao.guardarDonacion(nuevaDonacion);

                    if (exito) {
                        // Redirigir a la página de mis donaciones tras el guardado exitoso
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=mostrarDonaciones");
                    } else {
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al guardar la donación.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error procesando la donación.");
                }
                break;

            case "registrarPostulacion":
                try {
                    // Captura de datos
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellido");
                    String genero = request.getParameter("genero");
                    edad = String.valueOf(Integer.parseInt(request.getParameter("edad")));
                    String direccion = request.getParameter("direccion");
                    double metraje = Double.parseDouble(request.getParameter("metraje"));
                    String tipoMascotas = request.getParameter("mascotas");
                    int cantidadMascotas = Integer.parseInt(request.getParameter("cantidad_mascotas"));
                    int tiempoTemporal = Integer.parseInt(request.getParameter("tiempo_temporal"));
                    java.sql.Date fechaInicio = java.sql.Date.valueOf(request.getParameter("fecha_inicio"));
                    java.sql.Date fechaFin = java.sql.Date.valueOf(request.getParameter("fecha_fin"));
                    int cantidadCuartos = Integer.parseInt(request.getParameter("cuartos"));

                    // Nuevos campos
                    String personaReferencia = request.getParameter("persona_referencia");
                    String telefonoReferencia = request.getParameter("telefono_referencia");
                    String celular = request.getParameter("celular");

                    boolean tieneHijos = "si".equalsIgnoreCase(request.getParameter("hijos"));
                    boolean viveConDependientes = "dependientes".equalsIgnoreCase(request.getParameter("vivienda"));
                    boolean trabajaRemoto = "remoto".equalsIgnoreCase(request.getParameter("trabajo"));
                    String tieneMascotas = request.getParameter("mascota");

                    // Crear objeto Postulacion
                    Postulacion postulacion = new Postulacion();
                    postulacion.setNombre(nombre);
                    postulacion.setApellido(apellido);
                    postulacion.setGenero(genero);
                    postulacion.setEdad(edad);
                    postulacion.setDireccion(direccion);
                    postulacion.setMetrajeVivienda(metraje);
                    postulacion.setTipoMascotas(tipoMascotas);
                    postulacion.setCantidadMascotas(cantidadMascotas);
                    postulacion.setTiempoTemporal(tiempoTemporal);
                    postulacion.setFechaInicioTemporal(fechaInicio);
                    postulacion.setFechaFinTemporal(fechaFin);
                    postulacion.setCantidadCuartos(cantidadCuartos);
                    postulacion.setPersonaReferencia(personaReferencia);
                    postulacion.setTelefonoReferencia(telefonoReferencia);
                    postulacion.setCelular(celular);

                    postulacion.setTieneHijos(tieneHijos);
                    postulacion.setViveConDependientes(viveConDependientes);
                    postulacion.setTrabajaRemoto(trabajaRemoto);
                    postulacion.setTieneMascotas(tieneMascotas);

                    // Valores fijos
                    usuario = new Usuarios();
                    usuario.setId(1); // Usuario_ID fijo
                    postulacion.setUsuario(usuario);

                    PostulacionEstado estado = new PostulacionEstado();
                    estado.setIdPostulacionEstado(3); // Estado fijo
                    postulacion.setPostulacionEstado(estado);

                    // Guardar
                    PostulacionDao postulacionDao = new PostulacionDao();
                    postulacionDao.insertarPostulacion(postulacion);

                    response.sendRedirect(request.getContextPath() + "/Usuario?action=listarpostulaciones");

                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Error al procesar la solicitud: " + e.getMessage());
                    RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
                    dispatcher.forward(request, response);
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
