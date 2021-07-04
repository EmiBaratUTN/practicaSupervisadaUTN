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
    <body>
        <div class="container">
            <div class="col-3"></div>
            <div class="col-4">

                <h1>Confirma la eliminación???</h1>
                <h3>Posible recuperacion, no habrá.</h3>
                <form name="confirmarEliminacion" action="EliminarPesaje" method="post">
                    
                    <input type="hidden" value="${idPesaje}" name="txtIdPesaje">
                    <input type="submit" class="btn btn-warning" value="Eliminar">
                </form>
                <a href="ListarAlumnosPeso" class="btn btn-primary">Cancelar</a>
            </div>
            <div class="col-3"></div>
        </div>
    </body>
</html>