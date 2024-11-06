package com.example.webapphr1_2023.Daos;


import com.example.webapphr1_2023.Beans.Postulacion;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PostulacionDao {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/mydb"; // Cambia según tu configuración
    private final String jdbcUsername = "root"; // Cambia según tu configuración
    private final String jdbcPassword = "password"; // Cambia según tu configuración

    private static final String INSERT_POSTULACION_SQL = "INSERT INTO Postulacion (cantidad_cuartos, metraje_vivienda, cantidad_mascotas, tipo_mascotas, tiene_hijos, vive_con_dependientes, trabaja_remoto, fotos_lugar, persona_referencia, telefono_referencia, tiempo_temporal, fecha_inicio_temporal, fecha_fin_temporal, Postulacion_estado_idPostulacion_estado, Usuarios_ID, tiene_mascotas, nombre, apellido, edad, genero, celular, direccion, Distrito_idDistrito, visita_inopinada, fecha_inopinada, hora_inopinada, motivo_rechazo, mascotas_idMascotas) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_POSTULACION_BY_ID = "SELECT * FROM Postulacion WHERE idPostulacion = ?";
    private static final String SELECT_ALL_POSTULACIONES = "SELECT * FROM Postulacion";
    private static final String DELETE_POSTULACION_SQL = "DELETE FROM Postulacion WHERE idPostulacion = ?";
    private static final String UPDATE_POSTULACION_SQL = "UPDATE Postulacion SET cantidad_cuartos = ?, metraje_vivienda = ?, cantidad_mascotas = ?, tipo_mascotas = ?, tiene_hijos = ?, vive_con_dependientes = ?, trabaja_remoto = ?, fotos_lugar = ?, persona_referencia = ?, telefono_referencia = ?, tiempo_temporal = ?, fecha_inicio_temporal = ?, fecha_fin_temporal = ?, Postulacion_estado_idPostulacion_estado = ?, Usuarios_ID = ?, tiene_mascotas = ?, nombre = ?, apellido = ?, edad = ?, genero = ?, celular = ?, direccion = ?, Distrito_idDistrito = ?, visita_inopinada = ?, fecha_inopinada = ?, hora_inopinada = ?, motivo_rechazo = ?, mascotas_idMascotas = ? WHERE idPostulacion = ?";

    protected Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    // Insertar nueva postulacion
    public void insertPostulacion(Postulacion postulacion) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_POSTULACION_SQL)) {
            preparedStatement.setInt(1, postulacion.getCantidadCuartos());
            preparedStatement.setDouble(2, postulacion.getMetrajeVivienda());
            preparedStatement.setInt(3, postulacion.getCantidadMascotas());
            preparedStatement.setString(4, postulacion.getTipoMascotas());
            preparedStatement.setBoolean(5, postulacion.getTieneHijos());
            preparedStatement.setBoolean(6, postulacion.getViveConDependientes());
            preparedStatement.setBoolean(7, postulacion.getTrabajaRemoto());
            preparedStatement.setBytes(8, postulacion.getFotosLugar());
            preparedStatement.setString(9, postulacion.getPersonaReferencia());
            preparedStatement.setString(10, postulacion.getTelefonoReferencia());
            preparedStatement.setInt(11, postulacion.getTiempoTemporal());
            preparedStatement.setDate(12, new java.sql.Date(postulacion.getFechaInicioTemporal().getTime()));
            preparedStatement.setDate(13, new java.sql.Date(postulacion.getFechaFinTemporal().getTime()));
            preparedStatement.setInt(14, postulacion.getPostulacionEstadoIdPostulacionEstado());
            preparedStatement.setInt(15, postulacion.getUsuariosId());
            preparedStatement.setString(16, postulacion.getTieneMascotas());
            preparedStatement.setString(17, postulacion.getNombre());
            preparedStatement.setString(18, postulacion.getApellido());
            preparedStatement.setString(19, postulacion.getEdad());
            preparedStatement.setString(20, postulacion.getGenero());
            preparedStatement.setString(21, postulacion.getCelular());
            preparedStatement.setString(22, postulacion.getDireccion());
            preparedStatement.setInt(23, postulacion.getDistritoIdDistrito());
            preparedStatement.setString(24, postulacion.getVisitaInopinada());
            preparedStatement.setString(25, postulacion.getFechaInopinada());
            preparedStatement.setString(26, postulacion.getHoraInopinada());
            preparedStatement.setString(27, postulacion.getMotivoRechazo());
            preparedStatement.setInt(28, postulacion.getMascotasIdMascotas());
            preparedStatement.executeUpdate();
        }
    }

    // Seleccionar postulacion por ID
    public Postulacion selectPostulacion(int id) {
        Postulacion postulacion = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_POSTULACION_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                postulacion = new Postulacion();
                postulacion.setIdPostulacion(rs.getInt("idPostulacion"));
                postulacion.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
                postulacion.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                postulacion.setCantidadMascotas(rs.getInt("cantidad_mascotas"));
                postulacion.setTipoMascotas(rs.getString("tipo_mascotas"));
                postulacion.setTieneHijos(rs.getBoolean("tiene_hijos"));
                postulacion.setViveConDependientes(rs.getBoolean("vive_con_dependientes"));
                postulacion.setTrabajaRemoto(rs.getBoolean("trabaja_remoto"));
                postulacion.setFotosLugar(rs.getBytes("fotos_lugar"));
                postulacion.setPersonaReferencia(rs.getString("persona_referencia"));
                postulacion.setTelefonoReferencia(rs.getString("telefono_referencia"));
                postulacion.setTiempoTemporal(rs.getInt("tiempo_temporal"));
                postulacion.setFechaInicioTemporal(rs.getDate("fecha_inicio_temporal"));
                postulacion.setFechaFinTemporal(rs.getDate("fecha_fin_temporal"));
                postulacion.setPostulacionEstadoIdPostulacionEstado(rs.getInt("Postulacion_estado_idPostulacion_estado"));
                postulacion.setUsuariosId(rs.getInt("Usuarios_ID"));
                postulacion.setTieneMascotas(rs.getString("tiene_mascotas"));
                postulacion.setNombre(rs.getString("nombre"));
                postulacion.setApellido(rs.getString("apellido"));
                postulacion.setEdad(rs.getString("edad"));
                postulacion.setGenero(rs.getString("genero"));
                postulacion.setCelular(rs.getString("celular"));
                postulacion.setDireccion(rs.getString("direccion"));
                postulacion.setDistritoIdDistrito(rs.getInt("Distrito_idDistrito"));
                postulacion.setVisitaInopinada(rs.getString("visita_inopinada"));
                postulacion.setFechaInopinada(rs.getString("fecha_inopinada"));
                postulacion.setHoraInopinada(rs.getString("hora_inopinada"));
                postulacion.setMotivoRechazo(rs.getString("motivo_rechazo"));
                postulacion.setMascotasIdMascotas(rs.getInt("mascotas_idMascotas"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postulacion;
    }

    // Seleccionar todas las postulaciones
    public List<Postulacion> selectAllPostulaciones() {
        List<Postulacion> postulaciones = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSTULACIONES)) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                Postulacion postulacion = new Postulacion();
                postulacion.setIdPostulacion(rs.getInt("idPostulacion"));
                postulacion.setCantidadCuartos(rs.getInt("cantidad_cuartos"));
                postulacion.setMetrajeVivienda(rs.getDouble("metraje_vivienda"));
                postulacion.setCantidadMascotas(rs.getInt("cantidad_mascotas"));
                postulacion.setTipoMascotas(rs.getString("tipo_mascotas"));
                postulacion.setTieneHijos(rs.getBoolean("tiene_hijos"));
                postulacion.setViveConDependientes(rs.getBoolean("vive_con_dependientes"));
                postulacion.setTrabajaRemoto(rs.getBoolean("trabaja_remoto"));
                postulacion.setFotosLugar(rs.getBytes("fotos_lugar"));
                postulacion.setPersonaReferencia(rs.getString("persona_referencia"));
                postulacion.setTelefonoReferencia(rs.getString("telefono_referencia"));
                postulacion.setTiempoTemporal(rs.getInt("tiempo_temporal"));
                postulacion.setFechaInicioTemporal(rs.getDate("fecha_inicio_temporal"));
                postulacion.setFechaFinTemporal(rs.getDate("fecha_fin_temporal"));
                postulacion.setPostulacionEstadoIdPostulacionEstado(rs.getInt("Postulacion_estado_idPostulacion_estado"));
                postulacion.setUsuariosId(rs.getInt("Usuarios_ID"));
                postulacion.setTieneMascotas(rs.getString("tiene_mascotas"));
                postulacion.setNombre(rs.getString("nombre"));
                postulacion.setApellido(rs.getString("apellido"));
                postulacion.setEdad(rs.getString("edad"));
                postulacion.setGenero(rs.getString("genero"));
                postulacion.setCelular(rs.getString("celular"));
                postulacion.setDireccion(rs.getString("direccion"));
                postulacion.setDistritoIdDistrito(rs.getInt("Distrito_idDistrito"));
                postulacion.setVisitaInopinada(rs.getString("visita_inopinada"));
                postulacion.setFechaInopinada(rs.getString("fecha_inopinada"));
                postulacion.setHoraInopinada(rs.getString("hora_inopinada"));
                postulacion.setMotivoRechazo(rs.getString("motivo_rechazo"));
                postulacion.setMascotasIdMascotas(rs.getInt("mascotas_idMascotas"));
                postulaciones.add(postulacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return postulaciones;
    }

    // Eliminar postulacion
    public boolean deletePostulacion(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_POSTULACION_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Actualizar postulacion
    public boolean updatePostulacion(Postulacion postulacion) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_POSTULACION_SQL)) {
            statement.setInt(1, postulacion.getCantidadCuartos());
            statement.setDouble(2, postulacion.getMetrajeVivienda());
            statement.setInt(3, postulacion.getCantidadMascotas());
            statement.setString(4, postulacion.getTipoMascotas());
            statement.setBoolean(5, postulacion.getTieneHijos());
            statement.setBoolean(6, postulacion.getViveConDependientes());
            statement.setBoolean(7, postulacion.getTrabajaRemoto());
            statement.setBytes(8, postulacion.getFotosLugar());
            statement.setString(9, postulacion.getPersonaReferencia());
            statement.setString(10, postulacion.getTelefonoReferencia());
            statement.setInt(11, postulacion.getTiempoTemporal());
            statement.setDate(12, new java.sql.Date(postulacion.getFechaInicioTemporal().getTime()));
            statement.setDate(13, new java.sql.Date(postulacion.getFechaFinTemporal().getTime()));
            statement.setInt(14, postulacion.getPostulacionEstadoIdPostulacionEstado());
            statement.setInt(15, postulacion.getUsuariosId());
            statement.setString(16, postulacion.getTieneMascotas());
            statement.setString(17, postulacion.getNombre());
            statement.setString(18, postulacion.getApellido());
            statement.setString(19, postulacion.getEdad());
            statement.setString(20, postulacion.getGenero());
            statement.setString(21, postulacion.getCelular());
            statement.setString(22, postulacion.getDireccion());
            statement.setInt(23, postulacion.getDistritoIdDistrito());
            statement.setString(24, postulacion.getVisitaInopinada());
            statement.setString(25, postulacion.getFechaInopinada());
            statement.setString(26, postulacion.getHoraInopinada());
            statement.setString(27, postulacion.getMotivoRechazo());
            statement.setInt(28, postulacion.getMascotasIdMascotas());
            statement.setInt(29, postulacion.getIdPostulacion());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
