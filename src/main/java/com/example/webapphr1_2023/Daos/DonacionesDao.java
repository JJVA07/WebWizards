package com.example.webapphr1_2023.Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.example.webapphr1_2023.Beans.Donaciones;


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
        String query = "SELECT fecha_entrega, Tipo_donacion, Marca, punto_entrega, Cantidad_donacion " +
                "FROM donaciones " +
                "WHERE Usuarios_ID = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Donaciones donacion = new Donaciones();
                donacion.setFechaEntrega(rs.getDate("fecha_entrega"));
                donacion.setTipoDonacion(rs.getString("Tipo_donacion"));
                donacion.setMarca(rs.getString("Marca"));
                donacion.setPuntoEntrega(rs.getString("punto_entrega")); // Asigna el valor de punto_entrega
                donacion.setCantidadDonacion(rs.getString("Cantidad_donacion"));

                donaciones.add(donacion);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return donaciones;
    }

    public Donaciones vistaDetallesDonacionPorUsuarioFijo() {
        Donaciones donacion = null;
        String query = "SELECT fecha_entrega, Tipo_donacion, Marca, punto_entrega, Cantidad_donacion " +
                "FROM donaciones " +
                "WHERE Usuarios_ID = 1"; // Filtro fijo por Usuarios_ID = 1

        try (Connection conn = this.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                donacion = new Donaciones();
                donacion.setFechaEntrega(rs.getDate("fecha_entrega"));
                donacion.setTipoDonacion(rs.getString("Tipo_donacion"));
                donacion.setMarca(rs.getString("Marca"));
                donacion.setPuntoEntrega(rs.getString("punto_entrega"));
                donacion.setCantidadDonacion(rs.getString("Cantidad_donacion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return donacion;
    }




}
