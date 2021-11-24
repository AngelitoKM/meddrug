<%@page import="java.sql.ResultSet"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <title>Registrar usuario - Meddrug</title>
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
                <div class="header">Vista Registrar Usuario.</div>  
                <div class="info">

                    <center>
                        
                        
                    </center>
                    <div class="container">


                        <div class="col-12">
                            <form action="Controladorusu?accion=Guardar" class="col-md-6" method="POST" enctype="multipart/form-data">
                                <div class="card">
                                    <div class="card-header">
                                        <h3>Registrar Usuarios</h3>
                                    </div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>Tipo de documento (TI - CC)</label>
                                            <input type="text" name="txtTipodoc1" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Número de Documento</label>
                                            <input type="text" name="txtNumdoc1" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Nombres</label>
                                            <input type="text" name="txtNombres" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Apellidos</label>
                                            <input type="text" name="txtApellidos" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Correo</label>
                                            <input type="text" name="txtCorreo" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Teléfono</label>
                                            <input type="text" name="txtTelefono" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>Clave</label>
                                            <input type="password" name="txtClave1" class="form-control">
                                        </div>
                                    </div>
                                    <div class="card-footer">
                                        <button class="btn btn-outline-primary" name="accion" value="Guardar">Registrar Usuario</button>
                                        <a href="Controladorusu?accion=Guardar" class="btn btn-outline-danger" name="cancelar">Cancelar</a>
                                    </div>                
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                
            </div>



        </div>
        <script src="js/eliminarusu.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
