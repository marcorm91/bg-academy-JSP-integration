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
	
	
	//Recoge el data-id del alumno para hacer la eliminación del elemento.
	$(document).delegate(".tabla-info-alumn a", "click", function(event){
		
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
	    	    		url: "/Delalumno",
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
	
	
	//** NOTICIARIO **//
	
	// Realiza una búsqueda completa de noticiarios e imprime en la tabla los resultados.
	$("#eliminar-noticiario").on("click", function(){

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
    					        					
    					//not delete
    					$("#not-table tbody tr:last-child").append("<td class='tabla-info-not text-xs-center'><a href='' data-id="+resp[i][0]+"><i class='fa fa-trash text-danger' aria-hidden='true'></i></a></td>");
				
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
	
	
	//Recoge el data-id del alumno para hacer la eliminación del elemento.
	$(document).delegate(".tabla-info-not a", "click", function(event){
		
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
	    	    		url: "/Delnoticiario",
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
	
	
	//** GESTOR **//
	
	// Realiza una búsqueda completa de gestores e imprime en la tabla los resultados.
	$("#eliminar-gestor").on("click", function(){

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
    					        					
    					//gest delete
    					$("#gest-table tbody tr:last-child").append("<td class='tabla-info-gest text-xs-center'><a href='' data-id="+resp[i][0]+"><i class='fa fa-trash text-danger' aria-hidden='true'></i></a></td>");
				
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
	
	
	//Recoge el data-id del alumno para hacer la eliminación del elemento.
	$(document).delegate(".tabla-info-gest a", "click", function(event){
		
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
	    	    		url: "/Delgestor",
	    	    		success: function(resp){  
	    	    		
	    	    			// Condición que comprueba si está eliminando su propia cuenta.
	    	    			// Para hacerlo debe hacerlo un gestor distinto al suyo.
	    	    			if(resp == 0){
	    	    				$("#dialog-gestor").dialog();
	    	    			}else{
	    	    				if(resp > 0){
    	    	    				$("#dialog-confirm-ok").dialog();
    	    	    				padre.parent().parent().remove();
    	    	    			}else{
    	    	    				$("#dialog-confirm-nook").dialog();
    	    	    			}
	    	    			}

	    	    		}        	    	    		        	    	    		
	        	  });
	          	  $( this ).dialog( "close" );        	        	  
	          }
	        
	        }
	    
		});
    	
	});
	
	
	//** CURSO **//
	
	// Realiza una búsqueda completa de cursos e imprime en la tabla los resultados.
	$("#eliminar-curso").on("click", function(){

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
    					
    					//curso delete
    					$("#curso-table tbody tr:last-child").append("<td class='tabla-info-curso text-xs-center'><a href='' data-id="+resp[i][0]+"><i class='fa fa-trash text-danger' aria-hidden='true' style='font-size:20px;'></i></a></td>");
				
					       					        				
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
	
	
	//Recoge el data-id del curso para hacer la eliminación del elemento.
	$(document).delegate(".tabla-info-curso a", "click", function(event){
		
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
	    	    		url: "/Delcurso",
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
    	
});