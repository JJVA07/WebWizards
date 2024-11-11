package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.Mascotas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MascotaDao extends DaoBase {

    // Consulta SQL actualizada para unir con la tabla mascota_estado
    private static final String SQL_SELECT_MASCOTAS_ADOPCION = "SELECT m.Nombre_Mascota, m.Descripcion, m.Foto " +
            "FROM mascotas m " +
            "JOIN mascota_estado e ON m.Mascota_estado_idMascota_estado = e.idMascota_estado " +
            "WHERE e.Estado = 'AdopciÃ³n'";


    public List<Mascotas> obtenerMascotasEnAdopcion() {
        List<Mascotas> mascotas = new ArrayList<>();

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_MASCOTAS_ADOPCION);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Mascotas mascota = new Mascotas();
                mascota.setNombreMascota(rs.getString("Nombre_Mascota"));
                mascota.setDescripcion(rs.getString("Descripcion"));
                mascota.setFoto(rs.getBytes("Foto")); // Suponiendo que es un BLOB
                mascotas.add(mascota);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Verificación de la cantidad de mascotas en adopción
        System.out.println("Número de mascotas en adopción: " + mascotas.size());

        return mascotas;
    }
}