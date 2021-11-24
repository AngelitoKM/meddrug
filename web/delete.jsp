<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection con;
        String url="jdbc:mysql://localhost:3306/bd_prueba";
        String Driver="com.mysql.jdbc.Driver";
        String user="root";
        String clave="";
        Class.forName(Driver);
        con=DriverManager.getConnection(url,user,clave);
        
        PreparedStatement ps;
        
        int id=Integer.parseInt(request.getParameter("idProducto"));
        ps=con.prepareStatement("delete from producto where idProducto="+id);
        ps.executeUpdate();
        response.sendRedirect("Controlador?accion=Guardar");
        
        
        %>
        
    </body>
</html>
