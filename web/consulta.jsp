<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<a href="../src/java/com/model/Entrada.java"></a>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar - Meddrug</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="swetalert/sweetalert.js" type="text/javascript"></script>
        
        <link href="css/nav.css" rel="stylesheet" type="text/css">
        <%@include file="conexion.jsp" %>
    </head>
    <body>
        
                
        <div class="wrapper">
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
            </div>
        </div>
        <%@include file="menu_1.jsp" %>
            
        <div class="main_content">
                <div class="header">Vista Consultar Entrada.</div>  
                <div class="info">
                    <center>
                    </center>
                    <div class="container1">
                        <div>
                            <div class="form-group">
                            <form name="entrada" action="servEntrada" method="POST" autocomplete="off">
                                <input type="text" name="Referencia" value="" size="30" /><br/>
                                <input type="submit" value="Consultar" name="btnconsultar" />
                                
                                <table class="table table-bordered table-hover" width="780"  border="1">
                                    <thead>
                                        <tr class="text-center table-info">
                                            <th>Cantidad</th>
                                            <th>Fecha de Entrada</th>
                                            <th>Referencia</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="miproducto" items="${entradax}">
                                            <tr>
                                                <td>
                                                    ${miproducto.getCantidad()}
                                                    
                                                </td>
                                                <td>
                                                    ${miproducto.getFechaEntrada()}
                                                </td>
                                                <td>
                                                    ${miproducto.getReferencia()}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table> 
                                
                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="text-center text-white fixed-bottom">
        <div class="container p-4"></div>
        <div class="text-center p-3" style="background-color: rgba(0,0,0,0.2); color: #333">
            Pagina Creada Por Meddrug- Derechos Reservados &copy; 2021
        </div>
    </footer>
    </body>
</html>
