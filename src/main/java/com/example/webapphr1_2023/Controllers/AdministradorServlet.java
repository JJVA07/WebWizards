package com.example.webapphr1_2023.Controllers;
import com.example.webapphr1_2023.Beans.*;
import com.example.webapphr1_2023.Beans.Publicacion;
import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.AdministradorDao;
import com.example.webapphr1_2023.Daos.CoordinadorDao;
import com.example.webapphr1_2023.Daos.Lista_eventosDao;
import com.example.webapphr1_2023.Daos.PublicacionDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdministradorServlet", urlPatterns = {"/AdministradorServlet"})
@MultipartConfig
public class AdministradorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Determinar la acción
        String action = request.getParameter("action") == null ? "indicadores" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        // Instancia del DAO
        AdministradorDao adm = new AdministradorDao();
        switch (action) {
            case "indicadores":
                // Obtener número de lugares habilitados
                int totalLugares = adm.getNumeroDeLugaresHabilitados();
                List<Usuarios> listaAlbergues = adm.getListaDeAlbergues();
                request.setAttribute("listaAlbergues", listaAlbergues);
                request.setAttribute("totalLugares", totalLugares);
                String albergueIdParam = request.getParameter("albergueId");
                int albergueId;

                if (albergueIdParam == null || albergueIdParam.isEmpty()) {
                    // ID predeterminado, por ejemplo, el primer albergue con donaciones.
                    albergueId = 7; // Asegúrate de colocar aquí el ID correcto.
                } else {
                    albergueId = Integer.parseInt(albergueIdParam);
                }
                List<DonacionTopDTO> topDonantes = adm.obtenerTop10Donantes();
// Obtener la lista de donaciones
                List<DonacionMesDTO> listaDonaciones = adm.obtenerDonacionesPorMes(albergueId);
                request.setAttribute("listaDonaciones", listaDonaciones);
                request.setAttribute("topDonantes", topDonantes);
                // Mascotas Perdidas vs Encontradas
                List<MascotasPerdidasEncontradasDTO> mascotasData = adm.obtenerMascotasPerdidasEncontradas();
                request.setAttribute("mascotasData", mascotasData);
                Map<String, Integer> estadisticasUsuarios = adm.obtenerEstadisticasUsuarios();

                request.setAttribute("estadisticasUsuarios", estadisticasUsuarios);
                // Redirigir a adm_indicadores.jsp
                vista = "/Administrador/adm_indicadores.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "cuenta":
                // Redirigir a adm_indicadores.jsp
                vista = "/Administrador/micuenta.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "solicitudes":
                List<Usuarios> listaSolicitudes = adm.obtenerSolicitudesAcceso();
                System.out.println("Lista de solicitudes: " + listaSolicitudes.size());
                for (Usuarios u : listaSolicitudes) {
                    System.out.println("Nombre Albergue: " + u.getNombreAlbergue());
                    System.out.println("Correo: " + u.getCorreo());
                }

                // Pasar datos como atributo
                request.setAttribute("solicitudes", listaSolicitudes);

                // Redirigir a JSP
                vista = "/Administrador/adm_solicitudes.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "crearlugares":
                // Redirigir a adm_indicadores.jsp
                vista = "/Administrador/adm_lugares.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "lugares":
                // Redirigir a adm_indicadores.jsp
                List<Lugares> listaLugares = adm.obtenerLugaresHabilitados();
                request.setAttribute("listaLugares", listaLugares);
                vista = "/Administrador/luagres_habilitados.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "crearcoordinadores":
                // Redirigir a adm_indicadores.jsp
                vista = "/Administrador/adm_coordinadores.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "coordinadores":
                // Listas de usuarios según el rolId
                int rolIdCoordinadores = 3; // Coordinadores
                int rolIdUsuarios = 1;      // Usuarios
                int rolIdAlbergues = 2;     // Albergues

                List<Usuarios> listaCoordinadores = adm.obtenerUsuariosPorRol(rolIdCoordinadores);
                List<Usuarios> listaUsuarios = adm.obtenerUsuariosPorRol(rolIdUsuarios);
                List<Usuarios> listaAlbergue = adm.obtenerUsuariosPorRol(rolIdAlbergues);

                // Enviar las listas como atributos al JSP
                request.setAttribute("listaCoordinadores", listaCoordinadores);
                request.setAttribute("listaUsuarios", listaUsuarios);
                request.setAttribute("listaAlbergues", listaAlbergue);

                // Redirigir al JSP
                vista = "/Administrador/gestion_coordinadores.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            default:
                // Página principal por defecto
                vista = "/Administrador/indicadores.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        AdministradorDao admi = new AdministradorDao();

        switch (action) {
            case "crearCoordinador":
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String dni = request.getParameter("dni");
                String telefono = request.getParameter("telefono");
                String correo = request.getParameter("correo");
                String zona = request.getParameter("zona");

                boolean success = admi.insertarCoordinador(nombre, apellido, dni, telefono, correo, zona);

                if (success) {
                    request.setAttribute("mensaje", "Coordinador creado exitosamente.");
                } else {
                    request.setAttribute("mensaje", "Error al crear coordinador. Verifique los datos.");
                }
                request.getRequestDispatcher("gestion_coordinadores.jsp").forward(request, response);
                break;

            default:
                response.sendRedirect("error.jsp");
                break;
        }
    }
}