<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="es">
<head>
	<title>Error 404 | Página no encontrada</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/assets/css/sass/estilos.css">
	<link rel="shortcut icon" href="<%=request.getContextPath()%>/assets/imagenes/favicon.ico">
</head>
<body>
		<!-- Contenedor que engloba a todo el contenido de error.html -->
		<div id="contenedorAcceso" class="col-xs-12">
			<div class="container-fluid text-xs-center contenedorError">
				<img src="<%=request.getContextPath()%>/assets/imagenes/error.png" class="img-fluid">
				<p id="atrasError"> <a href="<%=request.getContextPath()%>/index.jsp" title="Volver a Inicio">VOLVER A INICIO</a></p>
			</div>
		</div>
</body>
</html>