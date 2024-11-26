package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.MascotaEstado;
import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.Publicacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PublicacionDao extends DaoBase {


    public void reportarMascota(Publicacion publicacion) {
        String sql = "INSERT INTO publicacion (" +
                "Nombre, Edad, Raza, Tamano, Distintivo, Nombre_contacto, Lugar_perdida, Hora_perdida, Telefono, Descripcion, Foto, Descripcion_adicional, Recompensa, Usuarios_ID, Tipo_publicacion_Tipo_publicacion, Publicacion_estado_idPublicacion_estado " +
                ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?, 1, 1)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, publicacion.getNombre());
            pstmt.setInt(2, publicacion.getEdad());
            pstmt.setString(3, publicacion.getRaza());
            pstmt.setString(4, publicacion.getTamano());
            pstmt.setString(5, publicacion.getDistintivo());
            pstmt.setString(6, publicacion.getNombreContacto());
            pstmt.setString(7, publicacion.getLugarPerdida());
            pstmt.setString(8, publicacion.getHoraPerdida());
            pstmt.setString(9, publicacion.getTelefono());
            pstmt.setString(10, publicacion.getDescripcion());
            pstmt.setBytes(11, publicacion.getFoto());
            pstmt.setString(12, publicacion.getDescripcionAdicional());
            pstmt.setString(13, publicacion.getRecompensa());
            pstmt.setInt(14,publicacion.getUsuario().getId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

    }
    public void denunciarMaltrato(Publicacion publicacion){
        String sql = "INSERT INTO publicacion (" +
                "Nombre_maltratador, Tipo_maltrato, Tamano, Raza, Direccion_maltrato, Denuncia_policial, Descripcion, Foto, Usuarios_ID, Tipo_publicacion_Tipo_publicacion, Publicacion_estado_idPublicacion_estado " +
                ") VALUES (?,?,?,?,?,?,?,?,?, 2, 3)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, publicacion.getNombreMaltratador());
            pstmt.setString(2, publicacion.getTipoMaltrato());
            pstmt.setString(3, publicacion.getTamano());
            pstmt.setString(4, publicacion.getRaza());
            pstmt.setString(5, publicacion.getDireccionMaltrato());
            pstmt.setBoolean(6, publicacion.getDenunciaPolicial());
            pstmt.setString(7, publicacion.getDescripcion());
            pstmt.setBytes(8, publicacion.getFoto());
            pstmt.setInt(9,publicacion.getUsuario().getId());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

    }
    public Publicacion obtenerPublicacionPorId(int id) {
        String sql = "SELECT " +
                "Nombre, " +
                "Edad, " +
                "Raza, " +
                "Foto"+
                "Tamano, " +
                "Contacto, " +
                "Distintivo, " +
                "LugarPerdida AS lugar_perdida, " +
                "HoraPerdida AS hora_perdida, " +
                "Nombre_contacto, " +
                "Recompensa " +
                "FROM publicacion WHERE idPublicacion = ?";
        Publicacion publicacion = null;
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    publicacion = new Publicacion();
                    publicacion.setIdPublicacion(id); // ID de la publicación
                    publicacion.setNombre(rs.getString("Nombre")); // Nombre de la mascota
                    publicacion.setEdad(rs.getInt("Edad")); // Edad
                    publicacion.setRaza(rs.getString("Raza")); // Raza
                    publicacion.setTamano(rs.getString("Tamano")); // Tamaño
                    publicacion.setNombreContacto(rs.getString("Contacto")); // Contacto (teléfono o email)
                    publicacion.setDistintivo(rs.getString("Distintivo")); // Característica distintiva
                    publicacion.setLugarPerdida(rs.getString("lugar_perdida")); // Lugar donde se perdió
                    publicacion.setHoraPerdida(rs.getString("hora_perdida")); // Hora de la pérdida
                    publicacion.setNombreContacto(rs.getString("Nombre_contacto")); // Nombre del contacto
                    publicacion.setRecompensa(rs.getString("Recompensa")); // Recompensa
                    publicacion.setFoto(rs.getBytes("Foto"));
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener la publicación por ID", e);
        }

        return publicacion;
    }
}