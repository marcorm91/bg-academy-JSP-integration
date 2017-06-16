//**** TAREAS DE ALUMNOS ****//

$("#alumno-tareas").on("click", function(){
	
	$(".loader").css("display", "block");
	
	// Cargamos tras el inicio de la página todas las tareas a realizar por el usuario.
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "../../Ver_tareas",    		
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
	
	// Cargamos tras el inicio de la página todos los exámenes a realizar por el usuario.
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "../../Ver_examenes",    		
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
		url: "../../Actividad_individual",
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
	
	
// Recoge las actividades (tareas y exámenes) y las imprime en un listado.
$("#alumno-calendario").on("click", function(){

	$.ajax({
        url: '../../Recoge_fecactividades',
        type: 'POST',
        dataType: "json",
        async: false,
        success: function(resp){
        	
        	var fechaactual = $.datepicker.formatDate('dd/mm/yy', new Date());
        	
            for(var i = 0; i < resp.length; i++){
            	
            	var fechaactividad = $.datepicker.formatDate('dd/mm/yy', new Date(resp[i][0]));
            	
            	diferencia_dias = difDias(fechaactual, fechaactividad);
            	
            	// Si la diferencia de días entre la actividad y la actual son entre 0 y 15 días.
            	if(diferencia_dias <= 15 && diferencia_dias >= 0){

	            	var tipo;
	            	
	            	if(resp[i][1] == "E"){
	            		tipo = "Examen";
	            	}else{
	            		tipo = "Tarea";
	            	}
	            	
	            	$("#prox-actividades > div").append( "<span class='font-weight-bold col-md-3 text-xs-right'>Fecha de entrega: </span>						 	     		"+
       								  			 		 "<span class='col-md-9 text-xs-left'>"+$.datepicker.formatDate('dd/mm/yy', new Date(resp[i][0]))+"</span><br/>  		"+
       								  			 		 "<span class='font-weight-bold col-md-3 text-xs-right'>Nombre de actividad: </span>							 		"+
       								  			 		 "<span class='col-md-9 text-xs-left'>"+resp[i][2]+"</span><br/>												 		"+
       								  			 		 "<span class='font-weight-bold col-md-3 text-xs-right'>Tipo: </span>							 				 		");
       						
	            			if(tipo == "Examen"){
       							$("#prox-actividades > div").append("<span class='col-md-9 text-xs-left text-danger'>"+tipo+" <i class='fa fa-exclamation text-danger' aria-hidden='true'></i></span><br/><hr/>	");
       						}else{
       							$("#prox-actividades > div").append("<span class='col-md-9 text-xs-left text-success'>"+tipo+" </span><br/><hr/>");
       						}	
            	}
	            	
	       }  
            
        }

    });

});

	
 // Retorna la diferencia de días entre 2 fechas pasadas.
 function difDias (f1,f2){
   	 var aFecha1 = f1.split('/'); 
   	 var aFecha2 = f2.split('/'); 
   	 var fFecha1 = Date.UTC(aFecha1[2],aFecha1[1]-1,aFecha1[0]); 
   	 var fFecha2 = Date.UTC(aFecha2[2],aFecha2[1]-1,aFecha2[0]); 
   	 var dif = fFecha2 - fFecha1;
   	 var dias = Math.floor(dif / (1000 * 60 * 60 * 24)); 
   	 return dias;
 }