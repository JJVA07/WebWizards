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
                List<String> listaAlbergues = adm.getListaDeAlbergues();
                request.setAttribute("listaAlbergues", listaAlbergues);
                request.setAttribute("totalLugares", totalLugares);
                // Redirigir a adm_indicadores.jsp
                vista = "/Administrador/adm_indicadores.jsp";
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
}