package Controllers;

import Modelo.dto.Categoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.dto.Categoria;
import Modelo.dto.Producto;
import Modelo.dao.CategoriaDAO;
import Modelo.dao.MarcaDAO;
import Modelo.dao.ProductoDAO;
import Modelo.dto.Marca;

public class ControladorPrincipal extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("paginaInicio".equals(accion)) {
            //Categoria
            List<Categoria> listCat = new CategoriaDAO().getListCategoria();
            request.setAttribute("listaCategoria", listCat);

            //Marca
            List<Marca> listMar = new MarcaDAO().getListMarca();
            request.setAttribute("listaMarca", listMar);

            //Productos
            List<Producto> listProd = new ProductoDAO().getListProducto();
            request.setAttribute("listaProductos", listProd);

            request.getRequestDispatcher("./views/paginaInicio.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
