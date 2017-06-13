<%@ page contentType="text/html; charset=UTF-8" %>

<% 
// 		 DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 		 datos[0] = "iduser";
// 		 datos[1] = "tipouser";
// 		 datos[2] = "nombre";
// 		 datos[3] = "apellido1";
// 		 datos[4] = "apellido2";
// 		 datos[5] = "usuario";
// 		 datos[6] = "pass";
// 		 datos[7] = "nif";
// 		 datos[8] = "fnac";
// 		 datos[9] = "nacimiento";
// 		 datos[10] = "nacionalidad";
// 		 datos[11] = "calle";
// 		 datos[12] = "cp";
// 		 datos[13] = "poblacion";
// 		 datos[14] = "provincia";
// 		 datos[15] = "fecalta";
// 		 datos[16] = "anioprom";
// 		 datos[17] = "cursoasign";
// 		 datos[18] = "comentarios";
// 		 datos[19] = "tlf";
// 		 datos[20] = "email";
%>

<% Object[] datos_alumn = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es alumno...
	if(session.getAttribute("log") == null || !datos_alumn[1].equals("A")){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Curso - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../assets/css/dataTables.min.css">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-alumn-curso">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-alumno.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./matricula.jsp" title="Ir a Mi Matrícula">
                                <i class="fa fa-id-card-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Matrícula </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mis-calificaciones.jsp" title="Ir a Mis Calificaciones">
                                <i class="fa fa-file-text-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mis Calificaciones </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./curso.jsp" title="Ir a Mi Curso">
                                <i class="fa fa-folder-open-o fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Mi Curso </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./reg-incidencia.jsp" title="Ir a Registrar Incidencia">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Registrar Incidencia </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link " href="./ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_alumn[2]); %> </a> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_alumn[2]); %> </a> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-alumno.jsp">Panel Principal</a> / Mi Curso</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> Panel del curso </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-pencil-square fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="alumno-tareas"></i> <p> Tareas </p>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-list-ol fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="alumno-examenes"></i> <p> Examenes </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-book fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="alumno-apuntes"></i> <p> Apuntes </p>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-calendar fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="alumno-calendario"></i> <p> Calendario </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <a href="../principal-alumno.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
    </div>
    
 <!------- SUBPANELES DE CURSO ------->
    
 <!-- Subpanel alumno calendario -->
 <div id="subpanel-calendario-alumno">
    
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
         <a href="./curso.jsp"> <button class="btn btn-primary"> Volver </button> </a>
     </div>
   
</div>
    
    
<!-- Subpanel apuntes alumno -->
<div id="subpanel-apuntes-alumno">
    
     <div class="container">
        <div class="row">
            <div class="col-xs-12">
                 <table class="table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Fecha de subida</th>
                      <th>Profesor</th>
                      <th>Tema / Materia</th>
                      <th>Descargar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>27/04/2017</td>
                      <td>Luis Fernández</td>
                      <td>Tema 1 (Writing)</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>01/05/2017</td>
                      <td>Luis Fernández</td>
                      <td>Tema 1 (Reading)</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>15/05/2017</td>
                      <td>Luis Fernández</td>
                      <td>Tema 2 (Writing)</td>
                      <td class="descarga-apuntes"><i class="fa fa-download text-danger" aria-hidden="true"></i></td>
                    </tr>
                  </tbody>
                </table> 
            </div>
         </div>
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./curso.jsp"> <button class="btn btn-primary"> Volver </button> </a>
     </div>
   
</div>

    
<!-- Subpanel tareas alumno -->
<div id="subpanel-tareas-alumno">
    
     <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="alumn-table-tareas">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Fecha de entrega</th>
                      <th>Nombre Actividad</th>
                      <th>Descripción</th>
                      <th>Seleccione Fichero</th>
                      <th>Subir</th>
                      <th>Entrega</th>
                    </tr>
                  </thead>
                  <tbody>
                   
                  </tbody>
                </table> 
            </div>
         </div>
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./curso.jsp"> <button class="btn btn-primary"> Volver </button> </a>
     </div>
   
</div>
    
<!-- Subpanel examenes alumno -->
<div id="subpanel-examenes-alumno">
    
     <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="alumn-table-examenes">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Fecha de entrega</th>
                      <th>Nombre Actividad</th>
                      <th>Descripción</th>
                      <th>Seleccione Fichero</th>
                      <th>Subir</th>
                      <th>Entrega</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                  </tbody>
                </table> 
            </div>
         </div>
    </div>
        
     <div class="col-xs-12 text-xs-center btn-atras">
         <a href="./curso.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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

<div class="loader" style='display: none;'></div> 

<!-- Modal -->
<div class="modal fade" id="modal-actividad" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-xs-center font-weight-bold">Descripción de la actividad</h4>
        </div>
        <div class="modal-body"></div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
</div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/script.js"></script>
        <script src="../assets/js/calendar.js"></script>
    
    <script>
    
    	//**** TAREAS DE ALUMNOS ****//
    
    	$("#alumno-tareas").on("click", function(){
    		
    		$(".loader").css("display", "block");
    		
    		// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario.
    		$.ajax({
    			type: "POST",
    			dataType: "json",
    			async: false,
    			url: "/Ver_tareas",    		
    			success: function(resp){  
    				
    				for(var i = 0; i < resp.length; i++){
    					for(j = 0; j < 4; j++){
    						if(resp[i][j] == null){
            					resp[i][j] = "";
            				}
    					}
        			}
    				
    				var fechaactual = $.datepicker.formatDate('yy/mm/dd', new Date());
    				
    				for(var i = 0; i < resp.length; i++){
    					
    					if(fechaactual <= $.datepicker.formatDate('yy/mm/dd', new Date(resp[i][3]))){
    					
	    					$("#alumn-table-tareas tbody").append("<tr>");
	    					    					
	    						$("#alumn-table-tareas tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	    						$("#alumn-table-tareas tbody tr:last-child").append("<td>"+$.datepicker.formatDate('dd/mm/yy', new Date(resp[i][3]))+"</td>");
	    						
	    						if(resp[i][1].length > 15){
	    							$("#alumn-table-tareas tbody tr:last-child").append("<td>"+resp[i][1].substr(0,15)+" ...</td>");
	    						}else{
	    							$("#alumn-table-tareas tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    						}
	    					
	    						$("#alumn-table-tareas tbody tr:last-child").append("<td class='descr-act text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-actividad'><i class='fa fa-file-text text-primary' aria-hidden='true'></i></a></td>");
	    						$("#alumn-table-tareas tbody tr:last-child").append("<td><input type='file'></td>");
	    						$("#alumn-table-tareas tbody tr:last-child").append("<td class='sube-tarea text-xs-center'><i class='fa fa-upload text-success' aria-hidden='true'></i></td>");
	    						$("#alumn-table-tareas tbody tr:last-child").append("<td class='act-ok text-xs-center'><i class='fa fa-times text-danger' aria-hidden='true'></i></td>")
	    						
	    					$("#alumn-table-tareas tbody").append("</tr>");
    						
    					}
    				}
    				
    	    			$("#alumn-table-tareas").DataTable({
    						 "language":{
    	    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
    	    		         "zeroRecords": "Sin resultados en su búsqueda.",
    	    		               "info": "Hay un total de _MAX_ tareas.",
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
    		
    		
			//**** EXÁMENES DE ALUMNOS ****//
    		
    		$("#alumno-examenes").on("click", function(){
    			
    			
    		
	    		$(".loader").css("display", "block");
	    		
	    		// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario.
	    		$.ajax({
	    			type: "POST",
	    			dataType: "json",
	    			async: false,
	    			url: "/Ver_examenes",    		
	    			success: function(resp){  
	    				
	    				for(var i = 0; i < resp.length; i++){
	    					for(j = 0; j < 4; j++){
	    						if(resp[i][j] == null){
	            					resp[i][j] = "";
	            				}
	    					}
	        			}
	    				
	    				var fechaactual = $.datepicker.formatDate('yy/mm/dd', new Date());
	    				
	    				for(var i = 0; i < resp.length; i++){
	    					
	    					if(fechaactual <= $.datepicker.formatDate('yy/mm/dd', new Date(resp[i][3]))){
	    					
		    					$("#alumn-table-examenes tbody").append("<tr>");
		    					    					
		    						$("#alumn-table-examenes tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
		    						$("#alumn-table-examenes tbody tr:last-child").append("<td>"+$.datepicker.formatDate('dd/mm/yy', new Date(resp[i][3]))+"</td>");
		    						
		    						if(resp[i][1].length > 15){
		    							$("#alumn-table-examenes tbody tr:last-child").append("<td>"+resp[i][1].substr(0,15)+" ...</td>");
		    						}else{
		    							$("#alumn-table-examenes tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
		    						}
		    					
		    						$("#alumn-table-examenes tbody tr:last-child").append("<td class='descr-act text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-actividad'><i class='fa fa-file-text text-primary' aria-hidden='true'></i></a></td>");
		    						$("#alumn-table-examenes tbody tr:last-child").append("<td><input type='file'  style='color: transparent; width:10px;'></td>");
		    						$("#alumn-table-examenes tbody tr:last-child").append("<td class='sube-tarea text-xs-center'><i class='fa fa-upload text-success' aria-hidden='true'></i></td>");
		    						$("#alumn-table-examenes tbody tr:last-child").append("<td class='act-ok text-xs-center'><i class='fa fa-times text-danger' aria-hidden='true'></i></td>")
		    						
		    					$("#alumn-table-examenes tbody").append("</tr>");
	    						
	    					}
	    				}
	    				
	    	    			$("#alumn-table-examenes").DataTable({
	    						 "language":{
	    	    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
	    	    		         "zeroRecords": "Sin resultados en su búsqueda.",
	    	    		               "info": "Hay un total de _MAX_ exámenes.",
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
    		$(document).delegate(".descr-act a", "click", function(event){
    			
    			var idactividad = $(this).data("id");
    			$("#modal-actividad").css("cursor", "default");
    			
    			$.ajax({
    	    		type: "POST",
    	    		dataType: "json",
    	    		data: {idactividad:idactividad},
    	    		url: "/Actividad_individual",
    	    		success: function(resp){  	
    	    			
    	    			for(var i = 0; i < resp.length; i++){
    	    				if(resp[i] == null){
    	    					resp[i] = "";
    	    				}
    	    			}
    	    			
    	    			$(".modal-body").empty();
    	    			
    	    			$(".modal-body").append("<div class='text-xs-center'><h3 class='text-primary font-weight-bold'>"+resp[0]+"</h3></div>");
    	    			$(".modal-body").append("<hr/>");
    	    			
    	    			if(resp[3] == "T"){
    	    				$(".modal-body").append("<div class='text-xs-justify'><span class='font-weight-bold'>Descripción de la tarea: </span><p>"+resp[1]+"</p></div>");
    	    			}else{
    	    				$(".modal-body").append("<div class='text-xs-justify'><span class='font-weight-bold'>Descripción del examen: </span><p>"+resp[1]+"</p></div>");
    	    			}
    	    			
    	    			$(".modal-body").append("<div><span class='font-weight-bold text-danger'>¡Recuerda!</span> <br/> Tienes hasta el <b>"+$.datepicker.formatDate('dd/mm/yy', new Date(resp[2]))+"</b> para hacer la entrega. </div>")
    	    			
    	    		}
    			});	 
    			
    		});
    		
    		
    		    		

    
    </script>
    
</body>
</html>

<% } %>