package com.example.webapphr1_2023.Beans;

import java.sql.Time;
import java.util.Date;

public class Donaciones {
    private int idDonaciones;
    private String cantidadDonacion;
    private Date fechaDonacion;
    private Date fechaEntrega;
    private String puntoEntrega;
    private Integer usuariosId;
    private Time horaEntrega;
    private int tipoDonacionIdTipoDonacion;
    private String marca;
    private int usuariosAlbergue;
    private int donacionEstadoIdDonacionEstado;
    private String motivoRechazo;
    private String tipoDonacion;
    private int donacionesIdDonaciones;

    // Constructor vacío
    public Donaciones() {
    }

    // Constructor con parámetros
    public Donaciones(int idDonaciones, String cantidadDonacion, Date fechaDonacion, Date fechaEntrega, String puntoEntrega,
                      Integer usuariosId, Time horaEntrega, int tipoDonacionIdTipoDonacion, String marca,
                      int usuariosAlbergue, int donacionEstadoIdDonacionEstado, String motivoRechazo,
                      String tipoDonacion, int donacionesIdDonaciones) {
        this.idDonaciones = idDonaciones;
        this.cantidadDonacion = cantidadDonacion;
        this.fechaDonacion = fechaDonacion;
        this.fechaEntrega = fechaEntrega;
        this.puntoEntrega = puntoEntrega;
        this.usuariosId = usuariosId;
        this.horaEntrega = horaEntrega;
        this.tipoDonacionIdTipoDonacion = tipoDonacionIdTipoDonacion;
        this.marca = marca;
        this.usuariosAlbergue = usuariosAlbergue;
        this.donacionEstadoIdDonacionEstado = donacionEstadoIdDonacionEstado;
        this.motivoRechazo = motivoRechazo;
        this.tipoDonacion = tipoDonacion;
        this.donacionesIdDonaciones = donacionesIdDonaciones;
    }

    public int getIdDonaciones() {
        return idDonaciones;
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

    public Date getFechaEntrega() {
        return fechaEntrega;
    }

    public void setFechaEntrega(Date fechaEntrega) {
        this.fechaEntrega = fechaEntrega;
    }

    public String getPuntoEntrega() {
        return puntoEntrega;
    }

    public void setPuntoEntrega(String puntoEntrega) {
        this.puntoEntrega = puntoEntrega;
    }

    public Integer getUsuariosId() {
        return usuariosId;
    }

    public void setUsuariosId(Integer usuariosId) {
        this.usuariosId = usuariosId;
    }

    public Time getHoraEntrega() {
        return horaEntrega;
    }

    public void setHoraEntrega(Time horaEntrega) {
        this.horaEntrega = horaEntrega;
    }

    public int getTipoDonacionIdTipoDonacion() {
        return tipoDonacionIdTipoDonacion;
    }

    public void setTipoDonacionIdTipoDonacion(int tipoDonacionIdTipoDonacion) {
        this.tipoDonacionIdTipoDonacion = tipoDonacionIdTipoDonacion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getUsuariosAlbergue() {
        return usuariosAlbergue;
    }

    public void setUsuariosAlbergue(int usuariosAlbergue) {
        this.usuariosAlbergue = usuariosAlbergue;
    }

    public int getDonacionEstadoIdDonacionEstado() {
        return donacionEstadoIdDonacionEstado;
    }

    public void setDonacionEstadoIdDonacionEstado(int donacionEstadoIdDonacionEstado) {
        this.donacionEstadoIdDonacionEstado = donacionEstadoIdDonacionEstado;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public String getTipoDonacion() {
        return tipoDonacion;
    }

    public void setTipoDonacion(String tipoDonacion) {
        this.tipoDonacion = tipoDonacion;
    }

    public int getDonacionesIdDonaciones() {
        return donacionesIdDonaciones;
    }

    public void setDonacionesIdDonaciones(int donacionesIdDonaciones) {
        this.donacionesIdDonaciones = donacionesIdDonaciones;
    }
}
