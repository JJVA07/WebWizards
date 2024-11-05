package com.example.webapphr1_2023.Beans;

public class Mascotas {
    private int idMascotas;
    private String nombreMascota;
    private String raza;
    private int edad;
    private String genero; // 'Macho' o 'Hembra'
    private String descripcion;
    private int mascotaEstadoIdMascotaEstado;
    private String comentarioCoordinador;
    private Integer usuariosId;
    private int albergueId;
    private String motivoRechazo;

    // Constructor vacío
    public Mascotas() {
    }

    // Constructor con parámetros
    public Mascotas(int idMascotas, String nombreMascota, String raza, int edad, String genero, String descripcion,
                    int mascotaEstadoIdMascotaEstado, String comentarioCoordinador, Integer usuariosId,
                    int albergueId, String motivoRechazo) {
        this.idMascotas = idMascotas;
        this.nombreMascota = nombreMascota;
        this.raza = raza;
        this.edad = edad;
        this.genero = genero;
        this.descripcion = descripcion;
        this.mascotaEstadoIdMascotaEstado = mascotaEstadoIdMascotaEstado;
        this.comentarioCoordinador = comentarioCoordinador;
        this.usuariosId = usuariosId;
        this.albergueId = albergueId;
        this.motivoRechazo = motivoRechazo;
    }

    public int getIdMascotas() {
        return idMascotas;
    }

    public void setIdMascotas(int idMascotas) {
        this.idMascotas = idMascotas;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getNombreMascota() {
        return nombreMascota;
    }

    public void setNombreMascota(String nombreMascota) {
        this.nombreMascota = nombreMascota;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getMascotaEstadoIdMascotaEstado() {
        return mascotaEstadoIdMascotaEstado;
    }

    public void setMascotaEstadoIdMascotaEstado(int mascotaEstadoIdMascotaEstado) {
        this.mascotaEstadoIdMascotaEstado = mascotaEstadoIdMascotaEstado;
    }

    public String getComentarioCoordinador() {
        return comentarioCoordinador;
    }

    public void setComentarioCoordinador(String comentarioCoordinador) {
        this.comentarioCoordinador = comentarioCoordinador;
    }

    public Integer getUsuariosId() {
        return usuariosId;
    }

    public void setUsuariosId(Integer usuariosId) {
        this.usuariosId = usuariosId;
    }

    public int getAlbergueId() {
        return albergueId;
    }

    public void setAlbergueId(int albergueId) {
        this.albergueId = albergueId;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }
}
