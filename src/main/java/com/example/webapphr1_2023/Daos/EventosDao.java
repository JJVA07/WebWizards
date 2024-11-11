package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Eventos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;
public class EventosDao extends DaoBase{

    public List<Eventos> obtenerEventosActivosPaginados(int offset, int limit) {
        List<Eventos> eventosList = new ArrayList<>();
        String query = "SELECT Nombre_Evento, Foto, Descripcion FROM eventos e " +
                "JOIN estado_eventos es ON e.idEstado_eventos = es.idEstado_eventos " +
                "WHERE es.Estado_eventos = 'activo' " +
                "ORDER BY e.Fecha DESC, e.Hora DESC " +
                "LIMIT ? OFFSET ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, limit);
            stmt.setInt(2, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Eventos evento = new Eventos();
                    evento.setNombreEvento(rs.getString("Nombre_Evento"));
                    evento.setFoto(rs.getBytes("Foto"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    eventosList.add(evento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return eventosList;
    }

    public int contarEventosActivos() {
        String query = "SELECT COUNT(*) AS total FROM Eventos e " +
                "JOIN EstadoEventos es ON e.idEstadoEventos = es.idEstadoEventos " +
                "WHERE es.estadoEventos = 'activo'";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}

