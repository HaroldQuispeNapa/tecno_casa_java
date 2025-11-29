/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import Modelo.dao.Auth;
import Modelo.dto.Usuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorAuth", urlPatterns = {"/ControladorAuth"})
public class ControladorAuth extends HttpServlet {

    private final Auth auth = new Auth();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        switch (accion) {
            case "registrar":
                registrarUsuario(request, response);
                break;

            case "login":
                loginUsuario(request, response);
                break;

            case "cerrar":
                request.getSession().invalidate();
                response.sendRedirect(request.getContextPath() + "/ControladorPrincipal?accion=paginaInicio");
                break;

            default:
                response.sendRedirect(request.getContextPath() + "/views/paginaInicio.jsp");
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");
        String clave = request.getParameter("clave");
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        int rol = Integer.parseInt(request.getParameter("rol")); // 1=Cliente, 2=Administrador

        Usuario usuario = new Usuario();
        usuario.setDni(Integer.parseInt(dni));
        usuario.setClave(clave);
        usuario.setNombres(nombres);
        usuario.setApellidos(apellidos);
        usuario.setRol(rol);

        boolean exito = auth.registrar(usuario);

        if (exito) {
            request.getSession().setAttribute("usuario", usuario.getNombres());
            response.sendRedirect(request.getContextPath() + "/views/paginaInicio.jsp");
        } else {
            request.setAttribute("page", "register");
            request.setAttribute("error", "Error al registrar");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }

    private void loginUsuario(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String dni = request.getParameter("dni");
        String clave = request.getParameter("clave");

        Usuario usuario = auth.login(dni, clave);

        if (usuario != null) {
            request.getSession().setAttribute("usuario", usuario.getNombres());

            // Redirección según rol
            if (usuario.getRol() == 1) { // Cliente
                response.sendRedirect(request.getContextPath() + "/ControladorPrincipal?accion=paginaInicio");
            } else if (usuario.getRol() == 2) { // Administrador
                response.sendRedirect(request.getContextPath() + "/ControladorProductos?accion=listar");
            }
        } else {
            request.setAttribute("page", "login");
            request.setAttribute("error", "DNI o contraseña incorrectos");
            request.getRequestDispatcher("/views/login.jsp").forward(request, response);
        }
    }
}
