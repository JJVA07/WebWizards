package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.MascotaEstado;
import com.example.webapphr1_2023.Beans.Mascotas;
import com.example.webapphr1_2023.Beans.Publicacion;
import com.example.webapphr1_2023.Beans.TipoPublicacion;

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
    // Método para obtener las publicaciones de un usuario
    public List<Publicacion> obtenerPublicacionesPorUsuario(int idUsuario) {
        List<Publicacion> publicaciones = new ArrayList<>();

        String sql = "SELECT p.*, tp.tipo AS tipo_publicacion " +
                "FROM publicacion p " +
                "INNER JOIN tipo_publicacion tp ON p.Tipo_publicacion_Tipo_publicacion = tp.Tipo_publicacion " +
                "WHERE p.Usuarios_ID = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Publicacion publicacion = new Publicacion();
                publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                publicacion.setDescripcion(rs.getString("Descripcion"));
                publicacion.setNombre(rs.getString("Nombre"));
                publicacion.setFoto(rs.getBytes("Foto"));

                // Asignar el nombre del maltratador
                publicacion.setNombreMaltratador(rs.getString("Nombre_maltratador"));

                // Cargar el tipo de publicación
                TipoPublicacion tipoPublicacion = new TipoPublicacion();
                tipoPublicacion.setIdTipoPublicacion(rs.getInt("Tipo_publicacion_Tipo_publicacion"));
                tipoPublicacion.setNombre(rs.getString("tipo_publicacion"));
                publicacion.setTipoPublicacion(tipoPublicacion);

                publicaciones.add(publicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return publicaciones;
    }

    // Eliminar una publicación por su ID
    public void eliminarPublicacion(int idPublicacion) {
        String query = "DELETE FROM publicacion WHERE idPublicacion = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, idPublicacion);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al eliminar publicación: " + e.getMessage());
        }
    }
    public void actualizarPublicacion(Publicacion publicacion) {
        String sql = "UPDATE publicacion SET " +
                "Nombre = ?, Edad = ?, Raza = ?, Tamano = ?, Distintivo = ?, " +
                "Nombre_contacto = ?, Lugar_perdida = ?, Telefono = ?, " +
                "Descripcion = ?, Descripcion_adicional = ?, " +
                "Nombre_maltratador = ?, Tipo_maltrato = ?, Direccion_maltrato = ?, Denuncia_policial = ? " +
                (publicacion.getFoto() != null ? ", Foto = ? " : "") + // Solo actualizar Foto si existe
                "WHERE idPublicacion = ?";

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            int index = 1;

            stmt.setString(index++, publicacion.getNombre());
            stmt.setObject(index++, publicacion.getEdad());
            stmt.setString(index++, publicacion.getRaza());
            stmt.setString(index++, publicacion.getTamano());
            stmt.setString(index++, publicacion.getDistintivo());
            stmt.setString(index++, publicacion.getNombreContacto());
            stmt.setString(index++, publicacion.getLugarPerdida());
            stmt.setString(index++, publicacion.getTelefono());
            stmt.setString(index++, publicacion.getDescripcion());
            stmt.setString(index++, publicacion.getDescripcionAdicional());
            stmt.setString(index++, publicacion.getNombreMaltratador());
            stmt.setString(index++, publicacion.getTipoMaltrato());
            stmt.setString(index++, publicacion.getDireccionMaltrato());
            stmt.setBoolean(index++, publicacion.getDenunciaPolicial());

            // Solo establecer la imagen si no es null
            if (publicacion.getFoto() != null) {
                stmt.setBytes(index++, publicacion.getFoto());
            }

            stmt.setInt(index, publicacion.getIdPublicacion());
            stmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al actualizar la publicación: " + e.getMessage());
        }
    }




    public Publicacion obtenerPublicacionPorId(int idPublicacion) {
        String sql = "SELECT p.*, tp.Tipo_publicacion AS idTipoPublicacion, tp.tipo AS nombreTipoPublicacion " +
                "FROM publicacion p " +
                "INNER JOIN tipo_publicacion tp ON p.Tipo_publicacion_Tipo_publicacion = tp.Tipo_publicacion " +
                "WHERE p.idPublicacion = ?";
        Publicacion publicacion = null;

        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idPublicacion);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                publicacion = new Publicacion();
                publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                publicacion.setNombre(rs.getString("Nombre"));
                publicacion.setEdad(rs.getInt("Edad"));
                publicacion.setRaza(rs.getString("Raza"));
                publicacion.setTamano(rs.getString("Tamano"));
                publicacion.setDistintivo(rs.getString("Distintivo"));
                publicacion.setNombreContacto(rs.getString("Nombre_contacto"));
                publicacion.setLugarPerdida(rs.getString("Lugar_perdida"));
                publicacion.setHoraPerdida(rs.getString("Hora_perdida"));
                publicacion.setTelefono(rs.getString("Telefono"));
                publicacion.setDescripcion(rs.getString("Descripcion"));
                publicacion.setDescripcionAdicional(rs.getString("Descripcion_adicional"));
                publicacion.setRecompensa(rs.getString("Recompensa"));
                publicacion.setNombreMaltratador(rs.getString("Nombre_maltratador"));
                publicacion.setTipoMaltrato(rs.getString("Tipo_maltrato"));
                publicacion.setDireccionMaltrato(rs.getString("Direccion_maltrato"));
                publicacion.setDenunciaPolicial(rs.getBoolean("Denuncia_policial"));

                // Crear y asignar el TipoPublicacion
                TipoPublicacion tipoPublicacion = new TipoPublicacion();
                tipoPublicacion.setIdTipoPublicacion(rs.getInt("idTipoPublicacion"));
                tipoPublicacion.setNombre(rs.getString("nombreTipoPublicacion"));
                publicacion.setTipoPublicacion(tipoPublicacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error al obtener la publicación por ID: " + e.getMessage());
        }

        return publicacion;
    }







}