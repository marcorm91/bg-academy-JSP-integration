<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Acceso - Big Ben Academy</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/sass/estilos.css">
	<link rel="shortcut icon" href="assets/imagenes/favicon.ico">
</head>
<body>
		<!-- Contenedor que engloba a todo el contenido de acceso.html -->
		<div id="contenedorAcceso">

			<!-- Barra superior de la web -->
			<div id="barraSup">
				<img id="accesoPlat" src="assets/imagenes/accesoPlat.png" class="img-fluid">
			</div>

			<!-- Contenedor que contiene el logotipo empresarial y el formulario de acceso -->
			<div class="container">
			
				<!-- Fila contenedora de un logotipo de la academia -->
				<div class="row">
					<div class="col-md-12">
						<p class="text-xs-center"><img src="assets/imagenes/logoLogin.png" id="logoAcceso" class="img-fluid"></p>
					</div>
				</div>
			
				<!-- Contenedor que contiene los datos de acceso en un formulario -->
				<div class="row login">
				
                    <!-- Formulario que lleva al controlador para identificar el tipo de usuario que accede
                         para llevar a un sitio u otro -->
					<form class="form-horizontal col-xs-12 col-md-12" action="acceso/principal-alumno.jsp">
						<div class="form-group">
							<label for="formGroup">Nombre de usuario: </label>
								<input class="form-control" type="text" id="inputUser" placeholder="Introduzca su nombre de usuario" autofocus required>
						</div>

						<div class="form-group">
							<label for="formGroup">Contraseña: </label>
								<input class="form-control" type="password" id="inputPass" placeholder="Introduzca su clave de acceso" required>
						</div>

						<div class="form-group">
							<label> <input type="checkbox" id="checkSession"> Mantener iniciada mi sesión</label>
						</div>

						<div id="botonesAcceso">
							<div class="form-group text-xs-center">
								<a href="./index.jsp"><button type="button" class="btn btn-primary" title="Ir a Página Principal">Volver</button></a>
                                <button type="submit" class="btn btn-primary">Acceder</button>
							</div>

							<div class="form-group text-xs-center">
								<button type="button" class="btn btn-danger">¿Perdió su clave/usuario de acceso?</button>
							</div>
						</div>

					</form>

				</div> <!-- Fin de contenedor de formulario -->

			</div>	<!-- Fin contenedor de logotipo y formulario -->

		</div> <!-- Fin contenedor principal -->


	<!-- jQuery -->
	<script type="text/javascript" src="assets/js/jquery-3.1.1.min.js"></script>
	<!-- Tether -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
	<!-- Bootstrap -->
	<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
	<!-- Script personal -->
	<script type="text/javascript" src="assets/js/script.js"></script>
</body>
</html>