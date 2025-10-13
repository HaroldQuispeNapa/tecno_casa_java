/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Modelo.dao.ProductoDAO;
import Modelo.dto.Categoria;
import Modelo.dto.Marca;
import Modelo.dto.Producto;
import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author L
 */
@MultipartConfig
@WebServlet(name = "ControladorProductos", urlPatterns = {"/ControladorProductos"})
public class ControladorProductos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProductos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProductos at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("listar".equals(accion)) {
            ProductoDAO dao = new ProductoDAO();
            List<Marca> marcas = dao.getListMarca();
            List<Categoria> categorias = dao.getListCategoria();
            List<Producto> productos = dao.getListProducto();

            request.setAttribute("productos", productos);
            request.setAttribute("marcas", marcas);
            request.setAttribute("categorias", categorias);

            request.getRequestDispatcher("/views/productos.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        ProductoDAO dao = new ProductoDAO();
        String accion = request.getParameter("accion");

        Map<String, Object> resultado = new HashMap<>();

        try {
            if ("registrar".equals(accion)) {
                String modelo = request.getParameter("modelo");
                String precioStr = request.getParameter("precio");
                String idMarcaStr = request.getParameter("idMarca");
                String idCategoriaStr = request.getParameter("idCategoria");

                if (modelo == null || modelo.trim().isEmpty()
                        || precioStr == null || precioStr.trim().isEmpty()
                        || idMarcaStr == null || idMarcaStr.trim().isEmpty()
                        || idCategoriaStr == null || idCategoriaStr.trim().isEmpty()) {

                    resultado.put("estado", "error");
                    resultado.put("mensaje", "Todos los campos son obligatorios");
                    out.print(gson.toJson(resultado));
                    out.flush();
                    out.close();
                    return;
                }

                double precio = Double.parseDouble(precioStr);
                int idMarca = Integer.parseInt(idMarcaStr);
                int idCategoria = Integer.parseInt(idCategoriaStr);

                Part archivo = request.getPart("img");
                String nombreArchivo = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

                String rutaImagenes = getServletContext().getRealPath("/imgs");
                File carpeta = new File(rutaImagenes);
                if (!carpeta.exists()) {
                    carpeta.mkdirs();
                }

                archivo.write(new File(carpeta, nombreArchivo).getAbsolutePath());

                Marca marca = new Marca(idMarca, null);
                Categoria categoria = new Categoria(idCategoria, null);
                Producto producto = new Producto(0, marca, modelo, precio, nombreArchivo, categoria);

                boolean exito = dao.registrarProducto(producto);

                resultado.put("estado", exito ? "ok" : "error");
                resultado.put("mensaje", exito ? "Producto registrado correctamente" : "No se pudo registrar el producto");

            } else if ("editar".equals(accion)) {
                String idProductoStr = request.getParameter("idProducto");
                String modelo = request.getParameter("modelo");
                String precioStr = request.getParameter("precio");
                String idMarcaStr = request.getParameter("idMarca");
                String idCategoriaStr = request.getParameter("idCategoria");

                if (idProductoStr == null || idProductoStr.trim().isEmpty()
                        || modelo == null || modelo.trim().isEmpty()
                        || precioStr == null || precioStr.trim().isEmpty()
                        || idMarcaStr == null || idMarcaStr.trim().isEmpty()
                        || idCategoriaStr == null || idCategoriaStr.trim().isEmpty()) {

                    resultado.put("estado", "error");
                    resultado.put("mensaje", "Todos los campos son obligatorios para editar");
                    out.print(gson.toJson(resultado));
                    out.flush();
                    out.close();
                    return;
                }

                int idProducto = Integer.parseInt(idProductoStr);
                double precio = Double.parseDouble(precioStr);
                int idMarca = Integer.parseInt(idMarcaStr);
                int idCategoria = Integer.parseInt(idCategoriaStr);

                Part archivo = request.getPart("img");
                String nombreArchivo = null;

                if (archivo != null && archivo.getSize() > 0) {
                    nombreArchivo = Paths.get(archivo.getSubmittedFileName()).getFileName().toString();

                    String rutaImagenes = getServletContext().getRealPath("/imgs");
                    File carpeta = new File(rutaImagenes);
                    if (!carpeta.exists()) {
                        carpeta.mkdirs();
                    }

                    File destino = new File(carpeta, nombreArchivo);
                    if (destino.exists()) {
                        destino.delete(); 
                    }
                    archivo.write(destino.getAbsolutePath());
                } else {
                    nombreArchivo = dao.obtenerNombreImagen(idProducto); 
                }

                Marca marca = new Marca(idMarca, null);
                Categoria categoria = new Categoria(idCategoria, null);
                Producto producto = new Producto(idProducto, marca, modelo, precio, nombreArchivo, categoria);

                boolean exito = dao.actualizarProducto(producto);

                resultado.put("estado", exito ? "ok" : "error");
                resultado.put("mensaje", exito ? "Producto actualizado correctamente" : "No se pudo actualizar el producto");

            } else if ("eliminar".equals(accion)) {
                String[] ids = request.getParameterValues("idProducto");

                if (ids == null || ids.length == 0) {
                    resultado.put("estado", "error");
                    resultado.put("mensaje", "No se proporcionaron productos para eliminar");
                    out.print(gson.toJson(resultado));
                    out.flush();
                    out.close();
                    return;
                }

                boolean todoOk = true;
                for (String idStr : ids) {
                    int id = Integer.parseInt(idStr);
                    boolean exito = dao.eliminarProducto(id);
                    if (!exito) {
                        todoOk = false;
                    }
                }

                resultado.put("estado", todoOk ? "ok" : "error");
                resultado.put("mensaje", todoOk ? "Productos eliminados correctamente" : "Algunos productos no se pudieron eliminar");
                out.print(gson.toJson(resultado));
                out.flush();
                out.close();
                return;
            }

        } catch (Exception e) {
            resultado.put("estado", "error");
            resultado.put("mensaje", "Error interno en el servidor");
            out.print(gson.toJson(resultado));
            out.flush();
            out.close();
            return; 
        }

        out.print(gson.toJson(resultado));
        out.flush();
        out.close();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Controlador para registrar, editar y eliminar productos";
    }// </editor-fold>

}
