/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;

import com.modeloDAO.SalidaDAO;
import java.sql.SQLException;
import com.modelo.salida;

/**
 *
 * @author Daniel
 */
public class SalidaController {
     SalidaDAO misalidaDAO= new SalidaDAO();
     public String registrarSalida(salida referencia){
        try {
            System.out.print(referencia);
            return misalidaDAO.eliminarProducto(referencia);
        } catch (SQLException ex) {
            return "error";
        }
    }
     
     public String actualizarInventario(salida entrada1) {
        
        try {
            return misalidaDAO.actualizarInventario(entrada1);
        } catch (SQLException e) {
            return "error";
        }
    }
    
    
}
