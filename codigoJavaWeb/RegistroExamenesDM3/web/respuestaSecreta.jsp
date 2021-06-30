<%-- 
    Document   : login
    Created on : Jun 9, 2021, 12:28:44 PM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="estilos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="background-color: moccasin">
        
        <div class="container">
            <div style="height: 150px; background-color: beige" class="row align-items-center">
                <div class="col-auto">
                    <h1>Responda la pregunta para ver su contraseña</h1>
                    
                    <!--<h5>${msj}</h5>-->
                </div>
            </div>
            <div style="margin-top: 20px" class="row justify-content-center align-items-center">
                <div class="col-3"></div>

                <div class="col-4">
                    <form action="VerificarRespuestaSecreta" method="post" class="form">
                        <input type="hidden" name="txtNombreUsuario" value="${usuario.nombreUsuario}">
                        <div>
                            <label class="form-label" for="respuesta">${usuario.preguntaSecreta}</label>
                            <input class="form-control" required="" type="text" name="txtRespuestaUser" id="respuesta">
<!--                            <p class="text-danger">${usuarioIncorrecta}</p>
                            <p class="text-danger">${usuarioBaja}</p>-->
                        </div>
<!--                        <div>
                            <label class="form-label" for="pass">Password:</label>
                            <input class="form-control" required="required" type="password" name="txtPass" id="pass">
                            <p class="text-danger">${contrasenaIncorrecta}</p>
                        </div>-->
                        <br>
                        <input class="form-control btn btn-primary" type="submit" value="Validar usuario">
                    </form>
                    
                    
                </div>
                <div class="col-3"></div>
            </div>

        </div>   
    </body>
</html>

