package com.example.webapphr1_2023.Beans;

public class PostulacionEstado {
    private int idPostulacionEstado;
    private String postulacionEstadoCol;

    // Constructor vacío
    public PostulacionEstado() {
    }

    // Constructor con parámetros
    public PostulacionEstado(int idPostulacionEstado, String postulacionEstadoCol) {
        this.idPostulacionEstado = idPostulacionEstado;
        this.postulacionEstadoCol = postulacionEstadoCol;
    }

    // Getters y Setters
    public int getIdPostulacionEstado() {
        return idPostulacionEstado;
    }

    public void setIdPostulacionEstado(int idPostulacionEstado) {
        this.idPostulacionEstado = idPostulacionEstado;
    }

    public String getPostulacionEstadoCol() {
        return postulacionEstadoCol;
    }

    public void setPostulacionEstadoCol(String postulacionEstadoCol) {
        this.postulacionEstadoCol = postulacionEstadoCol;
    }
}
