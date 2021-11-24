 function eliminarUsuario(cod) {
        var url = "Controlador?accion=eliminarUsuario&cod=" + cod;
        console.log("eliminado");
        $.ajax({
            type: 'POST',
            url: url,
            async: true,
            success: function (r) {
                
            }
        });
    }


