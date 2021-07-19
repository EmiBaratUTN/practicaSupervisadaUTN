<%-- 
    Document   : graficadorExamenesFiltrados
    Created on : Jul 19, 2021, 7:51:50 PM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="estilos.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestor" scope="request" class="controller.AccesoBaseDatos" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Su gráfico</h1>
        
        <!--hacer el grafico como David Pacheco-->
        <!--en el request esta la lista con los datos = listaExamenesGraficos-->
        <!--tengo que poner el form de filtardo para hacerlo dinamico-->
        
    </body>
</html>
