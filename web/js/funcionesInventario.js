$(document).ready(function(){
    $("tr #guardar").click(function (e){
        e.preventDefault();
        var cod=$(this).parent().find('#codigo').val();
         Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Your work has been saved',
                showConfirmButton: false,
                timer: 1500
              })
    })
});

