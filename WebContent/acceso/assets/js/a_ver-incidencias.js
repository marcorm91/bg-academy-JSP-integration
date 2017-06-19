$(document).ready(function(){
	
	$(".loader").css("display", "block");
	
	// Cargamos tras el inicio de la página todas las incidencias realizadas por el usuario.
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "../../Verincidenciasalumn",    		
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
			url: "../../Verincidencia_a",
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
