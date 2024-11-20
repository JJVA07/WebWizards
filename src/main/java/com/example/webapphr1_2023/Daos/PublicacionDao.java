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
    public int obtenerCantidadTotal() {
        String sql = "SELECT COUNT(*) AS total FROM (" +
                "(SELECT idPublicacion FROM publicacion) " +
                "UNION ALL " +
                "(SELECT idDonaciones FROM donaciones)) AS union_tablas";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            if (rs.next()) {
                return rs.getInt("total");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }
    public List<Publicacion> listarPublicacionesYDonacionesOrdenadas(int offset, int limit) {
        String sql = "(SELECT p.idPublicacion, p.Descripcion, tp.tipo, p.Fecha_publicacion AS fecha, 'publicacion' AS origen " +
                " FROM publicacion p " +
                " LEFT JOIN tipo_publicacion tp ON p.Tipo_publicacion_Tipo_publicacion = tp.Tipo_publicacion) " +
                "UNION ALL " +
                "(SELECT d.idDonaciones AS idPublicacion, d.descripcion, NULL AS tipo, d.Fecha_donacion AS fecha, 'donacion' AS origen " +
                " FROM donaciones d) " +
                "ORDER BY fecha DESC " +
                "LIMIT ? OFFSET ?";

        List<Publicacion> publicaciones = new ArrayList<>();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, limit);
            pstmt.setInt(2, offset);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    Publicacion publicacion = new Publicacion();
                    publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                    publicacion.setDescripcion(rs.getString("descripcion"));
                    publicacion.setFechaPublicacion(rs.getString("fecha"));

                    String tipo = rs.getString("tipo");
                    String origen = rs.getString("origen");

                    if ("publicacion".equalsIgnoreCase(origen)) {
                        if ("denuncia".equalsIgnoreCase(tipo)) {
                            publicacion.setDescripcion("Denuncia por maltrato: " + publicacion.getDescripcion());
                        } else if ("perdida".equalsIgnoreCase(tipo)) {
                            publicacion.setDescripcion("Perrito perdido: " + publicacion.getDescripcion());
                        }
                    } else if ("donacion".equalsIgnoreCase(origen)) {
                        publicacion.setDescripcion("Donación: " + publicacion.getDescripcion());
                    }

                    publicaciones.add(publicacion);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return publicaciones;
    }
    public Publicacion obtenerDenunciaPorId(int id) {
        String sql = "SELECT idPublicacion, Foto, Tamano, Raza, Descripcion, Tipo_maltrato, " +
                "Nombre_maltratador, Direccion_maltrato, Denuncia_policial " +
                "FROM publicacion " +
                "WHERE idPublicacion = ? AND Tipo_publicacion_Tipo_publicacion = (SELECT Tipo_publicacion FROM tipo_publicacion WHERE tipo = 'denuncia')";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Publicacion publicacion = new Publicacion();
                    publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                    publicacion.setFoto(rs.getBytes("Foto"));
                    publicacion.setTamano(rs.getString("Tamano"));
                    publicacion.setRaza(rs.getString("Raza"));
                    publicacion.setDescripcion(rs.getString("Descripcion"));
                    publicacion.setTipoMaltrato(rs.getString("Tipo_maltrato"));
                    publicacion.setNombreMaltratador(rs.getString("Nombre_maltratador"));
                    publicacion.setDireccionMaltrato(rs.getString("Direccion_maltrato"));
                    publicacion.setDenunciaPolicial(rs.getBoolean("Denuncia_policial"));
                    return publicacion;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener la denuncia por ID", e);
        }
        return null;
    }

    public Publicacion obtenerPublicacionPorId(int id) {
        String sql = "SELECT idPublicacion, Descripcion, Foto, Nombre, Edad, Raza, Tamano, Distintivo, Descripcion_adicional, " +
                "Lugar_perdida, HoraPerdida, Telefono, Nombre_contacto, Recompensa, Tipo_publicacion_Tipo_publicacion " +
                "FROM publicacion WHERE idPublicacion = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Publicacion publicacion = new Publicacion();
                    publicacion.setIdPublicacion(rs.getInt("idPublicacion"));
                    publicacion.setDescripcion(rs.getString("Descripcion"));
                    publicacion.setFoto(rs.getBytes("Foto"));
                    publicacion.setNombre(rs.getString("Nombre"));
                    publicacion.setEdad(rs.getInt("Edad"));
                    publicacion.setRaza(rs.getString("Raza"));
                    publicacion.setTamano(rs.getString("Tamano"));
                    publicacion.setDistintivo(rs.getString("Distintivo"));
                    publicacion.setDescripcionAdicional(rs.getString("Descripcion_adicional"));
                    publicacion.setLugarPerdida(rs.getString("Lugar_perdida"));
                    publicacion.setHoraPerdida(rs.getString("Hora_perdida"));
                    publicacion.setTelefono(rs.getString("Telefono"));
                    publicacion.setNombreContacto(rs.getString("Nombre_contacto"));
                    publicacion.setRecompensa(rs.getString("Recompensa"));
                    return publicacion;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al obtener la publicación por ID", e);
        }
        return null;
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