package com.example.webapphr1_2023.Controllers;
import com.example.webapphr1_2023.Beans.*;

import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.AlbergueDao;
import com.example.webapphr1_2023.Daos.Lista_eventosDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.util.List;
import java.util.ArrayList;

@WebServlet(name = "AlbergueServlet", urlPatterns = {"/AlbergueServlet"})
@MultipartConfig
public class AlbergueServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        AlbergueDao albergueDao = new AlbergueDao();
        int albergueId = 7; // Puedes cambiar el ID según sea necesario o hacerlo dinámico


        switch (action) {
            case "pagPrincipal":
                // Redirige a la página principal del albergue
                vista = "/Albergue/Albergue.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "eventos":

                List<Eventos> eventos = albergueDao.obtenerEventosAlbergue(7);

                if (eventos != null) {
                    request.setAttribute("eventos", eventos);
                }

                System.out.println("Cantidad de eventos obtenidos: " + (eventos != null ? eventos.size() : "0"));


                // Redirige a la vista `Eventos_tabla.jsp` para mostrar los eventos
                vista = "/Albergue/Eventos_tabla.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "cuenta":
                // Obtener el albergue específico (por ejemplo, con ID 7)
                Usuarios albergue = albergueDao.obtenerAlbergue(7);
                // Si se obtuvo la información del albergue, se pasa como atributo a la vista
                if (albergue != null) {
                    request.setAttribute("albergue", albergue);
                }

                // Redirige a la vista `mi_cuenta.jsp` para mostrar la información
                vista = "/Albergue/mi_cuenta.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "temporal":
                Lista_eventosDao lista_eventosDao = new Lista_eventosDao();
                List<Mascotas> mascotasTemporales = lista_eventosDao.obtenerEventosAlbergue(7);

                // Obtener lista de mascotas temporales
                if (mascotasTemporales != null) {
                    request.setAttribute("mascotasTemporales", mascotasTemporales);
                }
                vista = "/Albergue/mascotas_temporales.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;


            case "editar":

                albergue = albergueDao.obtenerAlbergue(albergueId);

                if (albergue != null) {
                    request.setAttribute("albergue", albergue);
                }

                vista = "/Albergue/editar_informacion.jsp";
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");

        AlbergueDao albergueDao = new AlbergueDao();

        switch (action) {
            case "actualizar":
                // Lógica para actualizar un albergue existente
                try {
                    int id = Integer.parseInt(request.getParameter("id")); // ID del albergue
                    String nombreAlbergue = request.getParameter("nombre_albergue");
                    int telefono = Integer.parseInt(request.getParameter("telefono"));
                    String direccion = request.getParameter("direccion");
                    String puntoAcopioDonaciones = request.getParameter("punto_acopio_donaciones");
                    String urlFbig = request.getParameter("url_redes_sociales");
                    int numeroDonaciones = Integer.parseInt(request.getParameter("numero_contacto_donaciones"));

                    // Crear un objeto Usuarios con los datos actualizados
                    Usuarios albergue = new Usuarios();
                    albergue.setId(id); // Establecer el ID del albergue
                    albergue.setNombreAlbergue(nombreAlbergue);
                    albergue.setTelefono(telefono);
                    albergue.setDireccion(direccion);
                    albergue.setPuntoAcopioDonaciones(puntoAcopioDonaciones);
                    albergue.setUrlFbig(urlFbig);
                    albergue.setNumeroDonaciones(numeroDonaciones);

                    // Llamar al DAO para actualizar el albergue
                    albergueDao.actualizarAlbergue(albergue);

                    // Redirigir a la vista de cuenta después de actualizar
                    response.sendRedirect("AlbergueServlet?action=cuenta");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp");
                }
                break;

            default:
                // Acción por defecto si no se especifica ninguna o es inválida
                response.sendRedirect("AlbergueServlet?action=pagPrincipal");
                break;
        }
    }

}
