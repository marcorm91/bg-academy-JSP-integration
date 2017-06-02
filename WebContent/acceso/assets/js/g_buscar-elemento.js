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
    				$("#fnac-modal-prof").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[7])));
    				$("#nif-modal-prof").text(resp[8]);
    				$("#nacimiento-modal-prof").text(resp[9]);
    				$("#nacionalidad-modal-prof").text(resp[19]);
    				$("#calle-modal-prof").text(resp[10]);
    				$("#cp-modal-prof").text(resp[11]);
    				$("#provincia-modal-prof").text(resp[12]);
    				$("#poblacion-modal-prof").text(resp[13]);
    				$("#fecalta-modal-prof").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[14])));
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
    				$("#fecalta-modal-not").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[7])));
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
    				$("#fecalta-modal-gest").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[7])));
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