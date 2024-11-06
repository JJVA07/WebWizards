package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Postulacion;
import com.example.webapphr1_2023.Daos.PostulacionDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/postulaciones")
public class PostulacionServlet extends HttpServlet {
    private PostulacionDao postulacionDAO;

    public void init() {
        postulacionDAO = new PostulacionDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null) {
                action = "list";
            }

            switch (action) {
                case "new":
                    showNewForm(request, response);
                    break;
                case "insert":
                    insertPostulacion(request, response);
                    break;
                case "delete":
                    deletePostulacion(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "update":
                    updatePostulacion(request, response);
                    break;
                default:
                    listPostulaciones(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void listPostulaciones(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Postulacion> listPostulacion = postulacionDAO.selectAllPostulaciones();
        request.setAttribute("listPostulacion", listPostulacion);
        RequestDispatcher dispatcher = request.getRequestDispatcher("postulacion-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("postulacion-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Postulacion existingPostulacion = postulacionDAO.selectPostulacion(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("postulacion-form.jsp");
        request.setAttribute("postulacion", existingPostulacion);
        dispatcher.forward(request, response);
    }

    private void insertPostulacion(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        Postulacion postulacion = new Postulacion();
        postulacion.setCantidadCuartos(Integer.parseInt(request.getParameter("cantidadCuartos")));
        postulacion.setMetrajeVivienda(Double.parseDouble(request.getParameter("metrajeVivienda")));
        postulacion.setCantidadMascotas(Integer.parseInt(request.getParameter("cantidadMascotas")));
        postulacion.setTipoMascotas(request.getParameter("tipoMascotas"));
        postulacion.setTieneHijos(Boolean.parseBoolean(request.getParameter("tieneHijos")));
        postulacion.setViveConDependientes(Boolean.parseBoolean(request.getParameter("viveConDependientes")));
        postulacion.setTrabajaRemoto(Boolean.parseBoolean(request.getParameter("trabajaRemoto")));
        postulacion.setPersonaReferencia(request.getParameter("personaReferencia"));
        postulacion.setTelefonoReferencia(request.getParameter("telefonoReferencia"));
        postulacion.setTiempoTemporal(Integer.parseInt(request.getParameter("tiempoTemporal")));
        postulacion.setPostulacionEstadoIdPostulacionEstado(Integer.parseInt(request.getParameter("postulacionEstadoIdPostulacionEstado")));
        postulacion.setUsuariosId(Integer.parseInt(request.getParameter("usuariosId")));
        postulacion.setTieneMascotas(request.getParameter("tieneMascotas"));
        postulacion.setNombre(request.getParameter("nombre"));
        postulacion.setApellido(request.getParameter("apellido"));
        postulacion.setEdad(request.getParameter("edad"));
        postulacion.setGenero(request.getParameter("genero"));
        postulacion.setCelular(request.getParameter("celular"));
        postulacion.setDireccion(request.getParameter("direccion"));
        postulacion.setDistritoIdDistrito(Integer.parseInt(request.getParameter("distritoIdDistrito")));
        postulacion.setVisitaInopinada(request.getParameter("visitaInopinada"));
        postulacion.setFechaInopinada(request.getParameter("fechaInopinada"));
        postulacion.setHoraInopinada(request.getParameter("horaInopinada"));
        postulacion.setMotivoRechazo(request.getParameter("motivoRechazo"));
        postulacion.setMascotasIdMascotas(Integer.parseInt(request.getParameter("mascotasIdMascotas")));

        postulacionDAO.insertPostulacion(postulacion);
        response.sendRedirect("postulaciones?action=list");
    }

    private void updatePostulacion(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Postulacion postulacion = postulacionDAO.selectPostulacion(id);

        postulacion.setCantidadCuartos(Integer.parseInt(request.getParameter("cantidadCuartos")));
        postulacion.setMetrajeVivienda(Double.parseDouble(request.getParameter("metrajeVivienda")));
        postulacion.setCantidadMascotas(Integer.parseInt(request.getParameter("cantidadMascotas")));
        postulacion.setTipoMascotas(request.getParameter("tipoMascotas"));
        postulacion.setTieneHijos(Boolean.parseBoolean(request.getParameter("tieneHijos")));
        postulacion.setViveConDependientes(Boolean.parseBoolean(request.getParameter("viveConDependientes")));
        postulacion.setTrabajaRemoto(Boolean.parseBoolean(request.getParameter("trabajaRemoto")));
        postulacion.setPersonaReferencia(request.getParameter("personaReferencia"));
        postulacion.setTelefonoReferencia(request.getParameter("telefonoReferencia"));
        postulacion.setTiempoTemporal(Integer.parseInt(request.getParameter("tiempoTemporal")));
        postulacion.setPostulacionEstadoIdPostulacionEstado(Integer.parseInt(request.getParameter("postulacionEstadoIdPostulacionEstado")));
        postulacion.setUsuariosId(Integer.parseInt(request.getParameter("usuariosId")));
        postulacion.setTieneMascotas(request.getParameter("tieneMascotas"));
        postulacion.setNombre(request.getParameter("nombre"));
        postulacion.setApellido(request.getParameter("apellido"));
        postulacion.setEdad(request.getParameter("edad"));
        postulacion.setGenero(request.getParameter("genero"));
        postulacion.setCelular(request.getParameter("celular"));
        postulacion.setDireccion(request.getParameter("direccion"));
        postulacion.setDistritoIdDistrito(Integer.parseInt(request.getParameter("distritoIdDistrito")));
        postulacion.setVisitaInopinada(request.getParameter("visitaInopinada"));
        postulacion.setFechaInopinada(request.getParameter("fechaInopinada"));
        postulacion.setHoraInopinada(request.getParameter("horaInopinada"));
        postulacion.setMotivoRechazo(request.getParameter("motivoRechazo"));
        postulacion.setMascotasIdMascotas(Integer.parseInt(request.getParameter("mascotasIdMascotas")));

        postulacionDAO.updatePostulacion(postulacion);
        response.sendRedirect("postulaciones?action=list");
    }

    private void deletePostulacion(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        postulacionDAO.deletePostulacion(id);
        response.sendRedirect("postulaciones?action=list");
    }
}
