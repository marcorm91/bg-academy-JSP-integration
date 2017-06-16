<%@ page contentType="text/html; charset=UTF-8" %>

<%
//	 DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 	 datos[0] = "iduser";
// 	 datos[1] = "tipouser";
// 	 datos[2] = "nombre";
// 	 datos[3] = "apellido1";
// 	 datos[4] = "apellido2";
// 	 datos[5] = "usuario";
// 	 datos[6] = "pass";
// 	 datos[7] = "fnac";
// 	 datos[8] = "nif";
// 	 datos[9] = "nacimiento";
// 	 datos[10] = "calle";
// 	 datos[11] = "cp";
// 	 datos[12] = "provincia";
// 	 datos[13] = "poblacion";
// 	 datos[14] = "fecalta";
// 	 datos[15] = "email";
// 	 datos[16] = "tlf";
// 	 datos[17] = "anioprom";
// 	 datos[18] = "asignimp";	
%>

<% if(session.getAttribute("log") == null){  
	response.sendRedirect("error.jsp");
} else{
%>

<% 
	Object[] datos_prof = (Object []) session.getAttribute("identificacion"); 
	if(!datos_prof[1].equals("P")){
		response.sendRedirect("error.jsp");
	}else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Principal Profesor - Big Ben Academy</title>
    <link rel="stylesheet" href="./../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="./../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="./../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="./assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="./assets/css/estilos.css">
</head>

<body>

<div class="complete-body" style="display:none;"></div>
    
<div id="bg-academy-principal-prof">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse"
                    aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="./principal-profesor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./profesor/cursos.jsp" title="Ir a Mis Cursos Asignados">
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Cursos Asignados </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./profesor/reg-incidencia.jsp" title="Ir a Registrar Incidencia">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Registrar Incidencia </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./profesor/ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias </span>
                            </a>
                        </li>    
                         <li class="nav-item">
                            <a class="nav-link" href="./profesor/mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./profesor/ayuda.jsp" title="Ir a Ayuda">
                                <i class="fa fa-question fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ayuda </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../Logout" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                         <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"><a href="./profesor/mi-perfil.jsp"> <% out.print(datos_prof[2]); %> </a></span>
                                <a href="../Logout"> <span id="desconectar">(Desconectar)</span></a>
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
                    <span id="quien" title="Ir a Mi Perfil"><a href="./profesor/mi-perfil.jsp"> <% out.print(datos_prof[2]); %> </a> </span>
                    <a href="../Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../assets/imagenes/logo.png">
                <h1> Panel Principal </h1>
                <hr/>
                <div class="panel-opciones">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./profesor/cursos.jsp">
                                    <i class="fa fa-folder-open-o fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Cursos <br/> Asignados </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./profesor/reg-incidencia.jsp">
                                    <i class="fa fa-pencil fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Registrar <br/> Incidencia </p>    
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./profesor/ver-incidencias.jsp">
                                    <i class="fa fa-wrench fa-4x" aria-hidden="true"></i>
                                </a>
                                <p>Mis<br/> Incidencias </p>    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./profesor/mi-perfil.jsp">
                                    <i class="fa fa-user-circle fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Mi <br/> Perfil </p>
                            </div>
                             <div class="col-md-4 col-xs-12">
                                <a href="./profesor/ayuda.jsp">
                                    <i class="fa fa-question fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Ayuda </p>
                            </div>
                             <div class="col-md-4 col-xs-12">
                                <a href="../Logout"> <i class="fa fa-sign-out fa-4x" aria-hidden="true"> </i> </a> 
                                <p> Salir </p>
                            </div>
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

<div id="md-welcome" title="¡Bienvenido!" style='display: none;'>	
	<div class="text-xs-center font-weight-bold">¡Bienvenido a la plataforma de Big Ben Academy!</div>
	<hr/>
	<p> Hola <% out.print(datos_prof[2]); %>, </p>
	<p> Ante todo, <span class="text-danger">Big Ben Academy</span>
		te quiere dar la bienvenida como nuevo miembro que eres.
	</p>
	<p> Estamos encantado de que pertenezcas a nuestra academia, y desde ya, tienes a tu disposición
		esta plataforma con la que podrás interactuar el resto del curso. </p>
	<p> Te aconsejamos que antes de empezar, utilices la <a class="text-primary" href="./profesor/ayuda.jsp" target="_blank">Ayuda</a> de la academia. </p>
	<p> <em>Good luck my friend!</em> </p>
	<div class="text-xs-center font-weight-bold"><br/><em>Big Ben Academy</em><br/><br/></div>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="./../assets/js/jquery-3.1.1.min.js"></script>
    <script src="./../assets/js/bootstrap.min.js"></script>
    <script src="./../assets/js/jquery-ui.js"></script>
    <script src="./assets/js/script.js"></script>
    <script src="./assets/js/p_principal.js"></script>
    
</body>
</html>

<% 		
		}
	}
%>