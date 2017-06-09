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
						
						<!-- NOTICIA PRINCIPAL -->
						<div class="cont_noticia_principal col-xs-12">
						</div>	

						<hr>	

						<!--  NOTICIAS ANTIGUAS -->
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
	<!-- jQuery UI -->
	<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>
	<script type="text/javascript" src="assets/js/noticiario.js"></script>

</body>
</html>