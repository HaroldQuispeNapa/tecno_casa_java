package Modelo.dto;


public class Reclamo {
    private int idReclamo;
    private String nombre;
    private String apellido;
    private String direccion;
    private String DNI;
    private String telefono;
    private String email;
    private String tipo_bien;
    private double monto;
    private String descripcion;
    private String tipo_reclamo;
    private String detalle;
    private String pedido;
    private String estado;

    public Reclamo() {
    }

    public Reclamo(int idReclamo, String nombre, String apellido, String direccion, String DNI, String telefono, String email, String tipo_bien, double monto, String descripcion, String tipo_reclamo, String detalle, String pedido, String estado) {
        this.idReclamo = idReclamo;
        this.nombre = nombre;
        this.apellido = apellido;
        this.direccion = direccion;
        this.DNI = DNI;
        this.telefono = telefono;
        this.email = email;
        this.tipo_bien = tipo_bien;
        this.monto = monto;
        this.descripcion = descripcion;
        this.tipo_reclamo = tipo_reclamo;
        this.detalle = detalle;
        this.pedido = pedido;
        this.estado = estado;
    }

    public int getIdReclamo() {
        return idReclamo;
    }

    public void setIdReclamo(int idReclamo) {
        this.idReclamo = idReclamo;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getDNI() {
        return DNI;
    }

    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTipo_bien() {
        return tipo_bien;
    }

    public void setTipo_bien(String tipo_bien) {
        this.tipo_bien = tipo_bien;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo_reclamo() {
        return tipo_reclamo;
    }

    public void setTipo_reclamo(String tipo_reclamo) {
        this.tipo_reclamo = tipo_reclamo;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getPedido() {
        return pedido;
    }

    public void setPedido(String pedido) {
        this.pedido = pedido;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    
}
