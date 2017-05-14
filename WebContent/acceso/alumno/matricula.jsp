<%@page import="java.text.SimpleDateFormat"%>
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
    <title>Mi Matrícula - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>

<body>
    
<div id="bg-academy-principal-alumn-matricula">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse"
                    aria-expanded="false">
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
                                <i class="fa fa-id-card-o fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Mi Matrícula </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mis-calificaciones.jsp" title="Ir a Mis Calificaciones">
                                <i class="fa fa-file-text-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mis Calificaciones </span>
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
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias">
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
                            <a class="nav-link" href="/Logout" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                         <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_alumn[2]); %> </span>
                                <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_alumn[2]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1> <a href="../principal-alumno.jsp">Panel Principal</a> / Mi Matrícula </h1>
                <hr/>
                <div class="panel-opciones p-alumno container-fluid">
                    
                     <h2> Datos de Mi Matrícula </h2>
                              
                        <!-- Primera fila -->
                        <div class="row text-xs-left">                           
                            <div class="col-xs-12 subtitular">
                                <span>Datos personales</span>
                            </div>
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Nombre: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[2]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Apellidos: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[3]); %></span>
                                <span><% out.print(datos_alumn[4]); %></span>
                            </div>
                        </div>
                    
                        <!-- Segunda fila -->
                        <div class="row text-xs-left">
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Fecha de nacimiento: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                            	<% 
                            		String fechaoriginal = datos_alumn[8].toString(); 
                            		String [] formatfecha = fechaoriginal.split("-");
                            	%>
                                <span><% out.print(formatfecha[2] + "/" + formatfecha[1] + "/" + formatfecha[0]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">NIF/NIE: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3 ">
                                <span><% out.print(datos_alumn[7]); %></span>
                            </div>
                        </div>
                    
                        <!-- Tercera fila -->
                        <div class="row text-xs-left">
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Nacido en: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[9]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Nacionalidad: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[10]); %></span>
                            </div>
                        </div>
                    
                        <!-- Cuarta fila -->
                        <div class="row text-xs-left">                           
                            <div class="col-xs-12 subtitular">
                                <span>Datos de dirección</span>
                            </div>
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Calle / Vía / Avenida: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[11]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Código Postal: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[12]); %></span>
                            </div>
                        </div>
                    
                        <!-- Quinta fila -->
                        <div class="row text-xs-left">
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Población: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[13]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Provincia: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[14]); %></span>
                            </div>
                        </div>
                    
                        <!-- Sexta fila -->
                        <div class="row text-xs-left">                           
                            <div class="col-xs-12 subtitular">
                                <span>Datos profesionales</span>
                            </div>
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Fecha de alta: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                            	<% 
                            		fechaoriginal = datos_alumn[15].toString(); 
                            		formatfecha = fechaoriginal.split("-");
                            	%>
                                <span><% out.print(formatfecha[2] + "/" + formatfecha[1] + "/" + formatfecha[0]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">E-Mail: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[20]); %></span>
                            </div>
                        </div>
                    
                        <!-- Séptima fila -->
                        <div class="row text-xs-left">                           
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Teléfono: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[19]); %></span>
                            </div>
                                                        
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Año promoción: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[16]); %></span>
                            </div>
                        </div>
                    
                        <!-- Octava fila -->
                        <div class="row text-xs-left">                           
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">Curso: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[17]); %></span>
                            </div>
                            <div class="col-xs-12 col-lg-3 text-lg-right">
                                <span class="fixed-text">ID registro: </span>
                            </div>
                            <div class="col-xs-12 col-lg-3">
                                <span><% out.print(datos_alumn[0]); %></span>
                            </div>
                        </div>
                    
                        <!-- Novena fila -->
                        <div class="row text-xs-center pdf">                           
                            <div class="col-xs-12">
                                <i class="fa fa-file-pdf-o text-danger" aria-hidden="true"></i>
                                <p class="text-danger">Descargar en PDF</p>
                            </div>
                        </div>
                    
                        <!-- Décima fila -->
                        <div class="row text-xs-center">                           
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
</body>
</html>

<% } %>