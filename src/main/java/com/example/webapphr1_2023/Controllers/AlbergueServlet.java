package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.AlbergueDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AlbergueServlet", urlPatterns = {"/AlbergueServlet"})
@MultipartConfig
public class AlbergueServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        AlbergueDao albergueDao = new AlbergueDao();

        switch (action) {
            case "pagPrincipal":
                // Redirige a la página principal del albergue
                vista = "/Albergue/Albergue.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "cuenta":
                // Obtener el albergue específico (por ejemplo, con ID 7)
                int albergueId = 7; // Puedes cambiar el ID según sea necesario o hacerlo dinámico
                Usuarios albergue = albergueDao.obtenerAlbergue(albergueId);

                // Si se obtuvo la información del albergue, se pasa como atributo a la vista
                if (albergue != null) {
                    request.setAttribute("albergue", albergue);
                }

                // Redirige a la vista `mi_cuenta.jsp` para mostrar la información
                vista = "/Albergue/mi_cuenta.jsp";
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
}
