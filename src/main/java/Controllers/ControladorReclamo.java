package Controllers;

import Modelo.dao.ReclamoDAO;
import Modelo.dto.Reclamo;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorReclamo", urlPatterns = {"/ControladorReclamo"})
@MultipartConfig
public class ControladorReclamo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorReclamo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorReclamo at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        response.setContentType("application/json;charset=UTF-8");

        String accion = request.getParameter("accion");
        System.out.println("accion " + accion);

        Map<String, Object> resultado = new HashMap<>();

        try {
            if ("registrar".equals(accion)) {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String direccion = request.getParameter("direccion");
                String dni = request.getParameter("dni");
                String telefono = request.getParameter("telefono");
                String email = request.getParameter("email");
                String tipo_bien = request.getParameter("tipo_bien");
                String montoStr = request.getParameter("monto");
                String descripcion = request.getParameter("descripcion");
                String tipo_reclamo = request.getParameter("tipo_reclamo");
                String detalle = request.getParameter("detalle");
                String pedido = request.getParameter("pedido");

                double monto = 0.0;
                monto = Double.parseDouble(montoStr);

                Reclamo reclamo = new Reclamo();
                reclamo.setNombre(nombre);
                reclamo.setApellido(apellido);
                reclamo.setDireccion(direccion);
                reclamo.setDNI(dni);
                reclamo.setTelefono(telefono);
                reclamo.setEmail(email);
                reclamo.setTipo_bien(tipo_bien);
                reclamo.setMonto(monto);
                reclamo.setDescripcion(descripcion);
                reclamo.setTipo_reclamo(tipo_reclamo);
                reclamo.setDetalle(detalle);
                reclamo.setPedido(pedido);

                boolean exito = new ReclamoDAO().registrarReclamo(reclamo);
                resultado.put("success", exito);
                
                System.out.println("VALOR " + exito);

            }

        } catch (Exception e) {
            e.printStackTrace();
            resultado.put("success", false);
        }

        String json = new Gson().toJson(resultado);
        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
