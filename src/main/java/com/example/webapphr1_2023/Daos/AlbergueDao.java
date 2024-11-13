package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Distrito;
import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Lugares;
import com.example.webapphr1_2023.Beans.Usuarios;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

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
                    Distrito distrito = new Distrito();
                    distrito.setNombre(rs.getString("Distrito"));
                    albergue.setDistrito(distrito);

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

    public void actualizarAlbergue(Usuarios albergue) {
        String sql = "UPDATE Usuarios SET " +
                "Nombre_albergue = ?, " +
                "Telefono = ?, " +
                "Direccion = ?, " +
                "Punto_acopio_donaciones = ?, " +
                "Url_fbig = ?, " +
                "Numero_donaciones = ? " +
                "WHERE ID = ? AND Rol_idRol = 2";  // ID dinámico y Rol_idRol se mantiene como filtro

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Asignar los valores al PreparedStatement
            pstmt.setString(1, albergue.getNombreAlbergue());
            pstmt.setInt(2, albergue.getTelefono());
            pstmt.setString(3, albergue.getDireccion());
            pstmt.setString(4, albergue.getPuntoAcopioDonaciones());
            pstmt.setString(5, albergue.getUrlFbig());
            pstmt.setInt(6, albergue.getNumeroDonaciones());
            pstmt.setInt(7, albergue.getId()); // ID dinámico

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Eventos> obtenerEventosAlbergue(int idAlbergue) {
        List<Eventos> eventos = new ArrayList<>();

        String sql = "SELECT " +
                "e.Nombre_Evento AS NombreDelEvento, " +
                "l.Nombre_Lugar AS Lugar, " +
                "e.Fecha AS FechaDelEvento, " +
                "e.Hora AS HoraDelEvento, " +
                "e.Aforo, " +
                "e.vacantes_disponibles AS Vacantes_disponibles, " +
                "e.Artistas_invitados AS ArtistasInvitados, " +
                "e.Descripcion, " +
                "e.Razon AS RazonDelEvento " +
                "FROM eventos e " +
                "JOIN lugares l ON e.Lugares_idLugar = l.idLugar " +
                "WHERE e.Albergue = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idAlbergue);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Eventos evento = new Eventos();

                    // Asignación de valores obtenidos de ResultSet al objeto Evento
                    evento.setNombreEvento(rs.getString("NombreDelEvento"));

                    Lugares lugares = new Lugares();
                    lugares.setNombreLugar(rs.getString("NombreLugar"));
                    evento.setLugar(lugares);

                    evento.setFecha(rs.getDate("FechaDelEvento"));
                    evento.setHora(rs.getTime("HoraDelEvento"));
                    evento.setAforo(rs.getInt("Aforo"));
                    evento.setVacantesDisponibles(rs.getString("Vacantes_disponibles"));
                    evento.setArtistasInvitados(rs.getString("ArtistasInvitados"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setRazon(rs.getString("RazonDelEvento"));

                    eventos.add(evento);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;
    }

    public List<Lugares> obtenerLugares() {}
}
