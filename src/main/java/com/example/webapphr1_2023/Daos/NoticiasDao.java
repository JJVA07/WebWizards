package com.example.webapphr1_2023.Daos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoticiasDao extends DaoBase{

    public List<Object[]> obtenerNoticiasMezcladas() {
        List<Object[]> noticias = new ArrayList<>();

        String query = "(SELECT 'Evento' AS tipo, Nombre_Evento AS titulo, Fecha AS fecha, Descripcion AS descripcion, Foto AS foto " +
                "FROM eventos " +
                "WHERE Estado_eventos_idEstado_eventos = 2) " +
                "UNION ALL " +
                "(SELECT 'Publicacion' AS tipo, Nombre AS titulo, Fecha_publicacion AS fecha, Descripcion AS descripcion, Foto AS foto " +
                "FROM publicacion " +
                "WHERE Publicacion_estado_idPublicacion_estado = 1) " +
                "ORDER BY fecha DESC";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Object[] noticia = new Object[5];
                noticia[0] = rs.getString("tipo");          // Tipo (Evento o Publicacion)
                noticia[1] = rs.getString("titulo");        // Título del evento/publicación
                noticia[2] = rs.getDate("fecha");           // Fecha
                noticia[3] = rs.getString("descripcion");   // Descripción
                noticia[4] = rs.getBytes("foto");           // Foto en byte[]
                noticias.add(noticia);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al obtener las noticias: " + e.getMessage());
        }
        return noticias;
    }
}
