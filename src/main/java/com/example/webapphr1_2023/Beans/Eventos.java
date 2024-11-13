package com.example.webapphr1_2023.Beans;
import java.sql.Time;
import java.util.Date;
public class Eventos {
    private int idEventos;
    private String nombreEvento;
    private Date fecha;
    private Time hora;
    private String lugarEvento;
    private int aforo;
    private String descripcion;
    private String vacantesDisponibles;
    private EstadoEventos estadoEventos; // Relación con EstadoEventos
    private Lugares lugar; // Relación con Lugares
    private Usuarios albergue; // Relación con Usuarios (albergue)
    private String razon;
    private String artistasInvitados;
    private byte[] foto;
    private String motivoRechazo;
    private Donaciones donaciones;

    public int getIdEventos() {
        return idEventos;
    }

    public void setIdEventos(int idEventos) {
        this.idEventos = idEventos;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Time getHora() {
        return hora;
    }

    public void setHora(Time hora) {
        this.hora = hora;
    }

    public String getLugarEvento() {
        return lugarEvento;
    }

    public void setLugarEvento(String lugarEvento) {
        this.lugarEvento = lugarEvento;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public EstadoEventos getEstadoEventos() {
        return estadoEventos;
    }

    public void setEstadoEventos(EstadoEventos estadoEventos) {
        this.estadoEventos = estadoEventos;
    }

    public String getVacantesDisponibles() {
        return vacantesDisponibles;
    }

    public void setVacantesDisponibles(String vacantesDisponibles) {
        this.vacantesDisponibles = vacantesDisponibles;
    }

    public Lugares getLugar() {
        return lugar;
    }

    public void setLugar(Lugares lugar) {
        this.lugar = lugar;
    }

    public Usuarios getAlbergue() {
        return albergue;
    }

    public void setAlbergue(Usuarios albergue) {
        this.albergue = albergue;
    }

    public String getRazon() {
        return razon;
    }

    public void setRazon(String razon) {
        this.razon = razon;
    }

    public String getArtistasInvitados() {
        return artistasInvitados;
    }

    public void setArtistasInvitados(String artistasInvitados) {
        this.artistasInvitados = artistasInvitados;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public Donaciones getDonaciones() {
        return donaciones;
    }

    public void setDonaciones(Donaciones donaciones) {
        this.donaciones = donaciones;
    }
}