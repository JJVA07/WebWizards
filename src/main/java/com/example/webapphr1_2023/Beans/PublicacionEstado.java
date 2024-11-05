package com.example.webapphr1_2023.Beans;

public class PublicacionEstado {
    private int idPublicacionEstado;
    private String estado;

    // Constructor vacío
    public PublicacionEstado() {
    }

    // Constructor con parámetros
    public PublicacionEstado(int idPublicacionEstado, String estado) {
        this.idPublicacionEstado = idPublicacionEstado;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdPublicacionEstado() {
        return idPublicacionEstado;
    }

    public void setIdPublicacionEstado(int idPublicacionEstado) {
        this.idPublicacionEstado = idPublicacionEstado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
