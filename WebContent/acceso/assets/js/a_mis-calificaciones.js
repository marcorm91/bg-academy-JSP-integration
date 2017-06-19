$(document).ready(function(){

	$(".loader").css("display", "block");
	
	// Cargamos tras el inicio de la página todas las tareas que se enviaron al usuario.
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
			
		   for(var i = 0; i < resp.length; i++){

			$("#tareas").append("<div class='col-xs-12'>																					"+
					    "	<h4 class='titulo-alumno-calif'>"+resp[i][1]+"</h4>							"+
					    "	<h5 class='descripcion-alumno-calif text-justify'>"+resp[i][2]+"</h5>					"+
					    "	<span class='fecha-alumno-calif'>"+$.datepicker.formatDate('dd/mm/yy', new Date(resp[i][3]))+"</span>  	"+
					    "	<span class='nota-alumno-calif'>Nota: <span> - </span></span><hr/>					"+
					    "</div>");
		   }

	     }
		
	});
	
	
	// Cargamos tras el inicio de la página todas los exámenes que se enviaron al usuario.
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
			
		   var cont = resp.length;	
			
		   for(var i = 0; i < resp.length; i++){

			$("#examenes").append(  "<div class='col-xs-12'>											"+
						"	<h4 class='titulo-alumno-calif'>"+resp[i][1]+"</h4>							"+
						"	<h5 class='descripcion-alumno-calif text-justify'>"+resp[i][2]+"</h5>					"+
						"	<span class='fecha-alumno-calif'>"+$.datepicker.formatDate('dd/mm/yy', new Date(resp[i][3]))+"</span>  	"+
						"	<span class='nota-alumno-calif'>Nota: <span> - </span></span><hr/></div>				");	               	
		   }

		},
		complete: function(){
			$(".loader").fadeOut(2000);
		}
		
	});
	
});
