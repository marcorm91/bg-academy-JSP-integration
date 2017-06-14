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

<% Object[] datos_prof = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es profesor...
	if(session.getAttribute("log") == null || !datos_prof[1].equals("P")){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Cursos Asignados - Big Ben Academy</title>
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
    
<div id="bg-academy-principal-prof-cursos">

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
                                <i class="fa fa-folder-open-o fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Cursos Asignados </span>
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
                <h1><a href="../principal-alumno.jsp">Panel Principal</a> / Mis Cursos Asignados</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> Panel de Mis Cursos </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-thumb-tack fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="profesor-tareas"></i> <p> Subir <br/> Tarea </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-files-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="profesor-examenes"></i> <p> Subir <br/> Examen </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-book fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="profesor-apuntes"></i> <p> Subir <br/> Apuntes </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-pencil-square-o fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="profesor-tareas-alumnos"></i> <p> Tareas <br/> de Alumnos </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-list-ol fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="profesor-examenes-alumnos"></i> <p> Examenes <br/> de Alumnos </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-list-alt fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="profesor-list-alumnos"></i> <p> Listado <br/> de Alumnos </p>
                            </div>
                        </div>
                         <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <a href="../principal-profesor.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
                       
                    </div> 
                </div>
            </div>
    </div>
    
 <!------- SUBPANELES DE MIS CURSOS ASIGNADOS ------->
    
<!-- Subpanel subir tarea profesor -->
<div id="subpanel-sub-tarea-profesor">
    
     <div class="container">
        <div class="row">
            <div class="col-xs-6 card-header" style="margin-left: 15px; border-bottom: 0; margin-bottom: 15px;">
                  <div class="form-group">
                    <label class="font-weight-bold">Seleccione el curso donde desee abrir una tarea:</label>
                         <div class="form-group row">
                			<label class="col-md-5 col-form-label">* Año promoción:</label>
			                <div class="col-md-7">
			                    <!-- PROMOCIONES CURSOS REGISTRADOS PREVIAMENTE -->
			                    <select class="form-control" id="anio-curso-prof-tarea">
			                    	<option> - Seleccione promoción - </option>
			                    </select>
			                </div>
            			</div>
			            <div class="form-group row">
			                <label class="col-md-4 col-form-label">* Selección de curso:</label>
			                <div class="col-md-8">
			                    <!-- CURSOS REGISTRADOS PREVIAMENTE -->
			                    <select class="form-control" id="curso-tarea">
			                    </select>
			                </div>
			            </div>
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-4">
                  <div class="form-group">
                    <label class="font-weight-bold">Estime una fecha límite:</label>
                        <input class="form-control" type="text" id="fecha-limite-subida-tarea">
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-8">
                  <div class="form-group">
                    <label class="font-weight-bold">Título de la actividad:</label>
                        <input class="form-control" type="text" id="tit-tarea">
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-8">
                  <div class="form-group">
                    <label class="font-weight-bold">Detalles de la actividad:</label>
                        <textarea class="form-control" rows="6" id="detalle-tarea"> </textarea>
                  </div>
            </div>
         </div>
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
         <a href="#" id="reg-tarea"> <button class="btn btn-primary" id="reg-tarea"> Registrar Tarea </button> </a>
     </div>
   
</div>

    
<!-- Subpanel subir examen profesor -->
<div id="subpanel-sub-examen-profesor">
    
      <div class="container">
        <div class="row">
           <div class="col-xs-6 card-header" style="margin-left: 15px; border-bottom: 0; margin-bottom: 15px;">
                  <div class="form-group">
                    <label class="font-weight-bold">Seleccione el curso donde desee abrir un examen:</label>
                         <div class="form-group row">
                			<label class="col-md-5 col-form-label">* Año promoción:</label>
			                <div class="col-md-7">
			                    <!-- PROMOCIONES CURSOS REGISTRADOS PREVIAMENTE -->
			                    <select class="form-control" id="anio-curso-prof-examen">
			                    	<option> - Seleccione promoción - </option>
			                    </select>
			                </div>
            			</div>
			            <div class="form-group row">
			                <label class="col-md-4 col-form-label">* Selección de curso:</label>
			                <div class="col-md-8">
			                    <!-- CURSOS REGISTRADOS PREVIAMENTE -->
			                    <select class="form-control" id="curso-examen">
			                    </select>
			                </div>
			            </div>
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-4">
                  <div class="form-group">
                    <label class="font-weight-bold">Estime una fecha límite:</label>
                        <input class="form-control" type="text" id="fecha-limite-subida-examen">
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-8">
                  <div class="form-group">
                    <label class="font-weight-bold">Título de la actividad:</label>
                        <input class="form-control" type="text" id="tit-examen">
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-8">
                  <div class="form-group">
                    <label class="font-weight-bold">Detalles de la actividad:</label>
                        <textarea class="form-control" rows="6" id="detalleexamen"> </textarea>
                  </div>
            </div>
         </div>
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
         <a href="#" id="reg-examen"> <button class="btn btn-primary"> Registrar Examen </button> </a>
     </div>
   
</div>
    
<!-- Subpanel apuntes profesor -->
<div id="subpanel-sub-apuntes-profesor">
    
     <div class="container">
        <div class="row">
            <div class="col-xs-5">
                  <div class="form-group">
                    <label class="font-weight-bold">Seleccione el curso donde desee subir los apuntes:</label>
                        <select class="form-control">
                            <option>A1 - Nivel Básico</option>
                            <option>C2 - Nivel Avanzado</option>
                        </select>
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-8">
                  <div class="form-group">
                    <label class="font-weight-bold">Título de los apuntes:</label>
                        <input class="form-control" type="text">
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-8">
                  <div class="form-group">
                    <label class="font-weight-bold">Detalles de la actividad:</label>
                        <textarea class="form-control" rows="6"> </textarea>
                  </div>
            </div>
         </div>
         <div class="row">
            <div class="col-xs-6">
                  <div class="form-group">
                    <label class="font-weight-bold">Subir fichero:</label>
                        <input class="form-control" type="file">
                  </div>
            </div>
         </div>
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
         <a href="#" id="reg-apuntes"> <button class="btn btn-primary"> Subir Apuntes </button> </a>
     </div>
   
</div>
    
<!-- Subpanel listado alumnos profesor -->
<div id="subpanel-list-alumnos-profesor">
    
     <div class="container-fluid">
         
        <div class="row">
            <div class="col-xs-12">
                 <table class="table" id="alumn-table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>DNI</th>
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
                 
         <div class="col-xs-12 text-xs-center btn-atras">
             <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
         </div>
   
    </div>
    
</div>
    
<!-- Subpanel tareas alumnos profesor -->
<div id="subpanel-tareas-alumnos-profesor">
    
     <div class="container">
         
         <div class="row menu-busqueda">
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-search fa-1x" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Palabra clave">
                </div>
            </div>
                    
            <div class="col-md-2">
                <button type="button" class="btn btn-primary">Buscar</button>
            </div>
        </div>
         
        <div class="row">
            <div class="col-xs-12">
                 <table class="table">
                  <thead>
                    <tr>
                      <th>ID Tarea</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>DNI</th>
                      <th>Año promoción</th>
                      <th>Curso asignado</th>
                      <th>Tarea</th>
                      <th>Descargar</th>
                      <th>Nota</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>45445656R</td>
                      <td>2011-2012</td>
                      <td>B1 - Nivel Intermedio</td>
                      <td>Aprende colores</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                      <td><input class="form-control" type="text" size="1" maxlength="5"></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>45445656R</td>
                      <td>2011-2012</td>
                      <td>A1 - Nivel Básico</td>
                      <td>Reading Tema 1</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                      <td><input class="form-control" type="text" size="1" maxlength="5"></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Adelina</td>
                      <td>López</td>
                      <td>45445656R</td>
                      <td>2013-2014</td>
                      <td>C1 - Nivel Avanzado</td>
                      <td>Writing Prueba</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                      <td><input class="form-control" type="text" size="1" maxlength="5"></td>
                    </tr>
                  </tbody>
                </table> 
            </div>
    </div>
         
    <div class="row paginacion-busq">
            <div class="col-xs-12 text-xs-center">
                <nav>
                    <ul class="pagination">
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Anterior</span>
                          </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Siguiente</span>
                          </a>
                        </li>
                    </ul>
                </nav>
            </div>
    </div>
        
         <div class="col-xs-12 text-xs-center btn-atras">
             <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
             <a href="#" id="reg-apuntes"> <button class="btn btn-primary"> Actualizar Notas </button> </a>
         </div>
   
    </div>
    
</div>
    
<!-- Subpanel tareas alumnos profesor -->
<div id="subpanel-examenes-alumnos-profesor">
    
     <div class="container">
         
         <div class="row menu-busqueda">
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-search fa-1x" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Palabra clave">
                </div>
            </div>
                    
            <div class="col-md-2">
                <button type="button" class="btn btn-primary">Buscar</button>
            </div>
        </div>
         
        <div class="row">
            <div class="col-xs-12">
                 <table class="table">
                  <thead>
                    <tr>
                      <th>ID Examen</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>DNI</th>
                      <th>Año promoción</th>
                      <th>Curso asignado</th>
                      <th>Examen</th>
                      <th>Descargar</th>
                      <th>Nota</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>45445656R</td>
                      <td>2011-2012</td>
                      <td>B1 - Nivel Intermedio</td>
                      <td>Aprende colores</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                      <td><input class="form-control" type="text" size="1" maxlength="5"></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>45445656R</td>
                      <td>2011-2012</td>
                      <td>A1 - Nivel Básico</td>
                      <td>Reading Tema 1</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                      <td><input class="form-control" type="text" size="1" maxlength="5"></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Adelina</td>
                      <td>López</td>
                      <td>45445656R</td>
                      <td>2013-2014</td>
                      <td>C1 - Nivel Avanzado</td>
                      <td>Writing Prueba</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                      <td><input class="form-control" type="text" size="1" maxlength="5"></td>
                    </tr>
                  </tbody>
                </table> 
            </div>
    </div>
         
    <div class="row paginacion-busq">
            <div class="col-xs-12 text-xs-center">
                <nav>
                    <ul class="pagination">
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Anterior</span>
                          </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Siguiente</span>
                          </a>
                        </li>
                    </ul>
                </nav>
            </div>
    </div>
        
         <div class="col-xs-12 text-xs-center btn-atras">
             <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
             <a href="#" id="reg-apuntes"> <button class="btn btn-primary"> Actualizar Notas </button> </a>
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

<!-- MODAL ALUMNO -->
<form id="modal-form-alumn" action="/PDF_alumn_prof.pdf" method="POST">
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

<div class="loader" style='display: none;'></div> 

<!-- MODAL SUCCESS / ERROR-->
<div id="modal-success-tarea" title="¡Tarea registrada!" style="display: none">
	<p> ¡Se ha registrado la tarea correctamente! </p>
</div>

<div id="modal-error-tarea" title="¡Error de registro tarea!" style="display: none">
	<p> <b>¡ERROR!</b> Comprueba que no falta ningún dato por rellenar. </p>
</div>

<div id="modal-success-examen" title="¡Examen registrado!" style="display: none">
	<p> ¡Se ha registrado el examen correctamente! </p>
</div>

<div id="modal-error-examen" title="¡Error de registro examen!" style="display: none">
	<p> <b>¡ERROR!</b> Comprueba que no falta ningún dato por rellenar. </p>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/tooltip/anime.min.js"></script>
	<script src="../assets/js/tooltip/charming.min.js"></script>
	<script src="../assets/js/tooltip/main.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/p_cursos.js"></script>
    
</body>
</html>

<% } %>