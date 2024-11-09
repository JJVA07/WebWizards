package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Mascotas;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MascotasDao extends DaoBase {

    public List<Mascotas> getMascotasEnAdopcion() {
        List<Mascotas> mascotas = new ArrayList<>();
        String query = "SELECT idMascotas, nombreMascota, raza, edad, genero, descripcion, " +
                "mascotaEstadoIdMascotaEstado, comentarioCoordinador, usuariosId, albergueId, motivoRechazo " +
                "FROM Mascotas WHERE Estado = 'en adopcion'";
        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Mascotas mascota = new Mascotas();
                mascota.setIdMascotas(rs.getInt("idMascotas"));
                mascota.setNombreMascota(rs.getString("nombreMascota"));
                mascota.setRaza(rs.getString("raza"));
                mascota.setEdad(rs.getInt("edad"));
                mascota.setGenero(rs.getString("genero"));
                mascota.setDescripcion(rs.getString("descripcion"));
                //mascota.setMascotaEstadoIdMascotaEstado(rs.getString("mascotaEstadoIdMascotaEstado"));
                mascota.setComentarioCoordinador(rs.getString("comentarioCoordinador"));
                //mascota.setUsuariosId(rs.getInt("usuariosId"));
                //mascota.setAlbergueId(rs.getInt("albergueId"));
                mascota.setMotivoRechazo(rs.getString("motivoRechazo"));
                mascotas.add(mascota);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return mascotas;
    }
}
