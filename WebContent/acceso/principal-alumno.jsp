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

<% if(session.getAttribute("log") == null){  
	response.sendRedirect("error.jsp");
} else{
%>

<% 
	Object[] datos_alumn = (Object []) session.getAttribute("identificacion"); 
	if(!datos_alumn[1].equals("A")){
		response.sendRedirect("error.jsp");
	}else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Principal Alumno - Big Ben Academy</title>
    <link rel="stylesheet" href="${request.contextPath}/assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="${request.contextPath}/assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="${request.contextPath}/acceso/assets/css/estilos.css">
</head>

<body>
    
<div id="bg-academy-principal-alumn">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse"
                    aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="principal-alumno.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./alumno/matricula.jsp" title="Ir a Mi Matrícula">
                                <i class="fa fa-id-card-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Matrícula </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./alumno/mis-calificaciones.jsp" title="Ir a Mis Calificaciones">
                                <i class="fa fa-file-text-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mis Calificaciones </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./alumno/curso.jsp" title="Ir a Mi Curso">
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Curso </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./alumno/mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./alumno/reg-incidencia.jsp" title="Ir a Registrar Incidencia">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Registrar Incidencia </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link ver-incidencias-alumn" href="./alumno/ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias </span>
                            </a>
                        </li>    
                        <li class="nav-item">
                            <a class="nav-link" href="./alumno/ayuda.jsp" title="Ir a Ayuda">
                                <i class="fa fa-question fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ayuda </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/Logout" title="Salir">
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
                <img src="../assets/imagenes/logo.png">
                <h1> Panel Principal </h1>
                <hr/>
                <div class="panel-opciones">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/matricula.jsp">
                                    <i class="fa fa-id-card-o fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Mi <br/> Matrícula </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/mis-calificaciones.jsp">
                                    <i class="fa fa-file-text-o fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Mis <br/> Calificaciones </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/curso.jsp">
                                    <i class="fa fa-folder-open-o fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Mi <br/> Curso </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/reg-incidencia.jsp">
                                    <i class="fa fa-pencil fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Registrar <br/> Incidencia </p>    
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/ver-incidencias.jsp" class="ver-incidencias-alumn">
                                    <i class="fa fa-wrench fa-4x" aria-hidden="true"></i>
                                </a>
                                <p>Mis<br/> Incidencias </p>    
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/mi-perfil.jsp">
                                    <i class="fa fa-user-circle fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Mi <br/> Perfil </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./alumno/ayuda.jsp">
                                    <i class="fa fa-question fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Ayuda </p>
                            </div>
                             <div class="col-md-4 col-xs-12">
                                <a href="${pageContext.request.contextPath}/Logout"> <i class="fa fa-sign-out fa-4x" aria-hidden="true"> </i> </a> 
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="${request.contextPath}/assets/js/jquery-3.1.1.min.js"></script>
    <script src="${request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${request.contextPath}/assets/js/jquery-ui.js"></script>
    <script src="${request.contextPath}/acceso/assets/js/script.js"></script>
</body>
</html>

<% 		
		}
	}
%>