package Controllers;

import Modelo.dao.ReclamoDAO;
import Modelo.dto.Reclamo;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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

        String accionAdmin = request.getParameter("accionAdmin");
        /*
        if ("reclamo".equals(accionAdmin)) {
            List<Reclamo> listaRec = new ReclamoDAO().getListReclamos();
            request.setAttribute("listaReclamos", listaRec);
            request.getRequestDispatcher("./views/reclamos.jsp").forward(request, response);
        }
         */

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
/*
        response.setContentType("application/json;charset=UTF-8");

        List<Reclamo> listRec = new ReclamoDAO().getListReclamos();
        String json = new Gson().toJson(listRec);

        try (PrintWriter out = response.getWriter()) {
            out.print(json);
        }
         */

        String accionAdmin = request.getParameter("accionAdmin");

        if ("reclamo".equals(accionAdmin)) {
            // Lista para JSP
            List<Reclamo> listaRec = new ReclamoDAO().getListReclamos();
            request.setAttribute("listaReclamos", listaRec);

            request.getRequestDispatcher("/views/reclamos.jsp").forward(request, response);
        } else {
            // Lista para JSON (AJAX)
            response.setContentType("application/json;charset=UTF-8");
            List<Reclamo> listRec = new ReclamoDAO().getListReclamos();
            String json = new Gson().toJson(listRec);

            try (PrintWriter out = response.getWriter()) {
                out.print(json);
            }
        }

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
                reclamo.setEstado("Pendiente");

                boolean exito = new ReclamoDAO().registrarReclamo(reclamo);

                System.out.println("VALOR " + exito);
                resultado.put("success", exito);

            } else if ("editar".equals(accion)) {
                String idStr = request.getParameter("idReclamo");
                String estado = request.getParameter("estado");

                int idReclamo = Integer.parseInt(idStr == null || idStr.isEmpty() ? "0" : idStr);

                if (!"Pendiente".equals(estado) && !"Proceso".equals(estado) && !"Resuelto".equals(estado)) {
                    estado = "Pendiente";
                }

                Reclamo reclamo = new Reclamo();
                reclamo.setIdReclamo(idReclamo);
                reclamo.setEstado(estado);

                boolean exito = new ReclamoDAO().editarReclamo(reclamo);
                resultado.put("success", exito);

            } else if ("eliminar".equals(accion)) {
                String idStr = request.getParameter("idReclamo");
                System.out.println("Eliminar id: " + idStr);

                int idReclamo = Integer.parseInt(idStr);

                boolean exito = new ReclamoDAO().eliminarReclamo(idReclamo);
                resultado.put("success", exito);
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
