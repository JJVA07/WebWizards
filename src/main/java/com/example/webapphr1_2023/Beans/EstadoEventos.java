package com.example.webapphr1_2023.Beans;

public class EstadoEventos {
    private int idEstadoEventos;
    private String estadoEventos;

    // Constructor vacío
    public EstadoEventos() {
    }

    // Constructor con parámetros
    public EstadoEventos(int idEstadoEventos, String estadoEventos) {
        this.idEstadoEventos = idEstadoEventos;
        this.estadoEventos = estadoEventos;
    }

    // Getters y Setters
    public int getIdEstadoEventos() {
        return idEstadoEventos;
    }

    public void setIdEstadoEventos(int idEstadoEventos) {
        this.idEstadoEventos = idEstadoEventos;
    }

    public String getEstadoEventos() {
        return estadoEventos;
    }

    public void setEstadoEventos(String estadoEventos) {
        this.estadoEventos = estadoEventos;
    }
}
