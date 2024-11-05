package com.example.webapphr1_2023.Beans;

public class EstadoUsuario {
    private int idEstadoUsuario;
    private String estado;

    // Constructor vacío
    public EstadoUsuario() {
    }

    // Constructor con parámetros
    public EstadoUsuario(int idEstadoUsuario, String estado) {
        this.idEstadoUsuario = idEstadoUsuario;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdEstadoUsuario() {
        return idEstadoUsuario;
    }

    public void setIdEstadoUsuario(int idEstadoUsuario) {
        this.idEstadoUsuario = idEstadoUsuario;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
