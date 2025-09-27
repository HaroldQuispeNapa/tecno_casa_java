/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Modelo.Usuario;
import Servicios.Encriptamiento;
import Servicios.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author efrai
 */
@WebServlet(name = "authUser", urlPatterns = {"/authUser"})
public class authUser extends HttpServlet {

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
            out.println("<title>Servlet authUser</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet authUser at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        
            String accion = request.getParameter("accion");
            
            switch (accion) {
            case "registrar":
                String nombre = request.getParameter("nombre");
                String email = request.getParameter("email");
                String clave = request.getParameter("clave");
                boolean success =  registrarUsuario(nombre,email,clave);
                if(success){
                    response.sendRedirect(request.getContextPath() + "/views/paginaInicio.jsp");
                }else{
                    request.setAttribute("page", "register");
                    request.setAttribute("error", "Email ya existe");
                    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                };
                break;
                
            case "login":
                String emailLogin = request.getParameter("email");
                String claveLogin = request.getParameter("clave");
                
                boolean exito = loginUsuario(request, emailLogin, claveLogin);
                if(exito){
                    response.sendRedirect(request.getContextPath() + "/views/paginaInicio.jsp");
                } else {
                    request.setAttribute("page", "login");
                    request.setAttribute("error", "Email o contraseña incorrectos");
                    request.getRequestDispatcher("/views/login.jsp").forward(request, response);
                }
                break;
                
            case "cerrar":
                request.getSession().invalidate();
                response.sendRedirect(request.getContextPath() + "/views/paginaInicio.jsp");
                break;
                
            default:
                throw new AssertionError();
        }     
    }
    
    private boolean registrarUsuario(String nombre,String email,String clave){
        Usuario usu =  validarUsuario(email);
        
        if(usu != null){ return false; }
        
        
        String claveHash = Encriptamiento.encriptar(clave.trim());

        String sql = "INSERT INTO usuarios (email, clave, nombre) VALUES(?,?,?)";
        try(
            Connection con = Conexion.getConection();
            PreparedStatement ps = con.prepareStatement(sql);
            ){

            ps.setString(1, email.trim());
            ps.setString(2, claveHash);
            ps.setString(3, nombre.trim());

            int filas = ps.executeUpdate();
            return true;

        } catch (SQLException  e) {
            e.printStackTrace();
        }
        return false;
        
        
    };
    
    private boolean loginUsuario(HttpServletRequest request ,String email, String clave){
        Usuario usu =  validarUsuario(email);
        if(usu != null){
            boolean comparador = Encriptamiento.verificar(clave, usu.getClave());
            if(comparador){
                request.getSession().setAttribute("usuario", usu.getNombre());
                return true;
            }
        }
        return false;
    }
    
    
    private Usuario validarUsuario (String email){
        Usuario usuario = null;
        
        String sql = "SELECT idusuario,nombre,email,clave FROM usuarios WHERE email = ?";
        try(
            Connection con = Conexion.getConection();
            PreparedStatement ps = con.prepareStatement(sql);
            ) {
            ps.setString(1, email);
            
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                usuario = new Usuario(rs.getInt("idusuario"), rs.getString("nombre"), rs.getString("email"), rs.getString("clave")); 
            }
            rs.close();
            ps.close();
            con.close();  
        } catch (SQLException  e) {
            e.printStackTrace();
        }
        
        return usuario; 
    
    };

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
