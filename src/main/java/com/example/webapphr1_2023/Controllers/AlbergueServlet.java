package com.example.webapphr1_2023.Controllers;
import com.example.webapphr1_2023.Beans.*;
import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.AdopcionDao;
import com.example.webapphr1_2023.Daos.AlbergueDao;
import com.example.webapphr1_2023.Daos.Lista_eventosDao;
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
import java.sql.Time;
import java.util.List;
import java.util.ArrayList;

@WebServlet(name = "AlbergueServlet", urlPatterns = {"/AlbergueServlet"})
@MultipartConfig

public class AlbergueServlet extends HttpServlet {
    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        AlbergueDao albergueDao = new AlbergueDao();
        int albergueId = 7; // Puedes cambiar el ID según sea necesario o hacerlo dinámico


        switch (action) {

            case "Albergue_donacion":
                vista = "/Albergue/Albergue_donacion.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "Albergue_adopcion":
                vista = "/Albergue/Albergue_adopcion.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "pagPrincipal":
                // Redirige a la página principal del albergue
                vista = "/Albergue/Albergue.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "lista_eventos":
                Lista_eventosDao listaEventosDao = new Lista_eventosDao();
                List<Eventos> eventos = listaEventosDao.obtenerEventosAlbergue(albergueId);

                // Agregar la lista de eventos al request
                request.setAttribute("eventos", eventos);

                // Redirigir a la vista de lista de eventos
                vista = "/Albergue/Eventos_tabla.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "cuenta":
                // Obtener el albergue específico (por ejemplo, con ID 7)
                Usuarios albergue = albergueDao.obtenerAlbergue(7);
                // Si se obtuvo la información del albergue, se pasa como atributo a la vista
                if (albergue != null) {
                    request.setAttribute("albergue", albergue);
                }

                // Redirige a la vista `mi_cuenta.jsp` para mostrar la información
                vista = "/Albergue/mi_cuenta.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "lista_temporal":
                // Crear instancia de AlbergueDao y obtener la lista de mascotas temporales
                AlbergueDao temporaldao = new AlbergueDao();
                List<Mascotas> mascotasTemporales = temporaldao.listaTemporales(albergueId);

                // Agregar la lista de mascotas temporales al request para pasarla a la vista
                request.setAttribute("mascotasTemporales", mascotasTemporales);

                // Redirigir a la vista que mostrará la lista de mascotas temporales
                vista = "/Albergue/Hogares_tabla.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "mis_donaciones":

                // Crear instancia del DAO para obtener la lista de donaciones
                AlbergueDao donacionesDao = new AlbergueDao();

                // ID del albergue (puedes obtenerlo dinámicamente si es necesario)

                // Obtener la lista de donaciones asociadas al albergue
                List<Donaciones> listaDonaciones = donacionesDao.obtenerDonacionesPorAlbergue(albergueId);

                // Agregar la lista de donaciones al request para enviarla a la vista
                request.setAttribute("listaDonaciones", listaDonaciones);

                // Redirigir a la vista que mostrará las donaciones
                vista = "/Albergue/Donaciones_tabla.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);


                break;

            case "mis_adopciones":
                AlbergueDao adopciones  = new AlbergueDao();

                List<Mascotas> misAdopciones = adopciones .obtenerAdopciones(albergueId);

                // Agregar la lista de adopciones como atributo al request
                request.setAttribute("misAdopciones", misAdopciones);

                // Redirigir a la vista correspondiente
                vista = "/Albergue/Adopciones_tabla.jsp"; // Cambia el nombre de la vista si es diferente
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);

                break;

            case "editar":

                albergue = albergueDao.obtenerAlbergue(albergueId);

                if (albergue != null) {
                    request.setAttribute("albergue", albergue);
                }

                vista = "/Albergue/editar_informacion.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;


            default:
                // Página por defecto
                vista = "/Albergue/Albergue.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");

        AlbergueDao albergueDao = new AlbergueDao();

        switch (action) {
            case "actualizar":
                // Lógica para actualizar un albergue existente
                try {
                    int id = Integer.parseInt(request.getParameter("id")); // ID del albergue
                    String nombreAlbergue = request.getParameter("nombre_albergue");
                    int telefono = Integer.parseInt(request.getParameter("telefono"));
                    String direccion = request.getParameter("direccion");
                    String puntoAcopioDonaciones = request.getParameter("punto_acopio_donaciones");
                    String urlFbig = request.getParameter("url_redes_sociales");
                    int numeroDonaciones = Integer.parseInt(request.getParameter("numero_contacto_donaciones"));

                    // Crear un objeto Usuarios con los datos actualizados
                    Usuarios albergue = new Usuarios();
                    albergue.setId(id); // Establecer el ID del albergue
                    albergue.setNombreAlbergue(nombreAlbergue);
                    albergue.setTelefono(telefono);
                    albergue.setDireccion(direccion);
                    albergue.setPuntoAcopioDonaciones(puntoAcopioDonaciones);
                    albergue.setUrlFbig(urlFbig);
                    albergue.setNumeroDonaciones(numeroDonaciones);

                    // Llamar al DAO para actualizar el albergue

                    // Redirigir a la vista de cuenta después de actualizar
                    response.sendRedirect("AlbergueServlet?action=cuenta");
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;

            case "adopcion_post":

                try {
                    // Validaciones de los parámetros enviados desde el formulario
                    if (request.getParameter("nombreMascota") == null || request.getParameter("nombreMascota").trim().isEmpty()) {
                        response.sendRedirect("error.jsp?message=Nombre de la mascota es obligatorio");
                        return;
                    }
                    if (request.getParameter("raza") == null || request.getParameter("raza").trim().isEmpty()) {
                        response.sendRedirect("error.jsp?message=Raza de la mascota es obligatoria");
                        return;
                    }
                    if (request.getParameter("edad") == null || Integer.parseInt(request.getParameter("edad")) <= 0) {
                        response.sendRedirect("error.jsp?message=Edad de la mascota debe ser un número positivo");
                        return;
                    }
                    if (request.getParameter("genero") == null || (!request.getParameter("genero").equals("Macho") && !request.getParameter("genero").equals("Hembra"))) {
                        response.sendRedirect("error.jsp?message=Género de la mascota es inválido");
                        return;
                    }
                    if (request.getParameter("descripcion") == null || request.getParameter("descripcion").trim().isEmpty()) {
                        response.sendRedirect("error.jsp?message=Descripción de la mascota es obligatoria");
                        return;
                    }

                    // Crear un objeto Mascotas para capturar los datos del formulario
                    Mascotas nuevaMascota = new Mascotas();
                    nuevaMascota.setNombreMascota(request.getParameter("nombreMascota"));
                    nuevaMascota.setEdad(Integer.parseInt(request.getParameter("edad")));
                    nuevaMascota.setGenero(request.getParameter("genero"));
                    nuevaMascota.setDescripcion(request.getParameter("descripcion"));
                    nuevaMascota.setRaza(request.getParameter("raza"));

                    // Establecer el estado "Adopción" (asumimos que idEstado = 1 para adopción)
                    MascotaEstado estadoAdopcion = new MascotaEstado();
                    estadoAdopcion.setIdMascotaEstado(1); // Estado de adopción
                    nuevaMascota.setMascotaEstado(estadoAdopcion);

                    // Asociar la mascota al albergue correspondiente
                    Usuarios albergue = new Usuarios();
                    albergue.setId(7); // Cambiar este ID si el albergue es dinámico
                    nuevaMascota.setAlbergue(albergue);

                    // Procesar y almacenar la foto como un byte array
                    if (request.getPart("Foto") != null) {
                        Part fotoPart = request.getPart("Foto"); // Obtiene el archivo adjunto del formulario
                        if (fotoPart.getSize() > 0) {
                            byte[] archivoAdjunto = obtenerImagenComoByteArray(fotoPart.getInputStream());
                            nuevaMascota.setFoto(archivoAdjunto);
                        } else {
                            response.sendRedirect("AlbergueServlet?action=mis_adopciones&error=No se pudo crear la publicación de adopción");
                            return;
                        }
                    } else {
                        response.sendRedirect("AlbergueServlet?action=mis_adopciones&error=No se pudo crear la publicación de adopción");
                        return;
                    }

                    // Crear la publicación en la base de datos
                    AdopcionDao postAdopcion = new AdopcionDao();
                    boolean resultado = postAdopcion.createAdopcion(nuevaMascota);

                    // Redirigir según el resultado de la operación
                    if (resultado) {
                        response.sendRedirect("AlbergueServlet?action=mis_adopciones");
                    } else {
                        response.sendRedirect("AlbergueServlet?action=mis_adopciones&error=No se pudo crear la publicación de adopción");
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("AlbergueServlet?action=mis_adopciones&error=No se pudo crear la publicación de adopción");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("AlbergueServlet?action=mis_adopciones&error=No se pudo crear la publicación de adopción");
                }
                break;


            case "donacion_post":
                try {
                    // Validaciones de los parámetros enviados desde el formulario
                    if (!validarParametroObligatorio(request, "telefono", "El teléfono es obligatorio", response)) return;
                    if (!validarParametroObligatorio(request, "cantidad_donacion", "La cantidad de donación es obligatoria", response)) return;
                    if (!validarParametroObligatorio(request, "nombre_contacto_albergue", "El nombre del contacto del albergue es obligatorio", response)) return;
                    if (!validarParametroObligatorio(request, "punto_acopio_donaciones", "El punto de acopio es obligatorio", response)) return;
                    if (!validarParametroObligatorio(request, "fechas_programadas_recepcion", "La fecha programada de recepción es obligatoria", response)) return;
                    if (!validarParametroObligatorio(request, "tipo_donacion", "El tipo de donación es obligatorio", response)) return;
                    if (!validarParametroObligatorio(request, "hora_recepcion", "La hora de recepción es obligatoria", response)) return;

                    // Crear un objeto Donaciones para capturar los datos del formulario
                    Donaciones nuevaDonacion = new Donaciones();
                    nuevaDonacion.setTelefono(Integer.parseInt(request.getParameter("telefono")));
                    nuevaDonacion.setCantidadDonacion(String.valueOf(Integer.parseInt(request.getParameter("cantidad_donacion"))));
                    nuevaDonacion.setNombre_contacto_albergue(request.getParameter("nombre_contacto_albergue"));
                    nuevaDonacion.setPunto_acopio_donaciones(request.getParameter("punto_acopio_donaciones"));
                    nuevaDonacion.setFechas_programadas_recepcion(request.getParameter("fechas_programadas_recepcion")); // Formato: YYYY-MM-DD

                    // Validar y asignar la hora de recepción
                    try {
                        String horaRecepcion = request.getParameter("hora_recepcion");
                        if (horaRecepcion != null && !horaRecepcion.isEmpty() && horaRecepcion.matches("\\d{2}:\\d{2}")) {
                            // Agregar segundos si están ausentes
                            horaRecepcion += ":00";
                            nuevaDonacion.setHora_recepcion(Time.valueOf(horaRecepcion));
                        } else {
                            response.sendRedirect("error.jsp?message=La hora de recepción tiene un formato inválido");
                            return;
                        }
                    } catch (IllegalArgumentException e) {
                        response.sendRedirect("error.jsp?message=La hora de recepción tiene un formato inválido");
                        return;
                    }


                    nuevaDonacion.setTipoDonacion(request.getParameter("tipo_donacion"));

                    // Crear y asignar el estado de la donación
                    DonacionEstado estado = new DonacionEstado();
                    estado.setIdDonacionEstado(4); // Estado fijo
                    nuevaDonacion.setDonacionEstado(estado);

                    // Usuario del albergue (puede ser dinámico desde la sesión)
                    Usuarios usuarioAlbergue = new Usuarios();
                    usuarioAlbergue.setId(7); // Albergue fijo
                    nuevaDonacion.setUsuarioAlbergue(usuarioAlbergue);

                    // Crear la donación en la base de datos
                    AlbergueDao donacionesDAO = new AlbergueDao();
                    boolean resultado = donacionesDAO.creardonacion(nuevaDonacion);

                    // Redirigir según el resultado de la operación
                    if (resultado) {
                        response.sendRedirect("AlbergueServlet?action=mis_donaciones");
                    } else {
                        response.sendRedirect("AlbergueServlet?action=mis_donaciones&error=No se pudo registrar la donación");
                    }

                } catch (NumberFormatException e) {
                    response.sendRedirect("AlbergueServlet?action=mis_donaciones&error=Los datos ingresados son inválidos");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("AlbergueServlet?action=mis_donaciones&error=Hubo un error inesperado");
                }
                break;


            default:
                response.sendRedirect("AlbergueServlet?action=pagPrincipal");
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
    private boolean validarParametroObligatorio(HttpServletRequest request, String parametro, String mensajeError, HttpServletResponse response) throws IOException {
        if (request.getParameter(parametro) == null || request.getParameter(parametro).trim().isEmpty()) {
            response.sendRedirect("error.jsp?message=" + mensajeError);
            return false;
        }
        return true;
    }

}
