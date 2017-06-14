$(document).ready(function(){
	
	//**** LISTAR ALUMNOS ****//
	
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
		
		
   	//**** REGISTRAR TAREA ****//
   	
    /**
     * Recoge los cursos en función del año de promoción.
     */
    $("#anio-curso-prof-tarea").change("click", function(e){
        	
    	$(".loader").css("display", "block");
    	
    	var anio = $(this).val();
    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recoge_cursos",
    		data: {anio: anio},
    		async: true,
    		success: function(resp){  
				$("#curso-tarea").empty();
    			for(var i = 0; i < resp.length; i++){	
    				if(resp[i] != null || resp[i] != ""){
    					$("#curso-tarea").append("<option> " + resp[i] + "</option>");
    				}
     			}    			
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
    	});
    	
    });

   	
    /**
     * Carga de años iniciales y finales de la BD curso sobre los campos de profesor.
     */
    $("#profesor-tareas").on("click", function(e){
    	
     	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recoge_anio",
    		async: false,
    		success: function(resp){  
  				if(resp != null){
  					$("#anio-curso-prof-tarea").append("<option> " + resp + "</option>");
  				}			
    		}
    	});
     	     	    
    });
    
    
    /**
     * Registra la tarea en la Base de Datos.
     */
    $("#reg-tarea").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var anioprom = $("#anio-curso-prof-tarea").val();
    	var cursoasign = $("#curso-tarea").val();
    	var feclimite = $("#fecha-limite-subida-tarea").val();
    	var tittarea = $("#tit-tarea").val();
    	var detalletarea = $("#detalle-tarea").val();
    	
		if(anioprom == "- Seleccione promoción -" ||  cursoasign == "" || feclimite == "" || tittarea == "" || detalletarea == ""){
			$("#modal-error-tarea").dialog();
		}else{
			
			$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		url: "/Reg_tarea",
	    		data: {anioprom: anioprom, cursoasign: cursoasign, feclimite:feclimite, tittarea: tittarea, detalletarea: detalletarea},
	    		success: function(resp){  
					
	    			if(resp == "0"){
    					$("#modal-error-tarea").dialog();
    				}else{
    					$("#fecha-limite-subida-tarea").val("");
    					$("#tit-tarea").val("");
    		    		$("#detalle-tarea").val("");
    					$("#modal-success-tarea").dialog();
    				}
	    			
	    		},
	    		complete: function(){
	    			$(".loader").fadeOut(1000);
	    		}
	    	});
			
		}
    		    	
    });
    
    
    //**** REGISTRAR EXAMEN ****//
    
    /**
     * Recoge los cursos en función del año de promoción.
     */
    $("#anio-curso-prof-examen").change("click", function(e){
    		        	
    	$(".loader").css("display", "block");
    	
    	var anio = $(this).val();
    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recoge_cursos",
    		data: {anio: anio},
    		async: true,
    		success: function(resp){  
				$("#curso-examen").empty();
    			for(var i = 0; i < resp.length; i++){	
    				if(resp[i] != null || resp[i] != ""){
    					$("#curso-examen").append("<option> " + resp[i] + "</option>");
    				}
     			}    			
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
    	});
    	
    });
    
    
    /**
     * Carga de años iniciales y finales de la BD curso sobre los campos de profesor.
     */
    $("#profesor-examenes").on("click", function(e){
    	
     	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recoge_anio",
    		async: false,
    		success: function(resp){  
  				if(resp != null){
  					$("#anio-curso-prof-examen").append("<option> " + resp + "</option>");
  				}			
    		}
    	});
     	     	    
    });
    
    
    /**
     * Registra el examen en la Base de Datos.
     */
    $("#reg-examen").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var anioprom = $("#anio-curso-prof-examen").val();
    	var cursoasign = $("#curso-examen").val();
    	var feclimite = $("#fecha-limite-subida-examen").val();
    	var titexamen = $("#tit-examen").val();
    	var detalleexamen = $("#detalleexamen").val();
    	
		if(anioprom == "- Seleccione promoción -" ||  cursoasign == "" || feclimite == "" || titexamen == "" || detalleexamen == ""){
			$("#modal-error-examen").dialog();
		}else{
			
			$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		url: "/Reg_examen",
	    		data: {anioprom: anioprom, cursoasign: cursoasign, feclimite:feclimite, titexamen: titexamen, detalleexamen: detalleexamen},
	    		success: function(resp){  
					
	    			if(resp == "0"){
    					$("#modal-error-examen").dialog();
    				}else{
    					$("#fecha-limite-subida-examen").val("");
    					$("#tit-examen").val("");
    		    		$("#detalleexamen").val("");
    					$("#modal-success-examen").dialog();
    				}
	    			
	    		},
	    		complete: function(){
	    			$(".loader").fadeOut(1000);
	    		}
	    	});
			
		}
    		    	
    });
   
});