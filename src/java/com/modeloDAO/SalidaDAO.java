
package com.modeloDAO;

import com.modelo.salida;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.swing.JOptionPane;

public class SalidaDAO {
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
    
    public String eliminarProducto(salida ref) throws SQLException{
     if (!conectar().equals("Exitoso")){
            return "error";
        }
        String resp="";
        String sentencia="DELETE FROM entrada WHERE referencia= ?";
        
        try {
            preStatement = connection.prepareStatement(sentencia);
            preStatement.setString(1,ref.getStatusSalida());
            preStatement.executeUpdate();
            System.out.print(ref);
            System.out.print(sentencia);
            
            resp="ok";
        } catch (SQLException e) {
            resp="ocurrio un error";
        }
        finally{
            preStatement.close();
            connection.close();
            conexion.desconectar();
        }
        return resp;
    }
    
    public String actualizarInventario(salida referencia) throws SQLException{
        String resultado="";
        if (!conectar().equals("Exitoso")){
            return "error";
        }
        try {
            String consulta2="UPDATE entrada "
                + "SET Cantidad = ? , "
                + "FechaEntrada= ? "
                + "where referencia= ?";
            
            preStatement = connection.prepareStatement(consulta2);
            
            preStatement.setInt(1,referencia.getCantidadSalida());
            preStatement.setDate(2,referencia.getFechaSalida());
            preStatement.setString(3,referencia.getStatusSalida());
            preStatement.executeUpdate();
            resultado="ok";
        } catch (SQLException e) {
           resultado = "Error";
        }
        finally{
            preStatement.close();
            connection.close();
            conexion.desconectar();
        }
           return resultado; 
            
        
    }
}
