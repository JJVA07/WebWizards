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
    private int estadoEventosIdEstadoEventos;
    private int lugaresIdLugar;
    private int tipoDonacionIdTipoDonacion;
    private int albergue;
    private String razon;
    private String artistasInvitados;
    private byte[] foto;
    private String motivoRechazo;
    private int donacionesIdDonaciones;

    // Constructor vacío
    public Eventos() {
    }

    // Constructor con parámetros
    public Eventos(int idEventos, String nombreEvento, Date fecha, Time hora, String lugarEvento, int aforo,
                   String descripcion, String vacantesDisponibles, int estadoEventosIdEstadoEventos, int lugaresIdLugar,
                   int tipoDonacionIdTipoDonacion, int albergue, String razon, String artistasInvitados,
                   byte[] foto, String motivoRechazo, int donacionesIdDonaciones) {
        this.idEventos = idEventos;
        this.nombreEvento = nombreEvento;
        this.fecha = fecha;
        this.hora = hora;
        this.lugarEvento = lugarEvento;
        this.aforo = aforo;
        this.descripcion = descripcion;
        this.vacantesDisponibles = vacantesDisponibles;
        this.estadoEventosIdEstadoEventos = estadoEventosIdEstadoEventos;
        this.lugaresIdLugar = lugaresIdLugar;
        this.tipoDonacionIdTipoDonacion = tipoDonacionIdTipoDonacion;
        this.albergue = albergue;
        this.razon = razon;
        this.artistasInvitados = artistasInvitados;
        this.foto = foto;
        this.motivoRechazo = motivoRechazo;
        this.donacionesIdDonaciones = donacionesIdDonaciones;
    }

    public int getIdEventos() {
        return idEventos;
    }

    public void setIdEventos(int idEventos) {
        this.idEventos = idEventos;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getNombreEvento() {
        return nombreEvento;
    }

    public void setNombreEvento(String nombreEvento) {
        this.nombreEvento = nombreEvento;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getAforo() {
        return aforo;
    }

    public void setAforo(int aforo) {
        this.aforo = aforo;
    }

    public String getVacantesDisponibles() {
        return vacantesDisponibles;
    }

    public void setVacantesDisponibles(String vacantesDisponibles) {
        this.vacantesDisponibles = vacantesDisponibles;
    }

    public int getEstadoEventosIdEstadoEventos() {
        return estadoEventosIdEstadoEventos;
    }

    public void setEstadoEventosIdEstadoEventos(int estadoEventosIdEstadoEventos) {
        this.estadoEventosIdEstadoEventos = estadoEventosIdEstadoEventos;
    }

    public int getLugaresIdLugar() {
        return lugaresIdLugar;
    }

    public void setLugaresIdLugar(int lugaresIdLugar) {
        this.lugaresIdLugar = lugaresIdLugar;
    }

    public int getTipoDonacionIdTipoDonacion() {
        return tipoDonacionIdTipoDonacion;
    }

    public void setTipoDonacionIdTipoDonacion(int tipoDonacionIdTipoDonacion) {
        this.tipoDonacionIdTipoDonacion = tipoDonacionIdTipoDonacion;
    }

    public int getAlbergue() {
        return albergue;
    }

    public void setAlbergue(int albergue) {
        this.albergue = albergue;
    }

    public String getRazon() {
        return razon;
    }

    public void setRazon(String razon) {
        this.razon = razon;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getArtistasInvitados() {
        return artistasInvitados;
    }

    public void setArtistasInvitados(String artistasInvitados) {
        this.artistasInvitados = artistasInvitados;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public int getDonacionesIdDonaciones() {
        return donacionesIdDonaciones;
    }

    public void setDonacionesIdDonaciones(int donacionesIdDonaciones) {
        this.donacionesIdDonaciones = donacionesIdDonaciones;
    }
}
