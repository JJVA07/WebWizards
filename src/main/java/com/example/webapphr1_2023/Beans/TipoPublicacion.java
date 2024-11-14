package com.example.webapphr1_2023.Beans;

public class TipoPublicacion {
    int  idTipoPublicacion;
    String Nombre;
    public TipoPublicacion() {}

    public int getIdTipoPublicacion() {
        return idTipoPublicacion;
    }

    public void setIdTipoPublicacion(int idTipoPublicacion) {
        this.idTipoPublicacion = idTipoPublicacion;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }
}
