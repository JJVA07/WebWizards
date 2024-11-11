package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Daos.DonacionesDao;
import com.example.webapphr1_2023.Daos.MascotaDao;
import com.example.webapphr1_2023.Daos.UsuariosDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.example.webapphr1_2023.Daos.EventosDao;
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
//            case "donar":
//                // Obtener los albergues y tipos de donación desde la base de datos
//                List<String> albergues = userDao.obtenerNombresAlbergues();
//                List<String> tiposDonacion = donacionesDao.obtenerTiposDonacion();
//
//                // Depurar valores obtenidos
//                if (albergues == null || albergues.isEmpty()) {
//                    System.out.println("No hay albergues disponibles en la base de datos.");
//                } else {
//                    System.out.println("Albergues disponibles: " + albergues);
//                }
//
//                if (tiposDonacion == null || tiposDonacion.isEmpty()) {
//                    System.out.println("No hay tipos de donación disponibles en la base de datos.");
//                } else {
//                    System.out.println("Tipos de donación disponibles: " + tiposDonacion);
//                }
//
//                // Pasar los datos al JSP
//                request.setAttribute("albergues", albergues);
//                request.setAttribute("tiposDonacion", tiposDonacion);
//
//                vista = "/Usuario_final/donar.jsp";
//                rd = request.getRequestDispatcher(vista);
//                rd.forward(request, response);
//                break;

            default:
                // Acción por defecto en caso de que no haya coincidencias con las acciones especificadas
                vista = "/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
        }
    }
}