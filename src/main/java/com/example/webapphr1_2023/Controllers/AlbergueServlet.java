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
import java.util.List;
 
@WebServlet(name= "AlbergueServlet", urlPatterns = {"/AlbergueServlet"})
public class AlbergueServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String idParam = request.getParameter("ID");
        int id = 0;

        try {
            id = Integer.parseInt(idParam); // Convierte el parámetro a entero
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Redirige a una página de error si el ID no es válido
            return;
        }
        AlbergueDao albergueDao = new AlbergueDao();
        Usuarios albergue = albergueDao.obtenerAlbergue(id);

        if (albergue != null) {
            // Si el albergue existe, pasa el objeto `albergue` a la página JSP
            request.setAttribute("albergue", albergue);
            RequestDispatcher dispatcher = request.getRequestDispatcher("albergue/detalleAlbergue.jsp");
            dispatcher.forward(request, response);
        } else {
            // Si no se encontró el albergue, redirige a una página de error
            response.sendRedirect("error.jsp");
        }
    }

}
