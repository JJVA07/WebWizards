package com.example.webapphr1_2023.Beans;

public class Publicacion {
    private int idPublicacion;
    private String descripcion;
    private byte[] foto;
    private String nombre;
    private Integer edad;
    private String raza;
    private String tamano;
    private String distintivo;
    private String descripcionAdicional;
    private String lugarPerdida;
    private String horaPerdida;
    private String telefono;
    private String nombreContacto;
    private String recompensa;
    private String tipoMaltrato;
    private String nombreMaltratador;
    private String direccionMaltrato;
    private Boolean denunciaPolicial;
    private int tipoPublicacionTipoPublicacion;
    private String motivoRechazo;
    private int publicacionEstadoIdPublicacionEstado;
    private String fechaPublicacion;
    private String fechaEncontrado;

    // Constructor vacío
    public Publicacion() {
    }

    // Constructor con parámetros
    public Publicacion(int idPublicacion, String descripcion, byte[] foto, String nombre, Integer edad, String raza,
                       String tamano, String distintivo, String descripcionAdicional, String lugarPerdida,
                       String horaPerdida, String telefono, String nombreContacto, String recompensa,
                       String tipoMaltrato, String nombreMaltratador, String direccionMaltrato, Boolean denunciaPolicial,
                       int tipoPublicacionTipoPublicacion, String motivoRechazo, int publicacionEstadoIdPublicacionEstado,
                       String fechaPublicacion, String fechaEncontrado) {
        this.idPublicacion = idPublicacion;
        this.descripcion = descripcion;
        this.foto = foto;
        this.nombre = nombre;
        this.edad = edad;
        this.raza = raza;
        this.tamano = tamano;
        this.distintivo = distintivo;
        this.descripcionAdicional = descripcionAdicional;
        this.lugarPerdida = lugarPerdida;
        this.horaPerdida = horaPerdida;
        this.telefono = telefono;
        this.nombreContacto = nombreContacto;
        this.recompensa = recompensa;
        this.tipoMaltrato = tipoMaltrato;
        this.nombreMaltratador = nombreMaltratador;
        this.direccionMaltrato = direccionMaltrato;
        this.denunciaPolicial = denunciaPolicial;
        this.tipoPublicacionTipoPublicacion = tipoPublicacionTipoPublicacion;
        this.motivoRechazo = motivoRechazo;
        this.publicacionEstadoIdPublicacionEstado = publicacionEstadoIdPublicacionEstado;
        this.fechaPublicacion = fechaPublicacion;
        this.fechaEncontrado = fechaEncontrado;
    }

    public int getIdPublicacion() {
        return idPublicacion;
    }

    public void setIdPublicacion(int idPublicacion) {
        this.idPublicacion = idPublicacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public byte[] getFoto() {
        return foto;
    }

    public void setFoto(byte[] foto) {
        this.foto = foto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getEdad() {
        return edad;
    }

    public void setEdad(Integer edad) {
        this.edad = edad;
    }

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getTamano() {
        return tamano;
    }

    public void setTamano(String tamano) {
        this.tamano = tamano;
    }

    public String getDistintivo() {
        return distintivo;
    }

    public void setDistintivo(String distintivo) {
        this.distintivo = distintivo;
    }

    public String getDescripcionAdicional() {
        return descripcionAdicional;
    }

    public void setDescripcionAdicional(String descripcionAdicional) {
        this.descripcionAdicional = descripcionAdicional;
    }

    public String getLugarPerdida() {
        return lugarPerdida;
    }

    public void setLugarPerdida(String lugarPerdida) {
        this.lugarPerdida = lugarPerdida;
    }

    public String getHoraPerdida() {
        return horaPerdida;
    }

    public void setHoraPerdida(String horaPerdida) {
        this.horaPerdida = horaPerdida;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getNombreContacto() {
        return nombreContacto;
    }

    public void setNombreContacto(String nombreContacto) {
        this.nombreContacto = nombreContacto;
    }

    public String getRecompensa() {
        return recompensa;
    }

    public void setRecompensa(String recompensa) {
        this.recompensa = recompensa;
    }

    public String getTipoMaltrato() {
        return tipoMaltrato;
    }

    public void setTipoMaltrato(String tipoMaltrato) {
        this.tipoMaltrato = tipoMaltrato;
    }

    public String getNombreMaltratador() {
        return nombreMaltratador;
    }

    public void setNombreMaltratador(String nombreMaltratador) {
        this.nombreMaltratador = nombreMaltratador;
    }

    public String getDireccionMaltrato() {
        return direccionMaltrato;
    }

    public void setDireccionMaltrato(String direccionMaltrato) {
        this.direccionMaltrato = direccionMaltrato;
    }

    public Boolean getDenunciaPolicial() {
        return denunciaPolicial;
    }

    public void setDenunciaPolicial(Boolean denunciaPolicial) {
        this.denunciaPolicial = denunciaPolicial;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public int getTipoPublicacionTipoPublicacion() {
        return tipoPublicacionTipoPublicacion;
    }

    public void setTipoPublicacionTipoPublicacion(int tipoPublicacionTipoPublicacion) {
        this.tipoPublicacionTipoPublicacion = tipoPublicacionTipoPublicacion;
    }

    public int getPublicacionEstadoIdPublicacionEstado() {
        return publicacionEstadoIdPublicacionEstado;
    }

    public void setPublicacionEstadoIdPublicacionEstado(int publicacionEstadoIdPublicacionEstado) {
        this.publicacionEstadoIdPublicacionEstado = publicacionEstadoIdPublicacionEstado;
    }

    public String getFechaEncontrado() {
        return fechaEncontrado;
    }

    public void setFechaEncontrado(String fechaEncontrado) {
        this.fechaEncontrado = fechaEncontrado;
    }

    public String getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(String fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }
}
