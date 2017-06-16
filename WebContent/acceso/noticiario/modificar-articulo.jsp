<%@ page contentType="text/html; charset=UTF-8" %>

<% 
	// 	 DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
	// 	 datos[0] = "iduser";
	// 	 datos[1] = "tipouser";
	// 	 datos[2] = "nombre";
	// 	 datos[3] = "apellido1";
	// 	 datos[4] = "apellido2";
	// 	 datos[5] = "usuario";
	// 	 datos[6] = "pass";
	// 	 datos[7] = "fecalta";
	// 	 datos[8] = "email";
	// 	 datos[9] = "tlf";
	// 	 datos[10] = "nif";
%>

<% Object[] datos_not = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es noticiario...
	if(session.getAttribute("log") == null || !datos_not[1].equals("N")){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar artículo - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
	<link rel="stylesheet" type="text/css" href="../assets/css/dataTables.min.css">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-not-modificar">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-noticiario.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./aniadir-articulo.jsp" title="Ir a Añadir Artículo">
                                <i class="fa fa-file-text fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./modificar-articulo.jsp" title="Ir a Modificar Artículo">
                                <i class="fa fa-pencil fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Modificar Artículo </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./eliminar-articulo.jsp" title="Ir a Eliminar Artículo">
                                <i class="fa fa-eraser fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Artículo </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Mi Perfil </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./ayuda.jsp" title="Ir a Ayuda">
                                <i class="fa fa-question fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ayuda </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../Logout" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                        <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"><a href="./mi-perfil.jsp"> <% out.print(datos_not[2]); %> </a></span>
                                <a href="../../Logout"> <span id="desconectar">(Desconectar)</span></a>
                            </span>
                        </li>
                    </ul>
            </div>
        </nav>
    </header>
        
    <div class="container">
            <div class="text-xs-center conectadoMobile">
                <span class="nav-link hidden-lg-up">
                    Conectado como 
                    <span id="quien" title="Ir a Mi Perfil"><a href="./mi-perfil.jsp"> <% out.print(datos_not[2]); %> </a></span>
                    <a href="../../Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Modificar artículo</h1>
                <hr/>
                                                                            
                        <div class="text-xs-left">
                            <table class="table" id="art-table">
                              <thead>
                                <tr>
                                  <th>ID</th>
                                  <th>Fecha</th>
                                  <th>Titular</th>
                                  <th>Autor</th>
                                  <th>Modificar</th>
                                </tr>
                              </thead>
                              <tbody>
                                
                              </tbody>
                            </table> 
                        </div>
    
                    
                    <div class="row">
                        <div class="col-xs-12 text-xs-center btn-atras">
                            <a href="../principal-noticiario.jsp"> <button class="btn btn-primary"> Volver </button> </a>
                        </div>
                    </div>
          
            </div>
        </div> 
           
    <footer>
        <div class="row">
            <div class="col-xs-12 text-xs-center">
                <span> © <span id="fechaActual"> </span> - Todos los derechos reservados | Marco Romero  </span>
            </div>
        </div>
    </footer>
        
</div>

<!-- MODAL NOTICIA -->
<div class="modal fade" id="modal-info-art" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <div class="modal-content">
        <div class="modal-header bg-primary text-white">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-xs-center font-weight-bold">Modificar contenido</h4>
        </div>
        <div class="modal-body">
        	<div class="container">
	        	<div class="form-group row">
	  				<label class="col-xs-3">ID: </label>
	  					<div class="col-xs-9">
	    					<span id="id-modal-art" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Fecha de publicación: </label>
	  					<div class="col-xs-9">
	    					<span id="fpubl-modal-art" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Última edición: </label>
	  					<div class="col-xs-9">
	    					<span id="edicion-modal-art" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Autor:  </label>
	  					<div class="col-xs-9">
	    					<span id="autor-modal-art" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Última edición por: </label>
	  					<div class="col-xs-9">
	    					<span id="edicionautor-modal-art" class="font-weight-bold"> </span>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Titular:  </label>
	  					<div class="col-xs-9">
	    					<input id="titular-modal-art" class="form-control" required>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Contenido:  </label>
	  					<div class="col-xs-9">
	    					<textarea cols="75" rows="10" class="img-fluid form-control" id="contenido-modal-art"></textarea>
	  					</div>
				</div>
				<div class="form-group row">
	  				<label class="col-xs-3">Imagen: </label>
	  					<div class="col-xs-9">
	    					<img id="img-modal-art" class="img-fluid">
	  					</div>
				</div>
			</div>
        </div>
        <div class="modal-footer text-xs-center">
          <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" id="btn-mod-art">Modificar </button>
        </div>
      </div>
    </div>
</div>

<!-- MODAL SUCCESS / ERROR-->
<div id="modal-success-art" title="¡Artículo modificado!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-check text-success fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>¡Se ha modificado el artículo correctamente!</b> <br/><br/> Actualiza la pantalla para ver los cambios efectuados.</p> </div>
</div>

<div id="modal-error-art" title="¡Comprueba los datos!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-exclamation-triangle text-danger fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>Comprueba que no falta ningún dato.</b> </p> </div>
</div>

<div class="loader" style='display: none;'></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/dataTables.min.js"></script>
    <script src="../assets/js/dataTables-bs4.min.js"></script>
    <script src="../assets/js/script.js"></script>
    <script src="../assets/js/n_modifica-articulo.js"></script>
    
</body>
</html>

<% } %>