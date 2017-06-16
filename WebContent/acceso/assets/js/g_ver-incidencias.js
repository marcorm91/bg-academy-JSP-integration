
$(document).ready(function(){
	
	$(".loader").css("display", "block");
		
// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario (profesor).
$.ajax({
	type: "POST",
	dataType: "json",
	async: false,
	url: "../../Verincidenciasproftotal",
	success: function(resp){  
		for(var i = 0; i < resp.length; i++){
			$("#prof-table tbody").append("<tr>");
				$("#prof-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
				$("#prof-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
				$("#prof-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
				
				if(resp[i][3] == "" || resp[i][3] == null){
					$("#prof-table tbody tr:last-child").append("<td class='resol-time'> <span style='padding-left:80px'> - </span> </td>");
				}else{
					$("#prof-table tbody tr:last-child").append("<td class='resol-time'>"+resp[i][3]+"</td>");
				}
				
				$("#prof-table tbody tr:last-child").append("<td class='tabla-incidencia-ver'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-incidencia'><i class='fa fa-bolt text-warning' aria-hidden='true'></i></a></td>");
				if(resp[i][5] == "N"){
					$("#prof-table tbody tr:last-child").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-down text-danger' data-id="+resp[i][0]+" aria-hidden='true'></i></td>");
				}else{
					$("#prof-table tbody tr:last-child").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-up text-success' data-id="+resp[i][0]+" aria-hidden='true'></i></td>");
				}
			$("#prof-table tbody").append("</tr>");
		}
		
		$("#prof-table").DataTable({
							 "language":{
		    		         "lengthMenu":"Mostrar _MENU_ registros por página.",
		    		         "zeroRecords": "Sin resultados en su búsqueda.",
		    		               "info": "Hay un total de _MAX_ de incidencias de profesores.",
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
		
// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario (alumno).
$.ajax({
	type: "POST",
	dataType: "json",
	async: false,
	url: "../../Verincidenciasalumntotal",
	success: function(resp){  			
		for(var i = 0; i < resp.length; i++){
			$("#alumn-table tbody").append("<tr>");
				$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][0]+"</td>");
				$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][1]+"</td>");
				$("#alumn-table tbody tr:last-child").append("<td>"+resp[i][2]+"</td>");
				
				if(resp[i][3] == "" || resp[i][3] == null){
					$("#alumn-table tbody tr:last-child").append("<td class='resol-time'> <span style='padding-left:80px'> - </span> </td>");
				}else{
					$("#alumn-table tbody tr:last-child").append("<td class='resol-time'>"+resp[i][3]+"</td>");
				}
				
				$("#alumn-table tbody tr:last-child").append("<td class='tabla-incidencia-ver'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-incidencia'><i class='fa fa-bolt text-warning' aria-hidden='true'></i></a></td>");
				if(resp[i][5] == "N"){
					$("#alumn-table tbody tr:last-child").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-down text-danger' data-id="+resp[i][0]+" aria-hidden='true'></i></td>");
				}else{
					$("#alumn-table tbody tr:last-child").append("<td class='tabla-incidencia-resolucion'><i class='fa fa-thumbs-up text-success' data-id="+resp[i][0]+" aria-hidden='true'></i></td>");
				}
			$("#alumn-table tbody").append("</tr>");
		}
		
			$("#alumn-table").DataTable({
				 "language":{
	         "lengthMenu":"Mostrar _MENU_ registros por página.",
	         "zeroRecords": "Sin resultados en su búsqueda.",
	               "info": "Hay un total de _MAX_ incidencias de alumnos.",
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
		url: "../../Verincidencias_individual",
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

// Mostramos la incidencia en un modal.
$(".tabla-incidencia-resolucion i").on("click", function() {
	    		
	var padre = $(this);
	var id = $(this).data("id");

	if($(this).hasClass("fa-thumbs-down")){
	
	    $("#dialog-confirm").dialog({
	        resizable: false,
	        height: "auto",
	        width: 400,
	        modal: true,
	        buttons: {
	          "Resolver incidencia": function() {
	          $(this).dialog("close");
	           
    			$.ajax({
		    		type: "POST",
		    		dataType: "json",
		    		data: {id:id},
		    		url: "../../Resolucion_s",
		    		success: function(resp){ 
		    			
			    			numincidencias = $(".bola #num-incidencias").text();
			    			
			    			if(numincidencias == "0"){
			    				$(".bola").css("display", "none");
			    			}else{
			    				$(".bola #num-incidencias").text(parseInt(numincidencias) - 1);
			    			}
			    			
		    				$(".loader").css("display", "block");
		    				padre.removeClass("fa-thumbs-down text-danger");
				    		padre.addClass("fa-thumbs-up text-success");
				    		padre.parent().siblings(".resol-time").text(resp);
		    		},
		    		complete: function(){
		    			$(".loader").fadeOut(2000);
		    		}
	    		});	 
    			
	          },
	          Cancel: function() {
	            $( this ).dialog("close");
	          }
	        }
	      });
	    
	    

	}else{
		
		$("#dialog-cancel").dialog({
	        resizable: false,
	        height: "auto",
	        width: 400,
	        modal: true,
	        buttons: {
	          "Cancelar incidencia": function() {
	            $(this).dialog( "close" );
	            
	            $.ajax({
		    		type: "POST",
		    		dataType: "json",
		    		data: {id:id},
		    		url: "../../Resolucion_n",
		    		success: function(resp){ 
		    			
		    			numincidencias = $(".bola #num-incidencias").text();
		    			
		    			if(numincidencias == "0"){
		    				$(".bola").css("display", "none");
		    			}else{
		    				$(".bola #num-incidencias").text(parseInt(numincidencias) + 1);
		    			}
		    			
		    			$(".loader").css("display", "block");
		    			 padre.removeClass("fa-thumbs-up text-success");
			    		 padre.addClass("fa-thumbs-down text-danger");
			    		 padre.parent().siblings(".resol-time").html("<span style='padding-left:80px'> "+resp+" </span>");
		    		},
		    		complete: function(){
		    			$(".loader").fadeOut(2000);
		    		}
	    		});	 
	            
	          },
	          Cancel: function() {
	            $( this ).dialog("close");
		          }
		        }
		      });
		}
		
	});
	
});