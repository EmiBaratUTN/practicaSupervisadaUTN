<%-- 
    Document   : confirmarEliminacion
    Created on : Jun 28, 2021, 10:08:16 AM
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
    <body style="background-color: activecaption">
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <img style="box-sizing: border-box" width="100%" src="./img/exclamacion.png">
                </div>
                <div class="col-4">

                    <h1>Confirma la eliminación???</h1>
                    <h3>Posible recuperacion, no habrá.</h3>
                    <form name="confirmarEliminacion" action="EstadoUsuario" method="post">
                        <input type="hidden" value="1" name="confirmacion">
                        <input type="hidden" value="${idUsuario}" name="txtIdUsuario">
                        <input type="submit" class="btn btn-warning" value="Eliminar">
                        <a href="ControlUsuarios" class="btn btn-primary">Cancelar</a>
                    </form>

                </div>
                <div class="col-3"></div>
            </div>
        </div>
    </body>
</html>
