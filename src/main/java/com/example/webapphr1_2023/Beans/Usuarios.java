package com.example.webapphr1_2023.Beans;

public class Usuarios {
    private int id;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String correo;
    private String contrasena;
    private Rol rol; // Relación con Rol
    private String nombreAlbergue;
    private Integer anioCreacion;
    private Distrito distrito; // Relación con Distrito
    private Zona zona; // Relación con Zona
    private Integer telefono;
    private Integer espaciosNuevosAnimales;
    private String urlFbig;
    private String puntoAcopioDonaciones;
    private String direccionDonacion;
    private String nombreDonaciones;
    private Integer numeroDonaciones;
    private Integer numeroYape;
    private byte[] codigoQr;
    private String fechaNacimiento;
    private EstadoUsuario estadoUsuario; // Relación con EstadoUsuario
    private String motivoEliminado;
    private Integer cantidadAlbergados;
    private String fechaRegistro;
    private Donaciones donaciones; // Relación con Donaciones

    public Usuarios() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public Integer getAnioCreacion() {
        return anioCreacion;
    }

    public void setAnioCreacion(Integer anioCreacion) {
        this.anioCreacion = anioCreacion;
    }

    public Distrito getDistrito() {
        return distrito;
    }

    public void setDistrito(Distrito distrito) {
        this.distrito = distrito;
    }

    public Zona getZona() {
        return zona;
    }

    public void setZona(Zona zona) {
        this.zona = zona;
    }

    public Integer getTelefono() {
        return telefono;
    }

    public void setTelefono(Integer telefono) {
        this.telefono = telefono;
    }

    public Integer getEspaciosNuevosAnimales() {
        return espaciosNuevosAnimales;
    }

    public void setEspaciosNuevosAnimales(Integer espaciosNuevosAnimales) {
        this.espaciosNuevosAnimales = espaciosNuevosAnimales;
    }

    public String getUrlFbig() {
        return urlFbig;
    }

    public void setUrlFbig(String urlFbig) {
        this.urlFbig = urlFbig;
    }

    public String getPuntoAcopioDonaciones() {
        return puntoAcopioDonaciones;
    }

    public void setPuntoAcopioDonaciones(String puntoAcopioDonaciones) {
        this.puntoAcopioDonaciones = puntoAcopioDonaciones;
    }

    public String getNombreDonaciones() {
        return nombreDonaciones;
    }

    public void setNombreDonaciones(String nombreDonaciones) {
        this.nombreDonaciones = nombreDonaciones;
    }

    public String getDireccionDonacion() {
        return direccionDonacion;
    }

    public void setDireccionDonacion(String direccionDonacion) {
        this.direccionDonacion = direccionDonacion;
    }

    public Integer getNumeroDonaciones() {
        return numeroDonaciones;
    }

    public void setNumeroDonaciones(Integer numeroDonaciones) {
        this.numeroDonaciones = numeroDonaciones;
    }

    public Integer getNumeroYape() {
        return numeroYape;
    }

    public void setNumeroYape(Integer numeroYape) {
        this.numeroYape = numeroYape;
    }

    public byte[] getCodigoQr() {
        return codigoQr;
    }

    public void setCodigoQr(byte[] codigoQr) {
        this.codigoQr = codigoQr;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public EstadoUsuario getEstadoUsuario() {
        return estadoUsuario;
    }

    public void setEstadoUsuario(EstadoUsuario estadoUsuario) {
        this.estadoUsuario = estadoUsuario;
    }

    public String getMotivoEliminado() {
        return motivoEliminado;
    }

    public void setMotivoEliminado(String motivoEliminado) {
        this.motivoEliminado = motivoEliminado;
    }

    public Integer getCantidadAlbergados() {
        return cantidadAlbergados;
    }

    public void setCantidadAlbergados(Integer cantidadAlbergados) {
        this.cantidadAlbergados = cantidadAlbergados;
    }

    public String getFechaRegistro() {
        return fechaRegistro;
    }

    public void setFechaRegistro(String fechaRegistro) {
        this.fechaRegistro = fechaRegistro;
    }

    public Donaciones getDonaciones() {
        return donaciones;
    }

    public void setDonaciones(Donaciones donaciones) {
        this.donaciones = donaciones;
    }
}
