package com.example.webapphr1_2023.Beans;

import java.sql.Time;
import java.util.Date;

import java.util.Date;
import java.sql.Time;

public class Donaciones {
    private int idDonaciones;
    private String cantidadDonacion;
    private Date fechaDonacion;
    private Date fechaEntrega;
    private String puntoEntrega;
    private Usuarios usuario; // Relación con Usuarios (usuario que hace la donación)
    private Time horaEntrega;
    private int tipoDonacionId; // atributo tipoDonacionId (no como objeto ya que no hay tabla relacionada)
    private String marca;
    private Usuarios usuarioAlbergue; // Relación con Usuarios (albergue receptor)
    private DonacionEstado donacionEstado; // Relación con DonacionEstado
    private String motivoRechazo;

    public int getIdDonaciones() {
        return idDonaciones;
    }

    public Donaciones() {
    }

    public void setIdDonaciones(int idDonaciones) {
        this.idDonaciones = idDonaciones;
    }

    public String getCantidadDonacion() {
        return cantidadDonacion;
    }

    public void setCantidadDonacion(String cantidadDonacion) {
        this.cantidadDonacion = cantidadDonacion;
    }

    public Date getFechaDonacion() {
        return fechaDonacion;
    }

    public void setFechaDonacion(Date fechaDonacion) {
        this.fechaDonacion = fechaDonacion;
    }

    public String getPuntoEntrega() {
        return puntoEntrega;
    }

    public void setPuntoEntrega(String puntoEntrega) {
        this.puntoEntrega = puntoEntrega;
    }

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    public Time getHoraEntrega() {
        return horaEntrega;
    }

    public void setHoraEntrega(Time horaEntrega) {
        this.horaEntrega = horaEntrega;
    }

    public int getTipoDonacionId() {
        return tipoDonacionId;
    }

    public void setTipoDonacionId(int tipoDonacionId) {
        this.tipoDonacionId = tipoDonacionId;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Usuarios getUsuarioAlbergue() {
        return usuarioAlbergue;
    }

    public void setUsuarioAlbergue(Usuarios usuarioAlbergue) {
        this.usuarioAlbergue = usuarioAlbergue;
    }

    public DonacionEstado getDonacionEstado() {
        return donacionEstado;
    }

    public void setDonacionEstado(DonacionEstado donacionEstado) {
        this.donacionEstado = donacionEstado;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }
}
