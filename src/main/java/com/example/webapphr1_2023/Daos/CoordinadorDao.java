package com.example.webapphr1_2023.Daos;
import com.example.webapphr1_2023.Beans.*;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CoordinadorDao extends DaoBase{

    public Usuarios micuenta(int id) {
        Usuarios coordinador = null;
        String sql = "SELECT Nombre, Apellido, Edad, Telefono, Correo FROM usuarios WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    coordinador = new Usuarios();
                    coordinador.setNombre(rs.getString("Nombre"));
                    coordinador.setApellido(rs.getString("Apellido"));
                    coordinador.setEdad(rs.getInt("Edad"));
                    coordinador.setTelefono(rs.getInt("Telefono"));
                    coordinador.setCorreo(rs.getString("Correo"));
                } else {
                    System.out.println("No se encontró un usuario con el ID: " + id); // Debug
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return coordinador;
    }

    public List<Publicacion> mascotasperdidas() {
        List<Publicacion> listaPublicaciones = new ArrayList<>();
        String sql = "SELECT p.idPublicacion, p.Nombre, p.Edad, p.Raza, p.Tamano, p.Telefono " +
                "FROM publicacion p " +
                "INNER JOIN usuarios u ON p.Usuarios_ID = u.ID " +
                "WHERE p.Tipo_publicacion_Tipo_publicacion = 1 " +
                "AND p.Publicacion_estado_idPublicacion_estado = 3 " +
                "AND u.Zona_idZona = 3";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Publicacion publicacion = new Publicacion();
                publicacion.setIdPublicacion(rs.getInt("idPublicacion")); // Aseguramos que este campo se asigne
                publicacion.setNombre(rs.getString("Nombre"));
                publicacion.setEdad(rs.getInt("Edad"));
                publicacion.setRaza(rs.getString("Raza"));
                publicacion.setTamano(rs.getString("Tamano"));
                publicacion.setTelefono(rs.getString("Telefono"));

                System.out.println("Publicación encontrada: " + publicacion.getNombre()); // Debug
                listaPublicaciones.add(publicacion);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaPublicaciones;
    }

    public List<Publicacion> mascotasaprobadas() {
        List<Publicacion> listaPublicaciones = new ArrayList<>();
        String sql = "SELECT p.idPublicacion, p.Nombre, p.Edad, p.Raza, p.Tamano, p.Telefono " +
                "FROM publicacion p " +
                "INNER JOIN usuarios u ON p.Usuarios_ID = u.ID " +
                "WHERE p.Tipo_publicacion_Tipo_publicacion = 1 " +
                "AND p.Publicacion_estado_idPublicacion_estado = 1 " +
                "AND u.Zona_idZona = 3";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Publicacion publicacion = new Publicacion();
                publicacion.setIdPublicacion(rs.getInt("idPublicacion")); // ID de la publicación
                publicacion.setNombre(rs.getString("Nombre"));           // Nombre de la mascota
                publicacion.setEdad(rs.getInt("Edad"));                 // Edad de la mascota
                publicacion.setRaza(rs.getString("Raza"));              // Raza
                publicacion.setTamano(rs.getString("Tamano"));          // Tamaño
                publicacion.setTelefono(rs.getString("Telefono"));      // Contacto

                listaPublicaciones.add(publicacion); // Agregar la publicación a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir cualquier error en la consola
        }

        return listaPublicaciones; // Retornar la lista de publicaciones
    }

    public List<Postulacion> solicitudesagendadas() {
        List<Postulacion> listaSolicitudes = new ArrayList<>();
        String sql = "SELECT " +
                "    p.idPostulacion, " +
                "    p.Nombre AS Nombre, " +
                "    p.Apellido AS Apellido, " +
                "    p.Edad AS Edad, " +
                "    p.Direccion AS Dirección, " +
                "    d.nombre AS Distrito, " +
                "    p.Celular AS Contacto " +
                "FROM " +
                "    postulacion p " +
                "LEFT JOIN " +
                "    distrito d ON p.Distrito_idDistrito = d.idDistrito " +
                "WHERE " +
                "    p.Postulacion_estado_idPostulacion_estado = 3";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Postulacion postulacion = new Postulacion();
                postulacion.setIdPostulacion(rs.getInt("idPostulacion"));      // ID de la postulación
                postulacion.setNombre(rs.getString("Nombre"));                 // Nombre del postulante
                postulacion.setApellido(rs.getString("Apellido"));             // Apellido del postulante
                postulacion.setEdad(rs.getString("Edad"));                     // Edad del postulante
                postulacion.setDireccion(rs.getString("Dirección"));           // Dirección del postulante
                postulacion.setCelular(rs.getString("Contacto"));              // Contacto del postulante

                // Relación con Distrito
                Distrito distrito = new Distrito();
                distrito.setNombre(rs.getString("Distrito")); // Nombre del distrito
                postulacion.setDistrito(distrito);            // Asignar distrito a la postulación

                listaSolicitudes.add(postulacion); // Agregar a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir cualquier error
        }

        return listaSolicitudes; // Devolver la lista de solicitudes
    }

    public List<Postulacion> solicitudehogares() {
        List<Postulacion> listaSolicitudeshogar = new ArrayList<>();
        String sql = "SELECT " +
                "    p.idPostulacion, " +
                "    p.Nombre AS Nombre, " +
                "    p.Apellido AS Apellido, " +
                "    p.Edad AS Edad, " +
                "    p.Direccion AS Dirección, " +
                "    d.nombre AS Distrito, " +
                "    p.Celular AS Contacto " +
                "FROM " +
                "    postulacion p " +
                "LEFT JOIN " +
                "    distrito d ON p.Distrito_idDistrito = d.idDistrito " +
                "WHERE " +
                "    p.Postulacion_estado_idPostulacion_estado = 4";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Postulacion postulacion = new Postulacion();
                postulacion.setIdPostulacion(rs.getInt("idPostulacion"));      // ID de la postulación
                postulacion.setNombre(rs.getString("Nombre"));                 // Nombre del postulante
                postulacion.setApellido(rs.getString("Apellido"));             // Apellido del postulante
                postulacion.setEdad(rs.getString("Edad"));                     // Edad del postulante
                postulacion.setDireccion(rs.getString("Dirección"));           // Dirección del postulante
                postulacion.setCelular(rs.getString("Contacto"));              // Contacto del postulante

                // Relación con Distrito
                Distrito distrito = new Distrito();
                distrito.setNombre(rs.getString("Distrito")); // Nombre del distrito
                postulacion.setDistrito(distrito);            // Asignar distrito a la postulación

                listaSolicitudeshogar.add(postulacion); // Agregar a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Imprimir cualquier error
        }

        return listaSolicitudeshogar; // Devolver la lista de solicitudes
    }

    public List<Postulacion> solicitudehogaresaprobados() {
        List<Postulacion> listaSolicitudeshogaraprobados = new ArrayList<>();
        String sql = "SELECT " +
                "    p.idPostulacion, " +
                "    p.Nombre AS Nombre, " +
                "    p.Apellido AS Apellido, " +
                "    p.Edad AS Edad, " +
                "    p.Direccion AS Dirección, " +
                "    d.nombre AS Distrito, " +
                "    p.Celular AS Contacto " +
                "FROM " +
                "    postulacion p " +
                "LEFT JOIN " +
                "    distrito d ON p.Distrito_idDistrito = d.idDistrito " +
                "WHERE " +
                "    p.Postulacion_estado_idPostulacion_estado = 1";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Postulacion postulacion = new Postulacion();
                postulacion.setIdPostulacion(rs.getInt("idPostulacion"));      // ID de la postulación
                postulacion.setNombre(rs.getString("Nombre"));                 // Nombre del postulante
                postulacion.setApellido(rs.getString("Apellido"));             // Apellido del postulante
                postulacion.setEdad(rs.getString("Edad"));                     // Edad del postulante
                postulacion.setDireccion(rs.getString("Dirección"));           // Dirección del postulante
                postulacion.setCelular(rs.getString("Contacto"));              // Contacto del postulante

                // Relación con Distrito
                Distrito distrito = new Distrito();
                distrito.setNombre(rs.getString("Distrito")); // Nombre del distrito
                postulacion.setDistrito(distrito);            // Asignar distrito a la postulación

                listaSolicitudeshogaraprobados.add(postulacion); // Agregar a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaSolicitudeshogaraprobados;
    }

    public Publicacion obtenerDetallesPublicacion(int idPublicacion) {
        Publicacion publicacion = null;
        String sql = "SELECT " +
                "    p.idPublicacion, " +
                "    p.Nombre, " +
                "    p.Edad, " +
                "    p.Raza, " +
                "    p.Tamano AS Tamaño, " +
                "    p.Telefono AS Contacto, " +
                "    p.Distintivo, " +
                "    p.Lugar_perdida AS Lugar, " +
                "    p.Hora_perdida AS Hora, " +
                "    p.Nombre_contacto AS Contacto_Nombre, " +
                "    p.Recompensa, " +
                "    p.Foto " + // Incluir el campo Foto
                "FROM " +
                "    publicacion p " +
                "INNER JOIN " +
                "    usuarios u ON p.Usuarios_ID = u.ID " +
                "WHERE " +
                "    p.idPublicacion = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPublicacion); // Pasar el ID como parámetro
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    publicacion = new Publicacion();
                    publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                    publicacion.setNombre(rs.getString("Nombre"));
                    publicacion.setEdad(rs.getInt("Edad"));
                    publicacion.setRaza(rs.getString("Raza"));
                    publicacion.setTamano(rs.getString("Tamaño"));
                    publicacion.setTelefono(rs.getString("Contacto"));
                    publicacion.setDistintivo(rs.getString("Distintivo"));
                    publicacion.setLugarPerdida(rs.getString("Lugar"));
                    publicacion.setHoraPerdida(rs.getString("Hora"));
                    publicacion.setNombreContacto(rs.getString("Contacto_Nombre"));
                    publicacion.setRecompensa(rs.getString("Recompensa"));

                    // Procesar el campo Foto (LONGBLOB)
                    publicacion.setFoto(rs.getBytes("Foto"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return publicacion;
    }

    public boolean eliminarPublicacion(int idPublicacion) {
        String sql = "DELETE FROM publicacion WHERE idPublicacion = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idPublicacion); // Establecer el ID de la publicación
            int filasAfectadas = pstmt.executeUpdate();
            return filasAfectadas > 0; // Retorna true si se eliminó correctamente

        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Retorna false si ocurre un error
        }
    }


    public Publicacion obtenerDetallesMascotaAprobada(int idPublicacion) {
        Publicacion publicacion = null;
        String sql = "SELECT " +
                "    p.Foto, " +
                "    p.idPublicacion, " +
                "    p.Nombre, " +
                "    p.Edad, " +
                "    p.Raza, " +
                "    p.Tamano AS Tamaño, " +
                "    p.Telefono AS Contacto, " +
                "    p.Distintivo, " +
                "    p.Lugar_perdida AS Lugar, " +
                "    p.Hora_perdida AS Hora, " +
                "    p.Nombre_contacto AS Contacto_Nombre, " +
                "    p.Recompensa " +
                "FROM " +
                "    publicacion p " +
                "INNER JOIN " +
                "    usuarios u ON p.Usuarios_ID = u.ID " +
                "WHERE " +
                "    p.Tipo_publicacion_Tipo_publicacion = 1 " +
                "    AND p.Publicacion_estado_idPublicacion_estado = 1 " +
                "    AND u.Zona_idZona = 3 " +
                "    AND p.idPublicacion = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idPublicacion); // Establece el ID de la publicación

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    publicacion = new Publicacion();
                    publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                    publicacion.setNombre(rs.getString("Nombre"));
                    publicacion.setEdad(rs.getInt("Edad"));
                    publicacion.setRaza(rs.getString("Raza"));
                    publicacion.setTamano(rs.getString("Tamaño"));
                    publicacion.setTelefono(rs.getString("Contacto"));
                    publicacion.setDistintivo(rs.getString("Distintivo"));
                    publicacion.setLugarPerdida(rs.getString("Lugar"));
                    publicacion.setHoraPerdida(rs.getString("Hora"));
                    publicacion.setNombreContacto(rs.getString("Contacto_Nombre"));
                    publicacion.setRecompensa(rs.getString("Recompensa"));
                    publicacion.setFoto(rs.getBytes("Foto")); // Obtiene la foto como array de bytes
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Maneja excepciones SQL
        }

        return publicacion;
    }

    public void actualizarComentarioCoordinador(Publicacion publicacion) {
        String sql = "UPDATE publicacion SET comentario_coordinador = ? WHERE idPublicacion = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, publicacion.getComentario_coordinador()); // Usa setString en lugar de setClob
            pstmt.setInt(2, publicacion.getIdPublicacion());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Postulacion obtenerDetallesSolicitudAgendada(int idPostulacion) {
        Postulacion postulacion = null;

        String sql = "SELECT " +
                "    p.idPostulacion, " +
                "    p.Nombre AS Nombre, " +
                "    p.Apellido AS Apellido, " +
                "    p.Edad AS Edad, " +
                "    p.Genero AS Género, " +
                "    p.Celular AS Celular, " +
                "    p.Direccion AS Dirección, " +
                "    d.nombre AS Distrito, " +
                "    p.cantidad_cuartos AS 'Cantidad de cuartos', " +
                "    p.metraje_vivienda AS 'Metraje de vivienda (m²)', " +
                "    CASE WHEN p.Tiene_mascotas = 1 THEN 'Sí' ELSE 'No' END AS 'Tiene mascotas', " +
                "    p.cantidad_mascotas AS 'Cantidad de mascotas', " +
                "    p.tipo_mascotas AS 'Tipo de mascotas', " +
                "    CASE WHEN p.tiene_hijos = 1 THEN 'Sí' ELSE 'No' END AS 'Tiene hijos', " +
                "    CASE WHEN p.vive_con_dependientes = 1 THEN 'Con dependientes' ELSE 'Solo' END AS 'Vive solo o con dependientes', " +
                "    CASE WHEN p.trabaja_remoto = 1 THEN 'Remoto' ELSE 'Presencial' END AS 'Trabaja', " +
                "    p.persona_referencia AS 'Persona de referencia', " +
                "    p.telefono_referencia AS 'Número de contacto de referencia', " +
                "    p.tiempo_temporal AS 'Tiempo de temporal (meses)', " +
                "    DATE_FORMAT(p.fecha_inicio_temporal, '%d/%m/%Y') AS 'Fecha de inicio', " +
                "    DATE_FORMAT(p.fecha_fin_temporal, '%d/%m/%Y') AS 'Fecha de fin', " +
                    "FROM postulacion p " +
                    "LEFT JOIN distrito d ON p.Distrito_idDistrito = d.idDistrito " +
                    "WHERE p.idPostulacion = ? AND p.Postulacion_estado_idPostulacion_estado = 3";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idPostulacion); // ID de la solicitud agendada como parámetro
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    postulacion = new Postulacion();
                    postulacion.setIdPostulacion(rs.getInt("idPostulacion"));
                    postulacion.setNombre(rs.getString("Nombre"));
                    postulacion.setApellido(rs.getString("Apellido"));
                    postulacion.setEdad(rs.getString("Edad"));
                    postulacion.setGenero(rs.getString("Género"));
                    postulacion.setCelular(rs.getString("Celular"));
                    postulacion.setDireccion(rs.getString("Dirección"));

                    // Relación con Distrito
                    Distrito distrito = new Distrito();
                    distrito.setNombre(rs.getString("Distrito"));
                    postulacion.setDistrito(distrito);

                    postulacion.setCantidadCuartos(rs.getInt("Cantidad de cuartos"));
                    postulacion.setMetrajeVivienda(rs.getDouble("Metraje de vivienda (m²)"));
                    postulacion.setTieneMascotas(rs.getString("Tiene mascotas").equals("Sí"));
                    postulacion.setCantidadMascotas(rs.getInt("Cantidad de mascotas"));
                    postulacion.setTipoMascotas(rs.getString("Tipo de mascotas"));
                    postulacion.setTieneHijos(rs.getString("Tiene hijos").equals("Sí"));
                    postulacion.setViveConDependientes(rs.getString("Vive solo o con dependientes").equals("Con dependientes"));
                    postulacion.setTrabajaRemoto(rs.getString("Trabaja").equals("Remoto"));
                    postulacion.setPersonaReferencia(rs.getString("Persona de referencia"));
                    postulacion.setTelefonoReferencia(rs.getString("Número de contacto de referencia"));
                    postulacion.setTiempoTemporal(rs.getInt("Tiempo de temporal (meses)"));
                    // Conversión de fechas
                    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
                    try {
                        postulacion.setFechaInicioTemporal(dateFormat.parse(rs.getString("Fecha de inicio")));
                        postulacion.setFechaFinTemporal(dateFormat.parse(rs.getString("Fecha de fin")));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return postulacion;
    }


    public boolean actualizarFechaHoraVisita(int idPostulacion, String fechaVisita, String horaVisita) {
        String sql = "UPDATE postulacion SET Fecha_inopinada = ?, Hora_inopinada = ? WHERE idPostulacion = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, fechaVisita); // Fecha de la visita
            pstmt.setString(2, horaVisita); // Hora de la visita
            pstmt.setInt(3, idPostulacion); // ID de la postulación

            int filasActualizadas = pstmt.executeUpdate();
            return filasActualizadas > 0; // Retorna true si se actualizó al menos una fila

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
