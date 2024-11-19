package com.example.webapphr1_2023.Daos;
import com.example.webapphr1_2023.Beans.*;

import java.sql.*;

public class AdopcionDao extends DaoBase{
    public boolean createAdopcion(Mascotas nuevaMascota) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Establece la conexión con la base de datos
            connection = DaoBase.getConnection();

            // Consulta SQL ajustada
            String sql = "INSERT INTO mascotas (Nombre_Mascota, Edad, Genero, Descripcion, Raza, Mascota_estado_idMascota_estado, Albergue_ID, Foto) " +
                    "VALUES (?, ?, ?, ?, ?, 1, 7, ?)";

            statement = connection.prepareStatement(sql);

            // Configuración de parámetros dinámicos
            statement.setString(1, nuevaMascota.getNombreMascota());
            statement.setInt(2, nuevaMascota.getEdad());
            statement.setString(3, nuevaMascota.getGenero());
            statement.setString(4, nuevaMascota.getDescripcion());
            statement.setString(5, nuevaMascota.getRaza());
            statement.setBytes(6, nuevaMascota.getFoto());

            // Ejecuta la consulta
            int rowsAffected = statement.executeUpdate();

            // Verifica si se afectó al menos una fila
            return rowsAffected > 0;

        } catch (SQLException e) {
            // Imprime un mensaje detallado en caso de error
            System.err.println("Error al insertar en la tabla 'mascotas': " + e.getMessage());
            e.printStackTrace();
            return false;
        } finally {
            // Cierra los recursos
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                System.err.println("Error al cerrar recursos: " + e.getMessage());
            }
        }
    }


}
