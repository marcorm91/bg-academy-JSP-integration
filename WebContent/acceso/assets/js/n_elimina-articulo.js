 $(document).ready(function(){
    	
    	$(".loader").css("display", "block");
    		    	    	
    	$.ajax({
    		type: "POST",
    		dataType: "json",
    		async: false,
    		url: "../../Ver_noticias",
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
    	
    	
    	//Recoge el data-id de la noticia para hacer la eliminación del elemento.
    	$(document).delegate(".tabla-eli a", "click", function(event){
    		        		
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
     	    	    		url: "../../Elimina_noticia",
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