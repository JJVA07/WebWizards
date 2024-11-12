package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.Publicacion;
import com.example.webapphr1_2023.Beans.Usuarios;
import com.example.webapphr1_2023.Daos.*;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@WebServlet(name ="UsuarioServlet" , value = "/Usuario")
@MultipartConfig
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") == null ? "pagPrincipal" : request.getParameter("action");
        String vista;
        RequestDispatcher rd;
        UsuariosDao userDao = new UsuariosDao();
        DonacionesDao donacionesDao = new DonacionesDao();

        switch (action) {
            case "pagPrincipal":
                vista = "/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request,response);
                break;
            case "adopcion":
                // Instancia de MascotaDao para obtener las mascotas en adopción
                MascotaDao mascotaDao = new MascotaDao();
                List<Mascotas> mascotas = mascotaDao.obtenerMascotasEnAdopcion();

                // Pasar la lista de mascotas a la vista
                request.setAttribute("mascotas", mascotas);
                request.setAttribute("paginaActiva", "adopcion");
                vista = "/Usuario_final/adopcion.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "eventos":
                int pagina = request.getParameter("pagina") == null ? 1 : Integer.parseInt(request.getParameter("pagina"));
                int offset = (pagina - 1) * 6;

                // Crear una instancia de EventosDao
                EventosDao eventosDao = new EventosDao();
                List<Eventos> eventos = eventosDao.obtenerEventosActivosPaginados(offset, 6);

                int totalEventos = eventosDao.contarEventosActivos();
                int totalPaginas = (int) Math.ceil((double) totalEventos / 6);

                request.setAttribute("eventos", eventos);
                request.setAttribute("paginaActual", pagina);
                request.setAttribute("totalPaginas", totalPaginas);


                vista = "src/main/webapp/Usuario_final/eventos.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "donar":
                String nombreAlbergue = request.getParameter("nombreAlbergue");
                if (nombreAlbergue != null) {
                    // AJAX request to get punto de acopio
                    List<String> puntosAcopio = userDao.obtenerPuntosAcopioPorAlbergue(nombreAlbergue);

                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Convertir la lista en formato JSON manualmente
                    StringBuilder json = new StringBuilder("[");
                    for (int i = 0; i < puntosAcopio.size(); i++) {
                        json.append("\"").append(puntosAcopio.get(i)).append("\"");
                        if (i < puntosAcopio.size() - 1) {
                            json.append(",");
                        }
                    }
                    json.append("]");

                    response.getWriter().write(json.toString());
                } else {
                    // Cargar la vista de donación si no se especifica "nombreAlbergue"
                    List<String> albergues = userDao.obtenerNombresAlbergues();
                    List<String> tiposDonacion = donacionesDao.obtenerTiposDonacion();

                    request.setAttribute("albergues", albergues);
                    request.setAttribute("tiposDonacion", tiposDonacion);

                    vista = "/Usuario_final/donar.jsp";
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                }
                break;
            case "detalleMascota":
                int idMascota = Integer.parseInt(request.getParameter("id"));
                MascotaDao mascotaDaoDetalles = new MascotaDao();
                Mascotas mascotaDetalles = mascotaDaoDetalles.obtenerMascotaPorId(idMascota);

                request.setAttribute("mascota", mascotaDetalles);
                vista = "/Usuario_final/formulario_adopcion.jsp";
                request.setAttribute("paginaActiva", "detalleMascota");
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
            case "formularioPerdida":
                vista = "/Usuario_final/mascotas_perdidas.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "mascostasPerdidas");
                rd.forward(request,response);
                break;
            default:
                // Acción por defecto en caso de que no haya coincidencias con las acciones especificadas
                vista = "/Usuario_final/home.jsp";
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        PublicacionDao publicacionDao = new PublicacionDao();

        switch (action) {
            case "reportarPOST":
                Publicacion publicacion = new Publicacion();
                int id_Usuario =5;
                Usuarios usuario = new Usuarios();
                usuario.setId(id_Usuario);

                String nombreMascota = request.getParameter("nombre");
                String edad = request.getParameter("edad");
                String raza = request.getParameter("raza");
                String tamano = request.getParameter("tamano");
                String distintivo = request.getParameter("distintivo");
                String nombreContacto = request.getParameter("nombre_contacto");
                String lugarPerdida = request.getParameter("lugar_perdida");
                String horaPerdida = request.getParameter("hora_perdida");
                String celularContacto = request.getParameter("celular_contacto");
                String descripcion = request.getParameter("descripcion");
                String descripcionAdicional = request.getParameter("descripcion_adicional");
                String recompensa = request.getParameter("recompensa");

                byte[] archivoImagen = obtenerImagenComoByteArray(request.getPart("imagen").getInputStream());

                publicacion.setNombre(nombreMascota);
                publicacion.setEdad(Integer.parseInt(edad));
                publicacion.setRaza(raza);
                publicacion.setTamano(tamano);
                publicacion.setDistintivo(distintivo);
                publicacion.setNombreContacto(nombreContacto);
                publicacion.setLugarPerdida(lugarPerdida);
                publicacion.setHoraPerdida(horaPerdida);
                publicacion.setTelefono(celularContacto);
                publicacion.setDescripcion(descripcion);
                publicacion.setFoto(archivoImagen);
                publicacion.setDescripcionAdicional(descripcionAdicional);
                publicacion.setRecompensa(recompensa);
                publicacion.setUsuario(usuario);
                publicacionDao.reportarMascota(publicacion);
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                break;
        }
    }
    public static byte[] obtenerImagenComoByteArray(InputStream inputStream) throws IOException {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        int nRead;
        byte[] data = new byte[1024];
        while ((nRead = inputStream.read(data, 0, data.length)) != -1) {
            buffer.write(data, 0, nRead);
        }
        buffer.flush();
        return buffer.toByteArray();
    }
}