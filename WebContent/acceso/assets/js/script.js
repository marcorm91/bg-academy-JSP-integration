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
        
    $("#fecha-nacimiento-profesor, #fecha-nacimiento-alumno, #fnac-modificar-alumn-perfil").datepicker();
    $("#fecha-limite-subida-tarea, #fecha-limite-subida-examen").datepicker({minDate:0});
    
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
     
    
    
});
