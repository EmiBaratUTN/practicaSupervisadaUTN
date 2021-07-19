<%-- 
    Document   : visualGraficos
    Created on : Jun 22, 2021, 10:49:17 AM
    Author     : Emiliano Barat
--%>

<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="estilos.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="gestor" scope="request" class="controller.AccesoBaseDatos" />
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body style="">
        <%@include file="header.jsp" %>
        <div style="margin-bottom: 20px" class="container">
            <h1>Mostrar Graficos estadisticos</h1>
            <!--<c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
                <a style="color: darkblue" href="menuAdmin.jsp">Volver al men&uacute; principal</a>
            </c:if>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
                <a style="color: darkblue" href="menuUsuario.jsp">Volver al men&uacute; principal</a>
            </c:if>-->

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
                    <form action="GraficoBarrasNotasPorPruebaTodos" >
                        <label class="form-label" for="categorias">Categoria</label>
                        <select class="form-control" id="categorias" name="cboCategorias">
                            <c:forEach items="${gestor.listarCategorias()}" var="item">
                                <option value="${item.idCategoria}">${item.descripcion}</option>
                            </c:forEach>
                            <option value="0" selected=""></option>
                        </select>
                        <input type="submit" class="btn btn-primary" value="Filtrar datos">
                    </form>
                    <img src="/RegistroExamenesDM3/GraficoBarrasNotasPorPruebaTodos"></img>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
