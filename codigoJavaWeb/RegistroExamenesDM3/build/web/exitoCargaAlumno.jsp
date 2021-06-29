<%-- 
    Document   : exitoCargaAlumno
    Created on : Jun 14, 2021, 8:38:48 PM
    Author     : Emiliano Barat
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="estilos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exito Carga Alumno</title>
    </head>
    <body>
        <h1>${msj}con exito al alumno ${a.nombres} ${a.apellidos}</h1>
        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
        <a href="menuAdmin.jsp">Volver al men&uacute; principal</a>
        </c:if>
        <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
        <a href="menuUsuario.jsp">Volver al men&uacute; principal</a>
        </c:if>
<!--        <table class="table table-striped table-center table-centered text-center table-bordered">
            
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
                    <c:forEach items="${listaTodos}" var="dtoAlumnos">
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
                            <td><a class="btn btn-success" href="BajaAlumno?idAlumno=${dtoAlumnos.idAlumno}">Dar Baja Alumno</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            

        </table>-->
    </body>
</html>
