<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.modelo.Producto"%>
<%@page import="com.modeloDAO.ProductoDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Editar Producto - Meddrug</title>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <link href="css/nav.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <% 
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            String codigo = request.getParameter("codigo");
            String marca = request.getParameter("marca");
            

        %>

        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

        <div class="wrapper">
            <div class="sidebar" style="background: #46b8da">
                <h2>Meddrug</h2>
                <ul>
                    <li><a href="#" style="color: #333"><i class="fas fa-home"></i>Home</a></li>
                    <li><a href="Controladorusu?accion=Guardar" style="color: #333"><i class="fas fa-user"></i>Usuarios</a></li>
                    <li><a href="Controlador?accion=Guardar" style="color: #333"><i class="fas fa-address-card"></i>Productos</a></li>
                    <li><a href="#" style="color: #333"><i class="fas fa-project-diagram"></i>Proveedores</a></li>
                    <li><a href="#" style="color: #333"><i class="fas fa-blog"></i>Rutas</a></li>
                    <li><a href="#" style="color: #333"><i class="fas fa-address-book"></i>Contacto</a></li>
                    <li><a href="#" style="color: #333"><i class="fas fa-map-pin"></i>Mapa</a></li>
                    <li><a href="Logincontrolador?accion=Salir" style="color: #333"><i class="fas fa-door-open"></i>Cerrar Sesion</a></li>
                </ul> 
                <div class="social_media">
                    <a href="#"><i style="color: #cccccc" class="fab fa-facebook-f"></i></a>
                    <a href="#"><i style="color: #cccccc" class="fab fa-twitter"></i></a>
                    <a href="#"><i style="color: #cccccc" class="fab fa-instagram"></i></a>
                </div>
            </div>
            <div class="main_content">
                <div class="header">Vista Editar Productos.</div>  
                <div class="info">

                    <center>
                        
                        
                    </center>
                    <div class="container">


                        <div class="col-12">
                            <form action="editProducto.jsp" class="col-md-6" method="GET" enctype="multipart/form-data">
                                <div class="card">
                                    <div class="card-header">                                        
                                        <h3>Editar Producto</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <input type="hidden" name="id" class="form-control" value="<%= id %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Nombre del Producto</label>
                                            <input type="text" name="nombre" class="form-control" value="<%= nombre %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Descripcion</label>
                                            <input type="text" name="descripcion" class="form-control" value="<%= descripcion %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Codigo</label>
                                            <input type="text" name="codigo" class="form-control" value="<%= codigo %>">
                                        </div>
                                        <div class="form-group">
                                            <label>Marca</label>
                                            <input type="text" name="marca" class="form-control" value="<%= marca %>">
                                        </div>                                        
                                    </div>
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-outline-primary" name="enviar">Actualizar</button>
                                        <a href="Controlador?accion=Guardar" class="btn btn-outline-danger" value="">Cancelar</a>
                                    </div>                
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
        <footer class="text-center text-white fixed-bottom">
        <div class="container p-4"></div>
        
        <div class="text-center p-3" style="background-color: rgba(0,0,0,0.2); color: #333">
            Pagina Creada Por Meddrug- Derechos Reservados &copy; 2021
        </div>
       
    </footer>
            </div>



        </div>
         <% 
         
            if (request.getParameter("enviar")!= null) {
                
                try {
                        Connection con = null;
                        String url = "jdbc:mysql://localhost:3306/bd_prueba";
                        String user = "root";
                        String pass = "";
                        Statement st = null;                        
                        
                        Class. forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, pass);                        
                        st = con.createStatement();
                        st.executeUpdate("update producto set Nombre='"+ nombre +"',descripcion='"+ descripcion +"',codigo='"+ codigo +"',marca='"+ marca +"' where idProducto='"+ id +"';");
                        request.getRequestDispatcher("Controlador?accion=Guardar").forward(request, response);
                        
                        
                    } catch (Exception e) {
                        out.print(e);
                    }
                    
                } 
                
         
         %>
        <script src="js/eliminar.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
