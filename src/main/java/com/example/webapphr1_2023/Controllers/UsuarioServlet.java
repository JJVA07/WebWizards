package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Daos.UsuariosDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name ="UsuarioServlet" , value = "/Usuario")
@MultipartConfig
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        UsuariosDao userDao = new UsuariosDao();

        switch (action) {
            case "pagPrincipal":
                vista = "src/main/webapp/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "adopcion":
                vista = "src/main/webapp/Usuario_final/adopcion.jsp";
                request.setAttribute("paginaActiva", "adopcion");
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
        }
    }
}