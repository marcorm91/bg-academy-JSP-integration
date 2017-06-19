$(document).ready(function(){
    	
    	$.ajax({
		type: "POST",
		dataType: "json",
		async: false,
		url: "../Activo_alumno",
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
	    	
	    		}).prev(".ui-dialog-titlebar").css({
								"background":"#033766",
								"color": "#fff"
							   });
			
			}
			
		}
	
	});

});
