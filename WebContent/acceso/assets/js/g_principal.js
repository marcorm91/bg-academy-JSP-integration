$(document).ready(function(){
	    	
	    	$.ajax({
	    		type: "POST",
				dataType: "json",
				async: false,
				url: "../Activo_gestor",
				success: function(resp){  
					
					if(resp == "N"){
						
						$(".complete-body").css("display", "block");
						
						$("#md-welcome").dialog({
			    			maxWidth:600,
			                width: 600,
			    			closeOnEscape: false,
			    			resizable: false,
			    			draggable: false,
			    			create: function (event) {
			    	            $(event.target).parent().css({ 'position': 'fixed', "left": 50, "top": 150 });
			    	          },
			    		    open: function(event, ui) {
			    		    	$("body").css("overflow", "hidden");
			    		        $(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
			    		    },
			    		    buttons: {
				        		"De acuerdo": function() {	
				        			$(".complete-body").fadeOut(300);
				        			$("body").css("overflow", "auto");
					         		$(this).dialog("close");
				        		}
				    		}
			    	
			    		}).prev(".ui-dialog-titlebar").css	({
		    	    											"background":"#033766",
		    	    											"color": "#fff"
			    											});
					
					}
			
		}
	
	});
		    	
	// Captura el número de incidencias por resolver entre alumnos y profesores. 
	$.ajax({
		type: "POST",
		dataType: "json",
		url: "../Incidencias_sinresolver",    		
		success: function(resp){ 
			if(resp == "0"){
				$(".bola").css("display", "none");
			}else{
				$(".bola").css("display", "block");
				$(".bola #num-incidencias").text(resp);
			}
		}
	});
	
});