<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Añadir producto - Meddrug</title>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <link href="css/nav.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

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
                <div class="header">Vista Agregar Productos.</div>  
                <div class="info">

                    <center>
                        
                        
                    </center>
                    <div class="container">


                        <div class="col-12">
                            <form action="Controlador?accion=Guardar" class="col-md-6" method="POST" enctype="multipart/form-data">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Agregar Productos</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Nombre del Producto</label>
                                            <input type="text" name="txtNombre" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Descripcion</label>
                                            <input type="text" name="txtDescripcion" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Codigo</label>
                                            <input type="text" name="txtCodigo" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Marca</label>
                                            <input type="text" name="txtMarca" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Foto del Producto</label>
                                            <input type="file" name="fileImagen">
                                            <br>
                                            <label>(Formato .JPEG)</label>
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn btn-outline-primary" name="accion" value="Guardar">Guardar Producto</button>
                                        <a href="Controlador?accion=Guardar" class="btn btn-outline-danger" name="cancelar">Cancelar</a>
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
        <script src="js/eliminar.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
