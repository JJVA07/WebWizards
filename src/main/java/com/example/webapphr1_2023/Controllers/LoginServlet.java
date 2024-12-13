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
                            response.sendRedirect(request.getContextPath() + "/Usuario?action=pagPrincipal");
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

        // Validar el usuario
        Usuarios usuario = usuariosDao.validarUsuarioPassword(username, password);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario); // Consistencia en el nombre de la sesión
            session.setMaxInactiveInterval(10 * 60); // 10 minutos de sesión

            int idRol = usuario.getRol() != null ? usuario.getRol().getIdRol() : -1; // Manejar nulos

            switch (idRol) {
                case 1:
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=pagPrincipal");
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
        } else {
            response.sendRedirect(request.getContextPath() + "/LoginServlet?error");
        }
    }
}


