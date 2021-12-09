package com.modeloDAO;

import com.modelo.Usuario;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDAO extends Conexion{
    
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r = 0;
    
    public int agregar(Usuario usu) {
        Conexion cn = new Conexion();
        String sql = "insert into usuario(tipoDocumento,numDocumento,nombres,apellidos,correo,telefono,clave)values(?,?,?,?,?,?,?)";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, usu.getTipoDocu());
            ps.setString(2, usu.getNumDocu());
            ps.setString(3, usu.getNombre());
            ps.setString(4, usu.getApellido());
            ps.setString(5, usu.getCorreo1());
            ps.setString(6, usu.getTelefono());
            ps.setString(7, usu.getClave1());
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        return r;
    }
    
    public List<Usuario> listar() {
        Conexion cn = new Conexion();
        String sql = "select * from usuario";
        List<Usuario>lista=new ArrayList<>();
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usu=new Usuario();
                usu.setIdu(rs.getInt(1));
                usu.setTipoDocu(rs.getString(2));
                usu.setNumDocu(rs.getString(3));
                usu.setNombre(rs.getString(4));
                usu.setApellido(rs.getString(5));
                usu.setCorreo1(rs.getString(6));
                usu.setTelefono(rs.getString(7));
                usu.setClave1(rs.getString(8));
                                
                lista.add(usu);
            }
        } catch (Exception e) {
        }
        return lista;
    }
    
    public void eliminarUsuario(Usuario usu) throws Exception{
        String sql = "DELETE FROM usuario"
                + " WHERE idUsuario = " + usu.getIdu();
        try{
           this.conectar(false);
           this.ejecutarOrden(sql);
           this.cerrar(true);
        }catch(Exception e){
            this.cerrar(false);
            throw e;
        }
    }
}
