package com.example.webapphr1_2023.Daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

}
