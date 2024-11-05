package com.example.webapphr1_2023.Beans;

public class Usuarioseventos {
    private int usuariosId;
    private int eventosIdEventos;

    // Constructor vacío
    public Usuarioseventos() {
    }

    // Constructor con parámetros
    public Usuarioseventos(int usuariosId, int eventosIdEventos) {
        this.usuariosId = usuariosId;
        this.eventosIdEventos = eventosIdEventos;
    }

    // Getters y Setters
    public int getUsuariosId() {
        return usuariosId;
    }

    public void setUsuariosId(int usuariosId) {
        this.usuariosId = usuariosId;
    }

    public int getEventosIdEventos() {
        return eventosIdEventos;
    }

    public void setEventosIdEventos(int eventosIdEventos) {
        this.eventosIdEventos = eventosIdEventos;
    }
}
