package com.example.webapphr1_2023.Beans;

public class DonacionMesDTO {
    private String mes;
    private int cantidadDonaciones;

    public DonacionMesDTO(String mes, int cantidadDonaciones) {
        this.mes = mes;
        this.cantidadDonaciones = cantidadDonaciones;
    }

    public String getMes() {
        return mes;
    }

    public void setMes(String mes) {
        this.mes = mes;
    }

    public int getCantidadDonaciones() {
        return cantidadDonaciones;
    }

    public void setCantidadDonaciones(int cantidadDonaciones) {
        this.cantidadDonaciones = cantidadDonaciones;
    }
}
