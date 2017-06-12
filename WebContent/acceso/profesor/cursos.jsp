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
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-calendar fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="profesor-calendario"></i> <p> Calendario </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="../principal-profesor.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
                       
                    </div> 
                </div>
            </div>
    </div>
    
 <!------- SUBPANELES DE MIS CURSOS ASIGNADOS ------->
    
 <!-- Subpanel profesor calendario -->
 <div id="subpanel-calendario-profesor">
    
     <div class="container">
        
        <div class="row">
            <div class="col-xs-4 text-xs-right">
                <button id="anioAnterior" class="btn btn-info"><i class="fa fa-angle-double-left fa-3x" aria-hidden="true"></i></button>
                <button id="mesAnterior" class="btn btn-info"><i class="fa fa-angle-left fa-3x" aria-hidden="true"></i></button>
            </div>

            <div class="col-xs-4 text-xs-center">
                <div id="mesActual"> </div> 
            </div>

            <div class="col-xs-4 text-xs-left">
                <button id="mesSiguiente" class="btn btn-info"><i class="fa fa-angle-right fa-3x" aria-hidden="true"></i></button>
                <button id="anioSiguiente" class="btn btn-info"><i class="fa fa-angle-double-right fa-3x" aria-hidden="true"></i></button> 
            </div>
        </div>
    
        
        <div class="row text-xs-center">
            <div class="col-xs-12">
                <div class="hoy"> 
                    <button id="bHoy" class="btn btn-info"> HOY </button> 
                </div>
            </div>
        </div>
        

       <div class="row text-xs-center">
            <table id="calendario">

                <tr>
                    <th>Lunes</th>
                    <th>Martes</th>
                    <th>Miércoles</th>
                    <th>Jueves</th>
                    <th>Viernes</th>
                    <th>Sábado</th>
                    <th>Domingo</th>
                </tr>

                <tr id="F1"><td></td><td></td><td></td><td></td><td></td><td class="finde"></td><td class="finde"></td></tr>
                <tr id="F2"><td></td><td></td><td></td><td></td><td></td><td class="finde"></td><td class="finde"></td></tr>
                <tr id="F3"><td></td><td></td><td></td><td></td><td></td><td class="finde"></td><td class="finde"></td></tr>
                <tr id="F4"><td></td><td></td><td></td><td></td><td></td><td class="finde"></td><td class="finde"></td></tr>
                <tr id="F5"><td></td><td></td><td></td><td></td><td></td><td class="finde"></td><td class="finde"></td></tr>
                <tr id="F6"><td></td><td></td><td></td><td></td><td></td><td class="finde"></td><td class="finde"></td></tr>

            </table>
        </div>

    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
     </div>
   
</div>
    
    
<!-- Subpanel subir tarea profesor -->
<div id="subpanel-sub-tarea-profesor">
    
     <div class="container">
        <div class="row">
            <div class="col-xs-5">
                  <div class="form-group">
                    <label class="font-weight-bold">Seleccione el curso donde desee abrir una tarea:</label>
                        <select class="form-control">
                            <option>A1 - Nivel Básico</option>
                            <option>C2 - Nivel Avanzado</option>
                        </select>
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
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./cursos.jsp"> <button class="btn btn-primary"> Volver </button> </a>
         <a href="#" id="reg-tarea"> <button class="btn btn-primary"> Registrar Tarea </button> </a>
     </div>
   
</div>

    
<!-- Subpanel subir examen profesor -->
<div id="subpanel-sub-examen-profesor">
    
      <div class="container">
        <div class="row">
            <div class="col-xs-5">
                  <div class="form-group">
                    <label class="font-weight-bold">Seleccione el curso donde desee abrir un examen:</label>
                        <select class="form-control">
                            <option>A1 - Nivel Básico</option>
                            <option>C2 - Nivel Avanzado</option>
                        </select>
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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/calendar.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/tooltip/anime.min.js"></script>
	<script src="../assets/js/tooltip/charming.min.js"></script>
	<script src="../assets/js/tooltip/main.js"></script>
    <script src="../assets/js/script.js"></script>
    
    <script>
    
    $(document).ready(function(){
    	
    		// Carga una lista de alumnos pertenecientes al mismo curso que está asignado el profesor.
    		$("#profesor-list-alumnos").on("click", function(e){
    			
    			e.preventDefault();
    			
    			$(".loader").css("display", "block");
    			
    			$.ajax({
    				type: "POST",
    				dataType: "json",
    				async: false,
    				url: "/Lista_alumnos_curso",
    				success: function(resp){  
    					
    					for(var i = 0; i < resp.length; i++){
    	    				
    	    				var asignimp_format = resp[i][7].substr(0, resp[i][7].length - 1);
    	    				
    	    				$("#alumn-table tbody").append("<tr>");
    		    				
    	    					//ID
    	    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
    	    					
    		    				//Nombre
    		    				if(resp[i][1].length > 8){
    		    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,8)+" ...</td>");
    		    				}else{
    		    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
    		    				}
    	    					
    	    					//Apellido 1
    	    					if(resp[i][2].length > 8){
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][2].substr(0,8)+" ...</td>");
    	    					}else{
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
    	    					}
    	    					
    	    					//Apellido 2
    	    					if(resp[i][3].length > 8){
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][3].substr(0,8)+" ...</td>");
    	    					}else{
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
    	    					}
    	    					
    	    					//DNI
    	    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
    	    					
    	    					//Email
    	    					if(resp[i][5].length > 8){
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][5].substr(0,8)+" ...</td>");
    	    					}else{
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][5]+"</td>");
    	    					}
    	    					
    	    					//Año promoción
    	    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][6]+"</td>");
    	    					
    	    					//Curso asignado
    	    					if(resp[i][7].length > 30){
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+asignimp_format.substr(0,30)+" ...</td>");
    	    					}else{
    	    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][7]+"</td>");
    	    					}
    	    					
    	    					//+ info
    	    					$("#alumn-table tbody tr:last-child").append("<td class='tabla-info-alumn text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-alumn'><i class='fa fa-info-circle' aria-hidden='true'></i></a></td>");
    	    				
    	    				$("#alumn-table tbody").append("</tr>");
    	    			}
    	    			
    	    			$("#alumn-table").DataTable({
    						 "language":{
    	    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
    	    		         "zeroRecords": "Sin resultados en su búsqueda.",
    	    		               "info": "Tienes un total de _MAX_ de alumnos asignados.",
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
    					$("#id-alumn-hidden").val(resp[0]);
    					$("#nombre-modal-alumn").text(resp[2]);
    					$("#apellido1-modal-alumn").text(resp[3]);
    					$("#apellido2-modal-alumn").text(resp[4]);
    					$("#usuario-modal-alumn").text(resp[5]);
    					$("#fnac-modal-alumn").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[8])));
    					$("#nif-modal-alumn").text(resp[7]);
    					$("#nacimiento-modal-alumn").text(resp[9]);
    					$("#nacionalidad-modal-alumn").text(resp[10]);
    					$("#calle-modal-alumn").text(resp[11]);
    					$("#cp-modal-alumn").text(resp[12]);
    					$("#provincia-modal-alumn").text(resp[14]);
    					$("#poblacion-modal-alumn").text(resp[13]);
    					$("#fecalta-modal-alumn").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[15])));
    					$("#email-modal-alumn").text(resp[20]);
    					$("#anioprom-modal-alumn").text(resp[16]);
    					$("#asignimp-modal-alumn").text(resp[17]);
    	    				
    	    				    	    			
    	    		},
    	    		complete: function(){
    	    			$(".loader").fadeOut(1000);
    	    		}
    			});	 
    			
    		});
    		
    		// Envía los datos del alumno a visualizar/descargar por PDF.
    		$("#down-pdf-alumn-gest").on("click", function(event){
    			event.preventDefault();
    			$("#modal-form-alumn").submit();
    		});
    	
    });
       
    </script>
    
</body>
</html>

<% } %>