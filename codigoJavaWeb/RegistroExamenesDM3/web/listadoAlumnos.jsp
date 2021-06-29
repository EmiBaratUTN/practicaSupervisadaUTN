<%-- 
    Document   : listadoAlumnos
    Created on : May 18, 2021, 11:14:22 AM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="estilos.jsp" %>
<jsp:useBean id="gestor" scope="request" class="controller.AccesoBaseDatos" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado Alumnos</title>
    </head>
    <body>
        <h1>Listado de Alumnos </h1>
        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
        <a href="menuAdmin.jsp">Volver al men&uacute; principal</a>
        </c:if>
        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
        <a href="menuUsuario.jsp">Volver al men&uacute; principal</a>
        </c:if>
        
        <div class="container-fluid">            
            <h2>Filtrar Alumnos por...</h2>
            <form class="form d-block " action="ListarAlumnos" method="post">
<!--                <input name="hiddenIdAlumno" type="hidden" value="${alumno.idAlumno}"/>-->

                <div class="container form-group row">
                    <div class="col-auto">
                        <label class="form-label" for="nombreAlumno">Por nombre</label>
                        <input class="form-control" id="nombreAlumno" name="txtNombreAlumno" type="text"/>
                    </div>
                    <div class="col-auto">
                        <label class="form-label" for="apellidoAlumno">Por apellido</label>
                        <input class="form-control" id="apellidoAlumno" name="txtApellidoAlumno" type="text"/>
                    </div>
                    <div class="col-auto">
                        <label class="form-label" for="categorias">Categoria</label>
                        <select class="form-control" id="categorias" name="cboCategorias">
                            <c:forEach items="${gestor.listarCategorias()}" var="item">
                                <option value="${item.idCategoria}">${item.descripcion}</option>
                            </c:forEach>
                            <option value="0" selected="">Tadas las categoria</option>
                        </select>
                    </div>


                </div>

                <div style="align-items: flex-end " class="container row">
                    <div style="padding-right:1px" class="col-auto">
                        <label class="form-label d-block" for="codEstadistico">...Codigo estadistico</label>
                        <input class="form-control d-block" type="text" name="txtCodEstadistico" id="codEstadistico"/>
                    </div>
                    <div style="padding-right:1px" class="col-auto">
                        <label class="form-label d-block" for="dni">... dni</label>
                        <input class="form-control d-block" type="text" name="txtDni" id="dni"/>
                    </div>

                    <div style="padding-right:1px" class="col-auto">
                        <label class="form-label d-inline" for="tipoGenero">...por genero</label>
                        <select class="form-control d-inline" id="tipoGenero" name="cmbTipoGenero">
                            <c:forEach items="${ gestor.listarGeneros()}" var="item">
                                <option value="${ item.idGenero }">${ item.nombreGenero }</option>
                            </c:forEach>
                            <option selected value="0">Todos los tipos</option>
                        </select>
                    </div>
                    <div style="padding-right:1px " class="col-auto">
                        <label class="form-label d-inline" for="tipoGrado">...por grado</label>
                        <select  class="form-control d-inline" id="tipoGrado" name="cmbTipoGrado">
                            <c:forEach items="${ gestor.listarGrados()}" var="item">
                                <option value="${ item.idGrado }">${ item.nombreGrado }</option>
                            </c:forEach>
                            <option selected value="0">Todos los Grados</option>
                        </select>
                    </div>
                </div>
                <br/>
                <div class="container row">
                    <div class="col-auto">
                        <input class=" form-control btn btn-primary mb-2" type="submit" value="Aplicar filtros"/>

                    </div>
                    <div class="col-auto">
                        <a href="ListarAlumnos" class="btn btn-primary mb-2">Deshacer los filtros</a>
                    </div>
                </div>
            </form>

        </div>
        <table class="table table-striped table-center table-centered text-center table-bordered">

            <thead>
                <tr>
                    <th>Grado</th>
                    <th>Apellido</th>
                    <th>Nombre</th>
                    <th>DNI</th>
                    <th>CE</th>
                    <th>Género</th>
                    <th>Fecha Nacimiento</th>


                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaAlumnos}" var="dtoAlumnos">
                    <tr>
                        <td>${dtoAlumnos.grado}</td>
                        <td>${dtoAlumnos.apellido}</td>
                        <td>${dtoAlumnos.nombre}</td>
                        <td>${dtoAlumnos.dni}</td>
                        <td>${dtoAlumnos.codigoEst}</td>
                        <td>${dtoAlumnos.genero}</td>
                        <td>${dtoAlumnos.fechaNac}</td>
                        <td><a class="btn btn-primary" href="AltaExamen?idAlumno=${dtoAlumnos.idAlumno}">Registrar Examen</a></td>
                        <td><a class="btn btn-primary" href="ListarExamenesPorAlumno?idAlumno=${dtoAlumnos.idAlumno}">Ver examenes</a></td>                            
                        <td><a class="btn btn-success" href="EditarAlumno?idAlumno=${dtoAlumnos.idAlumno}">Editar Alumno</a></td>
                        
                    </tr>
                </c:forEach>
            </tbody>


        </table>
    </body>
</html>
