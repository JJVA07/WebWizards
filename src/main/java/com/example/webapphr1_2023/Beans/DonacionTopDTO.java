package com.example.webapphr1_2023.Beans;

public class DonacionTopDTO {
    private String nombreUsuario;
    private int cantidadDonaciones;

    public DonacionTopDTO(String nombreUsuario, int cantidadDonaciones) {
        this.nombreUsuario = nombreUsuario;
        this.cantidadDonaciones = cantidadDonaciones;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public int getCantidadDonaciones() {
        return cantidadDonaciones;
    }

    public void setCantidadDonaciones(int cantidadDonaciones) {
        this.cantidadDonaciones = cantidadDonaciones;
    }
}
