package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.MascotaEstado;
import com.example.webapphr1_2023.Beans.Mascotas;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MascotaDao extends DaoBase {

    // Consulta SQL actualizada para unir con la tabla mascota_estado
    private static final String SQL_SELECT_MASCOTAS_ADOPCION = "SELECT m.Nombre_Mascota, m.Descripcion, m.Foto , m.idMascotas, m.Genero\n" +
            "            FROM mascotas m \n" +
            "            JOIN mascota_estado e ON m.Mascota_estado_idMascota_estado = e.idMascota_estado \n" +
            "            WHERE e.idMascota_estado = 1";


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
                mascota.setIdMascotas((rs.getInt("idMascotas")));
                mascota.setGenero(rs.getString("Genero"));
                mascotas.add(mascota);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Verificación de la cantidad de mascotas en adopción
        System.out.println("Número de mascotas en adopción: " + mascotas.size());

        return mascotas;
    }


    // Consulta SQL para obtener una mascota específica por ID
    private static final String SQL_SELECT_MASCOTA_BY_ID = "SELECT m.idMascotas, m.Nombre_Mascota, m.Descripcion, m.Foto, m.Edad, m.Raza, e.Estado, m.Genero " +
            "FROM mascotas m " +
            "JOIN mascota_estado e ON m.Mascota_estado_idMascota_estado = e.idMascota_estado " +
            "WHERE m.idMascotas = ?";
    // Método para obtener una mascota específica por ID
    public Mascotas obtenerMascotaPorId(int id) {
        Mascotas mascota = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(SQL_SELECT_MASCOTA_BY_ID)) {

            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    mascota = new Mascotas();
                    mascota.setIdMascotas(rs.getInt("idMascotas"));
                    mascota.setNombreMascota(rs.getString("Nombre_Mascota"));
                    mascota.setDescripcion(rs.getString("Descripcion"));
                    mascota.setFoto(rs.getBytes("Foto")); // Suponiendo que es un BLOB
                    mascota.setEdad(rs.getInt("Edad"));
                    mascota.setRaza(rs.getString("Raza"));
                    mascota.setGenero(rs.getString("Genero"));

                    System.out.println(rs.getString("Genero"));

                    // Crear un objeto MascotaEstado y establecer sus valores
                    MascotaEstado estado = new MascotaEstado();
                    estado.setIdMascotaEstado(rs.getInt("idMascota_estado"));
                    estado.setEstado(rs.getString("Estado"));

                    // Asignar el estado a la mascota
                    mascota.setMascotaEstado(estado);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return mascota;
    }
}