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
					        					
					//Mod Articulo
					$("#art-table tbody tr:last-child").append("<td class='tabla-mod text-xs-center' style='padding-left:0;'><a href='' data-id="+resp[i][0]+" data-toggle='modal' data-target='#modal-info-art'><i class='fa fa-pencil' aria-hidden='true'></i></a></td>");
				
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
	
	
	//Recoge el data-id del profesor para hacer una consulta más exhaustiva en un modal.
	$(document).delegate(".tabla-mod a", "click", function(event){
		
		$("#modal-info").css("cursor", "default");
		var id = $(this).data("id");
		
		$.ajax({
    		type: "POST",
    		dataType: "json",
    		data: {id:id},
    		url: "/Noticia_individual",
    		success: function(resp){  	
    			
    			for(var i = 0; i < resp.length; i++){
    				if(resp[i] == null){
    					resp[i] = "";
    				}
    			}
    			
   				$("#id-modal-art").text(resp[0]);
   				$("#fpubl-modal-art").text($.datepicker.formatDate('dd/mm/yy', new Date(resp[5])));
   				$("#autor-modal-art").text(resp[4]);
   				$("#titular-modal-art").val(resp[1]);
   				$("#contenido-modal-art").val(resp[3]);
   				
   				if(resp[7] == "" || resp[7] == null){
   					$("#edicion-modal-art").text("-");
   				}else{
   					$("#edicion-modal-art").text(resp[7]);
   				}
   				
   				if(resp[6] == "" || resp[6] == null){
   					$("#edicionautor-modal-art").text("-");
   				}else{
   					$("#edicionautor-modal-art").text(resp[6]);
   				}
   				
   				$("#img-modal-art").attr("src", "../../recursos/imgnoticias/"+resp[2]+"");
    				
    		},
    		complete: function(){
    			$(".loader").fadeOut(1000);
    		}
		});	 
		
	});
	
	
	// Acción modificar noticia.
	$("#btn-mod-art").on("click", function(){
		
		var id = $("#id-modal-art").text();
		var fpubl = $("#fpubl-modal-art").text();
		var autor = $("#autor-modal-art").text();
		var titular = $("#titular-modal-art").val();
		var contenido = $("#contenido-modal-art").val();
		
								
		if(titular == "" || contenido == ""){
			$("#modal-error-art").dialog();
    	}else{
    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {id:id, titular:titular, contenido:contenido},
	    		url: "/Modifica_noticia",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#modal-error-art").dialog();
	    			}else{	
	    				$("#modal-info-art").modal("toggle");
	    				$("#modal-success-art").dialog();
	    			}
	    		}
	    	});
    	
    	}
    	
	});
			
});