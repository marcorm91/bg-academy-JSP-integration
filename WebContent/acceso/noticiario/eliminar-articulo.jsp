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
    <title>Eliminar artículo - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../assets/css/dataTables.min.css">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-not-eliminar">

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
                            <a class="nav-link" href="./aniadir-articulo.jsp" title="Ir a Añadir Artículo">
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
                                <i class="fa fa-eraser fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Eliminar Artículo </span>
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
                    <span id="quien" title="Ir a Mi Perfil"><a href="./mi-perfil.jsp"> <% out.print(datos_not[2]); %> </a></span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Eliminar artículo</h1>
                <hr/>
                
                <div class="row">
                	<div class="col-xs-12">
                            <div class="text-xs-left">
                                <table class="table" id="art-table">
                                  <thead>
                                    <tr>
                                      <th>ID</th>
                                      <th>Fecha</th>
                                      <th>Titular</th>
                                      <th>Autor</th>
                                      <th>Eliminar</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    
                                  </tbody>
                                </table> 
                            </div>
	                    </div>
	              </div>
        
                  <div class="row">
                      <div class="col-xs-12 text-xs-center btn-atras">
                          <a href="../principal-noticiario.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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

<div class="loader" style='display: none;'></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/script.js"></script>
    
    <script>
    
    $(document).ready(function(){
    	
    		$(".loader").css("display", "block");
        		    	    	
        	$.ajax({
        		type: "POST",
        		dataType: "json",
        		async: false,
        		url: "/Ver_noticias",
        		success: function(resp){  
        			
        			for(var i = 0; i < resp.length; i++){
        				for(var j = 0; j < 7; j++){
        					if(resp[i][j] == null){
            					resp[i][j] = "";
            				}
        				}
        			}
        			
        			for(var i = 0; i < resp.length; i++){
        				        				
        				$("#art-table tbody").append("<tr>");
    	    				
        					//ID
        					$("#art-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
        					
        					//Fecha de publicación
        					$("#art-table tbody tr:last-child").append("<td>"+resp[i][5]+"</td>");
        					
        					//Título
    	    				if(resp[i][1].length > 15){
    	    					$("#art-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,15)+" ...</td>");
    	    				}else{
    	    					$("#art-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
    	    				}
        					
        					//Autor
        					if(resp[i][4].length > 10){
        						$("#art-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0,10)+" ...</td>");
        					}else{
        						$("#art-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
        					}
        					        					
        					//delete Not
        					$("#art-table tbody tr:last-child").append("<td class='tabla-eli text-xs-center' style='padding-left:0;'><a href='' data-id="+resp[i][0]+"><i class='fa fa-trash' aria-hidden='true'></i></a></td>");
        				
        				$("#art-table tbody").append("</tr>");
        			}
        			
        			$("#art-table").DataTable({
    					 "language":{
        		         "lengthMenu":"Mostrar _MENU_ registros por página.",
        		         "zeroRecords": "Sin resultados en su búsqueda.",
        		               "info": "Hay un total de _MAX_ de artículos.",
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
    	
    </script>
    
</body>
</html>

<% } %>