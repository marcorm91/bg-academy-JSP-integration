<%@ page contentType="text/html; charset=UTF-8" %>

<% if(session.getAttribute("log") == null){  
	response.sendRedirect("error.jsp");
} else{
%>

<% 
	Object[] datos_gest = (Object []) session.getAttribute("identificacion"); 
	if(datos_gest[3] != "G"){
		response.sendRedirect("error.jsp");
	}else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Principal Gestor - Big Ben Academy</title>
    <link rel="stylesheet" href="${request.contextPath}/assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="${request.contextPath}/assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="${request.contextPath}/acceso/assets/css/estilos.css">
</head>

<body>
    
<div id="bg-academy-principal-gest">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="principal-gestor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="gestor/aniadir-elemento.jsp" title="Ir a Añadir Elemento">
                                <i class="fa fa-plus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Elemento</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./gestor/eliminar-elemento.jsp" title="Ir a Eliminar Elemento">
                                <i class="fa fa-minus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./gestor/modificar-elemento.jsp" title="Ir a Editar Elemento">
                                <i class="fa fa-edit fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Editar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./gestor/buscar-elemento.jsp" title="Ir a Buscar - Listar Elementos">
                                <i class="fa fa-eye fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Buscar - Listar Elementos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./gestor/ver-incidencias.jsp" title="Ir a Ver Incidencias de Profesores y Alumnos">
                                <i class="fa fa-commenting fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias de Profesores y Alumnos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./gestor/mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./gestor/ayuda.jsp" title="Ir a Ayuda">
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
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[1]); %> </span> 
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[1]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../assets/imagenes/logo.png">
                <h1> Panel Principal</h1>
                <hr/>
                <div class="panel-opciones">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/aniadir-elemento.jsp">
                                    <i class="fa fa-plus fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Registrar <br/> Elemento </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/eliminar-elemento.jsp">
                                    <i class="fa fa-minus fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Eliminar <br/> Elemento </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/modificar-elemento.jsp">
                                    <i class="fa fa-pencil-square-o fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Modificar <br/> Elemento </p>
                            </div>
                        </div>                            
                     
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/buscar-elemento.jsp">
                                    <i class="fa fa-eye fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Buscar - Listar <br/> Elementos </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/ver-incidencias.jsp">
                                    <i class="fa fa-commenting fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Ver <br/> Incidencias de <br/> Profesores y Alumnos </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/mi-perfil.jsp">
                                    <i class="fa fa-user-circle fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Mi <br/> Perfil </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <a href="./gestor/ayuda.jsp">
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