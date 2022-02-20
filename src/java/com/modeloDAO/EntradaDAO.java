/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.modeloDAO;
import com.modelo.Entrada;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import com.modeloDAO.Conexion;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class EntradaDAO {
    Connection connection=null;
    Conexion conexion=null;
    PreparedStatement preStatement=null;
    
    private String conectar(){
        conexion = new Conexion();
        String resultado=conexion.conectar();
        if (resultado.equals("Exitoso")){
            connection = conexion.getConnection();
            preStatement = null;
        }else{
            JOptionPane.showMessageDialog(null,resultado,"Error",JOptionPane.ERROR_MESSAGE);
        }
        return resultado;
    }
    
    public String registrarEntrada(Entrada referencia) throws SQLException{
        String resultado="";
        if (!conectar().equals("Exitoso")){
            return "error";
        }
        String consulta= "INSERT INTO entrada(Cantidad,FechaEntrada,referencia)"+" VALUES (?,?,?)";
        try{
            preStatement = connection.prepareStatement(consulta);
            preStatement.setInt(1,referencia.getCantidad());
            preStatement.setDate(2,referencia.getFechaEntrada());
            preStatement.setString(3,referencia.getReferencia());
            preStatement.execute();
            resultado="ok";
        } catch(SQLException e){
            e.printStackTrace();
        }
        finally{
            preStatement.close();
            connection.close();
            conexion.desconectar();
        }
        return resultado;
    }
    
    public List consultarEntrada(Entrada consulta) throws SQLException{
        List<Entrada>lista= new ArrayList<>();
        Entrada miproducto=null;
        
        if (!conectar().equals("Exitoso")){
            return lista;
        }
        ResultSet result=null;
        
        String consulta2 ="SELECT Cantidad,FechaEntrada,referencia" + " FROM entrada where referencia=? ";
        
        try {
            preStatement=connection.prepareStatement(consulta2);
             preStatement.setString(1, consulta.getReferencia());
             result = preStatement.executeQuery();
             
             if(result.next()){
                miproducto  = new Entrada();
                miproducto.setCantidad(result.getInt("Cantidad"));
                miproducto.setFechaEntrada(result.getDate("FechaEntrada"));
                miproducto.setReferencia(result.getString("referencia"));
                lista.add(miproducto);
             }
        } catch (SQLException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            result.close();
            preStatement.close();
            connection.close();
            conexion.desconectar();  
        }
        return lista;
    }
    
   public ArrayList<Entrada> consultarListaEntrada() throws SQLException{
        ArrayList<Entrada> listaEntrada= new ArrayList<Entrada>();
        if (!conectar().equals("Exitoso")){
            return listaEntrada;
        }
        
        ResultSet result=null;
        
        Entrada mientrada=null;
        
        String consulta="SELECT Cantidad,fechaEntrada,referencia" + " FROM entrada";
        
        try {
            preStatement=connection.prepareStatement(consulta);
            result=preStatement.executeQuery();
            //Se realiza un while para traer varias personas a la consulta, para una sola persona se utiliza el if
            while(result.next()==true){
                mientrada=new Entrada();
                mientrada.setCantidad(Integer.parseInt(result.getString("Cantidad")));
                mientrada.setFechaEntrada(Date.valueOf(result.getString("Cantidad")));
                mientrada.setReferencia(result.getString("Cantidad"));
                listaEntrada.add(mientrada);
            }
        } catch (SQLException e) {
            System.out.println("Error en la consulta de entradas: "+e.getMessage());
        }
        finally{
            preStatement.close();
            connection.close();
            conexion.desconectar();
        }
        return listaEntrada;
    }
    
   public int consultarCantidad(Entrada consulta) throws SQLException{
        int x=0;
        int salida1=0;
        Entrada miproducto=null;
        //Entrada entradax= new Entrada();
        
        if (!conectar().equals("Exitoso")){
            return x;
        }
        ResultSet result=null;
        
        String consulta2 ="SELECT Cantidad" + " FROM entrada where referencia=? ";
        
        try {
            preStatement=connection.prepareStatement(consulta2);
             preStatement.setString(1, consulta.getReferencia());
             result = preStatement.executeQuery();
             
             if(result.next()){
                miproducto  = new Entrada();
                miproducto.setCantidad(result.getInt("Cantidad"));
                salida1=Integer.parseInt(String.valueOf(miproducto.getCantidad()));
                //System.out.print(miproducto.getCantidad());
                //return miproducto.getCantidad();
             }
        } catch (SQLException ex) {
            Logger.getLogger(EntradaDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            result.close();
            preStatement.close();
            connection.close();
            conexion.desconectar();  
        }
    return salida1;

    }
}
