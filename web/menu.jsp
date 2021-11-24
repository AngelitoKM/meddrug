
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <br>
        <br>
        <div class="container">
            <a href="addProducto.jsp" class="btn btn-success">
                <i class="fa fa-plus"></i> Nuevo Usuario </a>
        </div>

        <br>
        <div class="container mt-4">
            <br>
            <div class="form-group">
                <table class="table table-hover">
                    <thead>
                        <tr class="text-center">
                            <th>ID</th>
                            <th>Nombre Producto</th>
                            <th>IMAGEN</th>
                            <th>Descripcion</th>
                            <th>Codigo</th>
                            <th>Marca</th>

                            <th>ACCION</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${productos}">
                        <tr class="text-center">
                            <td>${p.id}</td>
                            <td>${p.nombre}</td>
                            <td><img src="${p.ruta}" height="100" width="100"></td>
                            <td>${p.descripcion}</td>
                            <td>${p.codigo}</td>
                            <td>${p.marca}</td>

                            <td>
                                <input type="hidden" id="codigo" value="${p.id}">
                                <a id="btnDelete" href="<c:url value="Controlador">
                                   <c:param name="accion" value="eliminarProducto" />
                                    <c:param name="cod" value="${p.id}" />
                                    </c:url>"><button type="button" class="btn btn-danger" data-toggle="tooltip"  title="Eliminar" data-original-title="Eliminar">
                                        <i class="fa fa-trash">Delete</i></button></a>
                            </td>
                        </tr>
                    </c:forEach>                    
                    </tbody>
                </table>      

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
