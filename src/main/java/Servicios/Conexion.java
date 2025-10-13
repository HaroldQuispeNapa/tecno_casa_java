/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servicios;

import io.github.cdimascio.dotenv.Dotenv;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author LAB-USR-LNORTE
 */
public class Conexion {
    private static final Dotenv dotenv = Dotenv.load();
    
    public static Connection getConection(){
        
        Connection cnx = null;
        
        String DB_NAME = dotenv.get("DB_NAME") != null ? dotenv.get("DB_NAME") : "tecno_casa";
        String DB_USER = dotenv.get("DB_USER") != null ? dotenv.get("DB_USER") : "root";
        String DB_PASSWORD = dotenv.get("DB_PASSWORD") != null ? dotenv.get("DB_PASSWORD") : "";
        
    
        String url = "jdbc:mysql://localhost:3306/"+ DB_NAME +"?useTimeZone=true&"
                + "serverTimezone=UTC&autoReconnect=true";

        String user = DB_USER;
        String clave = DB_PASSWORD;
        String Driver = "com.mysql.cj.jdbc.Driver";
        
        try {
            Class.forName(Driver);
            cnx = DriverManager.getConnection(url, user, clave);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, "Error en la conexión", ex);
        }
        
        return cnx;

    }
    
    public static void main(String[] args){
        Connection cx = Conexion.getConection();
        try{
            System.out.println("EXISTOSO BRO "+ cx.getCatalog());
        }
        catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, "Error en la conexión", ex);
        }
    }
    
}