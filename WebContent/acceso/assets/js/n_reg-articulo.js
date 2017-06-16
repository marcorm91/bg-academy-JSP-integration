 $(document).ready(function() {
	    	
	// Crear un input oculto para pasar el nombre del fichero a la BD.
	document.getElementById('img-noticia').onchange = uploadOnChange;	   
	
	function uploadOnChange() { 
	    
		var filenames = this.files;
	    $("#filenames").empty();                 
	                           
	    var filesArray = [];
	    
	    Array.prototype.push.apply(filesArray, filenames); 
	                           
	    filesArray.forEach(function(item){
	       $('<input/>', {
				value: item.name
	       }).appendTo("#filenames");
	    });
	    
	}
	
	

	// Acción tras Registrar artículo en BD.
	$("#btn-reg-articulo").on("click", function(){
		
		var titnoticia = $("#tit-noticia").val();
		var contenido = $("#contenido-noticia").val();
		var imagen = $("#filenames > input").val();

		if(titnoticia == "" || contenido == "" || imagen == "" || imagen == null){
			$("#modal-error").dialog();
		}else{
			
     		var formData = new FormData();
     		formData.append('image', $("input[type=file]")[0].files[0]);
			    		
 			$.ajax({
 			    type: "POST",
 			    url: "../../Subir_img",
 	            cache: false,
 	            async: false,
 	            processData: false,
	            contentType: false,
 			    data: formData
 			});
 			
    		// Registra el POST en la BD.
    		$.ajax({
    			type: "POST",
    			dataType: "json",
    			async: false,
    			data: {titnoticia: titnoticia, contenido: contenido, imagen:imagen},
    			url: "../../Registra_noticia",    		
    			success: function(resp){ 
    				
    				if(resp == "0"){
    					$("#modal-error").dialog();
    				}else{
    					$("#img-noticia").val("");
    					$("#tit-noticia").val("");
    		    		$("#contenido-noticia").val("");
    		    		$("#filenames > input").val("");
    					$("#modal-success").dialog();
    				}
    				
    			}
    		});
    		
		}
		
	});
		                          	    	
});