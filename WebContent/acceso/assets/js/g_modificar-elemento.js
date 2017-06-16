 $(document).ready(function(){
    	
    //** PROFESOR **//
	
	$("#fnac-modal-prof").datepicker({maxDate:0, changeYear: true, yearRange:'-90:+0'});
	
	// Realiza una búsqueda completa de profesores e imprime en la tabla los resultados.
	$("#modificar-profesor").on("click", function(){

		$(".loader").css("display", "block");
    		    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "../../Proflist",
    		success: function(resp){  
    			
    			for(var i = 0; i < resp.length; i++){
    				for(var j = 0; j < 7; j++){
    					if(resp[i][j] == null){
        					resp[i][j] = "";
        				}
    				}
    			}
    			
    			for(var i = 0; i < resp.length; i++){
    				
    				var asignimp_format = resp[i][6].substr(1, resp[i][6].length - 1);
    				
    				$("#prof-table tbody").append("<tr>");
	    				
    					//ID
    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
    					
	    				//Nombre
	    				if(resp[i][1].length > 8){
	    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][1].substr(0,8)+" ...</td>");
	    				}else{
	    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
	    				}
    					
    					//Apellido 1
    					if(resp[i][2].length > 8){
    						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][2].substr(0,8)+" ...</td>");
    					}else{
    						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
    					}
    					
    					//DNI
    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
    					
    					//Email
    					if(resp[i][4].length > 8){
    						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0,8)+" ...</td>");
    					}else{
    						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
    					}
    					
    					//Año promoción
    					$("#prof-table tbody tr:last-child").append("<td>"+resp[i][5]+"</td>");
    					
    					//Cursos asignados
    					if(resp[i][6].length > 30){
    						$("#prof-table tbody tr:last-child").append("<td>"+asignimp_format.substr(0,30)+" ...</td>");
    					}else{
    						$("#prof-table tbody tr:last-child").append("<td>"+resp[i][6]+"</td>");
    					}
    					
    					//+ info
    					$("#prof-table tbody tr:last-child").append("<td class='tabla-info-prof text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-prof'><i class='fa fa-pencil' aria-hidden='true'></i></a></td>");
    				
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
    		url: "../../Prof_individual",
    		success: function(resp){  	
    			
    			for(var i = 0; i < resp.length; i++){
    				if(resp[i] == null){
    					resp[i] = "";
    				}
    			}
    			
    				$("#id-modal-prof").text(resp[0]);
    				$("#nombre-modal-prof").val(resp[2]);
    				$("#apellido1-modal-prof").val(resp[3]);
    				$("#apellido2-modal-prof").val(resp[4]);
    				$("#usuario-modal-prof").val(resp[5]);
    				$("#fnac-modal-prof").val($.datepicker.formatDate('dd/mm/yy', new Date(resp[7])));
    				$("#nif-modal-prof").val(resp[8]);
    				$("#nacimiento-modal-prof").val(resp[9]);
    				$("#nacionalidad-modal-prof").val(resp[19]);
    				$("#calle-modal-prof").val(resp[10]);
    				$("#cp-modal-prof").val(resp[11]);
    				$("#provincia-modal-prof").val(resp[12]);
    				$("#poblacion-modal-prof").val(resp[13]);
    				$("#fecalta-modal-prof").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[14])));
    				$("#email-modal-prof").val(resp[15]);
    				$("#tlf-modal-prof").val(resp[16]);
    				$("#anioprom-modal-prof").text(resp[17]);
    				$("#asignimp-modal-prof").text(resp[18].substr(1, resp[18].length - 2));
    				
    				       				    	    			
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
		});	 
		
	});
	
	// Acción modificar profesor.
	$("#btn-mod-prof").on("click", function(){
			
		var id = $("#id-modal-prof").text();
		var nombre = $("#nombre-modal-prof").val();
		var apellido1 = $("#apellido1-modal-prof").val();
		var apellido2 = $("#apellido2-modal-prof").val();
		var usuario = $("#usuario-modal-prof").val();
		var fnac = $("#fnac-modal-prof").val();
		var nif = $("#nif-modal-prof").val();
		var nacimiento = $("#nacimiento-modal-prof").val();
		var nacionalidad = $("#nacionalidad-modal-prof").val();
		var calle = $("#calle-modal-prof").val();
		var cp = $("#cp-modal-prof").val();
		var tlf = $("#tlf-modal-prof").val();
		var provincia = $("#provincia-modal-prof").val();
		var poblacion = $("#poblacion-modal-prof").val();
		var email = $("#email-modal-prof").val();
								
		if(fnac == "" || nombre == "" || apellido1 == "" || apellido2 == "" || usuario == "" || nif == "" || nacimiento == "" || nacionalidad == "" || calle == "" || cp == "" || provincia == "" || poblacion == "" || email == ""){
			$("#modal-error-perfil").dialog();
    	}else{
    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {id:id, nombre:nombre, apellido1:apellido1, apellido2:apellido2, fnac:fnac, usuario:usuario, nif:nif, nacimiento:nacimiento, nacionalidad:nacionalidad, calle:calle, cp:cp, provincia:provincia, poblacion:poblacion, tlf:tlf, email:email},
	    		url: "../../Modificaperfilprof_gest",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#modal-error-perfil").dialog();
	    			}else{	
	    				$("#modal-info-prof").modal("toggle");
	    				$("#modal-success-perfil").dialog();
	    			}
	    		}
	    	});
    	
    	}
    	
	});
	
	
	//** ALUMNO **//
	
	$("#fnac-modal-alumn").datepicker({maxDate:0, changeYear: true, yearRange:'-90:+0'});
	
	// Realiza una búsqueda completa de alumnos e imprime en la tabla los resultados.
	$("#modificar-alumno").on("click", function(){

		$(".loader").css("display", "block");
    		    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "../../Alumnlist",
    		success: function(resp){
    			
    			for(var i = 0; i < resp.length; i++){
    				for(var j = 0; j < 7; j++){
    					if(resp[i][j] == null){
        					resp[i][j] = "";
        				}
    				}
    			}
    			
    			for(var i = 0; i < resp.length; i++){
    				    	    				
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
    					
    					//DNI
    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][3]+"</td>");
    					
    					//Email
    					if(resp[i][4].length > 8){
    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][4].substr(0,8)+" ...</td>");
    					}else{
    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][4]+"</td>");
    					}
    					
    					//Año promoción
    					$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][5]+"</td>");
    					
    					//Curso asignado
    					if(resp[i][6].length > 30){
    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][6].substr(0,30)+" ...</td>");
    					}else{
    						$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][6]+"</td>");
    					}
    					
    					//+ info
    					$("#alumn-table tbody tr:last-child").append("<td class='tabla-info-alumn text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-alumn'><i class='fa fa-pencil' aria-hidden='true'></i></a></td>");
    				
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
    		url: "../../Alumn_individual",
    		success: function(resp){  	
    			
    			for(var i = 0; i < resp.length; i++){
    				if(resp[i] == null){
    					resp[i] = "";
    				}
    			}
    			
   				$("#id-modal-alumn").text(resp[0]);
   				$("#nombre-modal-alumn").val(resp[2]);
   				$("#apellido1-modal-alumn").val(resp[3]);
   				$("#apellido2-modal-alumn").val(resp[4]);
   				$("#usuario-modal-alumn").val(resp[5]);
   				$("#fnac-modal-alumn").val($.datepicker.formatDate('dd/mm/yy', new Date(resp[8])));
   				$("#nif-modal-alumn").val(resp[7]);
   				$("#nacimiento-modal-alumn").val(resp[9]);
   				$("#nacionalidad-modal-alumn").val(resp[10]);
   				$("#calle-modal-alumn").val(resp[11]);
   				$("#cp-modal-alumn").val(resp[12]);
   				$("#provincia-modal-alumn").val(resp[14]);
   				$("#poblacion-modal-alumn").val(resp[13]);
   				$("#fecalta-modal-alumn").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[15])));
   				$("#email-modal-alumn").val(resp[20]);
   				$("#anioprom-modal-alumn").text(resp[16]);
   				$("#asignimp-modal-alumn").text(resp[17]);
   				$("#tlf-modal-alumn").val(resp[19]);
    				    	    			
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
		});	 
		
	});
	
	// Acción modificar alumno.
	$("#btn-mod-alumn").on("click", function(){
			
		var id = $("#id-modal-alumn").text();
		var nombre = $("#nombre-modal-alumn").val();
		var apellido1 = $("#apellido1-modal-alumn").val();
		var apellido2 = $("#apellido2-modal-alumn").val();
		var usuario = $("#usuario-modal-alumn").val();
		var fnac = $("#fnac-modal-alumn").val();
		var nif = $("#nif-modal-alumn").val();
		var nacimiento = $("#nacimiento-modal-alumn").val();
		var nacionalidad = $("#nacionalidad-modal-alumn").val();
		var calle = $("#calle-modal-alumn").val();
		var cp = $("#cp-modal-alumn").val();
		var tlf = $("#tlf-modal-alumn").val();
		var provincia = $("#provincia-modal-alumn").val();
		var poblacion = $("#poblacion-modal-alumn").val();
		var email = $("#email-modal-alumn").val();
								
		if(fnac == "" || nombre == "" || apellido1 == "" || apellido2 == "" || usuario == "" || nif == "" || nacimiento == "" || nacionalidad == "" || calle == "" || cp == "" || provincia == "" || poblacion == "" || email == ""){
			$("#modal-error-perfil").dialog();
    	}else{
    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {id:id, nombre:nombre, apellido1:apellido1, apellido2:apellido2, fnac:fnac, usuario:usuario, nif:nif, nacimiento:nacimiento, nacionalidad:nacionalidad, calle:calle, cp:cp, provincia:provincia, poblacion:poblacion, tlf:tlf, email:email},
	    		url: "../../Modificaperfilalumn_gest",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#modal-error-perfil").dialog();
	    			}else{	
	    				$("#modal-info-alumn").modal("toggle");
	    				$("#modal-success-perfil").dialog();
	    			}
	    		}
	    	});
    	
    	}
    	
	});
	
	
	//** NOTICIARIO **//
	
	// Realiza una búsqueda completa de noticiarios e imprime en la tabla los resultados.
	$("#modificar-noticiario").on("click", function(){

		$(".loader").css("display", "block");
    		    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "../../Notlist",
    		success: function(resp){  
    			
    			for(var i = 0; i < resp.length; i++){
    				for(var j = 0; j < 7; j++){
    					if(resp[i][j] == null){
        					resp[i][j] = "";
        				}
    				}
    			}
    			
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
    					$("#not-table tbody tr:last-child").append("<td class='tabla-info-not text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-not'><i class='fa fa-pencil' aria-hidden='true'></i></a></td>");
    				
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
    		url: "../../Not_individual",
    		success: function(resp){  	
    			
    			for(var i = 0; i < resp.length; i++){
    				if(resp[i] == null){
    					resp[i] = "";
    				}
    			}
    			
    				$("#id-modal-not").text(resp[0]);
    				$("#nombre-modal-not").val(resp[2]);
    				$("#apellido1-modal-not").val(resp[3]);
    				$("#apellido2-modal-not").val(resp[4]);
    				$("#usuario-modal-not").val(resp[5]);
    				$("#fecalta-modal-not").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[7])));
    				$("#email-modal-not").val(resp[8]);
    				$("#tlf-modal-not").val(resp[9]);
    				$("#nif-modal-not").val(resp[10]);
    				    	    			
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
		});	 
		
	});
	
	// Acción modificar noticiario.
	$("#btn-mod-not").on("click", function(){
			
		var id = $("#id-modal-not").text();
		var nombre = $("#nombre-modal-not").val();
		var apellido1 = $("#apellido1-modal-not").val();
		var apellido2 = $("#apellido2-modal-not").val();
		var usuario = $("#usuario-modal-not").val();
		var nif = $("#nif-modal-not").val();
		var tlf = $("#tlf-modal-not").val();
		var email = $("#email-modal-not").val();
								
		if(nombre == "" || apellido1 == "" || apellido2 == "" || usuario == "" || nif == "" || tlf == "" || email == ""){
			$("#modal-error-perfil").dialog();
    	}else{
    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {id:id, nombre:nombre, apellido1:apellido1, apellido2:apellido2, usuario:usuario, nif:nif, tlf:tlf, email:email},
	    		url: "../../Modificaperfilnot_gest",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#modal-error-perfil").dialog();
	    			}else{	
	    				$("#modal-info-not").modal("toggle");
	    				$("#modal-success-perfil").dialog();
	    			}
	    		}
	    	});
    	
    	}
    	
	});
	
	
	//** GESTOR **//
	
	// Realiza una búsqueda completa de gestores e imprime en la tabla los resultados.
	$("#modificar-gestor").on("click", function(){

		$(".loader").css("display", "block");
    		    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "../../Gestlist",
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
    					$("#gest-table tbody tr:last-child").append("<td class='tabla-info-gest text-xs-center'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-gest'><i class='fa fa-pencil' aria-hidden='true'></i></a></td>");
    				
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
    		url: "../../Gest_individual",
    		success: function(resp){  	
    			
    			for(var i = 0; i < resp.length; i++){
    				if(resp[i] == null){
    					resp[i] = "";
    				}
    			}
    			
    				$("#id-modal-gest").text(resp[0]);
    				$("#fecalta-modal-gest").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[7])));
    				$("#nombre-modal-gest").val(resp[2]);
    				$("#apellido1-modal-gest").val(resp[3]);
    				$("#apellido2-modal-gest").val(resp[4]);
    				$("#usuario-modal-gest").val(resp[5]);
    				$("#fecalta-modal-gest").val(resp[7]);
    				$("#email-modal-gest").val(resp[8]);
    				$("#tlf-modal-gest").val(resp[10]);
    				$("#nif-modal-gest").val(resp[9]);
    				    	    			
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
		});	 
		
	});
	
	// Acción modificar gestor.
	$("#btn-mod-gest").on("click", function(){
			
		var id = $("#id-modal-gest").text();
		var nombre = $("#nombre-modal-gest").val();
		var apellido1 = $("#apellido1-modal-gest").val();
		var apellido2 = $("#apellido2-modal-gest").val();
		var usuario = $("#usuario-modal-gest").val();
		var nif = $("#nif-modal-gest").val();
		var tlf = $("#tlf-modal-gest").val();
		var email = $("#email-modal-gest").val();
								
		if(nombre == "" || apellido1 == "" || apellido2 == "" || usuario == "" || nif == "" || tlf == "" || email == ""){
			$("#modal-error-perfil").dialog();
    	}else{
    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {id:id, nombre:nombre, apellido1:apellido1, apellido2:apellido2, usuario:usuario, nif:nif, tlf:tlf, email:email},
	    		url: "../../Modificaperfilgest_gest",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#modal-error-perfil").dialog();
	    			}else{	
	    				$("#modal-info-gest").modal("toggle");
	    				$("#modal-success-perfil").dialog();
	    			}
	    		}
	    	});
    	
    	}
    	
	});
	
});