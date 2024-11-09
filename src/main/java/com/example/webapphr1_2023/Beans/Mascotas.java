package com.example.webapphr1_2023.Beans;

public class Mascotas {
    private int idMascotas;
    private String nombreMascota;
    private String raza;
    private int edad;
    private String genero;
    private String descripcion;
    private MascotaEstado mascotaEstado; // Relación con MascotaEstado
    private String comentarioCoordinador;
    private Usuarios usuario; // Relación con Usuarios (usuario responsable)
    private Usuarios albergue; // Relación con Usuarios (albergue donde se encuentra la mascota)
    private String motivoRechazo;
    private byte[] foto;

    public Mascotas() {
    }

    public int getIdMascotas() {
        return idMascotas;
    }

    public void setIdMascotas(int idMascotas) {
        this.idMascotas = idMascotas;
    }

    public String getNombreMascota() {
        return nombreMascota;
    }

    public void setNombreMascota(String nombreMascota) {
        this.nombreMascota = nombreMascota;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public MascotaEstado getMascotaEstado() {
        return mascotaEstado;
    }

    public void setMascotaEstado(MascotaEstado mascotaEstado) {
        this.mascotaEstado = mascotaEstado;
    }

    public String getComentarioCoordinador() {
        return comentarioCoordinador;
    }

    public void setComentarioCoordinador(String comentarioCoordinador) {
        this.comentarioCoordinador = comentarioCoordinador;
    }

    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    public Usuarios getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Usuarios albergue) {
        this.albergue = albergue;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }
// Getters y Setters
}
