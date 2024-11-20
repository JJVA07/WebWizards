package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.CoordinadorDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "CoordinadorServlet", urlPatterns = {"/CoordinadorServlet"})
@MultipartConfig
public class CoordinadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        CoordinadorDao coordinadorDao = new CoordinadorDao();

        switch (action) {
            case "cuenta":
                // Obtener el ID dinámicamente
                int coordinadorid=3;
                try {
                    coordinadorid = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException e) {
                    // Manejar error si el ID no es válido
                    coordinadorid = 0;
                }

                // Obtener datos del usuario
                Usuarios coordinador = coordinadorDao.micuenta(coordinadorid);

                if (coordinador != null) {
                    request.setAttribute("coordinador", coordinador);
                } else {
                    request.setAttribute("error", "No se encontró información del coordinador con ID " + coordinadorid);
                }

                vista = "/Coordinador/Mi_cuenta.jsp";
                break;

            case "pagPrincipal":
                vista = "/Coordinador/index_coordinador.jsp";
                break;

            default:
                vista = "/Coordinador/index_coordinador.jsp";
                break;
        }

        // Redirección centralizada
        RequestDispatcher rd = request.getRequestDispatcher(vista);
        rd.forward(request, response);
    }
}
