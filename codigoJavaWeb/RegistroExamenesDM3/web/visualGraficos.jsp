<%-- 
    Document   : visualGraficos
    Created on : Jun 22, 2021, 10:49:17 AM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="estilos.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="background-color: activecaption">
        <div style="margin-bottom: 20px" class="container">
            <h1>Mostrar Graficos estadisticos</h1>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
                <a style="color: darkblue" href="menuAdmin.jsp">Volver al men&uacute; principal</a>
            </c:if>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
                <a style="color: darkblue" href="menuUsuario.jsp">Volver al men&uacute; principal</a>
            </c:if>

        </div>
        <div class="container">
            <div class="row">
                <!--            <div style="margin-bottom: 50px" class="row">
                                <div class="col-auto">
                                <img src="/RegistroExamenesDM3/GraficoTorta"></img>
                            </div>-->
                <div class="col-auto">
                    <img src="/RegistroExamenesDM3/GraficoPiePesoTodos"></img>
                </div>

                <br>


                <div class="col-auto">
                    <img src="/RegistroExamenesDM3/GraficoBarrasNotasPorPruebaTodos"></img>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
