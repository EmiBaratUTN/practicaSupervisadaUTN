<%-- 
    Document   : menuAdmin
    Created on : Jun 10, 2021, 11:45:25 AM
    Author     : Emiliano Barat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="estilos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <h2>Menu de Administracion</h2>
            <h3>Hola ${usuario.nombreUsuario}</h3>
            <div class="row">
                <div class="col-2"></div>
                <div class="col-8">
                    <h3>Tareas con examenes o alumnos</h3>
                    <p>Desde los listados podrá editar o eliminar un elemento</p>
                    <p>Para registar un examen el alumno causante debe estar previamente dado de alta</p>
                    
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link link" href="AltaAlumno" >Alta de Alumno</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarAlumnos">Listado de alumnos</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarAlumnos" >Registrar examen</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarExamenes" >Ver exámenes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ListarAlumnosPeso">Ver registro de peso</a>
                        </li>
                    </ul>
                    
                    <h3>Tareas de administracion del sistema </h3>
                    <p>Desde los listados podrá editar o eliminar un elemento</p>
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a class="nav-link link" href="AltaProfesor" >Alta de profesor</a>
                        </li>
                        <li class="nav-item">                            
                            <a class="nav-link link" href="ListarProfesores">Listado de profesores</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="AltaUsuario" >Alta de Usuario</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link link" href="ControlUsuarios" >Control de Usuarios</a>
                        </li>
                    </ul>
                    
                    <h3>Gráficos y estadísticas</h3>
                    <ul class="nav nav-pills">
                        <li class="nav-item"><a href="#" class="nav-link">Ver gráficos y datos estadísticos</a></li>
                        <li></li>
                    </ul>
                </div>
                <div class="col-2"></div>
                <!--<img src="/RegistroExamenesDM3/GraficoTorta?"></img>-->
            </div>
        </div>
        
    </body>
</html>
