<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
            </div>
            <div class="main_content">
                <div class="header">Vista Registrar Usuario.</div>  
                <div class="info">

                    <center>
                        
                        
                    </center>
                    <div class="container">


                        <div class="col-12">
                            <form action="" class="col-md-6" method="GET" enctype="multipart/form-data">
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
                                            <input type="text" id="numDoc" name="txtNumdoc1" class="form-control" onchange="verifyDocument()">
                                        </div>
                                        <div id="validarC" class="text-danger"></div>
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
                                        <button class="btn btn-outline-primary" type="submit" name="btnGuardar">Registrar</button>
                                        <a href="Controladorusu?accion=Guardar" class="btn btn-outline-danger" name="cancelar">Cancelar</a>
                                    </div>                
                                </div>
                            </form>
                            
                            <%
                                if(request.getParameter("btnGuardar")!= null){
                                String tipoDoc = request.getParameter("txtTipodoc1");
                                String numDoc = request.getParameter("txtNumdoc1");
                                String nombres = request.getParameter("txtNombres");
                                String apellidos = request.getParameter("txtApellidos");
                                String correo = request.getParameter("txtCorreo");
                                String telefono = request.getParameter("txtTelefono");
                                String clave1 = request.getParameter("txtClave1");
                                
                                Connection cnx = null;
                                String url = "jdbc:mysql://localhost:3306/bd_prueba";
                                String user = "root";
                                String pass = "";
                                ResultSet rs= null;
                                Statement sta = null;
                                
                                
                                try{                                
                                Class.forName("com.mysql.jdbc.Driver");
                                cnx=DriverManager.getConnection(url, user, pass);
                                
                                sta=cnx.createStatement();
                                
                                sta.executeUpdate("insert into usuario(tipoDocumento,numDocumento,nombres,apellidos,correo,telefono,clave) values('"+tipoDoc+"','"+numDoc+"','"+nombres+"','"+apellidos+"','"+correo+"','"+telefono+"','"+clave1+"')");
                                request.getRequestDispatcher("Controladorusu?accion=Guardar").forward(request, response);
                                }catch(Exception e){out.print(e+""); }
                                
                                }                            
                                                                 
                                                                        
                                %>
                        </div>
                    </div>
                </div>
                
            </div>



        </div>
        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>                
                        
        <script> 
            function verifyDocument(){
                const numDoc = document.getElementById("numDoc").value;
                
                $.ajax({
                    url:"Controladorusu?accion=validarDocumento",
                    data:{
                        numDoc:numDoc
                    },
                    success: function(result){
                       $("#validarC").html(result);
                    } 
                })
            } 
        
        </script>
                
        <script src="js/eliminarusu.js" type="text/javascript"></script>
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>        
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        
    </body>
</html>
