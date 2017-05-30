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
    <title>Mis Incidencias - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../assets/css/dataTables.min.css">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-alumn-verincidencia">

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
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Curso </span>
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
                            <a class="nav-link ver-incidencias-alumn" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Ver Incidencias </span>
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
                <h1><a href="../principal-alumno.jsp">Panel Principal</a> / Mis Incidencias</h1>
                <hr/>
                
                <div class="row text-xs-left form-publicacion-art">
                    <div class="row">
                        <div class="col-xs-12 text-xs-center">
                             <h2 class="title"> Mis Incidencias </h2>
                        </div>
                    </div>
                    
        <div class="row">
            <div class="col-xs-12">
                <table class="table" id="alumn-table">
                  <thead>
                    <tr>
                      <th>ID incidencia</th>
                      <th>Ver incidencia</th>
                      <th>Fecha y hora de incidencia</th>
                      <th>Fecha y hora de resolución</th>
                      <th>Resolución</th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table> 
            </div>
         </div>
                    
         <div class="row text-xs-center advertencia">
                <div class="col-xs-12">
                    <span class="text-danger">¡OJO!</span><br/> Si su incidencia fue revisada y/o solventada por el gestor verá un icono tal que <i class="fa fa-thumbs-up text-success" aria-hidden="true"></i>.<br/>
                    Si aún no fue revisada y/o solventada por el gestor verá un icono tal que <i class="fa fa-thumbs-down text-danger" aria-hidden="true"></i>.
                </div>      
         </div>
          
                    <div class="form-group row text-xs-center btn-enviar">
                        <div class="col-xs-12">
                            <a href="../principal-alumno.jsp"><button type="button" class="btn btn-primary">Volver</button></a>
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
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script>
	    
    	$(document).ready(function(){
    		
    		$(".loader").css("display", "block");
    		
    		// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario.
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		async: false,
	    		url: "/Verincidenciasalumn",
	    		success: function(resp){  			
	    			for(var i = 0; i < resp.length; i++){
	    				$("table tbody").append("<tr>");
	    					$("table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
	    					$("table tbody tr:last-child").append("<td class='tabla-incidencia-ver'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-incidencia'><i class='fa fa-bolt text-warning' aria-hidden='true'></i></a></td>");
	    					$("table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    					
	    					if(resp[i][2] == "" || resp[i][2] == null){
	    						$("table tbody tr:last-child").append("<td> - </td>");
	    					}else{
	    						$("table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
	    					}
	    					
	    					if(resp[i][3] == "N"){
	    						$("table tbody tr:last-child").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-down text-danger' aria-hidden='true'></i></td>");
	    					}else{
	    						$("table tbody tr:last-child").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-up text-success' aria-hidden='true'></i></td>");
	    					}
	    				$("table tbody").append("</tr>");
	    			}
	    			
		    			$("#alumn-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Tienes un total de _MAX_ de incidencias registradas.",
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
	    	
	    	
	    	// Mostramos la incidencia en un modal.
	    	$(".tabla-incidencia-ver a").on("click", function() {
	    		
	    		$(".loader").css("display", "block");
	    		
	    		$("#modal-incidencia").css("cursor", "default");
	    		var id = $(this).data("id");
	    		$.ajax({
		    		type: "POST",
		    		dataType: "json",
		    		data: {id:id},
		    		url: "/Verincidencia_a",
		    		success: function(resp){  	
		    			$("#modal-incidencia .modal-content .modal-body").empty();
		    			$("#modal-incidencia .modal-content .modal-body").append("<p>"+resp+"</p>");
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