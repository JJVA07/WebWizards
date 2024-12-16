package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdministradorDao extends DaoBase{
    public int getNumeroDeLugaresHabilitados() {
        String sql = "SELECT COUNT(*) FROM lugares"; // Contamos solo los habilitados
        int totalLugares = 0;

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                totalLugares = rs.getInt(1); // Obtenemos el resultado de la consulta
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return totalLugares;
    }
    public List<Usuarios> getListaDeAlbergues() {
        List<Usuarios> albergues = new ArrayList<>();
        String sql = "SELECT ID, Nombre_albergue FROM usuarios WHERE Rol_idRol = 2"; // Rol 2 identifica a los albergues

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getInt("ID")); // Setea el ID
                usuario.setNombreAlbergue(rs.getString("Nombre_albergue")); // Setea el nombre del albergue
                albergues.add(usuario); // Agrega el objeto a la lista
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return albergues; // Devuelve la lista completa
    }

    public List<DonacionMesDTO> obtenerDonacionesPorMes(int albergueId) {
        List<DonacionMesDTO> lista = new ArrayList<>();

        String sql = "SELECT DATE_FORMAT(Fecha_Donacion, '%M') AS mes, COUNT(*) AS cantidad " +
                "FROM donaciones d " +
                "JOIN donacion_estado de ON d.Donacion_estado_idDonacion_estado = de.idDonacion_estado " +
                "WHERE d.Usuarios_albergue = ? AND de.Donacion_estado = 'Donado' " +
                "AND Fecha_Donacion >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH) " +
                "GROUP BY MONTH(Fecha_Donacion), DATE_FORMAT(Fecha_Donacion, '%M') " +
                "ORDER BY MONTH(Fecha_Donacion);";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, albergueId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                String mes = rs.getString("mes");
                int cantidad = rs.getInt("cantidad");
                lista.add(new DonacionMesDTO(mes, cantidad));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
    public List<Usuarios> obtenerSolicitudesAcceso() {
        List<Usuarios> solicitudes = new ArrayList<>();
        String sql = "SELECT ID, Nombre_albergue, Correo, Fecha_registro, Url_fbig " +
                "FROM usuarios " +
                "WHERE Rol_idRol = 2 AND Estado_usuario_idEstado_usuario = 3 " +
                "ORDER BY Fecha_registro ASC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getInt("ID"));
                usuario.setNombreAlbergue(rs.getString("Nombre_albergue"));
                usuario.setCorreo(rs.getString("Correo"));
                usuario.setFechaRegistro(rs.getString("Fecha_registro"));
                usuario.setUrlFbig(rs.getString("Url_fbig"));

                solicitudes.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return solicitudes;
    }
    public List<Lugares> obtenerLugaresHabilitados() {
        List<Lugares> listaLugares = new ArrayList<>();
        String sql = "SELECT * FROM lugares";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Lugares lugar = new Lugares();
                lugar.setNombreLugar(rs.getString("Nombre_Lugar"));
                lugar.setDireccion(rs.getString("Direccion"));
                lugar.setAforo(rs.getInt("Aforo"));
                lugar.setIdLugar(rs.getInt("idLugar"));
                listaLugares.add(lugar);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaLugares;
    }
    public List<Usuarios> obtenerUsuariosPorRol(int rolId) {
        List<Usuarios> listaUsuarios = new ArrayList<>();
        String sql = "SELECT u.ID, u.Nombre, u.Apellido, u.DNI, u.Telefono, u.Correo, " +
                "u.Nombre_albergue, z.Nombre_Zona " +
                "FROM usuarios u " +
                "LEFT JOIN distrito d ON u.Distrito_idDistrito = d.idDistrito " +
                "LEFT JOIN zona z ON d.Zona_idZona = z.idZona " +
                "WHERE u.Rol_idRol = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, rolId);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Usuarios usuario = new Usuarios();
                usuario.setId(rs.getInt("ID"));
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellido"));
                usuario.setDni(rs.getString("DNI"));
                usuario.setTelefono(rs.getInt("Telefono"));
                usuario.setCorreo(rs.getString("Correo"));
                usuario.setNombreAlbergue(rs.getString("Nombre_albergue"));
                usuario.setZonaAsignada(rs.getString("Nombre_Zona"));

                listaUsuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaUsuarios;
    }
    public List<DonacionTopDTO> obtenerTop10Donantes() {
        List<DonacionTopDTO> topDonantes = new ArrayList<>();
        String sql = "SELECT u.Nombre AS nombreUsuario, COUNT(d.idDonaciones) AS cantidadDonaciones " +
                "FROM donaciones d " +
                "JOIN usuarios u ON d.Usuarios_ID = u.ID " +
                "JOIN donacion_estado de ON d.Donacion_estado_idDonacion_estado = de.idDonacion_estado " +
                "WHERE u.Rol_idRol = 1 AND de.Donacion_estado = 'Donado' " +
                "GROUP BY u.ID, u.Nombre " +
                "ORDER BY cantidadDonaciones DESC " +
                "LIMIT 10";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String nombreUsuario = rs.getString("nombreUsuario");
                int cantidadDonaciones = rs.getInt("cantidadDonaciones");

                // Agregar a la lista usando un DTO
                topDonantes.add(new DonacionTopDTO(nombreUsuario, cantidadDonaciones));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topDonantes;
    }
    public List<MascotasPerdidasEncontradasDTO> obtenerMascotasPerdidasEncontradas() {
        List<MascotasPerdidasEncontradasDTO> lista = new ArrayList<>();
        String sql = "SELECT " +
                "    'Últimos 3 Meses' AS periodo, " +
                "    SUM(CASE WHEN Publicacion_estado_idPublicacion_estado = 1 THEN 1 ELSE 0 END) AS mascotasPerdidas, " +
                "    SUM(CASE WHEN Publicacion_estado_idPublicacion_estado = 2 THEN 1 ELSE 0 END) AS mascotasEncontradas " +
                "FROM publicacion " +
                "WHERE Tipo_publicacion_Tipo_publicacion = 1 " +
                "  AND Fecha_publicacion >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH) " +
                "UNION ALL " +
                "SELECT " +
                "    'Anual' AS periodo, " +
                "    SUM(CASE WHEN Publicacion_estado_idPublicacion_estado = 1 THEN 1 ELSE 0 END) AS mascotasPerdidas, " +
                "    SUM(CASE WHEN Publicacion_estado_idPublicacion_estado = 2 THEN 1 ELSE 0 END) AS mascotasEncontradas " +
                "FROM publicacion " +
                "WHERE Tipo_publicacion_Tipo_publicacion = 1 " +
                "  AND YEAR(Fecha_publicacion) = YEAR(CURDATE());";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                String periodo = rs.getString("periodo");
                int mascotasPerdidas = rs.getInt("mascotasPerdidas");
                int mascotasEncontradas = rs.getInt("mascotasEncontradas");

                MascotasPerdidasEncontradasDTO dto = new MascotasPerdidasEncontradasDTO(periodo, mascotasPerdidas, mascotasEncontradas);
                lista.add(dto);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }
    public Map<String, Integer> obtenerEstadisticasUsuarios() {
        Map<String, Integer> estadisticasUsuarios = new HashMap<>();

        String sql = "SELECT " +
                "COUNT(CASE WHEN Rol_idRol = 1 AND Estado_usuario_idEstado_usuario = 2 THEN 1 END) AS usuariosRol1Baneados, " +
                "COUNT(CASE WHEN Rol_idRol = 1 AND Estado_usuario_idEstado_usuario <> 2 THEN 1 END) AS usuariosRol1Activos, " +
                "COUNT(CASE WHEN Rol_idRol = 2 THEN 1 END) AS usuariosRolalbergue " +
                "FROM usuarios";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            if (rs.next()) {
                estadisticasUsuarios.put("usuariosRol1Baneados", rs.getInt("usuariosRol1Baneados"));
                estadisticasUsuarios.put("usuariosRol1Activos", rs.getInt("usuariosRol1Activos"));
                estadisticasUsuarios.put("usuariosRolalbergue", rs.getInt("usuariosRolalbergue"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return estadisticasUsuarios;
    }
    public boolean insertarCoordinador(String nombre, String apellido, String dni, String telefono, String correo, String nombreZona) {
        String getZonaIdQuery = "SELECT idZona FROM zona z JOIN distrito d ON z.idZona = d.Zona_idZona " +
                "WHERE d.idDistrito = (SELECT Distrito_idDistrito FROM usuarios WHERE DNI = ? LIMIT 1) AND z.Nombre_Zona = ?";
        String insertUserQuery = "INSERT INTO usuarios (Nombre, Apellido, DNI, Telefono, Correo, Distrito_idDistrito, Rol_idRol, Estado_usuario_idEstado_usuario, Fecha_registro) " +
                "VALUES (?, ?, ?, ?, ?, ?, 3, 1, CURRENT_TIMESTAMP)";
        Connection conn = null;
        PreparedStatement psZona = null;
        PreparedStatement psInsert = null;
        ResultSet rs = null;

        try {
            conn = this.getConnection();
            conn.setAutoCommit(false); // Inicia una transacción

            // 1. Obtener el idZona relacionado
            psZona = conn.prepareStatement(getZonaIdQuery);
            psZona.setString(1, dni);
            psZona.setString(2, nombreZona);
            rs = psZona.executeQuery();
            int idZona = 0;
            if (rs.next()) {
                idZona = rs.getInt("idZona");
            } else {
                return false; // Si no se encuentra la zona, se aborta la inserción
            }

            // 2. Insertar al nuevo coordinador con fecha actual
            psInsert = conn.prepareStatement(insertUserQuery);
            psInsert.setString(1, nombre);
            psInsert.setString(2, apellido);
            psInsert.setString(3, dni);
            psInsert.setString(4, telefono);
            psInsert.setString(5, correo);
            psInsert.setInt(6, idZona);

            int rowsInserted = psInsert.executeUpdate();
            conn.commit();
            return rowsInserted > 0;

        } catch (SQLException e) {
            if (conn != null) {
                try {
                    conn.rollback();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            e.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (psZona != null) psZona.close();
                if (psInsert != null) psInsert.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }


}
