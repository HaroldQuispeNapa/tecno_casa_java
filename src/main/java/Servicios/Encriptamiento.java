/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servicios;

import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author efrai
 */
public class Encriptamiento {
    public static String encriptar(String textoPlano) {
        return BCrypt.hashpw(textoPlano, BCrypt.gensalt());
    }
    public static boolean verificar(String textoPlano, String hash) {
        return BCrypt.checkpw(textoPlano, hash);
    }
    
    public static void main(String[] args) {
        String password = "hola123";

        // Encriptar
        String hash = encriptar(password);
        System.out.println("Original: " + password);
        System.out.println("Encriptada (hash): " + hash);

        // Verificar
        boolean coincide = verificar("hola123", hash);
        System.out.println("¿Coincide? " + coincide);
    }
}