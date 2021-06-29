<%-- 
    Document   : editarExamen
    Created on : Jun 19, 2021, 9:35:20 AM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="estilos.jsp" %>
<jsp:useBean id="gestor" scope="request" class="controller.AccesoBaseDatos"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar examen</title>
    </head>
    <body>
        <h1>Edición de examen</h1>
        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
            <a href="menuAdmin.jsp">Volver al men&uacute; principal</a>
        </c:if>
        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
            <a href="menuUsuario.jsp">Volver al men&uacute; principal</a>
        </c:if>
        <div class="container">
            <h2 class="display-3">Edite los datos del examen nro: ${examenDto.idExamen}</h2>
            <h3></h3>
            <form action="EditarExamen" method="POST" name="formEdicionExamen">

                <!--paso el idAlumno y el idCategoria para poder completar los campos de examen.-->
                <input type="hidden" value="${examenModel.idAlumno}" name="txtIdAlumno">
                <input type="hidden" value="${examenModel.idCategoria}" name="txtIdCategoria">
                <input type="hidden" value="${examenDto.idExamen}" name="txtIdExamen">
                <!--<input type="hidden" value="${alumnoDto.idGenero}" name="txtIdGenero">-->

                <div class="row">

                    <div style="height: 100px" class="col-4">
                        <label class="form-label d-block" for="tipoExamen">Tipo de Examen</label>
                        <select class="form-control d-block" id="tipoExamen" name="cmbTipoExamen">
                            <option selected value="${examenModel.tipoExamen}">${examenDto.tipoExamen}</option>
                            <c:forEach items="${ gestor.listarTiposExamen()}" var="item">
                                <option value="${ item.idTipoExamen }">${ item.descripcion }</option>
                            </c:forEach>
                        </select>

                    </div>
                    <div style="height: 100px" class="col-4 ">
                        <div class="form-group ">
                            <label class="form-label d-block" for="profesor">Profesor</label>
                            <select class="form-control d-block" id="profesor" name="cmbProfesor">
                                <option value="${examenModel.idProfesor}">${examenDto.nombreProfe} ${examenDto.apellidoProfe}</option>
                                <c:forEach items="${ gestor.listarProfesores()}" var="item">
                                    <option value="${ item.idProfesor }">${ item.nombre } ${item.apellido}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div style="height: 100px" class="col-4">
                        <label class="form-label d-block" for="fechaExamen">Fecha del Examen</label>
                        <input type="date" autocomplete="true" name="dtpFechaExamen" class="form-control" min="2000-01-01" max="${fechaActual}" value="${examenDto.fechaExamen}" > 
                        <!--SERIA INTERESANTE DEJAR LA ULTIMA FECHA QUE INGRESO PARA LA PROXIMA CARGA. (DEJARLA EN SESSION???)-->
                    </div>

                </div>

                </br>
                <!--////////////busco las pruebas de la DB y las pongo como inputs-->       
                <h4>Ingrese los resultados de las pruebas</h4>
                <div class="row">

                    <div class="col">
                        <div class="form-group row">
                            <c:forEach items="${gestor.listarTiposDePrueba()}" var="item">
                                <div class="form-check">
                                    <input type="hidden" name="txtIdTipoPrueba${item.descripcion.trim()}" value="${item.tipoPrueba}">
                                    <label for="${item.descripcion.trim()}" class="col-auto col-form-label">${item.descripcion.trim()}</label>
                                    <div class="col-auto">
                                        <input type="text" value="${gestor.buscarResultadoPrueba(examenDto.idExamen, item.tipoPrueba)}" class="form-control" id="${item.descripcion.trim()}" name="txt${item.descripcion.trim()}" placeholder="">
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>

                </div>

                <div class="form-group">
                    <label for="observaciones">Observaciones</label>
                    <textarea class="form-control" id="observaciones" rows="3" name="txtObservaciones">${examenModel.observaciones}</textarea>
                </div>

                <!--////////////btn sumit////////////-->
                <div class="form-group row">
                    <div class="col-auto">
                        <input  class="form-control btn btn-primary mb-2" type="submit" value="Editar">
                    </div>
                    <div class="col-auto">
                        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
                            <a class="btn btn-primary" href="menuAdmin.jsp">Cancelar</a>
                        </c:if>
                        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
                            <a class="btn btn-primary" href="menuUsuario.jsp">Cancelar</a>
                        </c:if>
                    </div>


                </div>
            </form>
    </body>
</html>
