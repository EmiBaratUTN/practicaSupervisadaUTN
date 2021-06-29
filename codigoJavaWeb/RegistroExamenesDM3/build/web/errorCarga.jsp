<%-- 
    Document   : errorCarga
    Created on : May 14, 2021, 1:30:00 PM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Error!!</h1>
        <p>${msj}</p>
        <p>${a.grado}</p>
        <p>${a.genero}</p>
        <p>${a.nombres}</p>
        <p>${a.fechaNacimiento}</p>
        <p>${categoria.descripcion}</p>
        <p>${categoria.idCategoria}</p>
        
    </body>
</html>
