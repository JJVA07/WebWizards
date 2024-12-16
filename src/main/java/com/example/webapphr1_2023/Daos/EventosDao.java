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

    public List<Eventos> obtenerEventosActivosPaginados(int idUsuario, int offset, int limit) {
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Foto, e.Descripcion, e.Aforo, " +
                "(e.Aforo - COALESCE((SELECT COUNT(*) FROM usuarioseventos ue WHERE ue.Eventos_idEventos = e.idEventos), 0)) AS vacantes_disponibles, " +
                "CASE WHEN ue.Usuarios_ID IS NOT NULL THEN 1 ELSE 0 END AS inscrito " +
                "FROM eventos e " +
                "LEFT JOIN usuarioseventos ue ON e.idEventos = ue.Eventos_idEventos AND ue.Usuarios_ID = ? " +
                "JOIN estado_eventos es ON e.Estado_eventos_idEstado_eventos = es.idEstado_eventos " +
                "WHERE es.Estado_eventos = 'activo' " +
                "ORDER BY inscrito ASC, e.Fecha DESC, e.Hora DESC " +
                "LIMIT ? OFFSET ?";

        List<Eventos> eventosList = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, idUsuario);
            stmt.setInt(2, limit);
            stmt.setInt(3, offset);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Eventos evento = new Eventos();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("Nombre_Evento"));
                    evento.setFoto(rs.getBytes("Foto"));
                    evento.setDescripcion(rs.getString("Descripcion"));
                    evento.setAforo(rs.getInt("Aforo"));
                    evento.setVacantesDisponibles(String.valueOf(rs.getInt("vacantes_disponibles")));
                    eventosList.add(evento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
                "e.Artistas_invitados, e.Razon, e.Foto " +
                "FROM eventos e " +
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
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return evento;
    }



    public List<Eventos> obtenerEventosInscritosPorUsuario(int idUsuario) {
        List<Eventos> eventosList = new ArrayList<>();
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Aforo, " +
                "u.nombre_albergue AS Albergue " +
                "FROM eventos e " +
                "JOIN usuarioseventos ue ON e.idEventos = ue.Eventos_idEventos " +
                "JOIN usuarios u ON e.Albergue = u.ID " +
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

                    // Asignar el nombre del albergue al atributo Usuarios
                    Usuarios albergue = new Usuarios();
                    albergue.setNombreAlbergue(rs.getString("Albergue"));
                    evento.setAlbergue(albergue);

                    eventosList.add(evento);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return eventosList;
    }





    public void inscribirUsuarioEnEvento(int idUsuario, int idEvento) {
        String insertQuery = "INSERT INTO usuarioseventos (Usuarios_ID, Eventos_idEventos) VALUES (?, ?)";
        String updateQuery = "UPDATE eventos SET vacantes_disponibles = vacantes_disponibles - 1 WHERE idEventos = ? AND vacantes_disponibles > 0";

        try (Connection conn = getConnection()) {
            conn.setAutoCommit(false); // Iniciar transacción

            try (PreparedStatement insertStmt = conn.prepareStatement(insertQuery);
                 PreparedStatement updateStmt = conn.prepareStatement(updateQuery)) {

                // Insertar la inscripción
                insertStmt.setInt(1, idUsuario);
                insertStmt.setInt(2, idEvento);
                insertStmt.executeUpdate();

                // Actualizar las vacantes disponibles
                updateStmt.setInt(1, idEvento);
                updateStmt.executeUpdate();

                conn.commit(); // Confirmar transacción
            } catch (SQLException e) {
                conn.rollback(); // Revertir en caso de error
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public boolean verificarInscripcion(int idUsuario, int idEvento) {
        String query = "SELECT 1 FROM usuarioseventos WHERE Usuarios_ID = ? AND Eventos_idEventos = ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, idUsuario);
            stmt.setInt(2, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // Retorna true si el usuario ya está inscrito
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


}
