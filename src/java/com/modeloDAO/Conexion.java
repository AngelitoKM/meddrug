package com.modeloDAO;

import com.mysql.jdbc.jdbc2.optional.MysqlConnectionPoolDataSource;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class Conexion {

    private Connection conexion;
    private boolean transaccionIniciada;
     Connection con;
    String url = "jdbc:mysql://localhost:3306/bd_prueba";
    String user = "root";
    String pass = "";

    protected Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        
        return conexion;
    }

    protected void conectar(boolean wTransaccion) throws Exception {
        MysqlConnectionPoolDataSource ds = new MysqlConnectionPoolDataSource();
        ds.setServerName("localhost");
        ds.setPort(3306);
        ds.setDatabaseName("bd_prueba");
        conexion = ds.getConnection("root", "");

        if (wTransaccion == true) {
            this.conexion.setAutoCommit(false);
            this.transaccionIniciada = true;
        } else {
            this.conexion.setAutoCommit(true);
            this.transaccionIniciada = false;
        }
    }

    protected void cerrar(boolean wEstado) throws Exception {
        if (this.conexion != null) {
            if (this.transaccionIniciada == true) {
                try {
                    if (wEstado == true) {
                        this.conexion.commit();
                    } else {
                        this.conexion.rollback();
                    }
                } catch (Exception e) {
                    throw e;
                }
            }
            try {
                this.conexion.close();
            } catch (Exception e) {
            }
        }
        this.conexion = null;
    }

    protected void ejecutarOrden(String wSQL) throws Exception {
        Statement st;

        if (this.conexion != null) {
            st = this.conexion.createStatement();
            st.executeUpdate(wSQL);
        }
    }

    protected ResultSet ejecutarOrdenDatos(String wSQL) throws Exception {
        Statement st;
        ResultSet rs = null;

        if (this.conexion != null) {
            st = this.conexion.createStatement();
            rs = st.executeQuery(wSQL);
        }

        return rs;
    }

    protected Object ejecutarProcedimiento(String wProcedimiento,
            List<Parametro> wParametros) throws Exception {
        CallableStatement cs;
        Object valor = null;
        String parNombre = "";

        try {
            cs = this.getConexion().prepareCall(wProcedimiento);
            if (wParametros != null) {
                for (Parametro par : wParametros) {
                    if (par.isEntrada() == true) {
                        cs.setObject(par.getNombre(), par.getValor());
                    } else {
                        parNombre = par.getNombre();
                        cs.registerOutParameter(par.getNombre(), par.getTipo());
                    }
                }
            }
            cs.executeUpdate();
            if (parNombre.length() > 0) {
                valor = cs.getObject(parNombre);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            cs = null;
        }

        return valor;
    }

    protected ResultSet ejecutarProcedimientoDatos(String wProcedimiento,
            List<Parametro> wParametros) throws Exception {
        CallableStatement cs;
        ResultSet rs = null;

        try {
            cs = this.getConexion().prepareCall(wProcedimiento);
            if (wParametros != null) {
                for (Parametro par : wParametros) {
                    if (par.isEntrada() == true) {
                        cs.setObject(par.getNombre(), par.getValor());
                    } else {
                        // parametro de salida
                    }
                }
            }
            rs = cs.executeQuery();
        } catch (Exception e) {
            throw e;
        } finally {
            cs = null;
        }

        return rs;
    }

    Connection getConnection() {
     try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
        } catch (Exception e) {
        }
        return con;
    }
    
    public void desconectar(){
            con=null;
        }
    public String conectar() {
        String respuesta="";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url, user, pass);
            respuesta="Exitoso";
        } catch (Exception e) {
            respuesta="Error, cambiar programador XD";
        }
        
        return respuesta;
    }

}