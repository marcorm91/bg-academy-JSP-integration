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
//	 datos[19] = "nacionalidad";
//	 datos[20] = "imagen";
%>

<% Object[] datos_prof = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es profesor...
	if(session.getAttribute("log") == null || !datos_prof[1].equals("P")){  
		response.sendRedirect("error.jsp");
	} else{
		
		for(int i = 0; i < datos_prof.length; i++){
			if(datos_prof[i] == null){
				datos_prof[i] = "";
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
    
<div id="bg-academy-principal-prof-miperfil">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-profesor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./cursos.jsp" title="Ir a Mis Cursos Asignados">
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Cursos Asignados </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_prof[2]); %> </a>  </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_prof[2]); %> </a>  </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-profesor.jsp">Panel Principal</a> / Mi Perfil</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> Mi Perfil </h2>
              <form id="form-mod-perfil-prof">
                    <div class="container-fluid">
                        
                            <div class="form-group row">
                                <div class="col-xs-12 imagen-perfil">
                                    <% if (datos_prof[20] != null && !datos_prof[20].toString().equalsIgnoreCase("")) { %>
                                    	<img src="../../recursos/profesores/<%= datos_prof[5].toString() %>/fotopersonal/<%= datos_prof[20].toString() %>" class="img-circle">
                                    <% }else{ %>
                                    	<img src="../../assets/imagenes/sin-imagen.jpg" class="img-circle">
                                    <% } %>
                                </div>
                                <label class="col-xs-12 resolucion-imagen">Resolución de imagen recomendada: 440x615</label>
                                <input type="file" class="col-xs-12 text-xs-center" id="img-modificar-prof-perfil" accept="image/x-png,image/gif,image/jpeg" style="margin-bottom:25px;">
	                            <div id="filenames" style="display:none;"></div>
                            </div>
                        
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">ID de usuario: </label>
                                <div class="col-md-3 col-xs-12">
                                    <input class="form-control" type="text" id="id-modificar-prof-perfil" value="<% out.print(datos_prof[0]); %>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Fecha de alta: </label>
                                <div class="col-md-4 col-xs-12">
                               		<% 
	                            		String fechaoriginal = datos_prof[14].toString(); 
	                            		String [] formatfecha = fechaoriginal.split("-");
                            		%>
                                    <input class="form-control" id="alta-modificar-prof-perfil"  value="<% out.print(formatfecha[2] + "/" + formatfecha[1] + "/" + formatfecha[0]); %>"  disabled>
                                </div>
                            </div>
                        <hr/>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nombre: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="nombre-modificar-prof-perfil" name="nombre" value="<% out.print(datos_prof[2]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 1: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="ape1-modificar-prof-perfil"  name="apellido1" value="<% out.print(datos_prof[3]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 2: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="ape2-modificar-prof-perfil"  name="apellido2" value="<% out.print(datos_prof[4]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">E-mail: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="email-modificar-prof-perfil" name="email" value="<% out.print(datos_prof[15]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Población: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="poblacion-modificar-prof-perfil" name="poblacion" value="<% out.print(datos_prof[13]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Calle / Vía / Avda: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="calle-modificar-prof-perfil"  name="calle" value="<% out.print(datos_prof[10]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Código postal: </label>
                                <div class="col-md-3 col-xs-12">
                                    <input class="form-control" id="cp-modificar-prof-perfil" name="cp" value="<% out.print(datos_prof[11]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nacido en: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="nacido-modificar-prof-perfil" name="nacido" value="<% out.print(datos_prof[9]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nacionalidad: </label>
                                <div class="col-md-6 col-xs-12">
                                    <input class="form-control" id="nacionalidad-modificar-prof-perfil"  name="nacionalidad" value="<% out.print(datos_prof[19]); %>">
                                </div>
                            </div>
                        
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">F. de nacimiento: </label>
                                <div class="col-md-4 col-xs-12">
                                	<% 
	                            		String fechaoriginal2 = datos_prof[7].toString(); 
	                            		String [] formatfecha2 = fechaoriginal2.split("-");
                            		%>
                                    <input class="form-control" id="fnac-modificar-prof-perfil"  name="fnac" value="<% out.print(formatfecha2[2] + "/" + formatfecha2[1] + "/" + formatfecha2[0]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Teléfono: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" id="tlf-modificar-prof-perfil" name="tlf" value="<% out.print(datos_prof[16]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Contraseña: </label>
                                <div class="col-md-7 col-xs-12">
                                    <input class="form-control" id="pass-modificar-prof-perfil" type="password" name="pass" value="<% out.print(datos_prof[6]); %>" />               
                                </div>
                                <div class="col-md-2 col-xs-12">
                                	<i class="fa fa-eye" id="ver-pass" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div class="form-group row btn-enviar">
                                <div class="col-xs-12">
                                    <button type="button" class="btn btn-primary">Volver</button>
                                    <button type="button" id="mod-perfil-profesor" class="btn btn-primary">Modificar</button>
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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    
    <script>
    
 	// Crear un input oculto para pasar el nombre del fichero a la BD.
	document.getElementById('img-modificar-prof-perfil').onchange = uploadOnChange;	   
	
	function uploadOnChange() { 
	    
		var filenames = this.files;
	    $("#filenames").empty();                 
	                           
	    var filesArray = [];
	    
	    Array.prototype.push.apply(filesArray, filenames); 
	                           
	    filesArray.forEach(function(item){
	       $('<input/>', {
				value: item.name
	       }).appendTo("#filenames");
	    });
	    
	}
    
    </script>
    
</body>
</html>

<% } %>