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
    <title>Ver Incidencias - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-incidencias">

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
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias de Profesores y Alumnos">
                                <i class="fa fa-commenting fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Ver Incidencias de Profesores y Alumnos </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[2]); %> </span>
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
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Buscar Incidencia</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> ¿Qué tipo de incidencia desea buscar? </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-briefcase fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="incidencias-profesor"></i> <p> Incidencias de <br/> Profesor </p>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="incidencias-alumno"></i> <p> Incidencias de <br/> Alumno </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <a href="../principal-gestor.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
    </div>
    
 <!------- SUBPANELES DE INCIDENCIAS ------->
    
 <!-- Subpanel incidencias profesor -->
 <div id="subpanel-incidencia-profesor">
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
                <table class="table" id="prof-table">
                  <thead>
                    <tr>
                      <th>ID incidencia</th>
                      <th>ID profesor</th>
                      <th>Fecha y hora de incidencia</th>
                      <th>Fecha y hora de resolución</th>
                      <th>Ver incidencia</th>
                      <th>Resolución</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center paginacion-busq">
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
                 <a href="ver-incidencias.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel incidencias alumno -->
<div id="subpanel-incidencia-alumno">
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
                <table class="table" id="alumn-table">
                  <thead>
                    <tr>
                      <th>ID incidencia</th>
                      <th>ID alumno</th>
                      <th>Fecha y hora de incidencia</th>
                      <th>Fecha y hora de resolución</th>
                      <th>Ver incidencia</th>
                      <th>Resolución</th>
                    </tr>
                  </thead>
                  <tbody>
                    
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
                 <a href="ver-incidencias.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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

<!-- Modal -->
<div class="modal fade" id="modal-incidencia" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Incidencia</h4>
        </div>
        <div class="modal-body"></div>
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
    <script src="../assets/js/script.js"></script>
    <script>
    
    $(document).ready(function(){
    	
    	$(".loader").css("display", "block");
    			
		// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario (profesor).
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "/Verincidenciasproftotal",
    		success: function(resp){  			
    			for(var i = 0; i < resp.length; i++){
    				$("#prof-table tbody").append("<tr>");
    					$("#prof-table tbody").append("<td>"+resp[i][0]+"</td>");
    					$("#prof-table tbody").append("<td>"+resp[i][1]+"</td>");
    					$("#prof-table tbody").append("<td>"+resp[i][2]+"</td>");
    					
    					if(resp[i][3] == "" || resp[i][3] == null){
    						$("#prof-table tbody").append("<td> <span style='padding-left:80px'> - </span> </td>");
    					}else{
    						$("#prof-table tbody").append("<td>"+resp[i][3]+"</td>");
    					}
    					
    					$("#prof-table tbody").append("<td class='tabla-incidencia-ver'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-incidencia'><i class='fa fa-bolt text-warning' aria-hidden='true'></i></a></td>");
    					if(resp[i][5] == "N"){
    						$("#prof-table tbody").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-down text-danger' aria-hidden='true'></i></td>");
    					}else{
    						$("#prof-table tbody").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-up text-success' aria-hidden='true'></i></td>");
    					}
    				$("#prof-table tbody").append("</tr>");
    			}
    		},
    		complete: function(){
    			$(".loader").fadeOut(2000);
    		}
    		
    	});
				
    	// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario (alumno).
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "/Verincidenciasalumntotal",
    		success: function(resp){  			
    			for(var i = 0; i < resp.length; i++){
    				$("#alumn-table tbody").append("<tr>");
    					$("#alumn-table tbody").append("<td>"+resp[i][0]+"</td>");
    					$("#alumn-table tbody").append("<td>"+resp[i][1]+"</td>");
    					$("#alumn-table tbody").append("<td>"+resp[i][2]+"</td>");
    					
    					if(resp[i][3] == "" || resp[i][3] == null){
    						$("#alumn-table tbody").append("<td> <span style='padding-left:80px'> - </span> </td>");
    					}else{
    						$("#alumn-table tbody").append("<td>"+resp[i][3]+"</td>");
    					}
    					
    					$("#alumn-table tbody").append("<td class='tabla-incidencia-ver'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-incidencia'><i class='fa fa-bolt text-warning' aria-hidden='true'></i></a></td>");
    					if(resp[i][5] == "N"){
    						$("#alumn-table tbody").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-down text-danger' aria-hidden='true'></i></td>");
    					}else{
    						$("#alumn-table tbody").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-up text-success' aria-hidden='true'></i></td>");
    					}
    				$("#alumn-table tbody").append("</tr>");
    			}
    		},
    		complete: function(){
    			$(".loader").fadeOut(2000);
    		}
    	});
		
    	// Mostramos la incidencia en un modal.
    	$(".tabla-incidencia-ver a").on("click", function() {
    		
    		$(".loader").css("display", "block");
    		    		
    		$("#modal-incidencia").css("cursor", "default");
    		var id = $(this).data("id");
    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {id:id},
	    		url: "/Verincidencias_individual",
	    		success: function(resp){  	
	    			$("#modal-incidencia .modal-content .modal-body").empty();
	    			if(resp == null || resp == ""){
	    				$("#modal-incidencia .modal-content .modal-body").append("<p> - </p>");
	    			}else{
	    				$("#modal-incidencia .modal-content .modal-body").append("<p>"+resp+"</p>");
	    			}
	    		},
	    		complete: function(){
	    			$(".loader").fadeOut(1000);
	    		}
    		});	 
    		
    	});
		
    });
    
    </script>
    
</body>
</html>

<% } %>