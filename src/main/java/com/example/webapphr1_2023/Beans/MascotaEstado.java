package com.example.webapphr1_2023.Beans;

public class MascotaEstado {
    private int idMascotaEstado;
    private String estado;

    // Constructor vacío
    public MascotaEstado() {
    }

    // Constructor con parámetros
    public MascotaEstado(int idMascotaEstado, String estado) {
        this.idMascotaEstado = idMascotaEstado;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdMascotaEstado() {
        return idMascotaEstado;
    }

    public void setIdMascotaEstado(int idMascotaEstado) {
        this.idMascotaEstado = idMascotaEstado;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}
