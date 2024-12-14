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
    }
