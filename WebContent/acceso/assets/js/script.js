$(document).ready(function() {
	    
    // Capturamos el año actual para adaptarlo al copyright del footer.
    $("#fechaActual").append((new Date).getFullYear());
    
    /*** MODALES DE REGISTRO ***/
        
    // Comprobamos que la fecha lleve un 0 delante en el día o mes cuando éstos son < 10.
    if((new Date).getDate() < 10 && (new Date).getMonth() < 10){
       $("#fecha-alta-profesor, #fecha-alta-alumno, #fecha-alta-noticiario, #fecha-alta-gestor").
       val("0" + (new Date).getDate() + "/0" + ((new Date).getMonth()+1) + "/" + (new Date).getFullYear()); 
        
        // Fecha (Modificar ver-perfil.html de Gestor)
        $("#alta-modificar-gest-perfil").val
            
       // Aprovechamos la condición para añadir artículo. (Fecha de publicación)
       $("#fecha-publ").append("0" + (new Date).getDate() + "/0" + ((new Date).getMonth()+1) + "/" + (new Date).getFullYear());
        
    }else
        if((new Date).getDate() < 10){
            $("#fecha-alta-profesor, #fecha-alta-alumno, #fecha-alta-noticiario, #fecha-alta-gestor").
            val("0" + (new Date).getDate() + "/" + ((new Date).getMonth()+1) + "/" + (new Date).getFullYear());
            
            // Aprovechamos la condición para añadir artículo. (Fecha de publicación)
            $("#fecha-publ").append("0" + (new Date).getDate() + "/" + ((new Date).getMonth()+1) + "/" + (new Date).getFullYear());
            
        }else 
            if((new Date).getMonth() < 10){
                 $("#fecha-alta-profesor, #fecha-alta-alumno, #fecha-alta-noticiario, #fecha-alta-gestor").
                 val((new Date).getDate() + "/0" + ((new Date).getMonth()+1) + "/" + (new Date).getFullYear());
                
                  // Aprovechamos la condición para añadir artículo. (Fecha de publicación)
                  $("#fecha-publ").append((new Date).getDate() + "/0" + ((new Date).getMonth()+1) + "/" + (new Date).getFullYear());
                
            }            
        
    $("#fecha-nacimiento-profesor, #fecha-nacimiento-alumno, #fnac-modificar-alumn-perfil, #fnac-modificar-prof-perfil").datepicker({maxDate:0, changeYear: true, yearRange:'-90:+0'});
    $("#fecha-limite-subida-tarea, #fecha-limite-subida-examen").datepicker({minDate:0, changeYear: true, yearRange:'-90:+0'});
    
    // Cuando boton-collapse que es el botón de menú en dispositivo mobile se abre, no le daremos ninguna funcionalidad
    // a los elementos del body.
    $("#boton-collapse").on("click", function(){
        if ($("#boton-collapse").attr("aria-expanded") === "false"){
            $(".container").css("opacity", 0.2);
            $(".container").css("pointer-events", "none");
            $("body").css("overflow", "hidden");
        }else 
            if($("#boton-collapse").attr("aria-expanded") === "true"){
                $(".container").css("opacity", 1);
                $(".container").css("pointer-events", "auto");
                $("body").css("overflow", "auto");
            }
    });
    
    /*** SUBPANELES DE BÚSQUEDA ***/
    $("#busqueda-profesor").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./buscar-elemento.jsp'> Buscar elemento </a>"+
                                               "/ Búsqueda de profesor </h1>");
        $("#subpanel-busqueda-profesor").slideToggle();
    });
    
    $("#busqueda-alumno").on("click", function(){
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./buscar-elemento.jsp'> Buscar elemento </a>"+
                                               "/ Búsqueda de alumno </h1>");
        $("#subpanel-busqueda-alumno").slideToggle();
    });
    
    $("#busqueda-noticiario").on("click", function(){
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./buscar-elemento.jsp'> Buscar elemento </a>"+
                                               "/ Búsqueda de noticiario </h1>");
        $("#subpanel-busqueda-noticiario").slideToggle();
    });
    
    $("#busqueda-gestor").on("click", function(){
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./buscar-elemento.jsp'> Buscar elemento </a>"+
                                               "/ Búsqueda de gestor </h1>");
        $("#subpanel-busqueda-gestor").slideToggle();
    });
    
    /*** SUBPANELES DE INCIDENCIAS ***/
    $("#incidencias-profesor").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./ver-incidencias.jsp'> Tipo de incidencia </a>"+
                                               "/ Incidencias de profesor </h1>");
        $("#subpanel-incidencia-profesor").slideToggle();
    });
    
    $("#incidencias-alumno").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./ver-incidencias.jsp'> Tipo de incidencia </a>"+
                                               "/ Incidencias de alumno </h1>");
        $("#subpanel-incidencia-alumno").slideToggle();
    });
    
    /*** SUBPANELES DE BÚSQUEDA ***/
    $("#busqueda-curso").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./buscar-elemento.jsp'> Buscar elemento </a>"+
                                               "/ Búsqueda de curso </h1>");
        $("#subpanel-busqueda-curso").slideToggle();
    });
    
    /*** SUBPANELES DE ELIMINAR ***/
    $("#eliminar-profesor").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./eliminar-elemento.jsp'> Eliminar Elemento </a>"+
                                               "/ Eliminar profesor </h1>");
        $("#subpanel-eliminar-profesor").slideToggle();
    });
    
    $("#eliminar-alumno").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./eliminar-elemento.jsp'> Eliminar Elemento </a>"+
                                               "/ Eliminar alumno </h1>");
        $("#subpanel-eliminar-alumno").slideToggle();
    });
    
    $("#eliminar-curso").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./eliminar-elemento.jsp'> Eliminar Elemento </a>"+
                                               "/ Eliminar curso </h1>");
        $("#subpanel-eliminar-curso").slideToggle();
    });
    
    $("#eliminar-noticiario").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./eliminar-elemento.jsp'> Eliminar Elemento </a>"+
                                               "/ Eliminar noticiario </h1>");
        $("#subpanel-eliminar-noticiario").slideToggle();
    });
    
    $("#eliminar-gestor").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./eliminar-elemento.jsp'> Eliminar Elemento </a>"+
                                               "/ Eliminar gestor </h1>");
        $("#subpanel-eliminar-gestor").slideToggle();
    });
    
    /*** SUBPANELES DE MODIFICAR ***/
    $("#modificar-profesor").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./modificar-elemento.jsp'> Modificar Elemento </a>"+
                                               "/ Modificar profesor </h1>");
        $("#subpanel-modificar-profesor").slideToggle();
    });
    
    $("#modificar-alumno").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./modificar-elemento.jsp'> Modificar Elemento </a>"+
                                               "/ Modificar alumno </h1>");
        $("#subpanel-modificar-alumno").slideToggle();
    });
    
    $("#modificar-curso").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./modificar-elemento.jsp'> Modificar Elemento </a>"+
                                               "/ Modificar curso </h1>");
        $("#subpanel-modificar-curso").slideToggle();
    });
    
    $("#modificar-noticiario").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./modificar-elemento.jsp'> Modificar Elemento </a>"+
                                               "/ Modificar noticiario </h1>");
        $("#subpanel-modificar-noticiario").slideToggle();
    });
    
    $("#modificar-gestor").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-gestor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./modificar-elemento.jsp'> Modificar Elemento </a>"+
                                               "/ Eliminar gestor </h1>");
        $("#subpanel-modificar-gestor").slideToggle();
    });

    /*** SUBPANELES DE CURSO (ALUMNOS) ***/
    $("#alumno-calendario").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-alumno.jsp'>Panel Principal</a> "+
                                               "/ <a href='./curso.jsp'> Mi Curso </a>"+
                                               "/ Calendario </h1>");
        $("#subpanel-calendario-alumno").slideToggle();
    });
    
    $("#alumno-apuntes").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-alumno.jsp'>Panel Principal</a> "+
                                               "/ <a href='./curso.jsp'> Mi Curso </a>"+
                                               "/ Apuntes </h1>");
        $("#subpanel-apuntes-alumno").slideToggle();
    });
    
    $("#alumno-tareas").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-alumno.jsp'>Panel Principal</a> "+
                                               "/ <a href='./curso.jsp'> Mi Curso </a>"+
                                               "/ Tareas </h1>");
        $("#subpanel-tareas-alumno").slideToggle();
    });
    
    $("#alumno-examenes").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-alumno.jsp'>Panel Principal</a> "+
                                               "/ <a href='./curso.jsp'> Mi Curso </a>"+
                                               "/ Exámenes </h1>");
        $("#subpanel-examenes-alumno").slideToggle();
    });
    
    /*** SUBPANELES DE CURSO (PROFESOR) ***/
    $("#profesor-calendario").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Calendario </h1>");
        $("#subpanel-calendario-profesor").slideToggle();
    });
    
    $("#profesor-tareas").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Subir Tarea </h1>");
        $("#subpanel-sub-tarea-profesor").slideToggle();
    });
    
    $("#profesor-examenes").on("click", function(){     
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Subir Examen </h1>");
        $("#subpanel-sub-examen-profesor").slideToggle();
    });
    
    $("#profesor-apuntes").on("click", function(){  
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Subir Apuntes </h1>");
        $("#subpanel-sub-apuntes-profesor").slideToggle();
    });
    
    $("#profesor-list-alumnos").on("click", function(){  
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Listado de Alumnos </h1>");
        $("#subpanel-list-alumnos-profesor").slideToggle();
    });
    
    $("#profesor-tareas-alumnos").on("click", function(){  
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Tareas de Alumnos </h1>");
        $("#subpanel-tareas-alumnos-profesor").slideToggle();
    });
    
    $("#profesor-examenes-alumnos").on("click", function(){  
        $(".panel-opciones").slideToggle();
        $(".panel-principal > h1").replaceWith("<h1><a href='../principal-profesor.jsp'>Panel Principal</a> "+
                                               "/ <a href='./cursos.jsp'> Mis Cursos Asignados </a>"+
                                               "/ Exámenes de Alumnos </h1>");
        $("#subpanel-examenes-alumnos-profesor").slideToggle();
    });
    
    
    
    
    /*** MIS CALIFICACIONES (ALUMNOS) ***/
    $("#tit-tareas-notas-alumno").on("click", function(){
        if($("#tit-tareas-notas-alumno > h3").attr("aria-expanded") === "true"){
            $("#tit-tareas-notas-alumno > h3 > i").removeClass("fa-chevron-down");
            $("#tit-tareas-notas-alumno > h3 > i").addClass("fa-chevron-up");
        }else{
            $("#tit-tareas-notas-alumno > h3 > i").removeClass("fa-chevron-up");
            $("#tit-tareas-notas-alumno > h3 > i").addClass("fa-chevron-down");
        }      
    });
    
    $("#tit-examenes-notas-alumno").on("click", function(){
        if($("#tit-examenes-notas-alumno > h3").attr("aria-expanded") === "true"){
            $("#tit-examenes-notas-alumno > h3 > i").removeClass("fa-chevron-down");
            $("#tit-examenes-notas-alumno > h3 > i").addClass("fa-chevron-up");
        }else{
            $("#tit-examenes-notas-alumno > h3 > i").removeClass("fa-chevron-up");
            $("#tit-examenes-notas-alumno > h3 > i").addClass("fa-chevron-down");
        }      
    });
    
    
    // Mostrar contraseña si el usuario lo desea en Mi-perfil
    $("#ver-pass").on("click", function(){
    	if($("[id*='pass-modificar-']").attr("type") === "password"){
    		$("[id*='pass-modificar-']").attr("type", "text");    	
    	}else{
    		$("[id*='pass-modificar-']").attr("type", "password");    	
    	}
    });
    
    /****************************************************/
    /**************** PETICIONES AJAX *******************/
    /****************************************************/
    
    /**
     * Realiza el registro del alumno.
     */
    $("#reg-alumno").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-alumno").val();
    	var apellido1 = $("#apellido-1-alumno").val();
    	var apellido2 = $("#apellido-2-alumno").val();
    	var nif = $("#nifnie-alumno").val();
    	var fecna = $("#fecha-nacimiento-alumno").val();
    	var nacimiento = $("#nacimiento-alumno").val();
    	var nacionalidad = $("#nacionalidad-alumno").val();
    	var calle = $("#calle-alumno").val();
    	var cp = $("#cp-alumno").val();
    	var poblacion = $("#poblacion-alumno").val();
    	var provincia = $("#provincia-alumno").val();
    	var fecalta = $("#fecha-alta-alumno").val();
    	var email = $("#email-alumno").val();
    	var tlf = $("#tlf-alumno").val();
    	var aniocurso = $("#anio-curso").val();
    	var curso = $("#curso-alumno").val();
    	var comentarios = $("#comentario-alumno").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || nif == "" || fecna == "" || nacimiento == "" || nacionalidad == "" || calle == "" || cp == "" || poblacion == "" || provincia == "" || fecalta == "" || email == "" || tlf == "" || aniocurso == "" || curso == "" || comentarios == ""){
    		$("#modal-error").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2: apellido2, nif:nif, fecna:fecna, nacimiento:nacimiento, nacionalidad:nacionalidad, calle:calle, cp:cp, poblacion:poblacion, provincia:provincia, fecalta:fecalta, email:email, tlf:tlf, aniocurso:aniocurso, curso:curso, comentarios:comentarios},
	    		url: "/Regalumno",
	    		success: function(resp){
	    			    			
	    			if(resp == "1"){
	    				$("#modal-existe").dialog();
	    				$("#nifnie-alumno").css("background-color", "#ffb9aa");
	    				$("#nifnie-alumno").focus();
	    			}else{
	    				if (resp == "0"){
	    					$("#nifnie-alumno").css("background-color", "#fff");
	    					$("#form-reg-alumno")[0].reset();
	    					$("#fecha-alta-alumno").val(fecalta);
	    					$("#modal-aniadir-alumno").modal("toggle");
	        				$("#modal-success").dialog();
	    				}	
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza el registro de profesor.
     */
    $("#reg-profesor").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-profesor").val();
    	var apellido1 = $("#apellido-1-profesor").val();
    	var apellido2 = $("#apellido-2-profesor").val();
    	var nif = $("#nifnie-profesor").val();
    	var fecna = $("#fecha-nacimiento-profesor").val();
    	var nacimiento = $("#nacimiento-profesor").val();
    	var nacionalidad = $("#nacionalidad-profesor").val();
    	var calle = $("#calle-profesor").val();
    	var cp = $("#cp-profesor").val();
    	var poblacion = $("#poblacion-profesor").val();
    	var provincia = $("#provincia-profesor").val();
    	var fecalta = $("#fecha-alta-profesor").val();
    	var email = $("#email-profesor").val();
    	var tlf = $("#tlf-profesor").val();
    	var aniocurso = $("#anio-curso-profesor").val();
    	var cursos = []; 
    	$('#cursos-profesor :selected').each(function(i, selected){ 
    	  cursos[i] = $(selected).text(); 
    	});
    	cursos = cursos.toString();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || nif == "" || fecna == "" || nacimiento == "" || nacionalidad == "" || calle == "" || cp == "" || poblacion == "" || provincia == "" || fecalta == "" || email == "" || tlf == "" || aniocurso == "" || cursos == ""){
    		$("#modal-error").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2: apellido2, nif:nif, fecna:fecna, nacimiento:nacimiento, nacionalidad:nacionalidad, calle:calle, cp:cp, poblacion:poblacion, provincia:provincia, fecalta:fecalta, email:email, tlf:tlf, aniocurso:aniocurso, cursos:cursos},
	    		url: "/Regprofesor",
	    		success: function(resp){
	    			    			
	    			if(resp == "1"){
	    				$("#modal-existe").dialog();
	    				$("#nifnie-profesor").css("background-color", "#ffb9aa");
	    				$("#nifnie-profesor").focus();
	    			}else{
	    				if (resp == "0"){
	    					$("#nifnie-profesor").css("background-color", "#fff");
	    					$("#form-reg-profesor")[0].reset();
	    					$("#fecha-alta-profesor").val(fecalta);
	    					$("#modal-aniadir-profesor").modal("toggle");
	        				$("#modal-success").dialog();
	    				}	
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza el registro de gestor.
     */
    $("#reg-gestor").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-gestor").val();
    	var apellido1 = $("#apellido-1-gestor").val();
    	var apellido2 = $("#apellido-2-gestor").val();
    	var nif = $("#nifnie-gestor").val();
    	var fecalta = $("#fecha-alta-gestor").val();
    	var email = $("#email-gestor").val();
    	var tlf = $("#tlf-gestor").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || nif == "" || fecalta == "" || email == "" || tlf == ""){
    		$("#modal-error").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2: apellido2, nif:nif, fecalta:fecalta, email:email, tlf:tlf},
	    		url: "/Reggestor",
	    		success: function(resp){
	    			    			
	    			if(resp == "1"){
	    				$("#modal-existe").dialog();
	    				$("#nifnie-gestor").css("background-color", "#ffb9aa");
	    				$("#nifnie-gestor").focus();
	    			}else{
	    				if (resp == "0"){
	    					$("#nifnie-gestor").css("background-color", "#fff");
	    					$("#form-reg-gestor")[0].reset();
	    					$("#fecha-alta-gestor").val(fecalta);
	    					$("#modal-aniadir-gestor").modal("toggle");
	        				$("#modal-success").dialog();
	    				}	
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza el registro de noticiario.
     */
    $("#reg-noticiario").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-noticiario").val();
    	var apellido1 = $("#apellido-1-noticiario").val();
    	var apellido2 = $("#apellido-2-noticiario").val();
    	var nif = $("#nifnie-noticiario").val();
    	var fecalta = $("#fecha-alta-noticiario").val();
    	var email = $("#email-noticiario").val();
    	var tlf = $("#tlf-noticiario").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || nif == "" || fecalta == "" || email == "" || tlf == ""){
    		$("#modal-error").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2: apellido2, nif:nif, fecalta:fecalta, email:email, tlf:tlf},
	    		url: "/Regnoticiario",
	    		success: function(resp){
	    			    			
	    			if(resp == "1"){
	    				$("#modal-existe").dialog();
	    				$("#nifnie-noticiario").css("background-color", "#ffb9aa");
	    				$("#nifnie-noticiario").focus();
	    			}else{
	    				if (resp == "0"){
	    					$("#nifnie-noticiario").css("background-color", "#fff");
	    					$("#form-reg-noticiario")[0].reset();
	    					$("#fecha-alta-noticiario").val(fecalta);
	    					$("#modal-aniadir-noticiario").modal("toggle");
	        				$("#modal-success").dialog();
	    				}	
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza el registro de curso.
     */
    $("#reg-curso").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var curso = $("#curso").val();
    	var anioinicio = $("#anio-inicial-curso").val();
    	var aniofin = $("#anio-fin-curso").val();
    	
    	if(anioinicio == "" || aniofin == ""){
    		$("#modal-error").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {curso:curso, anioinicio:anioinicio, aniofin: aniofin},
	    		url: "/Regcurso",
	    		success: function(resp){
	    			    			
	    			if(resp == "1"){
	    				$("#modal-existe-curso").dialog();
	    				$("#anio-inicial-curso").css("background-color", "#ffb9aa");
	    				$("#anio-fin-curso").css("background-color", "#ffb9aa");
	    				$("#curso").css("background-color", "#ffb9aa");
	    			}else{
	    				if (resp == "0"){
	    					$("#anio-inicial-curso").css("background-color", "#fff");
		    				$("#anio-fin-curso").css("background-color", "#fff");
		    				$("#curso").css("background-color", "#fff");
	    					$("#form-reg-curso")[0].reset();
	    					$("#modal-aniadir-curso").modal("toggle");
	        				$("#modal-ok-curso").dialog({
	        					buttons: {
        			        		"OK": function() {
	        			        			$(this).dialog("close");
	        			        			location.reload();
        			        			}
	        					}
	        				});
	        				
	    				}	
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza la modificación de perfil de gestor.
     */
    $("#mod-perfil-gestor").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-modificar-gest-perfil").val();
    	var apellido1 = $("#ape1-modificar-gest-perfil").val();
    	var apellido2 = $("#ape2-modificar-gest-perfil").val();
    	var email = $("#email-modificar-gest-perfil").val();
    	var tlf = $("#tlf-modificar-gest-perfil").val();
    	var pass = $("#pass-modificar-gest-perfil").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || email == "" || tlf == "" || pass == ""){
    		$("#modal-error-perfil").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2:apellido2, email:email, tlf:tlf, pass:pass},
	    		url: "/Modificarperfilgest",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#form-mod-perfil-gestor")[0].reset();
        				$("#modal-success-perfil").dialog({
        						open: function(event, ui) {
        						        	$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        						        	$("#mod-perfil-gestor").css("pointer-events", "none");
        						    	},
        						closeOnEscape: false,
        						buttons: {
        			        		"OK": function() {
        			        			$(".loader").css("display", "block");
        			        			$("body").css("overflow", "auto");
        			        			$(this).dialog("close");
        			        			$(".loader").fadeOut(2000);
        			        			setTimeout(function(){ location.reload(); }, 2000);
        			        		}
        			    		}        				
        				});
        				$("body").css("overflow", "hidden");
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza la modificación de perfil de noticiario.
     */
    $("#mod-perfil-noticiario").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-modificar-not-perfil").val();
    	var apellido1 = $("#ape1-modificar-not-perfil").val();
    	var apellido2 = $("#ape2-modificar-not-perfil").val();
    	var email = $("#email-modificar-not-perfil").val();
    	var tlf = $("#tlf-modificar-not-perfil").val();
    	var pass = $("#pass-modificar-not-perfil").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || email == "" || tlf == "" || pass == ""){
    		$("#modal-error-perfil").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2:apellido2, email:email, tlf:tlf, pass:pass},
	    		url: "/Modificaperfilnot",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#form-mod-perfil-noticiario")[0].reset();
        				$("#modal-success-perfil").dialog({
        						open: function(event, ui) {
        						        	$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        						        	$("#mod-perfil-noticiario").css("pointer-events", "none");
        						    	},
        						closeOnEscape: false,
        						buttons: {
        			        		"OK": function() {
        			        			$(".loader").css("display", "block");
        			        			$("body").css("overflow", "auto");
        			        			$(this).dialog("close");
        			        			$(".loader").fadeOut(2000);
        			        			setTimeout(function(){ location.reload(); }, 2000);
        			        		}
        			    		}        				
        				});
        				$("body").css("overflow", "hidden");
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza la modificación de perfil de alumno.
     */
    $("#mod-perfil-alumno").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-modificar-alumn-perfil").val();
    	var apellido1 = $("#ape1-modificar-alumn-perfil").val();
    	var apellido2 = $("#ape2-modificar-alumn-perfil").val();
    	var email = $("#email-modificar-alumn-perfil").val();
    	var poblacion = $("#poblacion-modificar-alumn-perfil").val();
    	var calle = $("#calle-modificar-alumn-perfil").val();
    	var cp = $("#cp-modificar-alumn-perfil").val();
    	var nacido = $("#nacido-modificar-alumn-perfil").val();
    	var nacionalidad = $("#nacionalidad-modificar-alumn-perfil").val();
    	var calle = $("#calle-modificar-alumn-perfil").val();
    	var fecna = $("#fnac-modificar-alumn-perfil").val();
    	var tlf = $("#tlf-modificar-alumn-perfil").val();
    	var pass = $("#pass-modificar-alumn-perfil").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || email == "" || poblacion == "" || calle == "" || cp == "" || nacido == "" || nacionalidad == "" || calle == "" || fecna == "" || tlf == "" || pass == ""){
    		$("#modal-error-perfil").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2:apellido2, email:email, poblacion:poblacion, calle:calle, cp:cp, nacido:nacido, nacionalidad:nacionalidad, calle:calle, fecna:fecna,  tlf:tlf, pass:pass},
	    		url: "/Modificaperfilalumn",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#form-mod-perfil-alumno")[0].reset();
        				$("#modal-success-perfil").dialog({
        						open: function(event, ui) {
        						        	$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        						        	$("#mod-perfil-alumno").css("pointer-events", "none");
        						    	},
        						closeOnEscape: false,
        						buttons: {
        			        		"OK": function() {
        			        			$(".loader").css("display", "block");
        			        			$("body").css("overflow", "auto");
        			        			$(this).dialog("close");
        			        			$(".loader").fadeOut(2000);
        			        			setTimeout(function(){ location.reload(); }, 2000);
        			        		}
        			    		}        				
        				});
        				$("body").css("overflow", "hidden");
	    			}
	    		}, complete: function(){
	    			
	    			
	    		}
	    	});
    	
    	}
    
    });
    
    
    /**
     * Realiza la modificación de perfil de profesor.
     */
    $("#mod-perfil-profesor").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var nombre = $("#nombre-modificar-prof-perfil").val();
    	var apellido1 = $("#ape1-modificar-prof-perfil").val();
    	var apellido2 = $("#ape2-modificar-prof-perfil").val();
    	var email = $("#email-modificar-prof-perfil").val();
    	var poblacion = $("#poblacion-modificar-prof-perfil").val();
    	var calle = $("#calle-modificar-prof-perfil").val();
    	var cp = $("#cp-modificar-prof-perfil").val();
    	var nacido = $("#nacido-modificar-prof-perfil").val();
    	var nacionalidad = $("#nacionalidad-modificar-prof-perfil").val();
    	var calle = $("#calle-modificar-prof-perfil").val();
    	var fecna = $("#fnac-modificar-prof-perfil").val();
    	var tlf = $("#tlf-modificar-prof-perfil").val();
    	var pass = $("#pass-modificar-prof-perfil").val();
    	
    	if(nombre == "" || apellido1 == "" || apellido2 == "" || email == "" || poblacion == "" || calle == "" || cp == "" || nacido == "" || nacionalidad == "" || calle == "" || fecna == "" || tlf == "" || pass == ""){
    		$("#modal-error-perfil").dialog();
    	}else{
    	    	
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {nombre:nombre, apellido1:apellido1, apellido2:apellido2, email:email, poblacion:poblacion, calle:calle, cp:cp, nacido:nacido, nacionalidad:nacionalidad, calle:calle, fecna:fecna,  tlf:tlf, pass:pass},
	    		url: "/Modificaperfilprof",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#form-mod-perfil-prof")[0].reset();
        				$("#modal-success-perfil").dialog({
        						open: function(event, ui) {
        						        	$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        						        	$("#mod-perfil-profesor").css("pointer-events", "none");
        						    	},
        						closeOnEscape: false,
        						buttons: {
        			        		"OK": function() {
        			        			$(".loader").css("display", "block");
        			        			$("body").css("overflow", "auto");
        			        			$(this).dialog("close");
        			        			$(".loader").fadeOut(2000);
        			        			setTimeout(function(){ location.reload(); }, 2000);
        			        		}
        			    		}        				
        				});
        				$("body").css("overflow", "hidden");
	    			}
	    		}
	    	});
    	
    	}
    
    });
    
    
    
    /**
     * Carga de cursos y años iniciales y finales de la BD curso sobre los campos de profesor.
     */
    $("#regprofesor").on("click", function(e){
    	
    	// Pide por ajax la petición a la base de datos de las fechas iniciales y finales.
    	// Esta petición volverá con fechas iniciales y finales únicas de la BD.
     	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recogefechas",
    		async: false,
    		success: function(resp){  
    			for(var i = 0; i < resp.length; i++){			
    				if(resp[i][0] != null || resp[i][1] != null){
    					$("#anio-curso-profesor").append("<option> " + resp[i][0] + " - " + resp[i][1] + "</option>");
    				}
    			}    			
    		}
    	});
     	
     	// Petición que devolverá todos los cursos existentes en la BD.
     	// Mismo caso que fechas, devolverá e imprimirá la unicidad de cursos sin que éstos sean repetidos.
     	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recogecursos",
    		async: false,
    		success: function(resp){  
    			for(var i = 0; i < resp.length; i++){			
    				if(resp[i][0] != null){
    					$("#cursos-profesor").append("<option> " + resp[i][0] + "</option>");
    				}
    			}    			
    		}
    	});
     	    
    });
    
    
    /**
     * Carga de cursos y años iniciales y finales de la BD curso sobre los campos de alumno.
     */
    $("#regalumno").on("click", function(e){
    	
    	// Pide por ajax la petición a la base de datos de las fechas iniciales y finales.
    	// Esta petición volverá con fechas iniciales y finales únicas de la BD.
     	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recogefechas",
    		async: false,
    		success: function(resp){  
    			for(var i = 0; i < resp.length; i++){			
    				if(resp[i][0] != null || resp[i][1] != null){
    					$("#anio-curso").append("<option> " + resp[i][0] + " - " + resp[i][1] + "</option>");
    				}
    			}    			
    		}
    	});
     	
     	// Petición que devolverá todos los cursos existentes en la BD.
     	// Mismo caso que fechas, devolverá e imprimirá la unicidad de cursos sin que éstos sean repetidos.
     	$.ajax({
    		type: "POST",
    		dataType: "json",
    		url: "/Recogecursos",
    		async: false,
    		success: function(resp){  
    			for(var i = 0; i < resp.length; i++){			
    				if(resp[i][0] != null){
    					$("#curso-alumno").append("<option> " + resp[i][0] + "</option>");
    				}
    			}    			
    		}
    	});
     	    
    });
    
    
    
    /**
     * Insercción de incidencia en la BD incidencias de alumno.
     */
    $("#regincidencia-alumn").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var alumnincidencia = $("#alumnincidencia").val();
    	
    	if(alumnincidencia == ""){
    		$("#modal-error-incidencia").dialog();
    	}else{
    		    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {alumnincidencia:alumnincidencia},
	    		url: "/Regincidenciaalumn",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#form-reg-incidencia-alumn")[0].reset();
        				$("#modal-success-incidencia").dialog({
        						open: function(event, ui) {
        						        	$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        						    	},
        						closeOnEscape: false,
        						buttons: {
        			        		"OK": function() {
        			        			$(this).dialog("close");
        			        		}
        			    		}        				
        				});
	    			}
	    		}
	    	});
    	
    	}
    	
    });
    
    
    /**
     * Insercción de incidencia en la BD incidencias de profesor.
     */
    $("#regincidencia-prof").on("click", function(e){
    	
    	e.preventDefault();
    	
    	var profincidencia = $("#profincidencia").val();
    	
    	if(profincidencia == ""){
    		$("#modal-error-incidencia").dialog();
    	}else{
    		    		
    		$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		data: {profincidencia:profincidencia},
	    		url: "/Regincidenciaprof",
	    		success: function(resp){  			
	    			if(resp == "0"){
    					$("#form-reg-incidencia-prof")[0].reset();
        				$("#modal-success-incidencia").dialog({
        						open: function(event, ui) {
        						        	$(".ui-dialog-titlebar-close", ui.dialog | ui).hide();
        						    	},
        						closeOnEscape: false,
        						buttons: {
        			        		"OK": function() {
        			        			$(this).dialog("close");
        			        		}
        			    		}        				
        				});
	    			}
	    		}
	    	});
    	
    	}
    	
    });
    

    
    // Reload de la pag tras cerrar el modal alumno o profesor.
    $('#modal-aniadir-alumno, #modal-aniadir-profesor').on('hidden.bs.modal', function () {
        location.reload();
    })
    
    
});
