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
	    					<span id="provincia-modal-prof" class="font-weight-bold"> </span>
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
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
</div>


<!-- MODAL ALUMNO -->
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
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
</div>


<!-- MODAL NOTICIARIO -->
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
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
</div>


<!-- MODAL GESTOR -->
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
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
</div>

<div class="loader" style='display: none;'></div> 

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script>
    	$(document).ready(function(){
    		
    		//** PROFESOR **//
    		
    		// Realiza una búsqueda completa de profesores e imprime en la tabla los resultados.
    		$("#busqueda-profesor").on("click", function(){

    			$(".loader").css("display", "block");
    	    		    	    	
    	    	$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		async: false,
    	    		url: "/Proflist",
    	    		success: function(resp){  
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				
    	    				var asignimp_format = resp[i][6].substr(1, resp[i][6].length - 1);
    	    				
    	    				$("#prof-table tbody").append("<tr>");
	    	    				
    	    					//ID
    	    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	        					
	    	    				//Nombre
	    	    				if(resp[i][1].length >= 8){
	    	    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,8)+" ...</td>");
	    	    				}else{
	    	    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    	    				}
	        					
	        					//Apellido 1
	        					if(resp[i][2].length >= 8){
	        						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][2].substr(0,8)+" ...</td>");
	        					}else{
	        						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
	        					}
	        					
	        					//DNI
	        					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
	        					
	        					//Email
	        					if(resp[i][4].length >= 8){
	        						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0,8)+" ...</td>");
	        					}else{
	        						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
	        					}
	        					
	        					//Año promoción
	        					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][5]+"</td>");
	        					
	        					//Cursos asignados
	        					if(resp[i][6].length >= 30){
	        						$("#prof-table tbody tr:last-child").append("<td>"+asignimp_format.substr(0,30)+" ...</td>");
	        					}else{
	        						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][6]+"</td>");
	        					}
	        					
	        					//+ info
	        					$("#prof-table tbody tr:last-child").append("<td class='tabla-info-prof text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-prof'><i class='fa fa-info-circle' aria-hidden='true'></i></a></td>");
	        				
	        				$("#prof-table tbody").append("</tr>");
    	    			}
    	    			
    	    			$("#prof-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Hay un total de _MAX_ de profesores.",
		    		               "infoEmpty": "No hay registros aún.",
		    		               "infoFiltered": "(filtrados de un total de _MAX_ registros)",
		    		               "search" : "Búsqueda: ",
		    		               "LoadingRecords": "Cargando ...",
		    		               "Processing": "Procesando...",
		    		               "SearchPlaceholder": "Comience a teclear...",
		    		               "paginate": {
				    		          "previous": "Anterior",
				    		          "next": "Siguiente", 
	            					}
						 	}
			
	    				});
    	    			    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(2000);
    	    		}
    	    	});
    			
    		});
    		    		
    		
    		//Recoge el data-id del profesor para hacer una consulta más exhaustiva en un modal.
        	$(document).delegate(".tabla-info-prof a", "click", function(event){
        		
        		$("#modal-info").css("cursor", "default");
        		var id = $(this).data("id");
        		
        		$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		data: {id:id},
    	    		url: "/Prof_individual",
    	    		success: function(resp){  	
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				if(resp[i] == null){
    	    					resp[i] = "";
    	    				}
    	    			}
    	    			
    	    				$("#id-modal-prof").text(resp[0]);
    	    				$("#nombre-modal-prof").text(resp[2]);
    	    				$("#apellido1-modal-prof").text(resp[3]);
    	    				$("#apellido2-modal-prof").text(resp[4]);
    	    				$("#usuario-modal-prof").text(resp[5]);
    	    				$("#fnac-modal-prof").text(resp[7]);
    	    				$("#nif-modal-prof").text(resp[8]);
    	    				$("#nacimiento-modal-prof").text(resp[9]);
    	    				$("#nacionalidad-modal-prof").text(resp[19]);
    	    				$("#calle-modal-prof").text(resp[10]);
    	    				$("#cp-modal-prof").text(resp[11]);
    	    				$("#provincia-modal-prof").text(resp[12]);
    	    				$("#poblacion-modal-prof").text(resp[13]);
    	    				$("#fecalta-modal-prof").text(resp[14]);
    	    				$("#email-modal-prof").text(resp[15]);
    	    				$("#anioprom-modal-prof").text(resp[17]);
    	    				$("#asignimp-modal-prof").text(resp[18].substr(1, resp[18].length - 2));
    	    				    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(1000);
    	    		}
        		});	 
        		
        	});
    		
        	
    		//** ALUMNO **//
    		
        	// Realiza una búsqueda completa de alumnos e imprime en la tabla los resultados.
    		$("#busqueda-alumno").on("click", function(){

    			$(".loader").css("display", "block");
    	    		    	    	
    	    	$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		async: false,
    	    		url: "/Alumnlist",
    	    		success: function(resp){  
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				    	    				
    	    				$("#alumn-table tbody").append("<tr>");
	    	    				
    	    					//ID
    	    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	        					
	    	    				//Nombre
	    	    				if(resp[i][1].length >= 8){
	    	    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,8)+" ...</td>");
	    	    				}else{
	    	    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    	    				}
	        					
	        					//Apellido 1
	        					if(resp[i][2].length >= 8){
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][2].substr(0,8)+" ...</td>");
	        					}else{
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
	        					}
	        					
	        					//DNI
	        					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
	        					
	        					//Email
	        					if(resp[i][4].length >= 8){
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0,8)+" ...</td>");
	        					}else{
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
	        					}
	        					
	        					//Año promoción
	        					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][5]+"</td>");
	        					
	        					//Curso asignado
	        					if(resp[i][6].length >= 30){
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][6].substr(0,30)+" ...</td>");
	        					}else{
	        						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][6]+"</td>");
	        					}
	        					
	        					//+ info
	        					$("#alumn-table tbody tr:last-child").append("<td class='tabla-info-alumn text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-alumn'><i class='fa fa-info-circle' aria-hidden='true'></i></a></td>");
	        				
	        				$("#alumn-table tbody").append("</tr>");
    	    			}
    	    			
    	    			$("#alumn-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Hay un total de _MAX_ de alumnos.",
		    		               "infoEmpty": "No hay registros aún.",
		    		               "infoFiltered": "(filtrados de un total de _MAX_ registros)",
		    		               "search" : "Búsqueda: ",
		    		               "LoadingRecords": "Cargando ...",
		    		               "Processing": "Procesando...",
		    		               "SearchPlaceholder": "Comience a teclear...",
		    		               "paginate": {
				    		          "previous": "Anterior",
				    		          "next": "Siguiente", 
	            					}
						 	}
			
	    				});
    	    			    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(2000);
    	    		}
    	    	});
    			
    		});
    		    		
    		
    		//Recoge el data-id del alumno para hacer una consulta más exhaustiva en un modal.
        	$(document).delegate(".tabla-info-alumn a", "click", function(event){
        		
        		$("#modal-info-alumn").css("cursor", "default");
        		var id = $(this).data("id");
        		
        		$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		data: {id:id},
    	    		url: "/Alumn_individual",
    	    		success: function(resp){  	
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				if(resp[i] == null){
    	    					resp[i] = "";
    	    				}
    	    			}
    	    			
    	    				$("#id-modal-alumn").text(resp[0]);
    	    				$("#nombre-modal-alumn").text(resp[2]);
    	    				$("#apellido1-modal-alumn").text(resp[3]);
    	    				$("#apellido2-modal-alumn").text(resp[4]);
    	    				$("#usuario-modal-alumn").text(resp[5]);
    	    				$("#fnac-modal-alumn").text(resp[8]);
    	    				$("#nif-modal-alumn").text(resp[7]);
    	    				$("#nacimiento-modal-alumn").text(resp[9]);
    	    				$("#nacionalidad-modal-alumn").text(resp[10]);
    	    				$("#calle-modal-alumn").text(resp[11]);
    	    				$("#cp-modal-alumn").text(resp[12]);
    	    				$("#provincia-modal-alumn").text(resp[14]);
    	    				$("#poblacion-modal-alumn").text(resp[13]);
    	    				$("#fecalta-modal-alumn").text(resp[15]);
    	    				$("#email-modal-alumn").text(resp[20]);
    	    				$("#anioprom-modal-alumn").text(resp[16]);
    	    				$("#asignimp-modal-alumn").text(resp[17]);
    	    				    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(1000);
    	    		}
        		});	 
        		
        	});
    		
    		
    		//** NOTICIARIO **//
    		
        	// Realiza una búsqueda completa de noticiarios e imprime en la tabla los resultados.
    		$("#busqueda-noticiario").on("click", function(){

    			$(".loader").css("display", "block");
    	    		    	    	
    	    	$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		async: false,
    	    		url: "/Notlist",
    	    		success: function(resp){  
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				    	    				
    	    				$("#not-table tbody").append("<tr>");
	    	    				
    	    					//ID
    	    					$("#not-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	        					
	    	    				//Nombre
	    	    				if(resp[i][1].length >= 20){
	    	    					$("#not-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,20)+" ...</td>");
	    	    				}else{
	    	    					$("#not-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    	    				}
	        					
	        					//Apellido 1
	        					if(resp[i][2].length >= 20){
	        						$("#not-table tbody tr:last-child").append("<td>"+resp[i][2].substr(0,20)+" ...</td>");
	        					}else{
	        						$("#not-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
	        					}
	        					
	        					//Apellido 2
	        					if(resp[i][3].length >= 20){
	        						$("#not-table tbody tr:last-child").append("<td>"+resp[i][3].substr(0,20)+" ...</td>");
	        					}else{
	        						$("#not-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
	        					}
	        					
	        					//Email
	        					if(resp[i][4].length >= 20){
	        						$("#not-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0, 20)+" ...</td>");
	        					}else{
	        						$("#not-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
	        					}
	        					        					
	        					//+ info
	        					$("#not-table tbody tr:last-child").append("<td class='tabla-info-not text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-not'><i class='fa fa-info-circle' aria-hidden='true'></i></a></td>");
	        				
	        				$("#not-table tbody").append("</tr>");
    	    			}
    	    			
    	    			$("#not-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Hay un total de _MAX_ de noticiarios.",
		    		               "infoEmpty": "No hay registros aún.",
		    		               "infoFiltered": "(filtrados de un total de _MAX_ registros)",
		    		               "search" : "Búsqueda: ",
		    		               "LoadingRecords": "Cargando ...",
		    		               "Processing": "Procesando...",
		    		               "SearchPlaceholder": "Comience a teclear...",
		    		               "paginate": {
				    		          "previous": "Anterior",
				    		          "next": "Siguiente", 
	            					}
						 	}
			
	    				});
    	    			    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(2000);
    	    		}
    	    	});
    			
    		});
    		    		
    		
    		//Recoge el data-id del noticiario para hacer una consulta más exhaustiva en un modal.
        	$(document).delegate(".tabla-info-not a", "click", function(event){
        		
        		$("#modal-info-not").css("cursor", "default");
        		var id = $(this).data("id");
        		
        		$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		data: {id:id},
    	    		url: "/Not_individual",
    	    		success: function(resp){  	
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				if(resp[i] == null){
    	    					resp[i] = "";
    	    				}
    	    			}
    	    			
    	    				$("#id-modal-not").text(resp[0]);
    	    				$("#nombre-modal-not").text(resp[2]);
    	    				$("#apellido1-modal-not").text(resp[3]);
    	    				$("#apellido2-modal-not").text(resp[4]);
    	    				$("#usuario-modal-not").text(resp[5]);
    	    				$("#fecalta-modal-not").text(resp[7]);
    	    				$("#email-modal-not").text(resp[8]);
    	    				$("#tlf-modal-not").text(resp[9]);
    	    				$("#nif-modal-not").text(resp[10]);
    	    				    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(1000);
    	    		}
        		});	 
        		
        	});
    		
			
    		//** GESTOR **//
    		
        	// Realiza una búsqueda completa de gestores e imprime en la tabla los resultados.
    		$("#busqueda-gestor").on("click", function(){

    			$(".loader").css("display", "block");
    	    		    	    	
    	    	$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		async: false,
    	    		url: "/Gestlist",
    	    		success: function(resp){  
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				    	    				
    	    				$("#gest-table tbody").append("<tr>");
	    	    				
    	    					//ID
    	    					$("#gest-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	        					
	    	    				//Nombre
	    	    				if(resp[i][1].length >= 20){
	    	    					$("#gest-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,20)+" ...</td>");
	    	    				}else{
	    	    					$("#gest-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    	    				}
	        					
	        					//Apellido 1
	        					if(resp[i][2].length >= 20){
	        						$("#gest-table tbody tr:last-child").append("<td>"+resp[i][2].substr(0,20)+" ...</td>");
	        					}else{
	        						$("#gest-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
	        					}
	        					
	        					//Apellido 2
	        					if(resp[i][3].length >= 20){
	        						$("#gest-table tbody tr:last-child").append("<td>"+resp[i][3].substr(0,20)+" ...</td>");
	        					}else{
	        						$("#gest-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
	        					}
	        					
	        					//Email
	        					if(resp[i][4].length >= 20){
	        						$("#gest-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0, 20)+" ...</td>");
	        					}else{
	        						$("#gest-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
	        					}
	        					        					
	        					//+ info
	        					$("#gest-table tbody tr:last-child").append("<td class='tabla-info-gest text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-gest'><i class='fa fa-info-circle' aria-hidden='true'></i></a></td>");
	        				
	        				$("#gest-table tbody").append("</tr>");
    	    			}   
    	    			
    	    			$("#gest-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Hay un total de _MAX_ de gestores.",
		    		               "infoEmpty": "No hay registros aún.",
		    		               "infoFiltered": "(filtrados de un total de _MAX_ registros)",
		    		               "search" : "Búsqueda: ",
		    		               "LoadingRecords": "Cargando ...",
		    		               "Processing": "Procesando...",
		    		               "SearchPlaceholder": "Comience a teclear...",
		    		               "paginate": {
				    		          "previous": "Anterior",
				    		          "next": "Siguiente", 
	            					}
						 	}
			
	    				});
    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(2000);
    	    		}
    	    	});
    	    	
    		});
    		    		
    		
    		//Recoge el data-id del gestor para hacer una consulta más exhaustiva en un modal.
        	$(document).delegate(".tabla-info-gest a", "click", function(event){
        		
        		$("#modal-info-gest").css("cursor", "default");
        		var id = $(this).data("id");
        		
        		$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		data: {id:id},
    	    		url: "/Gest_individual",
    	    		success: function(resp){  	
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				if(resp[i] == null){
    	    					resp[i] = "";
    	    				}
    	    			}
    	    			
    	    				$("#id-modal-gest").text(resp[0]);
    	    				$("#nombre-modal-gest").text(resp[2]);
    	    				$("#apellido1-modal-gest").text(resp[3]);
    	    				$("#apellido2-modal-gest").text(resp[4]);
    	    				$("#usuario-modal-gest").text(resp[5]);
    	    				$("#fecalta-modal-gest").text(resp[7]);
    	    				$("#email-modal-gest").text(resp[8]);
    	    				$("#tlf-modal-gest").text(resp[10]);
    	    				$("#nif-modal-gest").text(resp[9]);
    	    				    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(1000);
    	    		}
        		});	 
        		
        	});
    		
			
    		//** CURSO **//
    		
        	// Realiza una búsqueda completa de cursos e imprime en la tabla los resultados.
    		$("#busqueda-curso").on("click", function(){

    			$(".loader").css("display", "block");
    	    		    	    	
    	    	$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		async: false,
    	    		url: "/Cursoslist",
    	    		success: function(resp){  
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				    	    				
    	    				$("#curso-table tbody").append("<tr>");
	    	    				
    	    					//ID
    	    					$("#curso-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	        					
	    	    				//Curso
	    	    				$("#curso-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	        					
	        					//Año inicio
	        					$("#curso-table tbody tr:last-child").append("<td>"+resp[i][2]+" - "+resp[i][3]+"</td>");
	        					
	        					//Alumnos matriculados
	        					$("#curso-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
	        					       					        				
	        				$("#curso-table tbody").append("</tr>");
    	    			}   
    	    			
    	    			$("#curso-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Hay un total de _MAX_ de cursos.",
		    		               "infoEmpty": "No hay registros aún.",
		    		               "infoFiltered": "(filtrados de un total de _MAX_ registros)",
		    		               "search" : "Búsqueda: ",
		    		               "LoadingRecords": "Cargando ...",
		    		               "Processing": "Procesando...",
		    		               "SearchPlaceholder": "Comience a teclear...",
		    		               "paginate": {
				    		          "previous": "Anterior",
				    		          "next": "Siguiente", 
	            					}
						 	}
			
	    				});
    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(2000);
    	    		}
    	    	});
    	    	
    		});
    		
    	});
    </script>
    
</body>
</html>

<% } %>