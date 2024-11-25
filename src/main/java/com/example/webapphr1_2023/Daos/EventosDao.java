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

    /**
     * Obtiene una lista de eventos activos con paginación.
     *
     * @param offset el desplazamiento para la paginación.
     * @param limit  el número máximo de registros a obtener.
     * @return lista de eventos activos.
     */
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

    /**
     * Cuenta el total de eventos activos.
     *
     * @return el total de eventos activos.
     */
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

    /**
     * Obtiene los detalles de un evento específico por su ID.
     *
     * @param idEvento el ID del evento.
     * @return el evento con sus detalles.
     */
    public Eventos obtenerDetallesEvento(int idEvento) {
        Eventos evento = null;
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Lugar_Evento, e.Aforo, e.Descripcion, " +
                "       (e.Aforo - COALESCE((SELECT COUNT(*) FROM usuarios_eventos ue WHERE ue.idEvento = e.idEventos), 0)) AS vacantesDisponibles, " +
                "       e.Artistas_Invitados, e.Razon, e.Foto, d.Cantidad_Donacion, d.Tipo_Donacion " +
                "FROM eventos e " +
                "LEFT JOIN donaciones d ON e.idDonacion = d.idDonaciones " +
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
                    evento.setArtistasInvitados(rs.getString("Artistas_Invitados"));
                    evento.setRazon(rs.getString("Razon"));
                    evento.setFoto(rs.getBytes("Foto"));

                    // Relación con Donaciones
                    Donaciones donacion = new Donaciones();
                    donacion.setCantidadDonacion(rs.getString("Cantidad_Donacion"));
                    donacion.setTipoDonacion(rs.getString("Tipo_Donacion"));
                    evento.setDonaciones(donacion);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return evento;
    }

    /**
     * Obtiene una lista de eventos asociados a un usuario.
     *
     * @param idUsuario el ID del usuario.
     * @return lista de eventos del usuario.
     */
    public List<Eventos> obtenerEventosPorUsuario(int idUsuario) {
        List<Eventos> eventosList = new ArrayList<>();
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Aforo, u.Nombre AS Albergue, " +
                "       d.Cantidad_Donacion AS Costo " +
                "FROM eventos e " +
                "JOIN usuarios u ON e.idAlbergue = u.idUsuario " +
                "LEFT JOIN donaciones d ON e.idDonacion = d.idDonaciones " +
                "JOIN usuarios_eventos ue ON ue.idEvento = e.idEventos " +
                "WHERE ue.idUsuario = ?";

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

                    // Configuración del albergue
                    Usuarios albergue = new Usuarios();
                    albergue.setNombre(rs.getString("Albergue"));
                    evento.setAlbergue(albergue);

                    // Configuración del costo desde Donaciones
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
