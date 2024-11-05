package com.example.webapphr1_2023.Beans;

public class Distrito {
    private int idDistrito;
    private String nombre;
    private int zonaIdZona;

    // Constructor vacío
    public Distrito() {
    }

    // Constructor con parámetros
    public Distrito(int idDistrito, String nombre, int zonaIdZona) {
        this.idDistrito = idDistrito;
        this.nombre = nombre;
        this.zonaIdZona = zonaIdZona;
    }

    // Getters y Setters
    public int getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(int idDistrito) {
        this.idDistrito = idDistrito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getZonaIdZona() {
        return zonaIdZona;
    }

    public void setZonaIdZona(int zonaIdZona) {
        this.zonaIdZona = zonaIdZona;
    }
}
