package com.example.webapphr1_2023.Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.example.webapphr1_2023.Beans.Donaciones;
import com.example.webapphr1_2023.Beans.Usuarios;


public class DonacionesDao extends DaoBase {
    public List<String> obtenerTiposDonacion() {
        List<String> tiposDonacion = new ArrayList<>();
        String sql = "SELECT DISTINCT Tipo_donacion FROM donaciones WHERE Tipo_donacion IS NOT NULL";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                tiposDonacion.add(rs.getString("Tipo_donacion"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tiposDonacion;
    }

    public List<Donaciones> obtenerDonacionesPorUsuario(int userId) {
        List<Donaciones> donaciones = new ArrayList<>();
        String query = "SELECT d.idDonaciones, d.fecha_entrega, d.Tipo_donacion, d.Marca, " +
                "ua.Punto_acopio_donaciones AS punto_acopio, ua.Nombre_albergue AS nombre_albergue, " +
                "d.Cantidad_donacion " +
                "FROM donaciones d " +
                "JOIN usuarios ua ON d.Usuarios_albergue = ua.ID " +
                "WHERE d.Usuarios_ID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId); // El ID del usuario que realiza la donación
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Donaciones donacion = new Donaciones();
                donacion.setIdDonaciones(rs.getInt("idDonaciones")); // Asignar el ID de la donación
                donacion.setFechaEntrega(rs.getDate("fecha_entrega"));
                donacion.setTipoDonacion(rs.getString("Tipo_donacion"));
                donacion.setMarca(rs.getString("Marca"));
                donacion.setPuntoEntrega(rs.getString("punto_acopio")); // Punto de acopio del albergue receptor
                donacion.setCantidadDonacion(rs.getString("Cantidad_donacion"));

                // Puedes incluir lógica para el albergue si es necesario
                Usuarios usuarioAlbergue = new Usuarios();
                usuarioAlbergue.setNombreAlbergue(rs.getString("nombre_albergue"));
                donacion.setUsuarioAlbergue(usuarioAlbergue);

                donaciones.add(donacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return donaciones;
    }


    public Donaciones obtenerDonacionPorId(int idDonacion) {
        Donaciones donacion = null;
        String query = "SELECT d.*, ua.Nombre_albergue AS nombreAlbergue " +
                "FROM donaciones d " +
                "LEFT JOIN usuarios ua ON d.Usuarios_albergue = ua.ID " +
                "WHERE d.idDonaciones = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idDonacion); // Pasamos el ID como parámetro
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                donacion = new Donaciones();
                donacion.setIdDonaciones(rs.getInt("idDonaciones"));
                donacion.setCantidadDonacion(rs.getString("Cantidad_donacion"));
                donacion.setTipoDonacion(rs.getString("Tipo_donacion"));
                donacion.setMarca(rs.getString("Marca"));
                donacion.setPuntoEntrega(rs.getString("punto_entrega"));
                donacion.setFechaEntrega(rs.getDate("fecha_entrega"));

                // Usuario Albergue (si está relacionado)
                Usuarios usuarioAlbergue = new Usuarios();
                usuarioAlbergue.setNombreAlbergue(rs.getString("nombreAlbergue"));
                donacion.setUsuarioAlbergue(usuarioAlbergue);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return donacion;
    }


    public int obtenerIdAlberguePorNombre(String nombreAlbergue) {
        String query = "SELECT ID FROM usuarios WHERE Nombre_albergue = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, nombreAlbergue); // Establecer el nombre del albergue
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("ID"); // Retornar el ID del albergue si se encuentra
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Retornar -1 si no se encuentra el albergue
    }

    public boolean guardarDonacion(Donaciones donacion) {
        String query = "INSERT INTO donaciones (Cantidad_donacion, Tipo_donacion, Marca, punto_entrega, Usuarios_ID, Usuarios_albergue, fecha_entrega) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, donacion.getCantidadDonacion());
            stmt.setString(2, donacion.getTipoDonacion());
            stmt.setString(3, donacion.getMarca());
            stmt.setString(4, donacion.getPuntoEntrega());
            stmt.setInt(5, donacion.getUsuario().getId()); // ID del usuario que realiza la donación
            stmt.setInt(6, donacion.getUsuarioAlbergue().getId()); // ID del albergue receptor
            stmt.setDate(7, new java.sql.Date(donacion.getFechaEntrega().getTime()));

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }







}
