package com.example.webapphr1_2023.Daos;
import com.example.webapphr1_2023.Beans.*;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;
public class Lista_eventosDao extends DaoBase{
    public List<Eventos> obtenerEventosAlbergue(int idAlbergue){
        List<Eventos> eventos = new ArrayList<>();
        String sql = "SELECT " +
                "e.Nombre_Evento AS NombreDelEvento, " +
                "l.Nombre_Lugar AS Lugar, " + // Alias 'Lugar' para el nombre del lugar
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
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Eventos evento = new Eventos();

                // Asignación de valores obtenidos de ResultSet al objeto Evento
                evento.setNombreEvento(rs.getString("NombreDelEvento"));

                Lugares lugares = new Lugares();
                lugares.setNombreLugar(rs.getString("Lugar"));
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
        }catch (SQLException ex) {
            ex.printStackTrace();
        }
        return eventos;

    }
}
