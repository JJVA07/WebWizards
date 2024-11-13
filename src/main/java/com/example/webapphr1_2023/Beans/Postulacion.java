package com.example.webapphr1_2023.Beans;

import java.util.Date;

public class Postulacion {
    private int idPostulacion;
    private Integer cantidadCuartos;
    private Double metrajeVivienda;
    private Integer cantidadMascotas;
    private String tipoMascotas;
    private Boolean tieneHijos;
    private Boolean viveConDependientes;
    private Boolean trabajaRemoto;
    private byte[] fotosLugar;
    private String personaReferencia;
    private String telefonoReferencia;
    private Integer tiempoTemporal;
    private Date fechaInicioTemporal;
    private Date fechaFinTemporal;
    private PostulacionEstado postulacionEstado; // Relación con PostulacionEstado
    private Usuarios usuario; // Relación con Usuarios (usuario que hace la postulación)
    private Boolean tieneMascotas;
    private String nombre;
    private String apellido;
    private String edad;
    private String genero;
    private String celular;
    private String direccion;
    private Distrito distrito; // Relación con Distrito
    private String visitaInopinada;
    private String fechaInopinada;
    private String horaInopinada;
    private String motivoRechazo;
    private Mascotas mascota; // Relación con Mascotas

    public Postulacion() {
    }

    public int getIdPostulacion() {
        return idPostulacion;
    }

    public void setIdPostulacion(int idPostulacion) {
        this.idPostulacion = idPostulacion;
    }

    public Integer getCantidadCuartos() {
        return cantidadCuartos;
    }

    public void setCantidadCuartos(Integer cantidadCuartos) {
        this.cantidadCuartos = cantidadCuartos;
    }

    public Double getMetrajeVivienda() {
        return metrajeVivienda;
    }

    public void setMetrajeVivienda(Double metrajeVivienda) {
        this.metrajeVivienda = metrajeVivienda;
    }

    public Integer getCantidadMascotas() {
        return cantidadMascotas;
    }

    public void setCantidadMascotas(Integer cantidadMascotas) {
        this.cantidadMascotas = cantidadMascotas;
    }

    public String getTipoMascotas() {
        return tipoMascotas;
    }

    public void setTipoMascotas(String tipoMascotas) {
        this.tipoMascotas = tipoMascotas;
    }

    public Boolean getTieneHijos() {
        return tieneHijos;
    }

    public void setTieneHijos(Boolean tieneHijos) {
        this.tieneHijos = tieneHijos;
    }

    public Boolean getViveConDependientes() {
        return viveConDependientes;
    }

    public void setViveConDependientes(Boolean viveConDependientes) {
        this.viveConDependientes = viveConDependientes;
    }

    public byte[] getFotosLugar() {
        return fotosLugar;
    }

    public void setFotosLugar(byte[] fotosLugar) {
        this.fotosLugar = fotosLugar;
    }

    public Boolean getTrabajaRemoto() {
        return trabajaRemoto;
    }

    public void setTrabajaRemoto(Boolean trabajaRemoto) {
        this.trabajaRemoto = trabajaRemoto;
    }

    public String getPersonaReferencia() {
        return personaReferencia;
    }

    public void setPersonaReferencia(String personaReferencia) {
        this.personaReferencia = personaReferencia;
    }

    public Integer getTiempoTemporal() {
        return tiempoTemporal;
    }

    public void setTiempoTemporal(Integer tiempoTemporal) {
        this.tiempoTemporal = tiempoTemporal;
    }

    public String getTelefonoReferencia() {
        return telefonoReferencia;
    }

    public void setTelefonoReferencia(String telefonoReferencia) {
        this.telefonoReferencia = telefonoReferencia;
    }

    public Date getFechaInicioTemporal() {
        return fechaInicioTemporal;
    }

    public void setFechaInicioTemporal(Date fechaInicioTemporal) {
        this.fechaInicioTemporal = fechaInicioTemporal;
    }

    public Date getFechaFinTemporal() {
        return fechaFinTemporal;
    }

    public void setFechaFinTemporal(Date fechaFinTemporal) {
        this.fechaFinTemporal = fechaFinTemporal;
    }

    public PostulacionEstado getPostulacionEstado() {
        return postulacionEstado;
    }

    public void setPostulacionEstado(PostulacionEstado postulacionEstado) {
        this.postulacionEstado = postulacionEstado;
    }

    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    public Boolean getTieneMascotas() {
        return tieneMascotas;
    }

    public void setTieneMascotas(Boolean tieneMascotas) {
        this.tieneMascotas = tieneMascotas;
    }

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getVisitaInopinada() {
        return visitaInopinada;
    }

    public void setVisitaInopinada(String visitaInopinada) {
        this.visitaInopinada = visitaInopinada;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

    public String getFechaInopinada() {
        return fechaInopinada;
    }

    public void setFechaInopinada(String fechaInopinada) {
        this.fechaInopinada = fechaInopinada;
    }

    public String getHoraInopinada() {
        return horaInopinada;
    }

    public void setHoraInopinada(String horaInopinada) {
        this.horaInopinada = horaInopinada;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public Mascotas getMascota() {
        return mascota;
    }

    public void setMascota(Mascotas mascota) {
        this.mascota = mascota;
    }
}
