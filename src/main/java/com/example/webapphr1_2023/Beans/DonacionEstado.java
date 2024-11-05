package com.example.webapphr1_2023.Beans;

public class DonacionEstado {
    private int idDonacionEstado;
    private String donacionEstado;

    // Constructor vacío
    public DonacionEstado() {
    }

    // Constructor con parámetros
    public DonacionEstado(int idDonacionEstado, String donacionEstado) {
        this.idDonacionEstado = idDonacionEstado;
        this.donacionEstado = donacionEstado;
    }

    // Getters y Setters
    public int getIdDonacionEstado() {
        return idDonacionEstado;
    }

    public void setIdDonacionEstado(int idDonacionEstado) {
        this.idDonacionEstado = idDonacionEstado;
    }

    public String getDonacionEstado() {
        return donacionEstado;
    }

    public void setDonacionEstado(String donacionEstado) {
        this.donacionEstado = donacionEstado;
    }
}
