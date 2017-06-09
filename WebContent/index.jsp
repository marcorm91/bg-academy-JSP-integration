<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Inicio - Big Ben Academy</title>
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
					<span> INICIO </span>
				</div>
			</div>
		</div> <!-- Fin de 'Panel de navegación' -->

	</div> <!-- Fin de contenedor principal de index.html -->


	<!-- Contenedor que engloba a lo principal de la web -->
	<div class="container">

	<div class="row">

		<!-- Contenedor de bienvenida con datos varios de la web -->
		<div class="col-xl-8 col-xs-12 contenedorPrincipal">

			<div id="titulo_cont" class="">
				<h1> Big Ben Academy en cifras </h1>
			</div>

			<div id="imgSuperior_cont" class="text-xs-center">
				<img src="assets/imagenes/birrete.png" class="img-fluid">
			</div>

			<div id="contenido_cont" class="text-xs-center">
			
					<div class="contenido_cont_academia">
						<i class="fa fa-graduation-cap fa-4x" aria-hidden="true"></i>
						<h3> <b class="destacar_contenido"> 5.000 </b> personas obtienen su certificado </h3>
						<p> 
							Conscientes de la situación actual de la educación nos comprometemos, 
							no sólo a que nuestros alumnos aprendan, sino a que disfruten con
							su aprendizaje.  La motivación es nuestro camino y te invitamos a
							invadirlo junto a nosotros.
						</p>
					</div>
				
					<div class="contenido_cont_academia">
						<i class="fa fa-users fa-4x" aria-hidden="true"></i>
						<h3> <b class="destacar_contenido"> 3.000 </b> estudiantes cada año </h3>
						<p>
							Nuestros estudiantes son la motivación del día a día en Big Ben Academy,
							y por ello, tenemos a los docentes más cualificados de la provincia en el ámbito
							y la enseñanza idiomática.  Las cifras lo dicen todo y nunca engañan.
						</p>
					</div>

					<div class="contenido_cont_academia">
						<i class="fa fa-signal fa-4x" aria-hidden="true"></i>
						<h3> <b class="destacar_contenido"> 6 </b> niveles </h3>
						<p>
							No importa que no sepas inglés.  En absoluto.  Ofrecemos desde el nivel más básico
							de inglés (A1) hasta el nivel más avanzado (C2).  
						</p>
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

		<!-- Contenedor que contiene las últimas noticias insertadas en el apartado noticias -->
		<div class="col-xl-4 col-xs-12 menuLateral_ultimasNoticias">
			<h5> Últimas Noticias </h5>
				<div id="celdaMensajes">
						
				</div>
		</div> <!-- Fin contenedor últimas noticias -->

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
	
<div class="modal fade" id="modal-not" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-xs-center">
                    <img id="img-modal-not" src="" class="img-fluid"/>
                </div>
            </div>
            <div class="row">    
                <div class="col-xs-12">
                    <h2 class="text-primary" id="tit-modal-not"></h2>
                </div>
            </div>
            <div class="row">
            	<div class="col-xs-12" id="autor-original">
            		<label><span class="font-weight-bold">Fecha publicación y autor: </span> <span id="fpubl-mod-not"></span> por <span id="autor-mod-not"></span></label>
            		
            	</div>
            </div>
             <div class="row">
            	<div class="col-xs-12 ultima-edicion">
            		<label><span class="font-weight-bold">Última edición por: </span><span id="autored-mod-not"></span> el <span id="fpubled-mod-not"></span></label>
            	</div>
            </div>
            <div class="row">
                <div class="col-xs-12 text-justify contenido-noticia">
                	<p id="cont-mod-not"> </p>
                </div>
            </div>
      </div>
      <div class="modal-footer text-xs-center">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>

	<!-- jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<!-- Tether -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>
	<script type="text/javascript" src="assets/js/index.js"></script>
	

</body>
</html>