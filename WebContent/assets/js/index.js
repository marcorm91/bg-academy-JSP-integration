$(document).ready(function(){
	
	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "./Ver_noticias",
		success: function(resp){  
							
			if(resp.length > 0){
			
				for(var i = 0; i < resp.length && i < 10; i++){
					
					if(resp[i][1].length > 25){
						resp[i][1] = resp[i][1].substring(0,25) + " ...";
					}
				
					
					$("#celdaMensajes").append("<div> 																																				"+ 
											   "	<a href='javascript:void(0);' data-id="+resp[i][0]+" title='"+resp[i][1]+"' data-target='#modal-not' data-toggle='modal' class='md-noticia'>	"+
											   "		<i class='fa fa-bookmark fa-1px' aria-hidden='true'></i>																					"+
											   "			"+resp[i][1]+"																															"+
											   "	</a>																																			"+
											   "	<span>"+resp[i][5]+"</span>																														"+
											   "</div>"																																				);
					
				}
					
			}
				
		}

	});
	
	//Recoge el data-id de la noticia para hacer una consulta más exhaustiva en un modal.
	$(document).delegate(".md-noticia", "click", function(event){
			
		event.preventDefault();
		
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
    			
    			$("#tit-modal-not").empty();
    			$("#fpubl-mod-not").empty();
    			$("#autor-mod-not").empty();
    			$("#cont-mod-not").empty();
    			$("#autored-mod-not").empty();
    			$("#fpubled-mod-not").empty();
    				    			
    			$("#img-modal-not").attr("src", "recursos/imgnoticias/"+resp[2]+"");
				$("#tit-modal-not").append(resp[1]);
				$("#fpubl-mod-not").append(resp[5]);
				$("#autor-mod-not").append(resp[4]);
				$("#cont-mod-not").append(resp[3]);
				
				$(".ultima-edicion").show();
				
				if(resp[6] == "" || resp[7] == ""){
					$(".ultima-edicion").hide();
					$("#autor-original").css("margin-bottom", "15px");
				}else{
					$("#autor-original").css("margin-bottom", "0px");
					$("#autored-mod-not").append(resp[6]);
					$("#fpubled-mod-not").append(resp[7]);
				}
    			
    		}
		});	 
		
		
	});
	
});