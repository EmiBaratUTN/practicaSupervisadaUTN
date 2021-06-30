<%-- 
    Document   : exitoCarga
    Created on : May 24, 2021, 11:57:30 AM
    Author     : Emiliano Barat
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean  id="gestor" scope="request" class="controller.AccesoBaseDatos"/>

<%@include file="estilos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Examenes eduFis</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h3>${msj}</h3>
            </div>
<!--            <table class="table table-striped">

                <th>Nro</th>
                <th>Fecha</th>
                <th>Alumno</th>
                <th>Categoria</th>
                <th>Profesor</th>
                <th>Nota Final</th>


                <tr>
                    <td>${gestor.buscarExamen(idExamen).idExamen}</td>
                    <td>${gestor.buscarExamen(idExamen).fechaExamen}</td>
                    <td>${gestor.buscarExamen(idExamen).nombreAlumno} ${gestor.buscarExamen(idExamen).apellidoAlumno} </td>
                    <td>${gestor.buscarExamen(idExamen).categoria}</td>
                    <td>${gestor.buscarExamen(idExamen).nombreProfe} ${gestor.buscarExamen(idExamen).apellidoProfe}</td>
                    <td>${gestor.buscarExamen(idExamen).notaFinal}</td>
                </tr>

                El examen deberia mostrar el resultado de cada prueba???
                si, pero uso otro metodo en el buscador para traer los datos. en funcion del idExamen

                Hacer los links de navegacion: volver menu; cargar otro examen; cargar alumno.
            </table>-->

<!--            <table class="table table-striped">
                <c:forEach items="${gestor.listarPruebasRendidasXIdExamen(idExamen)}" var="item">
                    <tr>
                        <td>${item.nombrePrueba}</td>
                        <td>${item.resultado}</td>
                        <td>${item.puntaje}</td>

                    </tr>
                </c:forEach>
            </table>-->
            <br>
            <a style="margin-right: 100px" href="ListarAlumnos" class="">Volver a listado Alumnos</a>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
                <a href="menuAdmin.jsp">Volver al men&uacute; principal</a>
            </c:if>
            <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
                <a href="menuUsuario.jsp">Volver al men&uacute; principal</a>
            </c:if>


            <!--DEBERIA HABER UNA FORMA DE EDITAR ANTES DE MANDAR A LA BASE DE DATOS... SE PODRIA HACER EL VISUALIZAR COMO UNA VISTA PREVIA-->

        </div>
    </body>
</html>
