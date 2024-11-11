package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Daos.DonacionesDao;
import com.example.webapphr1_2023.Daos.EventosDao;
import com.example.webapphr1_2023.Daos.MascotaDao;
import com.example.webapphr1_2023.Daos.UsuariosDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
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

        switch (action) {
            case "pagPrincipal":
                vista = "/Usuario_final/home.jsp";
                break;

            case "adopcion":
                // Instancia de MascotaDao para obtener las mascotas en adopción
                MascotaDao mascotaDao = new MascotaDao();
                List<Mascotas> mascotas = mascotaDao.obtenerMascotasEnAdopcion();

                // Pasar la lista de mascotas a la vista
                request.setAttribute("mascotas", mascotas);
                request.setAttribute("paginaActiva", "adopcion");
                vista = "/Usuario_final/adopcion.jsp";
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

                vista = "/Usuario_final/eventos.jsp";
                break;

            case "detallesEvento":
                int idEvento = Integer.parseInt(request.getParameter("idEvento"));
                eventosDao = new EventosDao();
                Eventos evento = eventosDao.obtenerDetallesEvento(idEvento);

                request.setAttribute("evento", evento);
                vista = "/Usuario_final/evento_detalles.jsp";
                break;

            case "donar":
                // Obtener los albergues y tipos de donación desde la base de datos
                List<String> albergues = userDao.obtenerNombresAlbergues();
                List<String> tiposDonacion = donacionesDao.obtenerTiposDonacion();

                // Pasar los datos al JSP
                request.setAttribute("albergues", albergues);
                request.setAttribute("tiposDonacion", tiposDonacion);

                vista = "/Usuario_final/donar.jsp";
                break;

            default:
                // Acción por defecto en caso de que no haya coincidencias con las acciones especificadas
                vista = "/Usuario_final/home.jsp";
                break;
        }

        rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }
}
