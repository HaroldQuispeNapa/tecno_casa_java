package Modelo.dao;

import Modelo.dto.Categoria;
import Modelo.dto.Marca;
import Modelo.dto.Producto;
import Servicios.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {

    public List<Producto> getListProducto() {
        String cadSQL = "SELECT p.idProducto, m.idMarca, m.nombre AS marca, p.modelo, p.precio, p.img, "
                + "c.idCategoria, c.nombre AS categoria " 
                + "FROM Producto p "
                + "INNER JOIN Marca m ON p.idMarca = m.idMarca "
                + "INNER JOIN Categoria c ON p.idCategoria = c.idCategoria";

        List<Producto> lista = new ArrayList<>();

        try (   Connection cnx = Conexion.getConection(); 
                PreparedStatement ps = cnx.prepareStatement(cadSQL);) {

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto producto = new Producto(
                        rs.getInt("idProducto"),
                        new Marca(rs.getInt("idMarca"), rs.getString("marca")),
                        rs.getString("modelo"),
                        rs.getDouble("precio"),
                        rs.getString("img"),
                        new Categoria(rs.getInt("idCategoria"), rs.getString("categoria")));
                lista.add(producto);
            }
            rs.close();
        } catch (Exception e) {
        }

        return lista;
    }

    public boolean registrarProducto(Producto producto) {
    String sql = "INSERT INTO Producto (idMarca, modelo, precio, img, idCategoria) VALUES (?, ?, ?, ?, ?)";

    try (Connection cnx = Conexion.getConection();
         PreparedStatement ps = cnx.prepareStatement(sql)) {

        ps.setInt(1, producto.getMarca().getIdMarca());
        ps.setString(2, producto.getModelo());
        ps.setDouble(3, producto.getPrecio());
        ps.setString(4, producto.getImg());
        ps.setInt(5, producto.getCategoria().getIdCategoria());

        return ps.executeUpdate() > 0;

    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

    public boolean actualizarProducto(Producto p) {
    String sql = "UPDATE Producto SET idMarca=?, modelo=?, precio=?, img=?, idCategoria=? WHERE idProducto=?";
    try (Connection cnx = Conexion.getConection(); PreparedStatement ps = cnx.prepareStatement(sql)) {
        ps.setInt(1, p.getMarca().getIdMarca());
        ps.setString(2, p.getModelo());
        ps.setDouble(3, p.getPrecio());
        ps.setString(4, p.getImg());
        ps.setInt(5, p.getCategoria().getIdCategoria());
        ps.setInt(6, p.getIdProducto());
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

public boolean eliminarProducto(int idProducto) {
    String sql = "DELETE FROM Producto WHERE idProducto=?";
    try (Connection cnx = Conexion.getConection(); PreparedStatement ps = cnx.prepareStatement(sql)) {
        ps.setInt(1, idProducto);
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

public List<Marca> getListMarca() {
    String sql = "SELECT idMarca, nombre FROM Marca";
    List<Marca> lista = new ArrayList<>();

    try (Connection cnx = Conexion.getConection();
         PreparedStatement ps = cnx.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            lista.add(new Marca(rs.getInt("idMarca"), rs.getString("nombre")));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return lista;
}
public List<Categoria> getListCategoria() {
    String sql = "SELECT idCategoria, nombre FROM Categoria";
    List<Categoria> lista = new ArrayList<>();

    try (Connection cnx = Conexion.getConection();
         PreparedStatement ps = cnx.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        while (rs.next()) {
            lista.add(new Categoria(rs.getInt("idCategoria"), rs.getString("nombre")));
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return lista;
}

public String obtenerNombreImagen(int idProducto) {
    String sql = "SELECT img FROM Producto WHERE idProducto = ?";
    try (Connection cnx = Conexion.getConection();
         PreparedStatement ps = cnx.prepareStatement(sql)) {
        ps.setInt(1, idProducto);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            return rs.getString("img");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "";
}

}
