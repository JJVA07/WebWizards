package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Distrito;
import com.example.webapphr1_2023.Beans.Usuarios;
import java.sql.*;

public class AlbergueDao extends DaoBase {

    public Usuarios obtenerAlbergue(int id) {
        Usuarios albergue = null;
        String sql = "SELECT * FROM Usuario WHERE ID = ? AND rol = 2";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, id); // Usa el parámetro `id` en lugar de fijar el valor `7`

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    albergue = new Usuarios();
                    albergue.setId(rs.getInt("ID")); // Asegúrate de que el nombre de columna sea correcto
                    albergue.setNombre(rs.getString("nombre"));
                    albergue.setTelefono(rs.getInt("telefono"));
                    albergue.setDireccion(rs.getString("direccion"));
                    albergue.setPuntoAcopioDonaciones(rs.getString("punto_acopio_donaciones"));
                    albergue.setUrlFbig(rs.getString("url_redes_sociales"));
                    albergue.setNumeroDonaciones(rs.getInt("contacto_donaciones"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return albergue;
    }
}
