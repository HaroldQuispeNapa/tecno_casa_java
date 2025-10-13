package Modelo.dao;

import Modelo.dto.Reclamo;
import Servicios.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReclamoDAO {

    public List<Reclamo> getListReclamos() {
        String cadSQL = "SELECT idReclamo, nombre, apellido, direccion, dni, telefono, email, "
                + "tipo_bien, monto, descripcion, tipo_reclamo, detalle, pedido, estado "
                + "FROM Reclamo";

        List<Reclamo> lista = new ArrayList<>();

        try (Connection cnx = Conexion.getConection(); PreparedStatement ps = cnx.prepareStatement(cadSQL)) {
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Reclamo reclamo = new Reclamo(
                        rs.getInt("idReclamo"),
                        rs.getString("nombre"),
                        rs.getString("apellido"),
                        rs.getString("direccion"),
                        rs.getString("dni"),
                        rs.getString("telefono"),
                        rs.getString("email"),
                        rs.getString("tipo_bien"),
                        rs.getDouble("monto"),
                        rs.getString("descripcion"),
                        rs.getString("tipo_reclamo"),
                        rs.getString("detalle"),
                        rs.getString("pedido"),
                        rs.getString("estado"));
                lista.add(reclamo);
            }
            rs.close();
        } catch (Exception e) {
        }

        return lista;
    }

    public boolean registrarReclamo(Reclamo reclamo) {
        boolean resultado = false;

        String cadSQL = "INSERT INTO Reclamo(nombre, apellido, direccion, dni, telefono, email, tipo_bien, monto, descripcion, tipo_reclamo, detalle, pedido, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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

            String estado = reclamo.getEstado();
            if (!estado.equals("Pendiente") && !estado.equals("Proceso") && !estado.equals("Resuelto")) {
                estado = "Pendiente";
            }

            ps.setString(13, reclamo.getEstado());

            int filas = ps.executeUpdate();
            resultado = (filas > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultado;

    }

    public boolean editarReclamo(Reclamo reclamo) {
        boolean resultado = false;

        String cadSQL = "UPDATE Reclamo SET estado = ? WHERE idReclamo = ?";

        try (Connection cnx = Conexion.getConection(); PreparedStatement ps = cnx.prepareStatement(cadSQL)) {

            ps.setString(1, reclamo.getEstado());  
            ps.setInt(2, reclamo.getIdReclamo()); 

            int filas = ps.executeUpdate();
            resultado = (filas > 0);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultado;
    }

    public boolean eliminarReclamo(int idReclamo) {
        System.err.println(idReclamo);
        String cadSQL = "DELETE FROM Reclamo WHERE idReclamo = ?";
        try (
                Connection cnx = Conexion.getConection(); PreparedStatement ps = cnx.prepareStatement(cadSQL);) {
            ps.setInt(1, idReclamo);
            int filas = ps.executeUpdate();
            return filas > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

}
