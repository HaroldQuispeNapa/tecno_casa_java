/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;

import Modelo.dto.Categoria;
import Modelo.dto.Usuario;
import Servicios.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author efrai
 */
public class ClienteDAO {
    public List<Usuario> getListClientes() {
        String cadSQL = "SELECT " +
            " u.id," +
            " u.dni," +
            " u.clave," +
            " u.nombres," +
            " u.apellidos," +
            " u.id_rol " +
            " FROM Usuarios u " +
            " INNER JOIN Roles r ON u.id_rol = r.id " +
            " WHERE r.nombre_rol = 'Cliente'";
        List<Usuario> lista = new ArrayList<>();

        try (
            Connection cnx = Conexion.getConection(); 
            PreparedStatement ps = cnx.prepareStatement(cadSQL);
            ResultSet rs = ps.executeQuery();          
            ) {
            while (rs.next()) {
                Usuario cliente = new Usuario(
                    rs.getInt("id"),
                    rs.getInt("dni"),
                    rs.getString("clave"),
                    rs.getString("nombres"),
                    rs.getString("apellidos"),
                    rs.getInt("id_rol")
                );
                lista.add(cliente);
            }          
        } catch (Exception e) {
             e.printStackTrace();
        }
        return lista;
    }
}
