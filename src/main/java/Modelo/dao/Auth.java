/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dao;

import java.sql.Connection;
import Modelo.dto.Usuario;
import Servicios.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import Servicios.Encriptamiento;
/**
 *
 * @author efrai
 */
import java.sql.SQLException;
public class Auth {
   public boolean registrar(Usuario usuario) {
        if (validarUsuario(String.valueOf(usuario.getDni())) != null) {
            return false; // DNI ya existe
        }

        String sql = "INSERT INTO Usuarios (dni, clave, nombres, apellidos, fecha_nacimiento, id_rol) VALUES (?,?,?,?,?,?)";
        try (Connection con = Conexion.getConection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, String.valueOf(usuario.getDni()));
            ps.setString(2, Encriptamiento.encriptar(usuario.getClave()));
            ps.setString(3, usuario.getNombres());
            ps.setString(4, usuario.getApellidos());
            ps.setString(5, "2000-01-01"); // Puedes ajustar fecha de nacimiento
            ps.setInt(6, usuario.getRol());

            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
   
   public Usuario validarUsuario(String dni) {
        Usuario usuario = null;
        String sql = "SELECT u.id, u.dni, u.clave, u.nombres, u.apellidos, u.id_rol FROM Usuarios u WHERE u.dni = ?";

        try (Connection con = Conexion.getConection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, dni);
            ResultSet rs = ps.executeQuery();
            System.out.println(rs);

            if (rs.next()) {
                usuario = new Usuario(
                        rs.getInt("id"),
                        Integer.parseInt(rs.getString("dni")),
                        rs.getString("clave"),
                        rs.getString("nombres"),
                        rs.getString("apellidos"),
                        rs.getInt("id_rol")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }

   public Usuario login(String dni, String clave) {
        Usuario usuario = validarUsuario(dni);

        if (usuario != null && Encriptamiento.verificar(clave, usuario.getClave())) {
            return usuario;
        }
        return null;
    }
}
