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
    <body style="background-color: activecaption">
        <div class="container">
            <h1>Registró con exito al alumno ${a.nombres} ${a.apellidos}</h1>
            <div class="row">
                <div class="col-5">

                    <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario <= 1}" >
                        <a  class="btn btn-primary" href="menuAdmin.jsp">Volver al men&uacute; principal</a>
                    </c:if>
                    <c:if test="${sessionScope.usuario.tipoUsuario.idTipoUsuario >= 2}">
                        <a  class="btn btn-primary" href="menuUsuario.jsp">Volver al men&uacute; principal</a>
                    </c:if>
                    <a class="btn btn-success" style="margin-left: 30px" href="AltaAlumno">Registrar otro alumno</a>
                </div>
            </div>
            </br>
            </br>
            <center>
                <img style="box-sizing: border-box" height="300px"  src="./img/exitoCheckVerde.jpg">
            </center>

        </div>

    </div>
</body>
</html>
