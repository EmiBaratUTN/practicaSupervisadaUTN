

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="estilos.jsp" %>
<!DOCTYPE html>

<html>
    <head>
        <title>Seccion EduFis</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" 
              rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" 
              crossorigin="anonymous">
        <link href="styles/normalize.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" 
        crossorigin="anonymous"></script>-->

    </head>
    <body>
        <div class="container">
            <div  class="">
                <a href="LogOut"  class="btn btn-primary ">Cerrar Sesion</a>
            </div>
            <h2>Menu de funciones de usuarios</h2>
            <h3>Hola ${usuario.nombreUsuario}</h3>
            <h4>${msj}</h4>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <h3>Que desea hacer??</h3>
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link link" href="AltaAlumno" >Crear un Alumno</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarAlumnos">Listado de alumnos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarExamenes" >Ver exámenes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarAlumnosPeso">Ver registro de peso</a>
                        </li>

                    </ul>
                </div>
                <div class="col-2"></div>
            </div>
        </div>
    </body>
</html>
