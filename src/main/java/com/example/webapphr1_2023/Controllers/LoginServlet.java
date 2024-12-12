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
                UsuariosDao usuariosDao = new UsuariosDao();

                if (usuario != null && usuario.getId() != 0) {
                    int a = usuario.getRol().getIdRol();
                    switch (a) {
                        case 1:
                            response.sendRedirect(request.getContextPath() + "/UsuarioServlet?action=null");
                        case 2:
                            response.sendRedirect(request.getContextPath() + "/AlbergueServlet?action=null");
                        case 3:
                            response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=null");
                        case 4:
                            response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=null");
                            break;


                    }

                } else {
                    view = request.getRequestDispatcher("/Usuario_final/inicio_sesion.jsp");
                    view.forward(request, response);
                }
                break;
            case "logout":
                HttpSession session = request.getSession();
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/LoginServlet?action=loginform");
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
            session.setMaxInactiveInterval(10 * 60); // 10 minutos de sesión

            int a = usuarios.getRol().getIdRol();

            if (!response.isCommitted()) { // Verificar que la respuesta no esté comprometida
                switch (a) {
                    case 1:
                        response.sendRedirect(request.getContextPath() + "/UsuarioServlet?action=null");
                        break;
                    case 2:
                        response.sendRedirect(request.getContextPath() + "/AlbergueServlet?action=null");
                        break;
                    case 3:
                        response.sendRedirect(request.getContextPath() + "/CoordinadorServlet?action=null");
                        break;
                    case 4:
                        response.sendRedirect(request.getContextPath() + "/AdministradorServlet?action=null");
                        break;
                    default:
                        response.sendRedirect(request.getContextPath() + "/LoginServlet?error");
                        break;
                }
            }
        } else {
            if (!response.isCommitted()) {
                response.sendRedirect(request.getContextPath() + "/LoginServlet?error");
            }
        }
    }
}


