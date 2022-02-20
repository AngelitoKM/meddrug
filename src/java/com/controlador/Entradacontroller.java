/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controlador;
import com.modelo.Entrada;
import com.modeloDAO.EntradaDAO;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;


public class Entradacontroller {
    EntradaDAO mientradaDAO= new EntradaDAO();
    public String registrarEnBD(Entrada entrada){
        try {
            return mientradaDAO.registrarEntrada(entrada);
        } catch (SQLException e) {
            //Logger.getLogger(Entradacontroller.class.getName()).log(Level.SEVERE, null, ex);
            return "error";
        }
    }
    public List obtenerEntrada(Entrada entrada){
        try {
            return mientradaDAO.consultarEntrada(entrada);
            
        } catch (SQLException ex) {
            //Logger.getLogger(Entradacontroller.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public int obtenerCantidad(Entrada entrada){
        int x=0;
        try {
            
            return mientradaDAO.consultarCantidad(entrada);
            
        } catch (SQLException ex) {
            //Logger.getLogger(Entradacontroller.class.getName()).log(Level.SEVERE, null, ex);
            return x;
        }
    }

    
     public ArrayList <Entrada> getListaEntrada(){
        try {
            return mientradaDAO.consultarListaEntrada();
        } catch (SQLException ex) {
            //Logger.getLogger(Entradacontroller.class.getName()).log(Level.SEVERE, null, ex);
            return new ArrayList <Entrada>();
        }
    }
}
