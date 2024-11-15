package com.example.webapphr1_2023.Daos;

import com.example.webapphr1_2023.Beans.*;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

public class AlbergueDao extends DaoBase {

    public Usuarios obtenerAlbergue(int id) {
        Usuarios albergue = null;

        String sql = "SELECT " +
                "    u.Nombre_albergue AS NombreDelAlbergue, " +
                "    CONCAT(u.Nombre, ' ', u.Apellido) AS Encargado, " +
                "    u.Telefono, " +
                "    d.Nombre AS Distrito, " +
                "    u.Direccion, " +
                "    u.Punto_acopio_donaciones, " +
                "    u.Url_fbig AS UrlRedesSociales, " +
                "    u.Numero_donaciones AS NumeroContactoDonaciones " +
                "FROM " +
                "    Usuarios u " +
                "JOIN " +
                "    Distrito d ON u.Distrito_idDistrito = d.idDistrito " +
                "WHERE " +
                "    u.ID = ? " +
                "    AND u.Rol_idRol = 2";

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, 7);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    albergue = new Usuarios();

                    // Asigna los valores obtenidos desde el ResultSet
                    albergue.setNombreAlbergue(rs.getString("NombreDelAlbergue"));
                    albergue.setNombre(rs.getString("Encargado"));
                    albergue.setTelefono(rs.getInt("Telefono"));

                    // Crear y asignar el objeto Distrito
                    Distrito distrito = new Distrito();
                    distrito.setNombre(rs.getString("Distrito"));
                    albergue.setDistrito(distrito);

                    albergue.setDireccion(rs.getString("Direccion"));
                    albergue.setPuntoAcopioDonaciones(rs.getString("Punto_acopio_donaciones"));
                    albergue.setUrlFbig(rs.getString("UrlRedesSociales"));
                    albergue.setNumeroDonaciones(rs.getInt("NumeroContactoDonaciones"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return albergue;
    }

    public void actualizarAlbergue(Usuarios albergue) {
        String sql = "UPDATE Usuarios SET " +
                "Nombre_albergue = ?, " +
                "Telefono = ?, " +
                "Direccion = ?, " +
                "Punto_acopio_donaciones = ?, " +
                "Url_fbig = ?, " +
                "Numero_donaciones = ? " +
                "WHERE ID = ? AND Rol_idRol = 2";  // ID dinámico y Rol_idRol se mantiene como filtro

        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Asignar los valores al PreparedStatement
            pstmt.setString(1, albergue.getNombreAlbergue());
            pstmt.setInt(2, albergue.getTelefono());
            pstmt.setString(3, albergue.getDireccion());
            pstmt.setString(4, albergue.getPuntoAcopioDonaciones());
            pstmt.setString(5, albergue.getUrlFbig());
            pstmt.setInt(6, albergue.getNumeroDonaciones());
            pstmt.setInt(7, albergue.getId()); // ID dinámico

            pstmt.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Mascotas> listaTemporales(int id_albergue){
        List<Mascotas> temporales = new ArrayList<>();
        String sql = "SELECT " +
                "m.idMascotas AS idMascota, " +
                "m.Nombre_Mascota AS nombreMascota, " +
                "m.Edad AS edad, " +
                "m.Genero AS genero, " +
                "m.Comentario_Coordinador AS comentarioCoordinador, " +
                "u.Telefono AS telefonoUsuario " +
                "FROM mascotas m " +
                "JOIN usuarios u ON m.Usuarios_ID = u.ID " +
                "WHERE m.Albergue_ID = ?"; // Filtrar por id_albergue

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Asignar el ID del albergue al parámetro
            pstmt.setInt(1, id_albergue);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // Crear un objeto Mascotas
                    Mascotas mascota = new Mascotas();
                    mascota.setIdMascotas(rs.getInt("idMascota"));
                    mascota.setNombreMascota(rs.getString("nombreMascota"));
                    mascota.setEdad(rs.getInt("edad"));
                    mascota.setGenero(rs.getString("genero"));
                    mascota.setComentarioCoordinador(rs.getString("comentarioCoordinador"));

                    // Asignar el teléfono al usuario dentro de Mascotas
                    Usuarios usuario = new Usuarios();
                    usuario.setTelefono(rs.getInt("telefonoUsuario"));
                    mascota.setUsuario(usuario); // Asocia el usuario con la mascota

                    // Agregar la mascota a la lista
                    temporales.add(mascota);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return temporales;
    }

    public List<Donaciones> obtenerDonacionesPorAlbergue(int AlbergueId){
        List<Donaciones> listaDonaciones  = new ArrayList<>();
        String sql = "SELECT " +
                "u.Telefono AS telefonoContacto, " +
                "CONCAT(u.Nombre, ' ', u.Apellido) AS nombreContacto, " +
                "d.punto_entrega AS puntoEventos, " +
                "d.Tipo_donacion AS tipoDonacion, " +
                "d.Cantidad_donacion AS cantidadDonaciones, " +
                "d.Fecha_Donacion AS fechasRecepcion, " +
                "d.Hora_entrega AS horasRecepcion " +
                "FROM donaciones d " +
                "JOIN usuarios u ON d.Usuarios_ID = u.ID " +
                "WHERE d.Usuarios_albergue = ?";

        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Asignar el valor del filtro para Usuarios_albergue
            pstmt.setInt(1, AlbergueId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {

                    Donaciones donacion = new Donaciones();

                    Usuarios usuario = new Usuarios();
                    usuario.setTelefono(rs.getInt("telefonoContacto"));
                    usuario.setNombre(rs.getString("nombreContacto"));
                    donacion.setUsuario(usuario);

                    donacion.setPuntoEntrega(rs.getString("puntoEventos"));
                    donacion.setTipoDonacion(rs.getString("tipoDonacion"));
                    donacion.setCantidadDonacion(rs.getString("cantidadDonaciones"));
                    donacion.setFechaDonacion(rs.getDate("fechasRecepcion"));
                    donacion.setHoraEntrega(rs.getTime("horasRecepcion"));

                    // Agregar a la lista
                    listaDonaciones.add(donacion);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return listaDonaciones;
    }

    public List<Mascotas> obtenerAdopciones(int albergueId){

        List<Mascotas> listaAdopciones = new ArrayList<>();

        String sql = "SELECT " +
                "m.Nombre_Mascota AS nombre, " +
                "m.Edad AS edad, " +
                "m.Genero AS genero, " +
                "m.Comentario_Coordinador AS comentarios, " +
                "m.Descripcion AS descripcion " +
                "FROM mascotas m " +
                "WHERE m.Albergue_ID = ? " +
                "AND m.Mascota_estado_idMascota_estado = 3";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            // Asignar el ID del albergue al parámetro de la consulta
            pstmt.setInt(1, albergueId);

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    // Crear una nueva instancia de Mascotas y asignar valores
                    Mascotas mascota = new Mascotas();
                    mascota.setNombreMascota(rs.getString("nombre"));
                    mascota.setEdad(rs.getInt("edad"));
                    mascota.setGenero(rs.getString("genero"));
                    mascota.setComentarioCoordinador(rs.getString("comentarios"));
                    mascota.setDescripcion(rs.getString("descripcion"));

                    // Agregar la mascota a la lista de adopciones
                    listaAdopciones.add(mascota);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaAdopciones;
    }

}

