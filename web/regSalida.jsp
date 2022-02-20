<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Registrar Salida - Meddrug</title>
        <link href="css/nav.css" rel="stylesheet" type="text/css"/>
        <link href="swetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/funcionesInventario.js" type="text/javascript"></script>
    </head>
    <body>
        
        <script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
        
        <!--<div class="wrapper">
            <div class="sidebar" style="background: #46b8da">
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
                    <a href="#"><i style="color: #cccccc" class="fab fa-facebook-f"></i></a>
                    <a href="#"><i style="color: #cccccc" class="fab fa-twitter"></i></a>
                    <a href="#"><i style="color: #cccccc" class="fab fa-instagram"></i></a>
                </div>
            </div>-->
        
        <%@include file="menu.jsp" %>
            <div class="main_content">
                <div class="header">Vista Registrar Salida.</div>  
                <div class="info">
                    <center>
                    </center>
                    <div class="container">
                        <div class="col-12">
                            <form name="entrada" action="servEntrada" method="POST" autocomplete="off">
                                <div class="card">
                                        <div class="card-header">
                                            <h3>Salida</h3>
                                        </div>
                                    <div class="card-body">
                                         <div class="form-group">
                                             <label>Cantidad</label>
                                             <input type="number" name="cantidadSalida" value="" size="30" placeholder="Ingrese solo el número ejemplo: 2" class="form-control" /><br/>
                                         </div>
                                        <div class="form-group">
                                            <label>Fecha de Salida</label>
                                             <input type="Date" name="fechaSalida" value="" size="30" class="form-control" /><br/>
                                        </div>
                                        <div class="form-group">
                                             <label>Referencia</label>
                                             <input type="text" name="statusSalida" value="" size="30" class="form-control"/><br/>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                       <%-- <input type="submit" value="Registrar" name="btnguardar" />--%>
                                        <button class="btn btn-outline-primary" type="submit" value="RegistrarSalida" name="regSalida">Reorganizar</button>
                                        <a href="Inventario.jsp" class="btn btn-outline-danger" name="cancelar">Cancelar</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
