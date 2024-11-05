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
    private int postulacionEstadoIdPostulacionEstado;
    private int usuariosId;
    private String tieneMascotas;
    private String nombre;
    private String apellido;
    private String edad;
    private String genero;
    private String celular;
    private String direccion;
    private Integer distritoIdDistrito;
    private String visitaInopinada;
    private String fechaInopinada;
    private String horaInopinada;
    private String motivoRechazo;
    private int mascotasIdMascotas;

    // Constructor vacío
    public Postulacion() {
    }

    // Constructor con parámetros
    public Postulacion(int idPostulacion, Integer cantidadCuartos, Double metrajeVivienda, Integer cantidadMascotas,
                       String tipoMascotas, Boolean tieneHijos, Boolean viveConDependientes, Boolean trabajaRemoto,
                       byte[] fotosLugar, String personaReferencia, String telefonoReferencia, Integer tiempoTemporal,
                       Date fechaInicioTemporal, Date fechaFinTemporal, int postulacionEstadoIdPostulacionEstado,
                       int usuariosId, String tieneMascotas, String nombre, String apellido, String edad, String genero,
                       String celular, String direccion, Integer distritoIdDistrito, String visitaInopinada,
                       String fechaInopinada, String horaInopinada, String motivoRechazo, int mascotasIdMascotas) {
        this.idPostulacion = idPostulacion;
        this.cantidadCuartos = cantidadCuartos;
        this.metrajeVivienda = metrajeVivienda;
        this.cantidadMascotas = cantidadMascotas;
        this.tipoMascotas = tipoMascotas;
        this.tieneHijos = tieneHijos;
        this.viveConDependientes = viveConDependientes;
        this.trabajaRemoto = trabajaRemoto;
        this.fotosLugar = fotosLugar;
        this.personaReferencia = personaReferencia;
        this.telefonoReferencia = telefonoReferencia;
        this.tiempoTemporal = tiempoTemporal;
        this.fechaInicioTemporal = fechaInicioTemporal;
        this.fechaFinTemporal = fechaFinTemporal;
        this.postulacionEstadoIdPostulacionEstado = postulacionEstadoIdPostulacionEstado;
        this.usuariosId = usuariosId;
        this.tieneMascotas = tieneMascotas;
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
        this.genero = genero;
        this.celular = celular;
        this.direccion = direccion;
        this.distritoIdDistrito = distritoIdDistrito;
        this.visitaInopinada = visitaInopinada;
        this.fechaInopinada = fechaInopinada;
        this.horaInopinada = horaInopinada;
        this.motivoRechazo = motivoRechazo;
        this.mascotasIdMascotas = mascotasIdMascotas;
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

    public Boolean getTrabajaRemoto() {
        return trabajaRemoto;
    }

    public void setTrabajaRemoto(Boolean trabajaRemoto) {
        this.trabajaRemoto = trabajaRemoto;
    }

    public byte[] getFotosLugar() {
        return fotosLugar;
    }

    public void setFotosLugar(byte[] fotosLugar) {
        this.fotosLugar = fotosLugar;
    }

    public String getPersonaReferencia() {
        return personaReferencia;
    }

    public void setPersonaReferencia(String personaReferencia) {
        this.personaReferencia = personaReferencia;
    }

    public String getTelefonoReferencia() {
        return telefonoReferencia;
    }

    public void setTelefonoReferencia(String telefonoReferencia) {
        this.telefonoReferencia = telefonoReferencia;
    }

    public Integer getTiempoTemporal() {
        return tiempoTemporal;
    }

    public void setTiempoTemporal(Integer tiempoTemporal) {
        this.tiempoTemporal = tiempoTemporal;
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

    public int getPostulacionEstadoIdPostulacionEstado() {
        return postulacionEstadoIdPostulacionEstado;
    }

    public void setPostulacionEstadoIdPostulacionEstado(int postulacionEstadoIdPostulacionEstado) {
        this.postulacionEstadoIdPostulacionEstado = postulacionEstadoIdPostulacionEstado;
    }

    public int getUsuariosId() {
        return usuariosId;
    }

    public void setUsuariosId(int usuariosId) {
        this.usuariosId = usuariosId;
    }

    public String getTieneMascotas() {
        return tieneMascotas;
    }

    public void setTieneMascotas(String tieneMascotas) {
        this.tieneMascotas = tieneMascotas;
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

    public String getEdad() {
        return edad;
    }

    public void setEdad(String edad) {
        this.edad = edad;
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

    public Integer getDistritoIdDistrito() {
        return distritoIdDistrito;
    }

    public void setDistritoIdDistrito(Integer distritoIdDistrito) {
        this.distritoIdDistrito = distritoIdDistrito;
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

    public int getMascotasIdMascotas() {
        return mascotasIdMascotas;
    }

    public void setMascotasIdMascotas(int mascotasIdMascotas) {
        this.mascotasIdMascotas = mascotasIdMascotas;
    }
}
