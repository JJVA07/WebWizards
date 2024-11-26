package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Donaciones;
import com.example.webapphr1_2023.Beans.Eventos;
import com.example.webapphr1_2023.Beans.Usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;

public class EventosDao extends DaoBase {

    public List<Eventos> obtenerEventosActivosPaginados(int offset, int limit) {
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Foto, e.Descripcion " +
                "FROM eventos e " +
                "JOIN estado_eventos es ON e.Estado_eventos_idEstado_eventos = es.idEstado_eventos " +
                "WHERE es.Estado_eventos = 'activo' " +
                "ORDER BY e.Fecha DESC, e.Hora DESC " +
                "LIMIT ? OFFSET ?";

        List<Eventos> eventosList = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, limit);
            stmt.setInt(2, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Eventos evento = new Eventos();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("Nombre_Evento"));
                    evento.setFoto(rs.getBytes("Foto"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    eventosList.add(evento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al ejecutar consulta en obtenerEventosActivosPaginados: " + e.getMessage());
        }

        return eventosList;
    }

    public int contarEventosActivos() {
        String query = "SELECT COUNT(*) AS total " +
                "FROM eventos e " +
                "JOIN estado_eventos es ON e.Estado_eventos_idEstado_eventos = es.idEstado_eventos " +
                "WHERE es.Estado_eventos = 'activo'";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al ejecutar consulta en contarEventosActivos: " + e.getMessage());
        }

        return 0;
    }

    public Eventos obtenerDetallesEvento(int idEvento) {
        Eventos evento = null;
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Lugar_Evento, e.Aforo, e.Descripcion, " +
                "(e.Aforo - COALESCE((SELECT COUNT(*) FROM usuarioseventos ue WHERE ue.Eventos_idEventos = e.idEventos), 0)) AS vacantesDisponibles, " +
                "e.Artistas_invitados, e.Razon, e.Foto, d.Cantidad_Donacion " +
                "FROM eventos e " +
                "LEFT JOIN donaciones d ON e.Donaciones_idDonaciones = d.idDonaciones " +
                "WHERE e.idEventos = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    evento = new Eventos();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("Nombre_Evento"));
                    evento.setFecha(rs.getDate("Fecha"));
                    evento.setHora(rs.getTime("Hora"));
                    evento.setLugarEvento(rs.getString("Lugar_Evento"));
                    evento.setAforo(rs.getInt("Aforo"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setVacantesDisponibles(rs.getString("vacantesDisponibles"));
                    evento.setArtistasInvitados(rs.getString("Artistas_invitados"));
                    evento.setRazon(rs.getString("Razon"));
                    evento.setFoto(rs.getBytes("Foto"));

                    Donaciones donacion = new Donaciones();
                    donacion.setCantidadDonacion(rs.getString("Cantidad_Donacion"));
                    evento.setDonaciones(donacion);
                } else {
                    System.out.println("No se encontraron resultados para idEvento: " + idEvento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return evento;
    }

    public List<Eventos> obtenerEventosPorUsuario(int idUsuario) {
        List<Eventos> eventosList = new ArrayList<>();
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Aforo, u.Nombre AS Albergue, " +
                "d.Cantidad_Donacion AS Costo " +
                "FROM eventos e " +
                "JOIN usuarios u ON e.Albergue = u.idUsuario " +
                "LEFT JOIN donaciones d ON e.Donaciones_idDonaciones = d.idDonaciones " +
                "JOIN usuarioseventos ue ON ue.Eventos_idEventos = e.idEventos " +
                "WHERE ue.Usuarios_ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idUsuario);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Eventos evento = new Eventos();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("Nombre_Evento"));
                    evento.setFecha(rs.getDate("Fecha"));
                    evento.setHora(rs.getTime("Hora"));
                    evento.setAforo(rs.getInt("Aforo"));

                    Usuarios albergue = new Usuarios();
                    albergue.setNombre(rs.getString("Albergue"));
                    evento.setAlbergue(albergue);

                    Donaciones donacion = new Donaciones();
                    donacion.setCantidadDonacion(rs.getString("Costo"));
                    evento.setDonaciones(donacion);

                    eventosList.add(evento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventosList;
    }
}
