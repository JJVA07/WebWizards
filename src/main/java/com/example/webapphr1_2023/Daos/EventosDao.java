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
        List<Eventos> eventosList = new ArrayList<>();
        String query = "SELECT Nombre_Evento, Foto, Descripcion FROM eventos e " +
                "JOIN estado_eventos es ON e.Estado_eventos_idEstado_eventos = es.idEstado_eventos " +
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
        String query = "SELECT COUNT(*) AS total FROM eventos e " +
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
        }
        return 0;
    }
    public Eventos obtenerDetallesEvento(int idEvento) {
        Eventos evento = null;
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Lugar_Evento, e.Aforo, e.Descripcion, "+
                "(e.Aforo - COALESCE((SELECT COUNT(*) FROM usuarioseventos ue WHERE ue.Eventos_idEventos = e.idEventos), 0)) AS vacantesDisponibles, "+
                "e.Artistas_invitados, e.Razon, e.Foto, d.Cantidad_donacion, d.Tipo_donacion AS tipoDonacion " +
                "FROM eventos e JOIN donaciones d ON e.idDonacion = d.idDonaciones "+
                "WHERE e.idEventos = ? ";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idEvento);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    evento = new Eventos();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFecha(rs.getDate("fecha"));
                    evento.setHora(rs.getTime("hora"));
                    evento.setLugarEvento(rs.getString("lugarEvento"));
                    evento.setAforo(rs.getInt("aforo"));
                    evento.setDescripcion(rs.getString("descripcion"));
                    evento.setVacantesDisponibles("vacantesDisponibles");
                    evento.setArtistasInvitados(rs.getString("artistasInvitados"));
                    evento.setRazon(rs.getString("razon"));
                    evento.setFoto(rs.getBytes("foto"));

                    // Relación con Donaciones
                    Donaciones donacion = new Donaciones();
                    donacion.setCantidadDonacion(rs.getString("cantidadDonacion"));
                    donacion.setMarca(rs.getString("tipoDonacion")); // Aquí se toma el tipo de donación
                    evento.setDonaciones(donacion);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return evento;
    }
    public List<Eventos> obtenerEventosPorUsuario(int idUsuario) {
        List<Eventos> eventosList = new ArrayList<>();
        String query = "SELECT e.idEventos, e.Nombre_Evento, e.Fecha, e.Hora, e.Aforo, u.Nombre_albergue AS albergue,"
                +"d.Cantidad_donacion AS costo FROM eventos e"
                +"JOIN usuarios u ON e.Albergue = u.ID"
                +"LEFT JOIN donaciones d ON e.Donaciones_idDonaciones = d.idDonaciones"
                +" JOIN usuarioseventos ue ON ue.Eventos_idEventos = e.idEventos"
                +"WHERE ue.idUsuario = ? ";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idUsuario);  // Filtramos por el ID del usuario

            try (ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                    Eventos evento = new Eventos();
                    evento.setIdEventos(rs.getInt("idEventos"));
                    evento.setNombreEvento(rs.getString("nombreEvento"));
                    evento.setFecha(rs.getDate("fecha"));
                    evento.setHora(rs.getTime("hora"));
                    evento.setAforo(rs.getInt("aforo"));

                    // Configuración del albergue
                    Usuarios albergue = new Usuarios();
                    albergue.setNombre(rs.getString("albergue"));
                    evento.setAlbergue(albergue);

                    // Configuración del costo desde Donaciones
                    Donaciones donacion = new Donaciones();
                    donacion.setCantidadDonacion(rs.getString("costo"));
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

