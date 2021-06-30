<%-- 
    Document   : errorCarga
    Created on : May 14, 2021, 1:30:00 PM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="estilos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h1>Error!!</h1>
            <p>${msj}</p>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
                <a class="link" href="menuAdmin.jsp">Volver al menu</a>
            </c:if>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
                <a class="link" href="menuUsuario.jsp">Volver al menu</a>
            </c:if>
            
        </div>
    </body>
</html>
