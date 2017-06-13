// --------------------- Variables globales --------------------- //
var lunes = 0, martes = 0, miercoles = 0, jueves = 0, viernes = 0;
var meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre",
		 	 "Diciembre"];
// -------------------------------------------------------------- //

$(document).ready(function(){
	
    fecha = new Date();
    mesActual =  fecha.getMonth();
    anioActual = fecha.getFullYear();

    // Con esto imprimimos en la parte superior de la pantalla, como título, el mes y año actual.
    $("#mesActual").text(meses[fecha.getMonth()] + " - " + fecha.getFullYear());
    
    arrayActividades = actividades();
    
    // Este evento nos pinta el calendario con el mes y año actual en el que nos encontramos.
    $("#bHoy").on('click', function() {
        mesActual = fecha.getMonth();
        anioActual = fecha.getFullYear();
        $("#mesActual").text(meses[mesActual] + " - " + (anioActual));
        $('td').removeClass('seleccion');
        escribirDias(arrayActividades);
    });

    // Este evento nos pinta el calendario con el año anterior al situado previamente.
    $("#anioAnterior").on('click', function() {
        anioActual -= 1;
        $("#mesActual").text(meses[mesActual] + " - " + (anioActual));
        $('td').removeClass('seleccion');
         escribirDias(arrayActividades);
    });

	// Este evento nos pinta el calendario con el año posterior al situado previamente.
    $("#anioSiguiente").on('click', function() {
        anioActual += 1;
        $("#mesActual").text(meses[mesActual] + " - " + (anioActual));
        $('td').removeClass('seleccion');
         escribirDias(arrayActividades);
    });

    // Este evento nos pinta el calendario con el mes anterior al situado previamente.
    $("#mesAnterior").on('click', function() {
        if(mesActual != 0){
            mesActual -= 1;
            $("#mesActual").text(meses[mesActual] + " - " + (anioActual));
            $('td').removeClass('seleccion');
             escribirDias(arrayActividades);
        }
    });

    // Este evento nos pinta el calendario con el mes posterior al situado previamente.
    $("#mesSiguiente").on('click', function() {
        if(mesActual != 11){
            mesActual += 1;
            $("#mesActual").text(meses[mesActual] + " - " + (anioActual));
            $('td').removeClass('seleccion');
             escribirDias(arrayActividades);
        }
    });	
    
    escribirDias(arrayActividades);
    
});



/**
 * Esta función nos realizará el pintado del calendario sobre el mes y año que seleccionemos.
 **/
function escribirDias(arrayActividades) {
		
         primerDia=new Date(anioActual,mesActual,"1")
         primeraSemana = primerDia.getDay()
         primeraSemana--;
         
         if (primeraSemana==-1) {
            primeraSemana=6;
         }
         
         diaprmes=primerDia.getDate() 
         prcelda=diaprmes-primeraSemana; 
         empezar=primerDia.setDate(prcelda);
         diames=new Date();
         diames.setTime(empezar);

         for (i=1;i<7;i++) {
             
             fila = $("#F"+i);
             
             for (j=0;j<7;j++) {
                 
                 diaActual=diames.getDate();
                 mimes=diames.getMonth();
                 mianno=diames.getFullYear();

                 // Vamos a formatear el mes y día para añadirle a los data el formato que queremos
                 // que será 2017-01-01, por ejemplo.
                 if(diaActual < 10 && mimes < 11){
                     data = mianno+"-0"+(mimes+1)+"-0"+diaActual; 
                 }else
                    if(diaActual < 10){
                        data = mianno+"-"+(mimes+1)+"-0"+diaActual; 
                    }else
                        if(mimes < 9){
                             data = mianno+"-0"+(mimes+1)+"-"+diaActual;
                        }else{
                             data = mianno+"-"+(mimes+1)+"-"+diaActual;
                        }

                 // Días del mes actual
                 if (mimes==mesActual) { 

                    // Si el día de la semana no es ni sábado ni domingo...
                    if(diames.getDay() != 6 && diames.getDay() != 0){

                    	// Añadimos a celda el día actual que le pertenezca, y además,
                    	// le añadimos un data-fecha al td con el data (año-mes-dia)
                    	// que le pertenezca.  
                    	// Quitamos la clase sinFecha (por si la tiene), ya que esta clase la tienen
                    	// los días que no pertenezcan al mes en el que nos encontramos.
                    	// Añadimos la clase conFecha y la clase encima.
                        celda = $('td', fila).eq(j).html(diaActual);
                        $(celda).attr("data-fecha", data);
                        $('td', fila).eq(j).removeClass('sinFecha');
                        $('td', fila).eq(j).addClass('conFecha');
                        //$('td', fila).eq(j).addClass('encima');
                                                
                           if(arrayActividades.indexOf(data)>-1){
                                $('td', fila).eq(j).addClass('seleccion');
                                //$('td', fila).eq(j).removeClass('encima');
                           }

                    // Si el día es sábado o domingo, quitamos la clase sinFecha. Tener en cuenta que se quedará
                    // sólo con la clase finde que es fija en la tabla.     
                    }else{
                        celda = $('td', fila).eq(j).html(diaActual);
                        $('td', fila).eq(j).removeClass('sinFecha');
                    }
                    
                   
                 // Días que no son del mes actual...
                 }else{

                 	// Pintamos igualmente el día que pertenezca y removemos los data, la clase encima, conFecha y
                 	// añadimos sinFecha.
                 	// No nos hará falta calcular nada ni sacar nada de la BD con los días que no pertenezcan al mes
                 	// actual.
                    celda = $('td', fila).eq(j).html(diaActual);
                    celda.removeAttr('data-fecha');
                    $('td', fila).eq(j).removeClass('conFecha');
                    $('td', fila).eq(j).addClass('sinFecha');
                    //$('td', fila).eq(j).removeClass('encima');

                 }

                 // Avanzamos un día para seguir pintando el calendario...
                 diaActual++;
                 diames.setDate(diaActual);
             
             }

         }
}


function actividades(){
    var actividades;
     
     $.ajax({
        url: '/Recoge_fecactividades',
        type: 'POST',
        dataType: "json",
        async: false,
        success: function(respuesta){
        	        	
            actividades = new Array(respuesta.length);
            
            for(var i = 0; i < respuesta.length; i++){
            	actividades[i] = respuesta[i];
            }  
            
        }

    });

    return actividades;
}