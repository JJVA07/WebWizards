package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.*;
import com.example.webapphr1_2023.Beans.Publicacion;
import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.CoordinadorDao;
import com.example.webapphr1_2023.Daos.Lista_eventosDao;
import com.example.webapphr1_2023.Daos.PublicacionDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CoordinadorServlet", urlPatterns = {"/CoordinadorServlet"})
@MultipartConfig
public class CoordinadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        Usuarios usuario  = (Usuarios) request.getSession().getAttribute("usuarioSession");
        String vista;
        RequestDispatcher rd;
        CoordinadorDao coordinadorDao = new CoordinadorDao();
        int coordinadorid=8;
        switch (action) {


            case "detallesVisita":
                try {
                    // Obtener el ID de la postulación desde los parámetros del request
                    int idPostulacion = Integer.parseInt(request.getParameter("id"));

                    // Instanciar el DAO para obtener los detalles de la postulación
                    Postulacion postulacion = coordinadorDao.obtenerDetallesSolicitudAgendada(idPostulacion);

                    // Validar que la postulación exista
                    if (postulacion != null) {
                        // Pasar la postulación como atributo a la vista
                        request.setAttribute("postulacionDetalles", postulacion);

                        // Redirigir a la vista de detalles de la visita
                        RequestDispatcher dispatcher = request.getRequestDispatcher("/Coordinador_final/detalles_solicitudes_agendadas.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        // Si no se encuentra la postulación, redirigir a la lista
                        response.sendRedirect(request.getContextPath() + "/SolicitudAgendadaServlet?action=list");
                    }
                } catch (NumberFormatException e) {
                    // Manejo de errores en caso de que el ID no sea válido
                    response.sendRedirect(request.getContextPath() + "/SolicitudAgendadaServlet?action=list");
                }
                break;


            case "detalleMascotaAprobada":
                try {
                    int idPublicacion = Integer.parseInt(request.getParameter("id")); // Obtener ID de la publicación
                    Publicacion publicacionDetalles = coordinadorDao.obtenerDetallesMascotaAprobada(idPublicacion); // Obtener detalles

                    if (publicacionDetalles != null) {
                        // Enviar los detalles de la publicación al JSP
                        request.setAttribute("publicacionDetalles", publicacionDetalles);
                        RequestDispatcher view = request.getRequestDispatcher("/Coordinador_final/detalle_mascota_aprobada.jsp");
                        view.forward(request, response);
                    } else {
                        // Redirigir si no se encuentra la publicación
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasaprobadas");
                    }
                } catch (NumberFormatException e) {
                    // Manejar errores en caso de que el parámetro ID no sea válido
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasaprobadas");
                }
                break;


            case "eliminarPublicacion":
                try {
                    // Obtener el ID de la publicación
                    int idEliminar = Integer.parseInt(request.getParameter("id"));

                    // Llamar al método para eliminar la publicación
                    boolean eliminado = coordinadorDao.eliminarPublicacion(idEliminar);

                    if (eliminado) {
                        // Redirigir a la lista de mascotas perdidas después de eliminar
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasperdidas");
                    } else {
                        // Manejo en caso de que no se pueda eliminar
                        request.setAttribute("error", "No se pudo eliminar la publicación.");
                        RequestDispatcher view = request.getRequestDispatcher("/CoordinadorServlet?action=mascotasperdidas");
                        view.forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasperdidas");
                }
                break;


            case "detallePublicacion":
                try {
                    int idPublicacion = Integer.parseInt(request.getParameter("id")); // Obtener el ID de la publicación
                    Publicacion publicacionDetalles = coordinadorDao.obtenerDetallesPublicacion(idPublicacion); // Buscar detalles

                    if (publicacionDetalles != null) {
                        // Enviar los detalles de la publicación al JSP
                        request.setAttribute("publicacionDetalles", publicacionDetalles);
                        RequestDispatcher view = request.getRequestDispatcher("/Coordinador_final/detalle_mascota.jsp");
                        view.forward(request, response);
                    } else {
                        // Redirigir si no se encuentra la publicación
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasperdidas");
                    }
                } catch (NumberFormatException e) {
                    // Manejo de errores en caso de que el parámetro ID no sea válido
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasperdidas");
                }
                break;


            case "solicitud_hogaresaprobados":
                // Llamar al método del DAO para obtener las solicitudes de hogares aprobados
                List<Postulacion> listaSolicitudeshogaraprobados = coordinadorDao.solicitudehogaresaprobados();
                // Verificar si la lista contiene datos y depurar
                if (listaSolicitudeshogaraprobados.isEmpty()) {
                    System.out.println("No se encontraron solicitudes de hogares aprobados.");
                } else {
                    System.out.println("Total de solicitudes de hogares aprobados: " + listaSolicitudeshogaraprobados.size());
                    for (Postulacion p : listaSolicitudeshogaraprobados) {
                        System.out.println("ID: " + p.getIdPostulacion() +
                                ", Nombre: " + p.getNombre() +
                                ", Distrito: " + p.getDistrito().getNombre());
                    }
                }
                // Enviar la lista como atributo al JSP
                request.setAttribute("listaSolicitudeshogaraprobados", listaSolicitudeshogaraprobados);

                // Definir la vista
                vista = "/Coordinador_final/hogares_aprobados.jsp";

                // Redirigir al JSP
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "solicitud_hogares":
                // Llamar al método del DAO para obtener las solicitudes de hogares
                List<Postulacion> listaSolicitudeshogar = coordinadorDao.solicitudehogares();

                // Verificar si la lista contiene datos y depurar
                if (listaSolicitudeshogar.isEmpty()) {
                    System.out.println("No se encontraron solicitudes de hogares.");
                } else {
                    System.out.println("Total de solicitudes de hogares: " + listaSolicitudeshogar.size());
                    for (Postulacion p : listaSolicitudeshogar) {
                        System.out.println("ID: " + p.getIdPostulacion() +
                                ", Nombre: " + p.getNombre() +
                                ", Distrito: " + p.getDistrito().getNombre());
                    }
                }

                // Enviar la lista como atributo al JSP
                request.setAttribute("listaSolicitudeshogar", listaSolicitudeshogar);

                // Definir la vista
                vista = "/Coordinador_final/solicitud de hogares.jsp";

                // Redirigir al JSP
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "solicitudes_agendadas":
                // Llamar al método del DAO para obtener las solicitudes agendadas
                List<Postulacion> listaSolicitudes = coordinadorDao.solicitudesagendadas();

                // Verificar si la lista contiene datos y depurar
                if (listaSolicitudes.isEmpty()) {
                    System.out.println("No se encontraron solicitudes agendadas.");
                } else {
                    System.out.println("Total de solicitudes agendadas: " + listaSolicitudes.size());
                    for (Postulacion p : listaSolicitudes) {
                        System.out.println("ID: " + p.getIdPostulacion() + ", Nombre: " + p.getNombre() + ", Distrito: " + p.getDistrito().getNombre());
                    }
                }

                // Enviar la lista al JSP
                request.setAttribute("listaSolicitudes", listaSolicitudes);

                // Definir la vista
                vista = "/Coordinador_final/solicitudes_agendadas.jsp";

                // Redirigir al JSP
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;


            case "mascotas_aprobadas":
                // Llamar al método del DAO para obtener la lista de mascotas aprobadas
                List<Publicacion> listaAprobadas = coordinadorDao.mascotasaprobadas();

                // Verificar si la lista contiene datos y depurar
                if (listaAprobadas.isEmpty()) {
                    System.out.println("No se encontraron mascotas aprobadas.");
                } else {
                    System.out.println("Total de mascotas aprobadas: " + listaAprobadas.size());
                    for (Publicacion pub : listaAprobadas) {
                        System.out.println("Publicación aprobada: " + pub.getNombre() + ", Contacto: " + pub.getTelefono());
                    }
                }

                // Enviar la lista al JSP
                request.setAttribute("listaAprobadas", listaAprobadas);

                // Definir la vista
                vista = "/Coordinador_final/mascotas_aprobadas.jsp";

                // Redirigir al JSP
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "mascotas_perdidas":

                // Llamar al DAO para obtener la lista de publicaciones
                List<Publicacion> listaPublicaciones = coordinadorDao.mascotasperdidas();
                System.out.println("Total publicaciones encontradas: " + listaPublicaciones.size());

                // Enviar la lista como atributo al JSP
                request.setAttribute("listaPublicaciones", listaPublicaciones);

                // Definir la vista
                vista = "/Coordinador_final/mascotas_perdidas.jsp";

                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);

                break;
            case "cuenta":
                // Obtener el albergue específico (por ejemplo, con ID 7)
                Usuarios coordinador = coordinadorDao.micuenta(coordinadorid);
                // Si se obtuvo la información del albergue, se pasa como atributo a la vista
                if (coordinador != null) {
                    request.setAttribute("coordinador", coordinador);
                    System.out.println("Coordinador enviado al JSP: " + coordinador.getNombre());
                }

                // Redirige a la vista `mi_cuenta.jsp` para mostrar la información
                vista = "/Coordinador_final/Mi_cuenta.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);

                break;


            case "pagPrincipal":

                vista = "/Coordinador_final/index_coordinador.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;


            case "detalle_mascotaperdida":

                break;


            default:
                vista = "/Coordinador_final/index_coordinador.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

    }
}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

            switch (action) {

                case "updateVisita":
                    try {
                        // Crear una instancia de CoordinadorDao
                        CoordinadorDao coordinadorDao = new CoordinadorDao();

                        // Obtener parámetros del request
                        int idPostulacion = Integer.parseInt(request.getParameter("id"));
                        String fechaVisita = request.getParameter("fechaVisita");
                        String horaVisita = request.getParameter("horaVisita");

                        // Validar que los campos no estén vacíos
                        if (fechaVisita != null && !fechaVisita.isEmpty() && horaVisita != null && !horaVisita.isEmpty()) {
                            // Llamar al método actualizarFechaHoraVisita con la instancia
                            boolean actualizado = coordinadorDao.actualizarFechaHoraVisita(idPostulacion, fechaVisita, horaVisita);

                            if (actualizado) {
                                request.setAttribute("mensaje", "Fecha y hora de visita actualizadas exitosamente.");
                            } else {
                                request.setAttribute("mensaje", "No se pudo actualizar la fecha y hora de visita.");
                            }
                        } else {
                            request.setAttribute("mensaje", "Por favor complete todos los campos.");
                        }

                        // Redirigir nuevamente a los detalles de la postulación
                        request.getRequestDispatcher("/CoordinadorServlet?action=detallesVisita&id=" + idPostulacion).forward(request, response);
                    } catch (NumberFormatException e) {
                        // Manejo de errores en caso de que el ID no sea válido
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasaprobadas&error=exception");
                    }
                    break;

                case "actualizarComentario":
                    try {
                        // Obtener parámetros del formulario
                        int idPublicacion = Integer.parseInt(request.getParameter("idPublicacion"));
                        String comentario = request.getParameter("comentario_coordinador");

                        if (idPublicacion > 0 && comentario != null && !comentario.trim().isEmpty()) {
                            Publicacion publicacion = new Publicacion();
                            publicacion.setIdPublicacion(idPublicacion);
                            publicacion.setComentario_coordinador(comentario);

                            // Actualizar el comentario en la base de datos
                            CoordinadorDao dao = new CoordinadorDao();
                            dao.actualizarComentarioCoordinador(publicacion);

                            // Redirigir con mensaje de éxito
                            response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=pagPrincipal");
                        } else {
                            // Redirigir con error por comentario vacío
                            response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=detallePublicacion&id=" + idPublicacion + "&error=emptyComment");
                        }
                    } catch (NumberFormatException | IOException e) {
                        // Manejar errores y redirigir
                        e.printStackTrace();
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=mascotasaprobadas&error=exception");
                    }
                    break;

                // Otros casos aquí...
                default:
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet");
                    break;
            }

    }
}
