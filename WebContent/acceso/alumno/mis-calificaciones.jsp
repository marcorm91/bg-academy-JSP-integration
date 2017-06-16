<%@ page contentType="text/html; charset=UTF-8" %>

<% 
// 		 DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 		 datos[0] = "iduser";
// 		 datos[1] = "tipouser";
// 		 datos[2] = "nombre";
// 		 datos[3] = "apellido1";
// 		 datos[4] = "apellido2";
// 		 datos[5] = "usuario";
// 		 datos[6] = "pass";
// 		 datos[7] = "nif";
// 		 datos[8] = "fnac";
// 		 datos[9] = "nacimiento";
// 		 datos[10] = "nacionalidad";
// 		 datos[11] = "calle";
// 		 datos[12] = "cp";
// 		 datos[13] = "poblacion";
// 		 datos[14] = "provincia";
// 		 datos[15] = "fecalta";
// 		 datos[16] = "anioprom";
// 		 datos[17] = "cursoasign";
// 		 datos[18] = "comentarios";
// 		 datos[19] = "tlf";
// 		 datos[20] = "email";
%>

<% Object[] datos_alumn = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es alumno...
	if(session.getAttribute("log") == null || !datos_alumn[1].equals("A")){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Calificaciones - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-alumn-calif">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-alumno.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./matricula.jsp" title="Ir a Mi Matrícula">
                                <i class="fa fa-id-card-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Matrícula </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mis-calificaciones.jsp" title="Ir a Mis Calificaciones">
                                <i class="fa fa-file-text-o fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Mis Calificaciones </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./curso.jsp" title="Ir a Mi Curso">
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Curso </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./reg-incidencia.jsp" title="Ir a Registrar Incidencia">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Registrar Incidencia </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link ver-incidencias-alumn" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias </span>
                            </a>
                        </li>    
                        <li class="nav-item">
                            <a class="nav-link" href="./ayuda.jsp" title="Ir a Ayuda">
                                <i class="fa fa-question fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ayuda </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../Logout" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                        <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_alumn[2]); %> </a> </span>
                                <a href="../../Logout"> <span id="desconectar">(Desconectar)</span></a>
                            </span>
                        </li>
                    </ul>
            </div>
        </nav>
    </header>
        
    <div class="container">
            <div class="text-xs-center conectadoMobile">
                <span class="nav-link hidden-lg-up">
                    Conectado como 
                    <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_alumn[2]); %> </a> </span>
                    <a href="../../Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-alumno.jsp">Panel Principal</a> / Mis Calificaciones</h1>
                <hr/>
                
                <div class="row text-xs-left form-publicacion-art">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                             <h2 class="title"> Mis Calificaciones </h2>
                        </div>
                    </div>
                    <!-- TAREAS -->
                    <div class="row">
                        <div class="col-xs-12" id="tit-tareas-notas-alumno">
                            <h3 data-toggle="collapse" data-target="#tareas" aria-expanded="true"> Tareas <i class="fa fa-chevron-down" aria-hidden="true"></i></h3>
                        </div>
                    </div>
                    <div class="row tareas-notas-alumno collapse in" id="tareas" >
                        
                    </div>
                    <!-- EXÁMENES -->
                    <div class="row">
                        <div class="col-xs-12" id="tit-examenes-notas-alumno">
                            <h3 data-toggle="collapse" data-target="#examenes" aria-expanded="true"> Exámenes <i class="fa fa-chevron-down" aria-hidden="true"></i> </h3>
                        </div>
                    </div>
                        <div class="row tareas-notas-alumno collapse in" id="examenes" aria-expanded="true">
                           
                        </div>
               
<!--                     <div class="row text-xs-center pdf">                            -->
<!--                         <div class="col-xs-12"> -->
<!--                             <i class="fa fa-file-pdf-o text-danger" aria-hidden="true"></i> -->
<!--                             <p class="text-danger">Descargar en PDF</p> -->
<!--                         </div> -->
<!--                     </div> -->
                    <div class="form-group row text-xs-center">
                        <div class="col-xs-12">
                            <a href="../principal-alumno.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
                        </div>
                    </div>
                </div>

            </div>
    </div>
        
    <footer>
        <div class="row">
            <div class="col-xs-12 text-xs-center">
                <span> © <span id="fechaActual"> </span> - Todos los derechos reservados | Marco Romero  </span>
            </div>
        </div>
    </footer>
        
</div>

<div class="loader" style='display: none;'></div> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/a_mis-calificaciones.js"></script>
    
</body>
</html>

<% } %>