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
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buscar Elementos - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../assets/css/dataTables.min.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/tooltip/normalize.css" />
	<link rel="stylesheet" type="text/css" href="../assets/css/tooltip/component.css" />
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-buscar">

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
                                <i class="fa fa-eye fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Buscar - Listar Elementos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias de Profesores y Alumnos">
                                <i class="fa fa-commenting fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias de Profesores y Alumnos </span>
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
                                <span id="quien" title="Ir a Mi Perfil"><a href="./mi-perfil.jsp"> <% out.print(datos_gest[2]); %> </a></span>
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
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Buscar Elemento</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> ¿Qué desea buscar? </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-briefcase fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="busqueda-profesor"></i> <p> Búsqueda de <br/> Profesor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="busqueda-alumno"></i> <p> Búsqueda de <br/> Alumno </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-newspaper-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="busqueda-noticiario"></i> <p> Búsqueda de <br/> Noticiario </p>
                            </div>
                        </div>
                        <div class="row">                       
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-user-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="busqueda-gestor"></i> <p> Búsqueda de <br/> Gestor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-book fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="busqueda-curso"></i> <p> Búsqueda de <br/> Curso </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="../principal-gestor.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
    </div>
    
 <!------- SUBPANELES DE BÚSQUEDA ------->
    
 <!-- Subpanel profesor -->
 <div id="subpanel-busqueda-profesor">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="prof-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>NIF/NIE</th>
                      <th>E-mail</th>
                      <th>Año promoción</th>
                      <th>Curso/s asignado/s</th>
                      <th>+ info</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="./buscar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel alumno -->
<div id="subpanel-busqueda-alumno">
   <div class="container-fluid">   
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="alumn-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>NIF/NIE</th>
                      <th>E-mail</th>
                      <th>Año promoción</th>
                      <th>Curso asignado</th>
                      <th>+ info</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="./buscar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
        
<!-- Subpanel curso -->
<div id="subpanel-busqueda-curso">
    <div class="container">
        
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="curso-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Curso</th>
                      <th>Año inicio - fin</th>
                      <th>Alumnos inscritos</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="./buscar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
        
    </div>
</div>

<!-- Subpanel noticiario -->
<div id="subpanel-busqueda-noticiario">
    <div class="container-fluid">
        
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="not-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>E-mail</th>
                      <th>+ info</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table> 
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="./buscar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>


<!-- Subpanel gestor -->
<div id="subpanel-busqueda-gestor">
    <div class="container-fluid">
        
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="gest-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>E-mail</th>
                      <th>+ info</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table> 
            </div>
        </div>

        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="./buscar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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

<!-- MODAL PROFESOR -->
<form id="modal-form-prof" action="/PDF_prof_gest.pdf" method="POST">
  <div class="modal fade" id="modal-info-prof" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-xs-center font-weight-bold">+ Info</h4>
        </div>
        <div class="modal-body">
        	<div class="container">
	        	<div class="form-group row">
	  				<label class="col-xs-3">ID: </label>
	  					<div class="col-xs-9">
	    					<span id="id-modal-prof" class="font-weight-bold"> </span>
	    					<input type="hidden" id="id-prof-hidden" name="id" value="">
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre:  </label>
	  					<div class="col-xs-9">
	    					<span id="nombre-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 1:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido1-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 2:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido2-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre de usuario: </label>
	  					<div class="col-xs-9">
	    					<span id="usuario-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de nacimiento: </label>
	  					<div class="col-xs-9">
	    					<span id="fnac-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">NIF: </label>
	  					<div class="col-xs-9">
	    					<span id="nif-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nacimiento: </label>
	  					<div class="col-xs-9">
	    					<span id="nacimiento-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nacionalidad: </label>
	  					<div class="col-xs-9">
	    					<span id="nacionalidad-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Calle: </label>
	  					<div class="col-xs-9">
	    					<span id="calle-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Código Postal: </label>
	  					<div class="col-xs-9">
	    					<span id="cp-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Provincia: </label>
	  					<div class="col-xs-9">
	    					<span id="provincia-modal-prof"class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Población: </label>
	  					<div class="col-xs-9">
	    					<span id="poblacion-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de alta: </label>
	  					<div class="col-xs-9">
	    					<span id="fecalta-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">E-mail: </label>
	  					<div class="col-xs-9">
	    					<span id="email-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Año promoción: </label>
	  					<div class="col-xs-9">
	    					<span id="anioprom-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Curso/s asignado/s: </label>
	  					<div class="col-xs-9">
	    					<span id="asignimp-modal-prof" class="font-weight-bold"> </span>
	  					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 text-xs-center">
						<div class="tooltip tooltip--smaug" data-type="smaug" style='opacity: 1;'>
							<div class="tooltip__trigger" role="tooltip" aria-describedby="info-smaug">
								<a id="down-pdf-prof-gest">
									<span class="tooltip__trigger-text"><i class="fa fa-file-pdf-o fa-3x text-danger" aria-hidden="true"></i></span>
								</a>
							</div>
							<div class="tooltip__base" style="bottom:1em !important">
								<svg class="tooltip__shape" width="100%" height="100%" viewBox="0 0 400 300">
									<path d="M 314,100 C 313,100 312,100 311,100 L 89.5,100 C 55.9,100 29.1,121 29.1,150 29.1,178 53.1,201 89.5,201 L 184,201 200,223 217,201 311,201 C 344,201 371,178 371,150 371,122 346,99 314,100 Z"/>
								</svg>
								<div class="tooltip__content text-white font-weight-bold text-xs-center">DESCARGAR INFORMACIÓN EN PDF</div>
							</div>
						</div>
					</div>
				</div>
		
				
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
</form>


<!-- MODAL ALUMNO -->
<form id="modal-form-alumn" action="/PDF_alumn_gest.pdf" method="POST">
  <div class="modal fade" id="modal-info-alumn" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-xs-center font-weight-bold">+ Info</h4>
        </div>
        <div class="modal-body">
        	<div class="container">
	        	<div class="form-group row">
	  				<label class="col-xs-3">ID: </label>
	  					<div class="col-xs-9">
	    					<span id="id-modal-alumn" class="font-weight-bold"> </span>
	    					<input type="hidden" id="id-alumn-hidden" name="id" value="">
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre:  </label>
	  					<div class="col-xs-9">
	    					<span id="nombre-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 1:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido1-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 2:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido2-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre de usuario: </label>
	  					<div class="col-xs-9">
	    					<span id="usuario-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de nacimiento: </label>
	  					<div class="col-xs-9">
	    					<span id="fnac-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">NIF: </label>
	  					<div class="col-xs-9">
	    					<span id="nif-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nacimiento: </label>
	  					<div class="col-xs-9">
	    					<span id="nacimiento-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nacionalidad: </label>
	  					<div class="col-xs-9">
	    					<span id="nacionalidad-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Calle: </label>
	  					<div class="col-xs-9">
	    					<span id="calle-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Código Postal: </label>
	  					<div class="col-xs-9">
	    					<span id="cp-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Provincia: </label>
	  					<div class="col-xs-9">
	    					<span id="provincia-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Población: </label>
	  					<div class="col-xs-9">
	    					<span id="poblacion-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de alta: </label>
	  					<div class="col-xs-9">
	    					<span id="fecalta-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">E-mail: </label>
	  					<div class="col-xs-9">
	    					<span id="email-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Año promoción: </label>
	  					<div class="col-xs-9">
	    					<span id="anioprom-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Curso asignado: </label>
	  					<div class="col-xs-9">
	    					<span id="asignimp-modal-alumn" class="font-weight-bold"> </span>
	  					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 text-xs-center">
						<div class="tooltip tooltip--smaug" data-type="smaug" style='opacity: 1;'>
							<div class="tooltip__trigger" role="tooltip" aria-describedby="info-smaug">
								<a id="down-pdf-alumn-gest">
									<span class="tooltip__trigger-text"><i class="fa fa-file-pdf-o fa-3x text-danger" aria-hidden="true"></i></span>
								</a>
							</div>
							<div class="tooltip__base" style="bottom:1em !important">
								<svg class="tooltip__shape" width="100%" height="100%" viewBox="0 0 400 300">
									<path d="M 314,100 C 313,100 312,100 311,100 L 89.5,100 C 55.9,100 29.1,121 29.1,150 29.1,178 53.1,201 89.5,201 L 184,201 200,223 217,201 311,201 C 344,201 371,178 371,150 371,122 346,99 314,100 Z"/>
								</svg>
								<div class="tooltip__content text-white font-weight-bold text-xs-center">DESCARGAR INFORMACIÓN EN PDF</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
</form>


<!-- MODAL NOTICIARIO -->
<form id="modal-form-not" action="/PDF_not_gest.pdf" method="POST">
  <div class="modal fade" id="modal-info-not" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-xs-center font-weight-bold">+ Info</h4>
        </div>
        <div class="modal-body">
        	<div class="container">
	        	<div class="form-group row">
	  				<label class="col-xs-3">ID: </label>
	  					<div class="col-xs-9">
	    					<span id="id-modal-not" class="font-weight-bold"> </span>
	    					<input type="hidden" id="id-not-hidden" name="id" value="">
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre:  </label>
	  					<div class="col-xs-9">
	    					<span id="nombre-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 1:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido1-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 2:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido2-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre de usuario: </label>
	  					<div class="col-xs-9">
	    					<span id="usuario-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">NIF: </label>
	  					<div class="col-xs-9">
	    					<span id="nif-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Teléfono: </label>
	  					<div class="col-xs-9">
	    					<span id="tlf-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de alta: </label>
	  					<div class="col-xs-9">
	    					<span id="fecalta-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">E-mail: </label>
	  					<div class="col-xs-9">
	    					<span id="email-modal-not" class="font-weight-bold"> </span>
	  					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 text-xs-center">
						<div class="tooltip tooltip--smaug" data-type="smaug" style='opacity: 1;'>
							<div class="tooltip__trigger" role="tooltip" aria-describedby="info-smaug">
								<a id="down-pdf-not-gest">
									<span class="tooltip__trigger-text"><i class="fa fa-file-pdf-o fa-3x text-danger" aria-hidden="true"></i></span>
								</a>
							</div>
							<div class="tooltip__base" style="bottom:1em !important">
								<svg class="tooltip__shape" width="100%" height="100%" viewBox="0 0 400 300">
									<path d="M 314,100 C 313,100 312,100 311,100 L 89.5,100 C 55.9,100 29.1,121 29.1,150 29.1,178 53.1,201 89.5,201 L 184,201 200,223 217,201 311,201 C 344,201 371,178 371,150 371,122 346,99 314,100 Z"/>
								</svg>
								<div class="tooltip__content text-white font-weight-bold text-xs-center">DESCARGAR INFORMACIÓN EN PDF</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
</form>


<!-- MODAL GESTOR -->
<form id="modal-form-gest" action="/PDF_gest_gest.pdf" method="POST">
  <div class="modal fade" id="modal-info-gest" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-xs-center font-weight-bold">+ Info</h4>
        </div>
        <div class="modal-body">
        	<div class="container">
	        	<div class="form-group row">
	  				<label class="col-xs-3">ID: </label>
	  					<div class="col-xs-9">
	    					<span id="id-modal-gest" class="font-weight-bold"> </span>
	    					<input type="hidden" id="id-gest-hidden" name="id" value="">
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre:  </label>
	  					<div class="col-xs-9">
	    					<span id="nombre-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 1:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido1-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Apellido 2:  </label>
	  					<div class="col-xs-9">
	    					<span id="apellido2-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Nombre de usuario: </label>
	  					<div class="col-xs-9">
	    					<span id="usuario-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">NIF: </label>
	  					<div class="col-xs-9">
	    					<span id="nif-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de alta: </label>
	  					<div class="col-xs-9">
	    					<span id="fecalta-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Teléfono: </label>
	  					<div class="col-xs-9">
	    					<span id="tlf-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">E-mail: </label>
	  					<div class="col-xs-9">
	    					<span id="email-modal-gest" class="font-weight-bold"> </span>
	  					</div>
				</div>
				
				<div class="row">
					<div class="col-xs-12 text-xs-center">
						<div class="tooltip tooltip--smaug" data-type="smaug" style='opacity: 1;'>
							<div class="tooltip__trigger" role="tooltip" aria-describedby="info-smaug">
								<a id="down-pdf-gest-gest">
									<span class="tooltip__trigger-text"><i class="fa fa-file-pdf-o fa-3x text-danger" aria-hidden="true"></i></span>
								</a>
							</div>
							<div class="tooltip__base" style="bottom:1em !important">
								<svg class="tooltip__shape" width="100%" height="100%" viewBox="0 0 400 300">
									<path d="M 314,100 C 313,100 312,100 311,100 L 89.5,100 C 55.9,100 29.1,121 29.1,150 29.1,178 53.1,201 89.5,201 L 184,201 200,223 217,201 311,201 C 344,201 371,178 371,150 371,122 346,99 314,100 Z"/>
								</svg>
								<div class="tooltip__content text-white font-weight-bold text-xs-center">DESCARGAR INFORMACIÓN EN PDF</div>
							</div>
						</div>
					</div>
				</div>
				
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
</form>

<div class="loader" style='display: none;'></div> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/tooltip/anime.min.js"></script>
	<script src="../assets/js/tooltip/charming.min.js"></script>
	<script src="../assets/js/tooltip/main.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/g_buscar-elemento.js"></script>
    
</body>
</html>

<% } %>