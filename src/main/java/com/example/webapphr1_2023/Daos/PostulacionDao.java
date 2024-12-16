package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.Postulacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostulacionDao extends DaoBase {

    public List<Postulacion> obtenerPostulacionesPorUsuarioYEstado(int usuarioId, int estadoId) {
        List<Postulacion> postulaciones = new ArrayList<>();

        String sql = "SELECT p.idPostulacion, p.Nombre, p.Apellido, p.Direccion, p.Celular, p.metraje_vivienda, p.tiempo_temporal "
                + "FROM postulacion p "
                + "WHERE p.Usuarios_ID = ? AND p.Postulacion_estado_idPostulacion_estado = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            ps.setInt(1, usuarioId);
            ps.setInt(2, estadoId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Postulacion postulacion = new Postulacion();
                    postulacion.setIdPostulacion(rs.getInt("idPostulacion")); // Recuperar ID
                    postulacion.setNombre(rs.getString("Nombre"));
                    postulacion.setApellido(rs.getString("Apellido"));
                    postulacion.setDireccion(rs.getString("Direccion"));
                    postulacion.setCelular(rs.getString("Celular"));
                    postulacion.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                    postulacion.setTiempoTemporal(rs.getInt("tiempo_temporal"));

                    postulaciones.add(postulacion);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return postulaciones;
    }


    public void insertarPostulacion(Postulacion postulacion) {
        String sql = "INSERT INTO postulacion (Nombre, Apellido, Direccion, Celular, metraje_vivienda, tiempo_temporal, " +
                "Usuarios_ID, Postulacion_estado_idPostulacion_estado, tiene_hijos, vive_con_dependientes, " +
                "trabaja_remoto, Tiene_mascotas, cantidad_cuartos, tipo_mascotas, cantidad_mascotas, " +
                "persona_referencia, telefono_referencia, fecha_inicio_temporal, fecha_fin_temporal) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = this.getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {

            // Asignación de parámetros
            ps.setString(1, postulacion.getNombre());
            ps.setString(2, postulacion.getApellido());
            ps.setString(3, postulacion.getDireccion());
            ps.setString(4, postulacion.getCelular());
            ps.setDouble(5, postulacion.getMetrajeVivienda());
            ps.setInt(6, postulacion.getTiempoTemporal());
            ps.setInt(7, postulacion.getUsuario().getId()); // Usuarios_ID = 1
            ps.setInt(8, postulacion.getPostulacionEstado().getIdPostulacionEstado()); // Estado = 3
            ps.setBoolean(9, postulacion.getTieneHijos()); // Booleano
            ps.setBoolean(10, postulacion.getViveConDependientes()); // Booleano
            ps.setBoolean(11, postulacion.getTrabajaRemoto()); // Booleano
            ps.setString(12, postulacion.getTieneMascotas()); // String (Sí/No)
            ps.setInt(13, postulacion.getCantidadCuartos());
            ps.setString(14, postulacion.getTipoMascotas());
            ps.setInt(15, postulacion.getCantidadMascotas());
            ps.setString(16, postulacion.getPersonaReferencia()); // Persona de referencia
            ps.setString(17, postulacion.getTelefonoReferencia());
            ps.setDate(18, new java.sql.Date(postulacion.getFechaInicioTemporal().getTime()));
            ps.setDate(19, new java.sql.Date(postulacion.getFechaFinTemporal().getTime()));


            // Ejecución del INSERT
            ps.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Postulacion obtenerPostulacionPorId(int idPostulacion) {
        Postulacion postulacion = null;

        String sql = "SELECT " +
                "p.cantidad_cuartos, p.metraje_vivienda, p.cantidad_mascotas, p.tipo_mascotas, " +
                "CASE WHEN p.tiene_hijos = 1 THEN 'Sí' ELSE 'No' END AS tiene_hijos, " +
                "CASE WHEN p.vive_con_dependientes = 1 THEN 'Sí' ELSE 'No' END AS vive_con_dependientes, " +
                "CASE WHEN p.trabaja_remoto = 1 THEN 'Sí' ELSE 'No' END AS trabaja_remoto, " +
                "p.fotos_lugar, p.tiempo_temporal, p.fecha_inicio_temporal, p.fecha_fin_temporal, p.Direccion, " +
                "m.Nombre_Mascota, m.Raza, m.Edad, m.Genero, m.Descripcion, m.Comentario_Coordinador, m.Foto " +
                "FROM postulacion p " +
                "JOIN mascotas m ON p.Mascotas_idMascotas = m.idMascotas " +
                "WHERE p.idPostulacion = ? AND m.Mascota_estado_idMascota_estado = 2";

        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, idPostulacion);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                postulacion = new Postulacion();
                postulacion.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
                postulacion.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                postulacion.setCantidadMascotas(rs.getInt("cantidad_mascotas"));
                postulacion.setTipoMascotas(rs.getString("tipo_mascotas"));
                postulacion.setTieneHijos(rs.getString("tiene_hijos").equals("Sí"));
                postulacion.setViveConDependientes(rs.getString("vive_con_dependientes").equals("Sí"));
                postulacion.setTrabajaRemoto(rs.getString("trabaja_remoto").equals("Sí"));
                postulacion.setFotosLugar(rs.getBytes("fotos_lugar"));
                postulacion.setTiempoTemporal(rs.getInt("tiempo_temporal"));
                postulacion.setFechaInicioTemporal(rs.getDate("fecha_inicio_temporal"));
                postulacion.setFechaFinTemporal(rs.getDate("fecha_fin_temporal"));
                postulacion.setDireccion(rs.getString("Direccion"));

                Mascotas mascota = new Mascotas();
                mascota.setNombreMascota(rs.getString("Nombre_Mascota"));
                mascota.setRaza(rs.getString("Raza"));
                mascota.setEdad(rs.getInt("Edad"));
                mascota.setGenero(rs.getString("Genero"));
                mascota.setDescripcion(rs.getString("Descripcion"));
                mascota.setComentarioCoordinador(rs.getString("Comentario_Coordinador"));
                mascota.setFoto(rs.getBytes("Foto"));

                postulacion.setMascota(mascota);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postulacion;
    }

    public void postularAdopcion(Postulacion postulacion) {
        String sql = "INSERT INTO postulacion (Usuarios_ID, Mascotas_idMascotas, Nombre, Apellido, Edad, Genero, Direccion, " +
                "metraje_vivienda, cantidad_cuartos, Celular, telefono_referencia, vive_con_dependientes, " +
                "trabaja_remoto, Tiene_mascotas, tiene_hijos, Postulacion_estado_idPostulacion_estado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, postulacion.getUsuario().getId());
            stmt.setInt(2, postulacion.getMascota().getIdMascotas());
            stmt.setString(3, postulacion.getNombre());
            stmt.setString(4, postulacion.getApellido());
            stmt.setString(5, postulacion.getEdad());
            stmt.setString(6, postulacion.getGenero());
            stmt.setString(7, postulacion.getDireccion());
            stmt.setDouble(8, postulacion.getMetrajeVivienda());
            stmt.setInt(9, postulacion.getCantidadCuartos());
            stmt.setString(10, postulacion.getCelular());
            stmt.setString(11, postulacion.getTelefonoReferencia());
            stmt.setBoolean(12, postulacion.getViveConDependientes());
            stmt.setBoolean(13, postulacion.getTrabajaRemoto());
            stmt.setBoolean(14, Boolean.parseBoolean(postulacion.getTieneMascotas()));
            stmt.setBoolean(15, postulacion.getTieneHijos());
            stmt.setInt(16, 4); // Estado por defecto: "Revisión"

            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al insertar postulación: " + e.getMessage());
        }
    }






}

