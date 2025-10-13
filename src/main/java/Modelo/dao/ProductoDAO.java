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

}
