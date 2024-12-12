package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Rol;
import com.example.webapphr1_2023.Beans.Usuarios;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.example.webapphr1_2023.Daos.UsuariosDao;
import com.example.webapphr1_2023.Daos.DonacionesDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class UsuariosDao extends DaoBase {

    public Usuarios getUsuarioFinal(int idUsuario) {
        Usuarios usuario = null;
        String query = "SELECT Nombre, Apellido FROM Usuarios u " +
                "JOIN Rol r ON u.Rol_idRol = r.idRol " +
                "WHERE r.Nombre = 'usuario final' AND u.ID = ?";
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

    public List<String> obtenerNombresAlbergues() {
        List<String> albergues = new ArrayList<>();
        String sql = "SELECT Nombre_albergue FROM mydb.usuarios WHERE Nombre_albergue IS NOT NULL";

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                albergues.add(rs.getString("Nombre_albergue"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return albergues;
    }
    // Método para obtener los puntos de acopio según el albergue seleccionado
    public List<String> obtenerPuntosAcopioPorAlbergue(String nombreAlbergue) {
        List<String> puntosAcopio = new ArrayList<>();
        String sql = "SELECT Punto_acopio_donaciones FROM usuarios WHERE Nombre_albergue = ? AND Punto_acopio_donaciones IS NOT NULL";

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setString(1, nombreAlbergue);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                puntosAcopio.add(rs.getString("Punto_acopio_donaciones"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return puntosAcopio;
    }

    // UsuariosDao.java
    public Usuarios obtenerUsuarioPorId(int idUsuario) {
        Usuarios usuario = null;
        String sql = "SELECT u.Nombre, u.Apellido, u.DNI, u.Telefono, u.Correo ,r.idRol as id,r.Nombre as rolcito FROM usuarios u join rol r on r.idRol = u.Rol_idRol WHERE ID = ?";
        Rol rol= new Rol();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idUsuario);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    usuario = new Usuarios();
                    usuario.setNombre(rs.getString("Nombre"));
                    usuario.setApellido(rs.getString("Apellido"));
                    usuario.setDni(String.valueOf(rs.getInt("DNI")));
                    usuario.setTelefono(rs.getInt("Telefono"));
                    usuario.setCorreo(rs.getString("Correo"));
                    rol.setIdRol(rs.getInt("id"));
                    rol.setNombre(rs.getString("rolcito"));
                    usuario.setRol(rol);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
    public Usuarios validarUsuarioPassword(String username, String password) {
        Usuarios usuario= null;
        String sql = "SELECT * FROM usuarios WHERE correo = ? AND contrasena = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    int ID = rs.getInt(1); // Ajusta el índice según tu base de datos
                    usuario = this.obtenerUsuarioPorId(ID);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return usuario;
    }


}
