package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Postulacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SolicitudDao extends DaoBase {

    public List<Object[]> obtenerSolicitudesPorUsuario(int usuarioId) {
        List<Object[]> solicitudes = new ArrayList<>();
        String sql = "SELECT pe.Postulacion_estadocol AS estadoSolicitud, p.fotos_lugar " +
                "FROM postulacion p " +
                "JOIN postulacion_estado pe ON p.Postulacion_estado_idPostulacion_estado = pe.idPostulacion_estado " +
                "WHERE p.Usuarios_ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, usuarioId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                // Crear un arreglo Object[] para cada registro
                Object[] solicitud = new Object[2];
                solicitud[0] = rs.getString("estadoSolicitud"); // Estado de la solicitud
                solicitud[1] = rs.getBytes("fotos_lugar"); // Foto del lugar

                // Agregar el arreglo de solicitud a la lista
                solicitudes.add(solicitud);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return solicitudes;
    }


    public static class PostulacionDao extends DaoBase {
        public Postulacion obtenerSolicitudPorUsuario(int usuarioId) {
            Postulacion postulacion = null;
            String sql = "SELECT u.Nombre, u.Apellido, p.Genero, p.Edad, p.persona_referencia, " +
                    "p.metraje_vivienda, p.tipo_mascotas, p.cantidad_cuartos, p.fecha_inicio_temporal, " +
                    "p.vive_con_dependientes, p.trabaja_remoto, p.tiene_hijos, u.Telefono AS celular_personal, " +
                    "p.telefono_referencia, p.fotos_lugar, u.Direccion, p.fecha_fin_temporal, p.tiene_mascotas " +
                    "FROM usuarios u " +
                    "JOIN postulacion p ON u.ID = p.Usuarios_ID " +
                    "WHERE u.ID = ?";

            try (Connection conn = getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setInt(1, usuarioId);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
                    postulacion = new Postulacion();
                    postulacion.setNombre(rs.getString("Nombre"));
                    postulacion.setApellido(rs.getString("Apellido"));
                    postulacion.setGenero(rs.getString("Genero"));
                    postulacion.setEdad(rs.getString("Edad"));
                    postulacion.setPersonaReferencia(rs.getString("persona_referencia"));
                    postulacion.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                    postulacion.setTipoMascotas(rs.getString("tipo_mascotas"));
                    postulacion.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
                    postulacion.setFechaInicioTemporal(rs.getDate("fecha_inicio_temporal"));
                    postulacion.setViveConDependientes(rs.getBoolean("vive_con_dependientes"));
                    postulacion.setTrabajaRemoto(rs.getBoolean("trabaja_remoto"));
                    postulacion.setTieneHijos(rs.getBoolean("tiene_hijos"));
                    postulacion.setCelular(rs.getString("celular_personal"));
                    postulacion.setTelefonoReferencia(rs.getString("telefono_referencia"));
                    postulacion.setFotosLugar(rs.getBytes("fotos_lugar"));
                    postulacion.setDireccion(rs.getString("Direccion"));
                    postulacion.setFechaFinTemporal(rs.getDate("fecha_fin_temporal"));
                    postulacion.setTieneMascotas(rs.getBoolean("tiene_mascotas"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return postulacion;
        }

        public void insertarSolicitud(Postulacion postulacion, int usuarioId) {
            String sql = "INSERT INTO postulacion (" +
                    "Usuarios_ID, cantidad_cuartos, metraje_vivienda, cantidad_mascotas, tipo_mascotas, tiene_hijos, vive_con_dependientes, " +
                    "trabaja_remoto, fotos_lugar, persona_referencia, telefono_referencia, tiempo_temporal, fecha_inicio_temporal, " +
                    "fecha_fin_temporal, tiene_mascotas, Nombre, Apellido, Edad, Genero, Celular, Direccion, Distrito_idDistrito, Postulacion_estado_idPostulacion_estado" +
                    ") VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            try (Connection conn = getConnection();
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                // Insertar los valores recibidos en el objeto Postulacion
                stmt.setInt(1, usuarioId);  // Usuarios_ID
                stmt.setInt(2, postulacion.getCantidadCuartos());  // cantidad_cuartos
                stmt.setDouble(3, postulacion.getMetrajeVivienda());  // metraje_vivienda
                stmt.setInt(4, postulacion.getCantidadMascotas());  // cantidad_mascotas
                stmt.setString(5, postulacion.getTipoMascotas());  // tipo_mascotas
                stmt.setBoolean(6, postulacion.getTieneHijos());  // tiene_hijos
                stmt.setBoolean(7, postulacion.getViveConDependientes());  // vive_con_dependientes
                stmt.setBoolean(8, postulacion.getTrabajaRemoto());  // trabaja_remoto
                stmt.setBytes(9, postulacion.getFotosLugar());  // fotos_lugar (si lo necesitas)
                stmt.setString(10, postulacion.getPersonaReferencia());  // persona_referencia
                stmt.setString(11, postulacion.getTelefonoReferencia());  // telefono_referencia
                stmt.setInt(12, postulacion.getTiempoTemporal());  // tiempo_temporal
                stmt.setDate(13, new java.sql.Date(postulacion.getFechaInicioTemporal().getTime()));  // fecha_inicio_temporal
                stmt.setDate(14, new java.sql.Date(postulacion.getFechaFinTemporal().getTime()));  // fecha_fin_temporal
                stmt.setString(15, String.valueOf(postulacion.getTieneMascotas()));  // tiene_mascotas
                stmt.setString(16, postulacion.getNombre());  // Nombre
                stmt.setString(17, postulacion.getApellido());  // Apellido
                stmt.setInt(18, Integer.parseInt(postulacion.getEdad()));  // Edad
                stmt.setString(19, postulacion.getGenero());  // Genero
                stmt.setString(20, postulacion.getCelular());  // Celular
                stmt.setString(21, postulacion.getDireccion());  // Direccion
                stmt.setInt(22, 3);  // Distrito_idDistrito (valor fijo como 3)
                stmt.setInt(23, 3);  // Postulacion_estado_idPostulacion_estado (valor fijo como 3, Pendiente)

                // Ejecutar la actualización (inserción)
                stmt.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }


}
