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
    <title>Eliminar Elementos - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../assets/css/dataTables.min.css">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-eliminar">

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
                                <i class="fa fa-minus fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Eliminar Elemento </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[2]); %> </span> 
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Eliminar Elemento</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> ¿Qué desea eliminar? </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-briefcase fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="eliminar-profesor"></i> <p> Eliminar <br/> Profesor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="eliminar-alumno"></i> <p> Eliminar <br/> Alumno </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-newspaper-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="eliminar-noticiario"></i> <p> Eliminar <br/> Noticiario </p>
                            </div>
                        </div>
                        <div class="row">                       
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-user-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="eliminar-gestor"></i> <p> Eliminar <br/> Gestor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-book fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="eliminar-curso"></i> <p> Eliminar <br/> Curso </p>
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
    
 <!------- SUBPANELES DE ELIMINACIÓN ------->
    
 <!-- Subpanel profesor -->
 <div id="subpanel-eliminar-profesor">
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
                      <th>Eliminar</th>
                    </tr>
                  </thead>
                  <tbody>
                   
                  </tbody>
                </table> 
            </div>
        </div>
                
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="eliminar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel alumno -->
<div id="subpanel-eliminar-alumno">
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
                      <th>E-Mail</th>
                      <th>Año promoción</th>
                      <th>Curso asignado</th>
                      <th>Eliminar</th>
                    </tr>
                  </thead>
                  <tbody>
                   
                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="eliminar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel noticiario -->
<div id="subpanel-eliminar-noticiario">
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
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>E-mail</th>
                      <th>Eliminar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>Martín</td>
                      <td>marco@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>antonio@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
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
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="eliminar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel curso -->
<div id="subpanel-eliminar-curso">
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
                      <th>ID</th>
                      <th>Año inicio</th>
                      <th>Año fin</th>
                      <th>Curso</th>
                      <th>Alumnos inscritos</th>
                      <th>Eliminar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>2011</td>
                      <td>2012</td>
                      <td>[A1] - Nivel Básico - 1er Curso</td>
                      <td> 12 </td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>2011</td>
                      <td>2012</td>
                      <td>[B2] - Nivel Avanzado - 4º Curso</td>
                      <td> 8 </td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
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
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="eliminar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
<!-- Subpanel noticiario -->
<div id="subpanel-eliminar-gestor">
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
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>E-mail</th>
                      <th>Eliminar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>Martín</td>
                      <td>marco@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-trash text-danger" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>antonio@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-tras text-danger" aria-hidden="true"></i></a></td>
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
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="eliminar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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

<!-- DELETE MODAL -->
<div id="dialog-confirm" title="Eliminar elemento" style="display:none">
	 <p>
	 	¿Está seguro que quiere <b>eliminar</b> este elemento? <br/> Puede confirmar sus datos en el panel Listar.
	 </p>
</div>

<div id="dialog-confirm-ok" title="Eliminación correcta" style="display:none;">
	<p>
		El elemento ha sido eliminado correctamente.
	</p>
</div>

<div id="dialog-confirm-nook" title="Eliminación incorrecta" style="display:none;">
	<p>
		El elemento NO ha sido eliminado correctamente.
	</p>
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
    		$("#eliminar-profesor").on("click", function(){

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
	        					
	        					//Prof delete
	        					$("#prof-table tbody tr:last-child").append("<td class='tabla-info-prof text-xs-center'><a href='' data-id="+resp[i][0]+"><i class='fa fa-trash text-danger' aria-hidden='true'></i></a></td>");
	        				
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
    		    		
    		
    		//Recoge el data-id del profesor para hacer la eliminación del elemento.
        	$(document).delegate(".tabla-info-prof a", "click", function(event){
        		
        		event.preventDefault();
        		
        		$("#dialog-confirm").css("cursor", "default");
	        	var id = $(this).data("id");
	        	var padre = $(this);

	        	$("#dialog-confirm").dialog({
        	        resizable: false,
        	        height: "auto",
        	        width: 400,
        	        modal: true,
        	        buttons: {
        	          Cancelar: function() {
        	            $( this ).dialog( "close" );
        	          },
        	          "Eliminar": function() {
        	        	  $.ajax({
        	    	    		type: "POST",
        	    	    		dataType: "json",
        	    	    		data: {id:id},
        	    	    		url: "/Delprofesor",
        	    	    		success: function(resp){  	
        	    	    			
        	    	    			if(resp > 0){
        	    	    				$("#dialog-confirm-ok").dialog();
        	    	    				padre.parent().parent().remove();
        	    	    			}else{
        	    	    				$("#dialog-confirm-nook").dialog();
        	    	    			}
        	         	    	    			
        	    	    		}        	    	    		        	    	    		
        	        	  });
        	          	  $( this ).dialog( "close" );        	        	  
        	          }
        	        
        	        }
        	    
        		});
	        	
        	});
    		
    		
			//** ALUMNO **//
    		
    		// Realiza una búsqueda completa de profesores e imprime en la tabla los resultados.
    		$("#eliminar-alumno").on("click", function(){

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
	        					
	        					//Cursos asignados
	        					if(resp[i][6].length >= 30){
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][6].substr(0,30)+" ...</td>");
	        					}else{
	        						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][6]+"</td>");
	        					}
	        					
	        					//Alumn delete
	        					$("#alumn-table tbody tr:last-child").append("<td class='tabla-info-alumn text-xs-center'><a href='' data-id="+resp[i][0]+"><i class='fa fa-trash text-danger' aria-hidden='true'></i></a></td>");
	        				
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

    	});
    </script>
    
</body>
</html>

<% } %>