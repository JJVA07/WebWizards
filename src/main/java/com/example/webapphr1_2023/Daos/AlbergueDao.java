package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Distrito;
import com.example.webapphr1_2023.Beans.Usuarios;
import java.sql.*;

public class AlbergueDao extends DaoBase {

    public Usuarios obtenerAlbergue(int id) {
        Usuarios albergue = null;

        String sql = "SELECT " +
                "    u.Nombre_albergue AS NombreDelAlbergue, " +
                "    CONCAT(u.Nombre, ' ', u.Apellido) AS Encargado, " +
                "    u.Telefono, " +
                "    d.Nombre AS Distrito, " +
                "    u.Direccion, " +
                "    u.Punto_acopio_donaciones, " +
                "    u.Url_fbig AS UrlRedesSociales, " +
                "    u.Numero_donaciones AS NumeroContactoDonaciones " +
                "FROM " +
                "    Usuarios u " +
                "JOIN " +
                "    Distrito d ON u.Distrito_idDistrito = d.idDistrito " +
                "WHERE " +
                "    u.ID = ? " +
                "    AND u.Rol_idRol = 2";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, 7);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    albergue = new Usuarios();

                    // Asigna los valores obtenidos desde el ResultSet
                    albergue.setNombreAlbergue(rs.getString("NombreDelAlbergue"));
                    albergue.setNombre(rs.getString("Encargado"));
                    albergue.setTelefono(rs.getInt("Telefono"));

                    // Crear y asignar el objeto Distrito
                    //Distrito distrito = new Distrito();
                    //distrito.setNombre(rs.getString("Distrito"));
                    //albergue.setDistrito(distrito);

                    albergue.setDireccion(rs.getString("Direccion"));
                    albergue.setPuntoAcopioDonaciones(rs.getString("Punto_acopio_donaciones"));
                    albergue.setUrlFbig(rs.getString("UrlRedesSociales"));
                    albergue.setNumeroDonaciones(rs.getInt("NumeroContactoDonaciones"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return albergue;
    }
}
