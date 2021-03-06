<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Canal YT - Big Ben Academy</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/sass/estilos.css">
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="assets/imagenes/favicon.ico">
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
					<span> CANAL YT </span>
				</div>
			</div>
		</div> <!-- Fin de 'Panel de navegación' -->

	</div> <!-- Fin de contenedor principal de index.html -->


	<!-- Contenedor que engloba a lo principal de la web -->
	<div class="container">

	<div class="row">

		<!-- Contenedor de bienvenida con datos varios de la web -->
		<div class="col-xl-12 col-xs-12 contenedorPrincipal contenedorFull">

			<div id="titulo_cont">
				<h1> Vídeos Big Ben Academy </h1>
			</div>

			<div id="contenido_cont" class="text-justify">
			
			 	<div id="imgSuperior_cont" class="text-xs-center imagenYT">
					<img src="assets/imagenes/yt.png" class="img-fluid">
				</div>

				<div class="row">
					<div class="col-xs-12 text-justify">
						<p> Puedes seguirnos al día con nuestros videotutoriales web de nuestro canal
							de <b class="text-danger">YouTube</b> 
							<i class="fa fa-youtube fa-2x text-danger" aria-hidden="true"></i>  para que puedas
							seguir formándote en inglés.
						</p>
						<p> Te aconsejamos que estés al día sobre esta sección porque iremos añadiendo vídeos 
							en nuestro canal de YT.
						</p>
						<div class="row text-xs-center videosYT">
							<div class="col-xs-12">
								<h1> Subidos recientemente </h1>
								
								<iframe class="img-fluid" src="https://www.youtube.com/embed/zaa0r2WbmYo"></iframe>

								<iframe class="img-fluid" src="https://www.youtube.com/embed/rCvAvG-43eE"></iframe>

								<iframe class="img-fluid" src="https://www.youtube.com/embed/vf861z0MuMc"></iframe>

								<iframe class="img-fluid" src="https://www.youtube.com/embed/fPTKESyRZs0"></iframe>

							</div>
							
							<div class="col-xs-12">
								<h1> Vídeos más antiguos </h1>
								
								<iframe class="img-fluid" width="200" height="150" src="https://www.youtube.com/embed/GCYAGoYJOc4"></iframe>

								<iframe class="img-fluid" width="200" height="150" src="https://www.youtube.com/embed/bGnrmvcXpyU"></iframe>

								<iframe class="img-fluid" width="200" height="150" src="https://www.youtube.com/embed/J8MaIO_xkV4"></iframe>

							</div>
						</div>
							
					</div>
				</div>

			</div> <!-- Fin contenido principal -->

	</div> <!-- Fin contenedor principal -->

	</div> <!-- Fin de fila (row) -->

	</div> <!-- Fin container -->

	<!-- Pie de página -->
	<div id="pie_pag"></div>
	
	<div class="loader" style='display: none;'></div>

	<!-- jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<!-- Tether -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>

</body>
</html>