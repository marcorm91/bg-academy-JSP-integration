<%@ page contentType="text/html; charset=UTF-8" %>

<% if(session.getAttribute("log") == null){  
	response.sendRedirect("error.jsp");
} else{
%>

<% 
	Object[] datos_not = (Object []) session.getAttribute("identificacion"); 
	if(datos_not[3] != "N"){
		response.sendRedirect("error.jsp");
	}else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Principal Noticiario - Big Ben Academy</title>
    <link rel="stylesheet" href="${request.contextPath}/assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${request.contextPath}/assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="${request.contextPath}/assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="${request.contextPath}/acceso/assets/css/estilos.css">
</head>

<body>
    
<div id="bg-academy-principal-notic">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse"
                    aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="./principal-noticiario.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./noticiario/aniadir-articulo.jsp" title="Ir a Redactar Artículo">
                                <i class="fa fa-file-text fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./noticiario/modificar-articulo.html" title="Ir a Modificar Artículo">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Modificar Artículo </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./noticiario/eliminar-articulo.jsp" title="Ir a Eliminar Artículo">
                                <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./noticiario/mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./noticiario/ayuda.jsp" title="Ir a Ayuda">
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
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_not[1]); %> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_not[1]); %> </span>
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
                                <a href="./noticiario/aniadir-articulo.jsp">
                                    <i class="fa fa-file-text fa-4x" aria-hidden="true"></i>
                                </a>
                                <p> Añadir <br/> Artículo </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./noticiario/modificar-articulo.jsp">
                                    <i class="fa fa-pencil fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Modificar <br/> Artículo </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./noticiario/eliminar-articulo.jsp">
                                    <i class="fa fa-eraser fa-4x" aria-hidden="true"></i> 
                                </a>
                                <p> Eliminar <br/> Artículo </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                 <a href="./noticiario/mi-perfil.jsp">
                                    <i class="fa fa-user-circle fa-4x" aria-hidden="true"></i>
                                 </a>
                                 <p> Mi <br/> Perfil </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="./noticiario/ayuda.jsp">
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