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
}