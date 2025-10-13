package Modelo.dao;

import Modelo.dto.Marca;
import Servicios.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MarcaDAO {
        public List<Marca> getListMarca() {
        String cadSQL = "SELECT * FROM Marca";
        List<Marca> lista = new ArrayList<>();

        try (
            Connection cnx = Conexion.getConection(); 
            PreparedStatement ps = cnx.prepareStatement(cadSQL);
            ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Marca marca = new Marca(
                rs.getInt("idMarca"),
                        rs.getString("nombre")
                );
                lista.add(marca);
            }
            rs.close();
            
        } catch (Exception e) {
        }
        return lista;
    }
}
