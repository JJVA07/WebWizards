package com.example.webapphr1_2023.Beans;

public class Publicacion {
    private int idPublicacion;
    private String descripcion;
    private byte[] foto;
    private String nombre;
    private int edad;
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
    private PublicacionEstado publicacionEstado; // Relación con PublicacionEstado
    private String motivoRechazo;
    private String fechaPublicacion;
    private String fechaEncontrado;
    private Usuarios usuario; // Relación con Usuarios (usuario que realiza la publicación)
    private String comentario_coordinador;
    private TipoPublicacion tipoPublicacion;

    public TipoPublicacion getTipoPublicacion() {
        return tipoPublicacion;
    }

    public void setTipoPublicacion(TipoPublicacion tipoPublicacion) {
        this.tipoPublicacion = tipoPublicacion;
    }

    public String getComentario_coordinador() {
        return comentario_coordinador;
    }

    public void setComentario_coordinador(String comentario_coordinador) {
        this.comentario_coordinador = comentario_coordinador;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public Publicacion() {
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

    public String getRaza() {
        return raza;
    }

    public void setRaza(String raza) {
        this.raza = raza;
    }

    public String getDistintivo() {
        return distintivo;
    }

    public void setDistintivo(String distintivo) {
        this.distintivo = distintivo;
    }

    public String getTamano() {
        return tamano;
    }

    public void setTamano(String tamano) {
        this.tamano = tamano;
    }

    public String getLugarPerdida() {
        return lugarPerdida;
    }

    public void setLugarPerdida(String lugarPerdida) {
        this.lugarPerdida = lugarPerdida;
    }

    public String getDescripcionAdicional() {
        return descripcionAdicional;
    }

    public void setDescripcionAdicional(String descripcionAdicional) {
        this.descripcionAdicional = descripcionAdicional;
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

    public PublicacionEstado getPublicacionEstado() {
        return publicacionEstado;
    }

    public void setPublicacionEstado(PublicacionEstado publicacionEstado) {
        this.publicacionEstado = publicacionEstado;
    }

    public String getMotivoRechazo() {
        return motivoRechazo;
    }

    public void setMotivoRechazo(String motivoRechazo) {
        this.motivoRechazo = motivoRechazo;
    }

    public String getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(String fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public String getFechaEncontrado() {
        return fechaEncontrado;
    }

    public void setFechaEncontrado(String fechaEncontrado) {
        this.fechaEncontrado = fechaEncontrado;
    }

    public Usuarios getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuarios usuario) {
        this.usuario = usuario;
    }

    // Getters y Setters
}
