package Modelo.dao;

import java.util.List;
import Modelo.dto.Categoria;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import Servicios.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;

public class CategoriaDAO {

    public List<Categoria> getListCategoria() {
        String cadSQL = "SELECT * FROM categoria";
        List<Categoria> lista = new ArrayList<>();

        try (
            Connection cnx = Conexion.getConection(); 
            PreparedStatement ps = cnx.prepareStatement(cadSQL);
            ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Categoria categoria = new Categoria(
                rs.getInt("idCategoria"),
                        rs.getString("nombre")
                );
                lista.add(categoria);
            }
            rs.close();
            
        } catch (Exception e) {
        }
        return lista;
    }

}
