<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Sitemap - Big Ben Academy</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/sass/estilos.css">
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="assets/imagenes/favicon.ico">
</head>
<body>

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
					<span> SITEMAP </span>
				</div>
			</div>
		</div> <!-- Fin de 'Panel de navegación' -->

	</div> <!-- Fin de contenedor principal de index.html -->


	<!-- Contenedor que engloba a lo principal de la web -->
	<div class="container">

		<div class="row">

			<!-- Contenedor de bienvenida con datos varios de la web -->
			<div class="col-xl-12 col-xs-12 contenedorPrincipal contenedorFull contenedorQuienesSomos">

				<div id="titulo_cont">
					<h1> Sitemap </h1>
				</div>

				<div id="contenido_cont" class="text-justify">
				
				  <div class="row">

				  	<div class="col-xs-12 text-xs-center">
				  			<img src="assets/imagenes/sitemap.png" class="img-fluid" id="imagenSitemap">
				  	</div>

					<div class="col-xs-12 contenidoSiteMap">

			    	    <ul>
			    	    	<li><a href="./index.jsp" title="Índice">Índice</a></li>   
			    	    	<li><a href="./acceso.jsp" title="Acceso a la Intranet de la Academia">Acceso a la Intranet de la Academia</a></li>
			                <li><a href="./ofertas.jsp" title="Ofertas especiales">Ofertas especiales</a></li>
			                <li><a href="./noticias.jsp" title="Noticias">Noticias</a></li>
			                <li><a href="./canal.jsp" title="Canal YT">Canal YT</a></li>
			                <li><a href="./info.jsp" title="Quiénes somos">Quiénes somos</a></li>
			                	<ul>
			                		<li><a href="./docencia.jsp" title="Conoce a nuestros profesores">Conoce a nuestros profesores</a></li>
			                	</ul>
			                <li><a href="./contacto.jsp" title="Contacto">Contacto</a></li>
			            <ul>
				
					</div>

				  </div>
				
				</div> <!-- Fin contenido principal -->

			</div> <!-- Fin contenedor principal -->

		</div> <!-- Fin de fila (row) -->

	</div> <!-- Fin container -->

	<!-- Pie de página -->
	<div id="pie_pag"></div>

	<!-- jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<!-- Tether -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>

	<script src='https://maps.googleapis.com/maps/api/js?v=3.exp&key=AIzaSyDKABVSsz_k5ycTiB97Jvx9t07de3bHsxA'></script>

	<iframe src="youtube.com" hidden/>

</body>
</html>