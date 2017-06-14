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
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Añadir Noticia - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-not-new">

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
                            <a class="nav-link" href="./noticiario/aniadir-articulo.jsp" title="Ir a Redactar Artículo">
                                <i class="fa fa-file-text fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Añadir Artículo </span>
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
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_not[2]); %> </a> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_not[2]); %> </a> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-noticiario.jsp">Panel Principal</a> / Añadir Artículo</h1>
                <hr/>
                
                <div class="row text-xs-left form-publicacion-art">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                             <h2 class="title"> Añadir nuevo artículo </h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-md-2">
                            <b>Fecha de publicación:</b>
                        </div>
                        <div class="col-xs-4 col-md-4">
                            <span id="fecha-publ"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-2">
                            <b>* Titular:</b>
                        </div>
                        <div class="col-xs-12 col-md-10">
                             <input type="text" placeholder="Ponle un titular..." size="43" class="img-fluid form-control" id="tit-noticia">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-2">
                            <b>* Imagen de noticia:</b>
                        </div>
                        <form enctype="multipart/form-data">
	                        <div class="col-xs-12 col-md-7">
	                             <input type="file" class="img-fluid" id="img-noticia" accept="image/x-png,image/gif,image/jpeg">
	                             <div id="filenames" style="display:none;"></div>
	                        </div>
                        </form>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-md-2">
                            <b>* Texto:</b>
                        </div>
                        <div class="col-xs-12 col-md-10">
                            <textarea cols="75" rows="10" placeholder="Redacta tu noticia..." class="img-fluid form-control" id="contenido-noticia"></textarea>
                        </div>
                    </div>
                    <div class="form-group row text-xs-center">
                        <div class="col-xs-12">
                            <a href="../principal-noticiario.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
                            <button type="button" class="btn btn-primary" id="btn-reg-articulo">Registrar artículo</button>
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

<!-- MODAL SUCCESS / ERROR-->
<div id="modal-success" title="¡Artículo registrado!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-check text-success fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>¡Se ha registrado el artículo correctamente!</b> </div>
</div>

<div id="modal-error" title="¡Error!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-exclamation-triangle text-danger fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>Hubo un problema al registrar el artículo. <br/> Comprueba que no falta ningún campo por rellenar.</b> </p> </div>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/n_reg-articulo.js"></script>
    
</body>
</html>

<% } %>