package com.example.webapphr1_2023.Beans;

import java.sql.Time;
import java.util.Date;

public class Donaciones {
    private int idDonaciones;
    private String cantidadDonacion;
    private Date fechaDonacion;
    private Date fechaEntrega;
    private String puntoEntrega;
    private Usuarios usuario; // Relación con Usuarios (usuario que hace la donación)
    private Time horaEntrega;
    private String marca;
    private Usuarios usuarioAlbergue; // Relación con Usuarios (albergue receptor)
    private DonacionEstado donacionEstado; // Relación con DonacionEstado
    private String motivoRechazo;
    private String tipoDonacion;
    private int Donaciones_idDonaciones;
    private Integer Telefono;
    private String Nombre_contacto_albergue;
    private String punto_acopio_donaciones;
    private Date Fechas_programadas_recepcion;
    private Time Hora_recepcion;

    public Integer getTelefono() {
        return Telefono;
    }

    public void setTelefono(Integer telefono) {
        Telefono = telefono;
    }

    public void setFechas_programadas_recepcion(String fechasProgramadasRecepcion) {
        try {
            this.Fechas_programadas_recepcion = java.sql.Date.valueOf(fechasProgramadasRecepcion); // Conversión
        } catch (IllegalArgumentException e) {
            throw new RuntimeException("Formato de fecha inválido. Use YYYY-MM-DD");
        }
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

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public Time getHoraEntrega() {
        return horaEntrega;
    }

    public void setHoraEntrega(Time horaEntrega) {
        this.horaEntrega = horaEntrega;
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

    public String getTipoDonacion() {
        return tipoDonacion;
    }

    public void setTipoDonacion(String tipoDonacion) {
        this.tipoDonacion = tipoDonacion;
    }

    public int getDonaciones_idDonaciones() {
        return Donaciones_idDonaciones;
    }

    public void setDonaciones_idDonaciones(int donaciones_idDonaciones) {
        Donaciones_idDonaciones = donaciones_idDonaciones;
    }



    public String getNombre_contacto_albergue() {
        return Nombre_contacto_albergue;
    }

    public void setNombre_contacto_albergue(String nombre_contacto_albergue) {
        Nombre_contacto_albergue = nombre_contacto_albergue;
    }

    public String getPunto_acopio_donaciones() {
        return punto_acopio_donaciones;
    }

    public void setPunto_acopio_donaciones(String punto_acopio_donaciones) {
        this.punto_acopio_donaciones = punto_acopio_donaciones;
    }

    public Date getFechas_programadas_recepcion() {
        return Fechas_programadas_recepcion;
    }

    public void setFechas_programadas_recepcion(Date fechas_programadas_recepcion) {
        Fechas_programadas_recepcion = fechas_programadas_recepcion;
    }

    public Time getHora_recepcion() {
        return Hora_recepcion;
    }

    public void setHora_recepcion(Time hora_recepcion) {
        Hora_recepcion = hora_recepcion;
    }
}
