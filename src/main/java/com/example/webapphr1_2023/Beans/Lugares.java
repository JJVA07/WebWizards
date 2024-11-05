package com.example.webapphr1_2023.Beans;

public class Lugares {
    private int idLugar;
    private String nombreLugar;
    private String direccion;
    private int aforo;

    // Constructor vacío
    public Lugares() {
    }

    // Constructor con parámetros
    public Lugares(int idLugar, String nombreLugar, String direccion, int aforo) {
        this.idLugar = idLugar;
        this.nombreLugar = nombreLugar;
        this.direccion = direccion;
        this.aforo = aforo;
    }

    // Getters y Setters
    public int getIdLugar() {
        return idLugar;
    }

    public void setIdLugar(int idLugar) {
        this.idLugar = idLugar;
    }

    public String getNombreLugar() {
        return nombreLugar;
    }

    public void setNombreLugar(String nombreLugar) {
        this.nombreLugar = nombreLugar;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }
}

