package com.example.webapphr1_2023.Controllers;

import com.example.webapphr1_2023.Beans.*;
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
                    request.setAttribute("paginaActiva", "donar");
                    rd = request.getRequestDispatcher(vista);
                    rd.forward(request, response);
                }
                break;
            case "detalleMascota":
                try {
                    int idMascota = Integer.parseInt(request.getParameter("id"));
                    MascotaDao mascotaDaoDetalles = new MascotaDao();
                    Mascotas mascotaDetalles = mascotaDaoDetalles.obtenerMascotaPorId(idMascota);
                    if (mascotaDetalles == null) {
                        response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
                    }
                    else{
                        request.setAttribute("mascota", mascotaDetalles);
                        vista = "/Usuario_final/formulario_adopcion.jsp";
                        request.setAttribute("paginaActiva", "adopcion");
                        rd = request.getRequestDispatcher(vista);
                        rd.forward(request, response);
                    }
                }
                catch(NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion");
                }
                break;

            case "formularioPerdida":
                vista = "/Usuario_final/mascotas_perdidas.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "mascotas_perdidas");
                rd.forward(request,response);
                break;
            case "formularioDenuncia":
                vista = "/Usuario_final/denuncias.jsp";
                rd = request.getRequestDispatcher(vista);
                request.setAttribute("paginaActiva", "denuncias");
                rd.forward(request,response);
                break;

            case "mostrarDonaciones":
                int userId = 1; // Valor estático para userId
                List<Donaciones> donaciones = donacionesDao.obtenerDonacionesPorUsuario(userId);
                request.setAttribute("donaciones", donaciones);

                // Ruta actualizada para el archivo mis_donaciones.jsp
                vista = "/Usuario_final/mis_donaciones.jsp";
                request.setAttribute("paginaActiva", "mis_donaciones");
                rd = request.getRequestDispatcher(vista);
                rd.forward(request, response);
                break;

            case "detalleDonacion":
                Donaciones donacion = donacionesDao.vistaDetallesDonacionPorUsuarioFijo();
                request.setAttribute("donacion", donacion);

                rd = request.getRequestDispatcher("/Usuario_final/donacion_detalle.jsp");
                rd.forward(request, response);
                break;
            case "miCuenta":
                int idUsuario = 5; // Aquí especificas el ID del usuario
                Usuarios usuario = userDao.obtenerUsuarioPorId(idUsuario);
                request.setAttribute("usuario", usuario);
                rd = request.getRequestDispatcher("/Usuario_final/mi_cuenta.jsp");
                rd.forward(request, response);
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
        PostulacionDao postulacionDao = new PostulacionDao();
        Usuarios usuario = new Usuarios();
        int id_Usuario =5;

        switch (action) {
            case "reportarPOST":
                Publicacion publicacion = new Publicacion();


                usuario.setId(id_Usuario);


                String nombreMascota = request.getParameter("nombre");
                if (nombreMascota.trim().isEmpty() || nombreMascota == null || nombreMascota.trim().isBlank()){
                    System.out.println("Error, se ha enviado un nombre vacío ");
                }
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
            case "denunciaPost":
                Publicacion denuncia = new Publicacion();


                usuario.setId(id_Usuario);

                String nombreMaltratador = request.getParameter(("nombre_maltratador"));
                String tipoMaltrato = request.getParameter(("tipo_maltrato"));
                String tamanoMascota = request.getParameter(("tamano_mascota"));
                String razaMascota = request.getParameter(("raza_mascota"));
                String direccionMaltrato = request.getParameter(("direccion_maltrato"));
                Boolean denunciaPolicial = Boolean.valueOf(request.getParameter(("denuncia_policial")));
                String informacionExtra = request.getParameter(("informacion_extra"));

                byte[] archivoAdjunto = obtenerImagenComoByteArray(request.getPart("archivo").getInputStream());

                denuncia.setNombreMaltratador(nombreMaltratador);
                denuncia.setTipoMaltrato(tipoMaltrato);
                denuncia.setTamano(tamanoMascota);
                denuncia.setRaza(razaMascota);
                denuncia.setDireccionMaltrato(direccionMaltrato);
                denuncia.setDenunciaPolicial(denunciaPolicial);
                denuncia.setDescripcion(informacionExtra);
                denuncia.setFoto(archivoAdjunto);
                denuncia.setUsuario(usuario);


                publicacionDao.denunciarMaltrato(denuncia);
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misPublicaciones");
                break;
            case "adoptarMascota":
                Postulacion postulacion = new Postulacion();

                usuario.setId(id_Usuario);

                // Obtener el idMascota del formulario
                String idMascotaParam = request.getParameter("idMascota");
                if (idMascotaParam != null && !idMascotaParam.isEmpty()) {
                    int idMascota = Integer.parseInt(idMascotaParam);
                    Mascotas mascota = new Mascotas();
                    mascota.setIdMascotas(idMascota);
                    postulacion.setMascota(mascota);
                } else {
                    // Manejar el caso cuando idMascota no está presente o es inválido
                    response.sendRedirect(request.getContextPath() + "/Usuario?action=adopcion"); // o la acción que prefieras
                    return;
                }



                String Nombre = request.getParameter(("Nombre"));
                String Apellido = request.getParameter(("Apellido"));
                String Genero = request.getParameter(("Genero"));
                String Edad = request.getParameter(("Edad"));
                String Direccion = request.getParameter(("Direccion"));
                String metraje_vivienda = request.getParameter(("metraje_vivienda"));
                String cantidad_cuartos = request.getParameter(("cantidad_cuartos"));
                String celular = request.getParameter(("celular"));
                String telefono_referencia = request.getParameter(("telefono_referencia"));
                String vive_con_dependientes = request.getParameter(("vive_con_dependientes"));
                String trabaja_remoto = request.getParameter(("trabaja_remoto"));
                String Tiene_mascotas = request.getParameter(("Tiene_mascotas"));
                String tiene_hijos = request.getParameter(("tiene_hijos"));

                postulacion.setNombre(Nombre);
                postulacion.setApellido(Apellido);
                postulacion.setGenero(Genero);
                postulacion.setEdad(Edad);
                postulacion.setDireccion(Direccion);
                postulacion.setMetrajeVivienda(Double.valueOf(metraje_vivienda));
                postulacion.setCantidadCuartos(Integer.valueOf(cantidad_cuartos));
                postulacion.setCelular(celular);
                postulacion.setTelefonoReferencia(telefono_referencia);
                postulacion.setViveConDependientes(Boolean.valueOf(vive_con_dependientes));
                postulacion.setTrabajaRemoto(Boolean.valueOf(trabaja_remoto));
                postulacion.setTieneMascotas(Boolean.valueOf(Tiene_mascotas));
                postulacion.setTieneHijos(Boolean.valueOf(tiene_hijos));
                postulacion.setUsuario(usuario);


                postulacionDao.postularAdopcion(postulacion);
                response.sendRedirect(request.getContextPath() + "/Usuario?action=misSolicitudes");
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