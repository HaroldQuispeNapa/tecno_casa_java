package Modelo.dao;

import Modelo.dto.Reclamo;
import Servicios.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ReclamoDAO {

    public boolean registrarReclamo(Reclamo reclamo) {
        boolean resultado = false;

        String cadSQL = "INSERT INTO Reclamo(nombre, apellido, direccion, dni, telefono, email, tipo_bien, monto, descripcion, tipo_reclamo, detalle, pedido) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection cnx = Conexion.getConection(); PreparedStatement ps = cnx.prepareStatement(cadSQL)) {

            ps.setString(1, reclamo.getNombre());
            ps.setString(2, reclamo.getApellido());
            ps.setString(3, reclamo.getDireccion());
            ps.setString(4, reclamo.getDNI());
            ps.setString(5, reclamo.getTelefono());
            ps.setString(6, reclamo.getEmail());
            ps.setString(7, reclamo.getTipo_bien());
            ps.setDouble(8, reclamo.getMonto());
            ps.setString(9, reclamo.getDescripcion());
            ps.setString(10, reclamo.getTipo_reclamo());
            ps.setString(11, reclamo.getDetalle());
            ps.setString(12, reclamo.getPedido());

            int filas = ps.executeUpdate();
            resultado = (filas > 0);

        } catch (Exception e) {
            e.printStackTrace();

        }

        return resultado;

    }

}
