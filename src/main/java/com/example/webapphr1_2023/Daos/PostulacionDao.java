package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Postulacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class PostulacionDao extends DaoBase{


    public void postularAdopcion(Postulacion postulacion) {
        String sql = "INSERT INTO postulacion (" +
                "Nombre, Apellido, Genero, Edad, Direccion, metraje_vivienda, cantidad_cuartos, celular, telefono_referencia, vive_con_dependientes, trabaja_remoto, Tiene_mascotas, tiene_hijos, Usuarios_ID, Postulacion_estado_idPostulacion_estado, Mascotas_idMascotas" +
                ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,3,?)";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, postulacion.getNombre());
            pstmt.setString(2, postulacion.getApellido());
            pstmt.setString(3, postulacion.getGenero());
            pstmt.setString(4, postulacion.getEdad());
            pstmt.setString(5, postulacion.getDireccion());
            pstmt.setDouble(6, postulacion.getMetrajeVivienda());
            pstmt.setInt(7, postulacion.getCantidadCuartos());
            pstmt.setString(8, postulacion.getCelular());
            pstmt.setString(9, postulacion.getTelefonoReferencia());
            pstmt.setBoolean(10, postulacion.getViveConDependientes());
            pstmt.setBoolean(11, postulacion.getTrabajaRemoto());
            pstmt.setBoolean(12, postulacion.getTieneMascotas());
            pstmt.setBoolean(13, postulacion.getTieneHijos());
            pstmt.setInt(14, postulacion.getUsuario().getId());
            pstmt.setInt(15, postulacion.getMascota().getIdMascotas()); // Agrega el idMascota aquí

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
