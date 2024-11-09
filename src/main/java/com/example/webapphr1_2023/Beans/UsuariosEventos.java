package com.example.webapphr1_2023.Beans;
public class UsuariosEventos {
    private Usuarios usuario; // Relación con Usuarios
    private Eventos evento; // Relación con Eventos

    public UsuariosEventos(Usuarios usuario, Eventos evento) {
        this.usuario = usuario;
        this.evento = evento;
    }

    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    public Eventos getEvento() {
        return evento;
    }

    public void setEvento(Eventos evento) {
        this.evento = evento;
    }
}
