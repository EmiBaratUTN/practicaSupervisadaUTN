

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
    <body style="background-color: activecaption">
        <div style="padding-top: 10px" class="container-fluid">
            <div style="background-color:darkgreen; color: azure; height: 150px" class="row d-flex align-items-center justify-content-between">

                <div style="padding-left: 40px">
                    <h2 >Menu de Administracion</h2>
                    <h3>Hola ${usuario.nombreUsuario}</h3>            
                </div>
                <div><img height="120px" src="./img/Escudo_gendarmeria1.jpg"></div>
                <div style="align-self: start; margin: 10px" class="align-items-start">
                    <a href="LogOut"  class="btn btn-primary ">Cerrar Sesion</a>
                </div>
            </div>
            <div class="row">
                <!--<div class="col-1"></div>-->
                <div style="margin: 30px; " class="col-10">
                    <div style="padding: 15px" class="row d-block ">
                        <h3>Tareas con examenes o alumnos</h3>
                        <p>Desde los listados podrá editar o eliminar un elemento</p>
                        <p>Para registar un examen el alumno causante debe estar previamente dado de alta</p>

                        <ul class="nav nav-pills justify-content-around">
                            <li class="nav-item">
                                <a class="btn btn-primary" href="AltaAlumno" >Alta de Alumno</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="ListarAlumnos">Listado de alumnos</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="ListarAlumnos" >Registrar examen</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="ListarExamenes" >Ver exámenes</a>
                            </li>
                            <li class="nav-item">
                                <a class="btn btn-primary" href="ListarAlumnosPeso">Registro de peso</a>
                            </li>
                        </ul>
                    </div>
                    <hr>
                    
                </div>
                <div class="col-2"></div>
                <!--<img src="/RegistroExamenesDM3/GraficoTorta?"></img>-->
            </div>
            <div style="background-color: darkgreen; height: 150px" class="row d-flex align-items-center justify-content-around">
                <a class="btn btn-primary" href="#">Terminos y condiciones</a>
                <a class="btn btn-primary" href="./contactoFormulario.jsp">Contacto</a>
                <a class="btn btn-primary" href="#">FAQ</a>
            </div>
        </div>

    </body>
</html>
