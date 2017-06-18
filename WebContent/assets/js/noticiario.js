$(document).ready(function(){
					
		$.ajax({
			type: "POST",
			dataType: "json",
			async: false,
			url: "./Ver_noticias",
			success: function(resp){  
								
			if(resp.length > 0){
			
				// Titular de la noticia
				if(resp[0][1].length > 50){
					$(".contenido_cont_academia .cont_noticia_principal").append($("<h2>"+resp[0][1].substring(0, 50)+" ...</h2>"));
				}else{
					$(".contenido_cont_academia .cont_noticia_principal").append($("<h2>"+resp[0][1]+"</h2>"));
				}
				
				// Fecha y autor de publicación
				$(".contenido_cont_academia .cont_noticia_principal").append($("<h3>"+resp[0][5]+" por "+resp[0][4]+"</h3>"));
				
				// Imagen de noticia
				$(".contenido_cont_academia .cont_noticia_principal").append($("<img src='recursos/imgnoticias/"+resp[0][2]+"' class='img-fluid'>"));
				
				// Contenido de la noticia
				if(resp[0][3].length > 100 ){
					$(".contenido_cont_academia .cont_noticia_principal").append($("<p>"+resp[0][3].substring(0, 250)+" [...] </p>"));
				}else{
					$(".contenido_cont_academia .cont_noticia_principal").append($("<p>"+resp[0][3]+"</p>"));
				}

				$(".contenido_cont_academia .cont_noticia_principal").append($("<button type='button' data-id="+resp[0][0]+" data-target='#modal-not' data-toggle='modal' class='btn btn-primary md-noticia'>Leer Más</button>"));
				
			}
								
			if(resp.length > 1){

				// Noticias más antiguas 	
				for(var i = 1; i < resp.length && i < 5; i++){
												 
					$(".contenido_cont_academia .fila").append($("<div class='cont_noticias_antiguas col-xs-12 col-md-6'>"));
											
						// Titular de la noticia
						if(resp[i][1].length > 50){
							$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<h2>"+resp[i][1].substring(0, 50)+" ...</h2>"));
						}else{
							$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<h2>"+resp[i][1]+"</h2>"));
						}
						
						// Fecha y autor de publicación
						$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<h3>"+resp[i][5]+" por "+resp[i][4]+"</h3>"));
					
						// Imagen de noticia
						$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<img src='recursos/imgnoticias/"+resp[i][2]+"' style='margin-left:0;' class='img-fluid'>"));
					
						// Contenido de la noticia
						if(resp[i][3].length > 100 ){
							$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<p style='padding-right: 1em;'>"+resp[i][3].substring(0, 100)+" [...] </p>"));
						}else{
							$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<p style='padding-right: 1em;'>"+resp[i][3]+"</p>"));
						}
						
						// Botón Leer Más
						$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<button type='button' data-id="+resp[i][0]+" data-target='#modal-not' data-toggle='modal' class='btn btn-primary btn-sm md-noticia'>Leer Más</button> "));					
					
					$(".contenido_cont_academia .fila").append($("</div>"));
					
				}
					
			}
								    	    			
		}
	
	});
	
	//Recoge el data-id del alumno para hacer una consulta más exhaustiva en un modal.
	$(document).delegate(".md-noticia", "click", function(event){
		
		var id = $(this).data("id");
		$("#modal-not").css("cursor", "default");
		
		$.ajax({
    		type: "POST",
    		dataType: "json",
    		data: {id:id},
    		url: "./Noticia_individual",
    		success: function(resp){  	
    			
    			for(var i = 0; i < resp.length; i++){
    				if(resp[i] == null){
    					resp[i] = "";
    				}
    			}
    			
    			$("#tit-modal-not").text("");
    			$("#fpubl-mod-not").text("");
    			$("#autor-mod-not").text("");
    			$("#cont-mod-not").text("");
    			$("#autored-mod-not").text("");
				$("#fpubled-mod-not").text("");
    			
    			$("#img-modal-not").attr("src", "recursos/imgnoticias/"+resp[2]+"");
				$("#tit-modal-not").append(resp[1]);
				$("#fpubl-mod-not").append(resp[5]);
				$("#autor-mod-not").append(resp[4]);
				$("#cont-mod-not").append(resp[3]);
									
				if(resp[6] == null || resp[7] == null){
					$(".ultima-edicion > label").toggle();
					$("#autor-original").css("margin-bottom", "15px");
				}
				
				if(resp[6] != "" || resp[7] != ""){
					$("#autored-mod-not").append(resp[6]);
					$("#fpubled-mod-not").append(resp[7]);
				}
    			
    		}
		});	 
		
	});
	
});