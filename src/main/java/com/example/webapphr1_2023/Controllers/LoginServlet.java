package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
@WebServlet(name ="LoginServlet" , urlPatterns = {"/LoginServlet"})
@MultipartConfig
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "loginform" : request.getParameter("action");
        RequestDispatcher view;
        switch (action) {
            case "loginform":
                Usuarios usuario = (Usuarios) request.getSession().getAttribute("usuarioSession");
                if (usuario != null && usuario.getId() != 0) {
                    response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=pagPrincipal");
                } else {
                    view = request.getRequestDispatcher("/Usuario_final/inicio_sesion.jsp");
                    view.forward(request, response);
                }
                break;
                case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath());
                break;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UsuariosDao usuariosDao = new UsuariosDao();
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        Usuarios usuarios = usuariosDao.validarUsuarioPassword(username, password);
        if (usuarios != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuarioSession", usuarios);
            session.setMaxInactiveInterval(10 * 60); // 10 minutos
            response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=null");
        } else {
            response.sendRedirect(request.getContextPath() + "/LoginServlet?error");
        }
    }
}


