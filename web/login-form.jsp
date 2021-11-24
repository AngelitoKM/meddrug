<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
    </head>
    <body>
        <body style="margin: 0; padding: 0; background: url(img/Medicamentos.jpg) no-repeat center top; background-size: cover; font-family: sans-serif; height: 100vh">
        <div class="container">
    <header>
        <nav style="background: #353535" class="navbar navbar-expand-xl navbar-dark">
            <div class="container-fluid">
                <a href="index.jsp" class="navbar-brand text-white">  MEDDRUG</a>
                <div class="navbar-nav ms-auto">
                    <a href="index.jsp" class="nav-item nav-link">Inicio</a>
                    <a href="login-form.jsp" class="nav-item nav-link active">Iniciar Sesion</a>
                </div>
                <div style="color: #18AAD9" class="navbar-text ms-3">Software de Inventario</div>
            </div>
        </nav>
    </header>
            <div class="login-box" style="width: 320px; height: 420px; background: #353535; color: #fff; top: 50%; left: 50%; position: absolute; transform: translate(-50%, -50%); box-sizing: border-box; padding: 70px 30px">
                <img src="img/candado.png" class="avatar" alt="Avatar Image" style="width: 100px; height: 100px; border-radius: 50%; position: absolute; top: -50px; left: calc(50% - 50px)">
                <h1 style="margin: 0; padding: 0 0 20px; text-align: center; font-size: 22px;">Inicio de Sesion</h1>
                <form action="Logincontrolador">
        
          <label for="username" style="margin: 0; padding: 0; font-weight: bold; display: block;">N° Identificación</label>
          <input name="txtdoc" style=" width: 100%; margin-bottom: 20px; border: none; border-bottom: 1px solid #fff; background: transparent; outline: none; height: 40px; color: #fff; font-size: 16px;" type="text" placeholder="Ingresa número de identificación">
        
        <label style="margin: 0; padding: 0; font-weight: bold; display: block;" for="password">Contraseña</label>
        <input style="border: none; border-bottom: 1px solid #fff; background: transparent; outline: none; height: 40px; color: #fff; font-size: 16px;" name="txtclave" type="password" placeholder="Contraseña">
        <br>
        <hr>
        <input class="btn btn-danger btn-block" style="border: none; outline: none ; height: 40px; width: 260px; background: #18AAD9; color: #fff; font-size: 18px; border-radius: 20px;" type="submit" value="Ingresar" name="accion">
        <br>
        <br>
        <a href="#" style="text-decoration: none; font-size: 15px; line-height: 20px; color: darkgrey;">Olvidé mi contraseña</a> <br>
      </form>
    </div>
            
            <footer class="text-center text-white fixed-bottom">
        <div class="container p-4"></div>
        
        <div class="text-center p-3" style="background-color: rgba(0,0,0,0.2)">
            Pagina Creada Por Meddrug - Derechos Reservados &copy; 2021
        </div>
       
    </footer>
        
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
    </body>
</html>
