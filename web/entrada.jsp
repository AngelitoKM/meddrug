<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Entrada - Meddrug</title>
        <link href="img/Logo meddrug (only pildora).png" rel="icon">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <link href="css/nav.css" rel="stylesheet" type="text/css"/>
        <%@include file="conexion.jsp" %>
    </head>
    <body>
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
                
        <!--<div class="wrapper">
            <div class="sidebar text-secondary" style="background-color: #46b8da">
                <h2>Meddrug</h2>                
                <ul>
                    <li><a href="#" style="color: #333"><i class="fas fa-home"></i>Inicio</a></li>
                    <li><a href="Controladorusu?accion=Guardar" style="color: #333"><i class="fas fa-user"></i>Usuarios</a></li>
                    <li><a href="Controlador?accion=Guardar" style="color: #333"><i class="fas fa-address-card"></i>Productos</a></li>
                    <li><a href="Salida.jsp" style="color: #333"><i class="fas fa-project-diagram"></i>Salida</a></li>
                    <li><a href="entrada.jsp" style="color: #333"><i class="fas fa-blog"></i>Entrada</a></li>
                    <li><a href="Inventario.jsp" style="color: #333"><i class="fas fa-address-book"></i>Inventario</a></li>
                    <li><a href="#" style="color: #333"><i class="fas fa-map-pin"></i>Contactos</a></li>
                    <li><a href="Logincontrolador?accion=Salir" style="color: #333"><i class="fas fa-door-open"></i>Cerrar Sesion</a></li>                   
                </ul> 
                <div class="social_media">
                    <a href="#" style="color: #e0e4e8; background: #717171"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" style="color: #e0e4e8; background: #717171"><i class="fab fa-twitter"></i></a>
                    <a href="#" style="color: #e0e4e8; background: #717171"><i class="fab fa-instagram"></i></a>
                </div>
            </div>-->
        
        <%@include file="menu_1.jsp" %>
            <div class="main_content">
                <div class="header">Entrada.</div>  
                <div class="info">
                    
                    <table class="tablabtn" style="background-color: #46b8da; border: #46b8da; margin-left: auto; margin-right: auto;">
                    <div class="container">
                        <th><a href="addEntrada.jsp" class="btn btn-success" style="background-color: #46b8da; border: #46b8da">
                            <i class="fa fa-plus"></i> Nueva Entrada</a></th>
                    </div>
                    <div class="container">
                       <th> <a href="consulta.jsp" class="btn btn-success" style="background-color: #46b8da; border: #46b8da">
                        <i class="fa fa-plus"></i> Consultar Entrada</a></th>
                    </div>
                    </table>
                    <br>
                    <div class="container mt-4">
                        <br>
                        <div class="form-group">
                            <table class="table table-bordered table-hover" width="780"  border="1">
                                <thead>
                                    <tr class="text-center table-info">
                                        <th>Cantidad</th>
                                        <th>Fecha de Entrada</th>
                                        <th>Referencia</th>
                                    </tr>
                                </thead>
                                <%
                                String qry="Select * from entrada";
                                ResultSet data= sql.executeQuery(qry);
                                while(data.next()){
                                %>
                                <tr>
                                    <th>
                                        <% out.print(data.getInt(1));%>
                                    </th>
                                    <th>
                                        <% out.print(data.getDate(2));%>
                                    </th>
                                    <th>
                                        <% out.print(data.getString(3));%>
                                    </th>
                                <%}%>
                                </tr>
                            </table>      

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
    
        
        
        <script src="js/eliminarusu.js" type="text/javascript"></script>    
    <script src="swetalert/sweetalert.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
