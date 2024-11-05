package com.example.webapphr1_2023.Beans;

public class Usuarios {
    private int id;
    private String nombre;
    private String apellido;
    private String dni;
    private String direccion;
    private String correo;
    private String contraseña;
    private int rolIdRol;
    private String nombreAlbergue;
    private int anioCreacion;
    private Integer distritoIdDistrito;
    private Integer zonaIdZona;
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
    private Integer estadoUsuarioIdEstadoUsuario;
    private String motivoEliminado;
    private Integer cantidadAlbergados;
    private String fechaRegistro;
    private int donacionesIdDonaciones;

    // Constructor vacío
    public Usuarios() {
    }

    // Constructor con parámetros
    public Usuarios(int id, String nombre, String apellido, String dni, String direccion, String correo, String contraseña,
                    int rolIdRol, String nombreAlbergue, int anioCreacion, Integer distritoIdDistrito, Integer zonaIdZona,
                    Integer telefono, Integer espaciosNuevosAnimales, String urlFbig, String puntoAcopioDonaciones,
                    String direccionDonacion, String nombreDonaciones, Integer numeroDonaciones, Integer numeroYape,
                    byte[] codigoQr, String fechaNacimiento, Integer estadoUsuarioIdEstadoUsuario, String motivoEliminado,
                    Integer cantidadAlbergados, String fechaRegistro, int donacionesIdDonaciones) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.dni = dni;
        this.direccion = direccion;
        this.correo = correo;
        this.contraseña = contraseña;
        this.rolIdRol = rolIdRol;
        this.nombreAlbergue = nombreAlbergue;
        this.anioCreacion = anioCreacion;
        this.distritoIdDistrito = distritoIdDistrito;
        this.zonaIdZona = zonaIdZona;
        this.telefono = telefono;
        this.espaciosNuevosAnimales = espaciosNuevosAnimales;
        this.urlFbig = urlFbig;
        this.puntoAcopioDonaciones = puntoAcopioDonaciones;
        this.direccionDonacion = direccionDonacion;
        this.nombreDonaciones = nombreDonaciones;
        this.numeroDonaciones = numeroDonaciones;
        this.numeroYape = numeroYape;
        this.codigoQr = codigoQr;
        this.fechaNacimiento = fechaNacimiento;
        this.estadoUsuarioIdEstadoUsuario = estadoUsuarioIdEstadoUsuario;
        this.motivoEliminado = motivoEliminado;
        this.cantidadAlbergados = cantidadAlbergados;
        this.fechaRegistro = fechaRegistro;
        this.donacionesIdDonaciones = donacionesIdDonaciones;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getContraseña() {
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = contraseña;
    }

    public String getNombreAlbergue() {
        return nombreAlbergue;
    }

    public void setNombreAlbergue(String nombreAlbergue) {
        this.nombreAlbergue = nombreAlbergue;
    }

    public int getRolIdRol() {
        return rolIdRol;
    }

    public void setRolIdRol(int rolIdRol) {
        this.rolIdRol = rolIdRol;
    }

    public int getAnioCreacion() {
        return anioCreacion;
    }

    public void setAnioCreacion(int anioCreacion) {
        this.anioCreacion = anioCreacion;
    }

    public Integer getDistritoIdDistrito() {
        return distritoIdDistrito;
    }

    public void setDistritoIdDistrito(Integer distritoIdDistrito) {
        this.distritoIdDistrito = distritoIdDistrito;
    }

    public Integer getZonaIdZona() {
        return zonaIdZona;
    }

    public void setZonaIdZona(Integer zonaIdZona) {
        this.zonaIdZona = zonaIdZona;
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

    public String getNombreDonaciones() {
        return nombreDonaciones;
    }

    public void setNombreDonaciones(String nombreDonaciones) {
        this.nombreDonaciones = nombreDonaciones;
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

    public Integer getEstadoUsuarioIdEstadoUsuario() {
        return estadoUsuarioIdEstadoUsuario;
    }

    public void setEstadoUsuarioIdEstadoUsuario(Integer estadoUsuarioIdEstadoUsuario) {
        this.estadoUsuarioIdEstadoUsuario = estadoUsuarioIdEstadoUsuario;
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

    public int getDonacionesIdDonaciones() {
        return donacionesIdDonaciones;
    }

    public void setDonacionesIdDonaciones(int donacionesIdDonaciones) {
        this.donacionesIdDonaciones = donacionesIdDonaciones;
    }
}
