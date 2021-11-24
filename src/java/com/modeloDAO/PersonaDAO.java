
package com.modeloDAO;

import com.modelo.Persona;
import com.modelo.Validar;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class PersonaDAO implements Validar{
    
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    int r=0;
    
    @Override    
    public int validar(Persona per){
        int r=0;
        String sql="SELECT * FROM usuario WHERE numDocumento=? and clave=?";
        try {
            con = cn.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, per.getNumDoc());
            ps.setString(2, per.getClave());
            rs = ps.executeQuery();
            while(rs.next()){
                r=r+1;
                per.setNumDoc(rs.getString("numDocumento"));
                per.setClave(rs.getString("clave"));
            }
            if (r==1) {
                return 1;
            }else{
                return 0;
            }
        } catch (SQLException e) {
            return 0;
        }
    }    
}
