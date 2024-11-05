package com.example.webapphr1_2023.Beans;

public class TipoPublicacion {
    private int tipoPublicacion;
    private String tipo;

    // Constructor vacío
    public TipoPublicacion() {
    }

    // Constructor con parámetros
    public TipoPublicacion(int tipoPublicacion, String tipo) {
        this.tipoPublicacion = tipoPublicacion;
        this.tipo = tipo;
    }

    // Getters y Setters
    public int getTipoPublicacion() {
        return tipoPublicacion;
    }

    public void setTipoPublicacion(int tipoPublicacion) {
        this.tipoPublicacion = tipoPublicacion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}

