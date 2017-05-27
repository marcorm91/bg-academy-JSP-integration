<%@ page contentType="text/html; charset=UTF-8" %>

<% 
	// 	 DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
	// 	 datos[0] = "iduser";
	// 	 datos[1] = "tipouser";
	// 	 datos[2] = "nombre";
	// 	 datos[3] = "apellido1";
	// 	 datos[4] = "apellido2";
	// 	 datos[5] = "usuario";
	// 	 datos[6] = "pass";
	// 	 datos[7] = "fecalta";
	// 	 datos[8] = "email";
	// 	 datos[9] = "tlf";
	// 	 datos[10] = "nif";
%>

<% Object[] datos_not = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es noticiario...
	if(session.getAttribute("log") == null || !datos_not[1].equals("N")){  
		response.sendRedirect("error.jsp");
	} else{
		
		for(int i = 0; i < datos_not.length; i++){
			if(datos_not[i] == null){
				datos_not[i] = "";
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
    
<div id="bg-academy-principal-not-miperfil">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-noticiario.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="../noticiario/aniadir-articulo.jsp" title="Ir a Redactar Artículo">
                                <i class="fa fa-file-text fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./modificar-articulo.jsp" title="Ir a Modificar Artículo">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Modificar Artículo </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./eliminar-articulo.jsp" title="Ir a Eliminar Artículo">
                                <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Artículo </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_not[2]); %> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_not[2]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-noticiario.jsp">Panel Principal</a> / Mi Perfil</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> Mi Perfil </h2>
               <form id="form-mod-perfil-noticiario" action="" method="">
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
                                    <input class="form-control" type="text" id="id-modificar-not-perfil" value="<% out.print(datos_not[0]); %>" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Fecha de alta: </label>
                                <div class="col-md-4 col-xs-12">
                                	<% 
	                            		String fechaoriginal = datos_not[7].toString(); 
	                            		String [] formatfecha = fechaoriginal.split("-");
                            		%>
                                    <input class="form-control" type="text" id="alta-modificar-not-perfil" value="<% out.print(formatfecha[2] + "/" + formatfecha[1] + "/" + formatfecha[0]); %>" disabled>
                                </div>
                            </div>
                        <hr/>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nombre: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" type="text" name="nombre" id="nombre-modificar-not-perfil" value="<% out.print(datos_not[2]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 1: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" type="text" name="apellido1" id="ape1-modificar-not-perfil" value="<% out.print(datos_not[3]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 2: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" type="text" name="apellido2" id="ape2-modificar-not-perfil" value="<% out.print(datos_not[4]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">E-mail: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" type="text" name="email" id="email-modificar-not-perfil" value="<% out.print(datos_not[8]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Teléfono: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" type="text" name="tlf" id="tlf-modificar-not-perfil" value="<% out.print(datos_not[9]); %>">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Contraseña: </label>
                                <div class="col-md-7 col-xs-12">
                                    <input class="form-control" id="pass-modificar-not-perfil" name="pass" type="password" name="pass" value="<% out.print(datos_not[6]); %>" />               
                                </div>
                                <div class="col-md-2 col-xs-12">
                                	<i class="fa fa-eye" id="ver-pass" aria-hidden="true"></i>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-xs-12">
                                    <a href="../principal-noticiario.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
                                    <button type="submit" id="mod-perfil-noticiario" class="btn btn-primary">Modificar</button>
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
    
</body>
</html>

<% } %>