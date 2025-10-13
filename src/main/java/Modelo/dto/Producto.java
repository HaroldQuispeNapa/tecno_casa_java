package Modelo.dto;

public class Producto {
    private int idProducto;
    private Marca marca;
    private String modelo;
    private double precio;
    private String img;
    private Categoria categoria;

    public Producto() {
    }

    public Producto(int idProducto, Marca marca, String modelo, double precio, String img, Categoria categoria) {
        this.idProducto = idProducto;
        this.marca = marca;
        this.modelo = modelo;
        this.precio = precio;
        this.img = img;
        this.categoria = categoria;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public Marca getMarca() {
        return marca;
    }

    public void setMarca(Marca marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }
    
    
    
}
