package com.example.webapphr1_2023.Beans;

public class Rol {
    private int idRol;
    private String nombre;

    // Constructor vacío
    public Rol() {
    }

    // Constructor con parámetros
    public Rol(int idRol, String nombre) {
        this.idRol = idRol;
        this.nombre = nombre;
    }

    // Getters y Setters
    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
