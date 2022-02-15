package com.modeloDAO;

import com.modelo.Producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO extends Conexion{
    
    Producto p =new Producto();
    Conexion cn = new Conexion();

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;

    public int agregar(Producto p) {        
        String sql = "insert into producto(Nombre,Ruta,descripcion,codigo,marca)values(?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, p.getNombre());
            ps.setString(2, p.getRuta());
            ps.setString(3, p.getDescripcion());
            ps.setString(4, p.getCodigo());
            ps.setString(5, p.getMarca());
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return r;
    }

    public List<Producto> listar() {        
        String sql = "select * from producto";
        List<Producto>lista=new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                Producto p=new Producto();
                p.setId(rs.getInt(1));
                p.setNombre(rs.getString(2));
                p.setRuta(rs.getString(3));
                p.setDescripcion(rs.getString(4));
                p.setCodigo(rs.getString(5));
                p.setMarca(rs.getString(6));
                
                lista.add(p);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    public void eliminarProducto(Producto p) throws Exception{
        String sql = "DELETE FROM producto"
                + " WHERE idProducto = " + p.getId();
        try{
           this.conectar(false);
           this.ejecutarOrden(sql);
           this.cerrar(true);
        }catch(Exception e){
            this.cerrar(false);
            throw e;
        }
    }
    
    public Producto list(int id) throws SQLException {        
        String sql = "select * from producto where idProducto="+id;
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs=ps.executeQuery();
            while (rs.next()) {
                
                p.setId(rs.getInt("idProducto"));
                p.setNombre(rs.getString("Nombre"));
                p.setRuta(rs.getString("Ruta"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setCodigo(rs.getString("codigo"));
                p.setMarca(rs.getString("marca"));
                
                System.out.println("Consulta Exitosa");
                
                }
            ps.close();
            
            
        } catch (Exception e) {
            System.out.println("Consulta no exitosa"+ e.getMessage());
        }finally{
            con.close();
        }
        return p;
    }
    
    public boolean edit (Producto p){
        
        String sql="update producto set Nombre='"+p.getNombre()+"',descripcion='"+p.getDescripcion()+"',codigo='"+p.getCodigo()+"',marca='"+p.getMarca()+"'where idProducto="+p.getId();
        try {
            con=cn.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
}
