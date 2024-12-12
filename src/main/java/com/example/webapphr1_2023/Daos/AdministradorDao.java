package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.*;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
    public List<String> getListaDeAlbergues() {
        List<String> albergues = new ArrayList<>();
        String sql = "SELECT Nombre_albergue FROM usuarios WHERE Rol_idRol = 2"; // Rol 2 identifica a los albergues

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                albergues.add(rs.getString("Nombre_albergue"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return albergues;
    }
}