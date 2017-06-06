<%@ page contentType="text/html; charset=UTF-8" %>
<%
// 	DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 	datos[0] = "iduser";
// 	datos[1] = "tipouser";
// 	datos[2] = "nombre";
// 	datos[3] = "apellido1";
// 	datos[4] = "apellido2";
// 	datos[5] = "usuario";
// 	datos[6] = "pass";
// 	datos[7] = "fecalta";
// 	datos[8] = "email";
// 	datos[9] = "nif";
// 	datos[10] = "tlf";
%>

<% Object[] datos_gest = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es gestor...
	if(session.getAttribute("log") == null || !datos_gest[1].equals("G")){  
		response.sendRedirect("error.jsp");
	} else{
		
		
		for(int i = 0; i < datos_gest.length; i++){
			if(datos_gest[i] == null){
				datos_gest[i] = "";
			}
		}
		
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-miperfil">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-gestor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./aniadir-elemento.jsp" title="Ir a Añadir Elemento">
                                <i class="fa fa-plus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Elemento </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./eliminar-elemento.jsp" title="Ir a Eliminar Elemento">
                                <i class="fa fa-minus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./modificar-elemento.jsp" title="Ir a Editar Elemento">
                                <i class="fa fa-edit fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Editar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./buscar-elemento.jsp" title="Ir a Buscar - Listar Elementos">
                                <i class="fa fa-eye fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Buscar - Listar Elementos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                        	<div class="bola hidden-xs-down" style="display: none;">
                        		<span id="num-incidencias"></span>
                        	</div>
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias de Profesores y Alumnos">
                                <i class="fa fa-commenting fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias de Profesores y Alumnos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Mi Perfil </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_gest[2]); %> </a> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"><a href="./mi-perfil.jsp"> <% out.print(datos_gest[2]); %> </a></span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Mi Perfil</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> Mi Perfil </h2>
               <form id="form-mod-perfil-gestor" action="" method="">
                    <div class="container-fluid">
                        
                            <div class="form-group row">
                                <div class="col-xs-12 imagen-perfil">
                                    <img src="../../assets/imagenes/foto-de-perfil.jpg" class="img-circle">
                                </div>
                                <label class="col-xs-12 resolucion-imagen">Resolución de imagen recomendada: 440x615</label>
                                <input type="file" id="img-modificar-gest-perfil" class="col-xs-12 text-xs-center">
                            </div>
                        
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">ID de usuario: </label>
                                <div class="col-md-3 col-xs-12">
                                    <input class="form-control" id="id-modificar-gest-perfil" value="<% out.print(datos_gest[0]);  %>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                            	<% 
                            		String fechaoriginal = datos_gest[7].toString(); 
                            		String [] formatfecha = fechaoriginal.split("-");
                            	%>
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Fecha de alta: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" id="alta-modificar-gest-perfil" value="<% out.print(formatfecha[2] + "/" + formatfecha[1] + "/" + formatfecha[0]); %>" disabled>
                                </div>
                            </div>
                        <hr/>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nombre: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="nombre-modificar-gest-perfil" name="nombre" value="<% out.print(datos_gest[2]); %>" />
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 1: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="ape1-modificar-gest-perfil" name="apellido1" value="<% out.print(datos_gest[3]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 2: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="ape2-modificar-gest-perfil" name="apellido2" value="<% out.print(datos_gest[4]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">E-mail: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="email-modificar-gest-perfil" name="email" value="<% out.print(datos_gest[8]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Teléfono: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" id="tlf-modificar-gest-perfil" name="tlf" value="<% out.print(datos_gest[10]); %>">
                                </div>
                            </div>
                             <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Contraseña: </label>
                                <div class="col-md-7 col-xs-12">
                                    <input class="form-control" id="pass-modificar-gest-perfil" type="password" name="pass" value="<% out.print(datos_gest[6]); %>" />               
                                </div>
                                <div class="col-md-2 col-xs-12">
                                	<i class="fa fa-eye" id="ver-pass" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div class="form-group row btn-enviar">
                                <div class="col-xs-12">
                                    <a href="../principal-gestor.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
                                    <button type="submit" id="mod-perfil-gestor" class="btn btn-primary">Modificar</button>
                                </div>
                            </div>
                     </div> 
                   </form>
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

<!-- MODAL SUCCESS / ERROR-->
<div id="modal-success-perfil" title="¡Usuario modificado!" style="display: none">
	<p> ¡Se ha modificado el usuario correctamente! </p>
</div>

<div id="modal-error-perfil" title="¡Comprueba los datos!" style="display: none">
	<p> ¡ERROR! Comprueba que no falta ningún dato. </p>
</div>

<div class="loader" style='display: none;'></div> 
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    
    <script>
    
	    $(document).ready(function(){
	    	
	    	// Captura el número de incidencias por resolver entre alumnos y profesores. 
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		url: "/Incidencias_sinresolver",    		
	    		success: function(resp){ 
	    			if(resp == "0"){
	    				$(".bola").css("display", "none");
	    			}else{
	    				$(".bola").css("display", "block");
	    				$(".bola #num-incidencias").text(resp);
	    			}
	    		}
	    	});
	    	
	    });
    
    </script>
    
</body>
</html>

<% } %>