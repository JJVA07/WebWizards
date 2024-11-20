package com.example.webapphr1_2023.Daos;
import com.example.webapphr1_2023.Beans.*;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CoordinadorDao extends DaoBase{

    public Usuarios micuenta(int id) {
        Usuarios coordinador = null;
        String sql = "SELECT Nombre, Apellido, Edad, Genero, Telefono, Correo FROM usuarios WHERE ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Establecer el parámetro de ID en la consulta preparada
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    // Crear un nuevo objeto Usuarios y asignar los valores del resultado
                    coordinador = new Usuarios();
                    coordinador.setNombre(rs.getString("Nombre"));
                    coordinador.setApellido(rs.getString("Apellido"));
                    coordinador.setEdad(rs.getInt("Edad"));
                    coordinador.setGenero(rs.getString("Genero"));
                    coordinador.setTelefono(rs.getInt("Telefono"));
                    coordinador.setCorreo(rs.getString("Correo"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return coordinador;
    }

}
