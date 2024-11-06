package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuariosDao extends DaoBase {

    public Usuarios getUsuarioFinal(int idUsuario) {
        Usuarios usuario = null;
        String query = "SELECT Nombre, Apellido FROM Usuarios u " +
                "JOIN Rol r ON u.Rol_idRol = r.idRol " +
                "WHERE r.Nombre = 'usuario final' AND u.idUsuario = ?";
        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                usuario = new Usuarios();
                usuario.setNombre(rs.getString("Nombre"));
                usuario.setApellido(rs.getString("Apellido"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
}
