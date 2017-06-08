<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Noticias - Big Ben Academy</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/sass/estilos.css">
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.css">
</head>
<body>

	<div class="complete-body"></div>

	<!-- Contenedor principal de index.html -->
	<div class="container">
		
		<!-- Contenedor de logo principal de la academia -->
		<div id="cabecera"></div>

		<!-- Cabecera que contiene menú principal para el acceso a las distintas secciones de la web -->
		<div id="menu"></div>

		<!-- Panel de navegación -->
		<div id="navegacion">
			<div class="col-xs-12 barra">
				<div class="col-xs-6 navIzquierda">
					<span> NOTICIAS </span>
				</div>
			</div>
		</div> <!-- Fin de 'Panel de navegación' -->

	</div> <!-- Fin de contenedor principal de index.html -->


	<!-- Contenedor que engloba a lo principal de la web -->
	<div class="container">

	<div class="row">

		<!-- Contenedor de bienvenida con datos varios de la web -->
		<div class="col-xl-8 col-xs-12 contenedorPrincipal">

			<div id="titulo_cont">
				<h1> Noticias Big Ben </h1>
			</div>

			<div id="imgSuperior_cont" class="text-xs-center">
				<img src="assets/imagenes/noticias.png" class="img-fluid">
			</div>

			<div id="contenido_cont" class="text-xs-center">
			
					<div class="contenido_cont_academia">
						
						<div class="cont_noticia_principal col-xs-12">
<!-- 							<h2> Aprender inglés gratis </h2> -->
<!-- 							<h3> 14/02/17 por Marco Romero </h3> -->
<!-- 							<img src="assets/imagenes/titular1.png" class="img-fluid"> -->
<!-- 							<p> ¡Ya no tienes excusa! Estudiar inglés está al alcance de tus manos y en todos los niveles que desees. Hay una gran variedad de opciones en la web, desde plataformas educativas con material complementario y de muy buena calidad,  hasta canales de Youtube con vídeos explicativos y tutoriales; y lo mejor: son totalmente gratis. -->
<!-- 							</p> -->
<!-- 							<button type="button" class="btn btn-primary">Leer Más</button> -->
						</div>	

						<hr>	

						<div class="row fila">

						</div>

						<div class="row btn-sm" id="paginacion">

							<nav aria-label="Page navigation example">
 								 <ul class="pagination justify-content-center">
    								<li class="page-item disabled">
      									<a class="page-link" href="#" tabindex="-1">«</a>
   									</li>
    								<li class="page-item"><a class="page-link" href="#">1</a></li>
    								<li class="page-item"><a class="page-link" href="#">2</a></li>
    								<li class="page-item"><a class="page-link" href="#">3</a></li>
    								<li class="page-item">
      									<a class="page-link" href="#">»</a>
   									</li>
  								</ul>
							</nav>

						</div>
							
					</div>
			
			</div>

		</div> <!-- Fin contenedor principal -->

		<!-- Contenedor que contiene el acceso a la intranet de la academia -->
		<div class="col-xl-4 col-xs-12 menuLateral_acceso">
			<h5> Acceso a la Intranet de la academia </h5>
			<div>
				<a href="./acceso.jsp" title="Ir a la Intranet de la academia"> <img src="assets/imagenes/acceso.png"> </a>
			</div>
		</div> <!-- Fin contenedor acceso a la intranet -->

		<!-- Contenedor que contiene el menú lateral de acceso a conocer la docencia de la academia -->
		<div class="col-xl-4 col-xs-12 menuLateral_docente">
			<h5> Nuestro equipo docente </h5>
			<div>
				<p> 
					El equipo de profesores de nuestra academia está formado por profesionales activos
					y en constante renovación.
					Entra y échale un vistazo al perfil de cada uno.
				</p>
				<div class="text-xs-center">
					<a href="./docencia.jsp" title="Ir a Docencia">
						<i class="fa fa-id-card-o" aria-hidden="true"></i>
					</a>
				</div>
			</div>
		</div> <!-- Fin contenedor acceso a docencia de academia -->

	</div>
	</div>

	<!-- Pie de página -->
	<div id="pie_pag"></div>
	
	<div class="loader" style='display: none;'></div>

	<!-- jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<!-- Tether -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- jQuery UI -->
	<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>
	
	<script>
	
		$(document).ready(function(){
					
			$.ajax({
				type: "POST",
				dataType: "json",
				async: false,
				url: "/Ver_noticias",
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
	
						$(".contenido_cont_academia .cont_noticia_principal").append($("<button type='button' data-id="+resp[0][0]+" class='btn btn-primary'>Leer Más</button>"));
						
					}
										
					if(resp.length > 1){
	
						// Noticias más antiguas 	
						for(var i = 1; i < resp.length; i++){
														 
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
								$(".contenido_cont_academia .fila .cont_noticias_antiguas:last-child").append($("<button type='button' data-id="+resp[i][0]+" class='btn btn-primary btn-sm'>Leer Más</button> "));					
							
							$(".contenido_cont_academia .fila").append($("</div>"));
							
						}
							
					}
										    	    			
				}
			
			});
			
		});
			
	</script>

</body>
</html>