<%@ page contentType="text/html; charset=UTF-8" %>

<%
// 	DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 	datos[0] = "iduser";
// 	datos[1] = "tipouser";
// 	datos[2] = "nombre";
// 	datos[3] = "apellido1";
// 	datos[4] = "apellido2";
// 	datos[5] = "usuario";
// 	datos[6] = "pass";
// 	datos[7] = "fecalta";
// 	datos[8] = "email";
// 	datos[9] = "nif";
// 	datos[10] = "tlf";
%>

<% Object[] datos_gest = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es gestor...
	if(session.getAttribute("log") == null || !datos_gest[1].equals("G")){  
		response.sendRedirect("error.jsp");
	} else{
%>


<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Añadir Elemento - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-new">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-gestor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./aniadir-elemento.jsp" title="Ir a Añadir Elemento">
                                <i class="fa fa-plus fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Añadir Elemento </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./eliminar-elemento.jsp" title="Ir a Eliminar Elemento">
                                <i class="fa fa-minus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Eliminar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./modificar-elemento.jsp" title="Ir a Editar Elemento">
                                <i class="fa fa-edit fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Editar Elemento </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./buscar-elemento.jsp" title="Ir a Buscar - Listar Elementos">
                                <i class="fa fa-eye fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Buscar - Listar Elementos </span>
                            </a>
                        </li>
                        <li class="nav-item">
                        	<div class="bola hidden-xs-down" style="display: none;">
                        		<span id="num-incidencias"></span>
                        	</div>
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias de Profesores y Alumnos">
                                <i class="fa fa-commenting fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias de Profesores y Alumnos </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_gest[2]); %> </a> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <a href="./mi-perfil.jsp"> <% out.print(datos_gest[2]); %> </a> </span>
                    <a href="../../Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Añadir Elemento</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> ¿Qué desea añadir? </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-briefcase fa-4x" aria-hidden="true" data-toggle="modal" 
                                   data-target="#modal-aniadir-profesor" id="regprofesor"></i> <p> Registrar <br/> Profesor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   data-target="#modal-aniadir-alumno" id="regalumno"></i> <p> Registrar <br/> Alumno </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-newspaper-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   data-target="#modal-aniadir-noticiario"></i> <p> Registrar <br/> Noticiario </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-user-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   data-target="#modal-aniadir-gestor"></i> <p> Registrar <br/> Gestor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-book fa-4x" aria-hidden="true" data-toggle="modal"
                                   data-target="#modal-aniadir-curso"></i> <p> Registrar <br/> Curso </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <a href="../principal-gestor.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
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

 <!------- MODALES ------->
    
 <!-- REGISTRAR PROFESOR -->
 <form id="form-reg-profesor">
 <div class="modal fade" id="modal-aniadir-profesor" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title text-xs-center font-weight-bold">Registrar profesor</h4>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nombre" id="nombre-profesor" maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido1" id="apellido-1-profesor" maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido2" id="apellido-2-profesor" maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">NIF / NIE:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="nif" id="nifnie-profesor" maxlength="9" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">F. de nacimiento:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="fecna" id="fecha-nacimiento-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nacido en:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nacimiento" id="nacimiento-profesor" maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nacionalidad:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nacionalidad" id="nacionalidad-profesor" maxlength="150" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos de dirección </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Calle:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="calle" id="calle-profesor" maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Código Postal:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="cp" id="cp-profesor" maxlength="10" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Población:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="poblacion" id="poblacion-profesor" maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Provincia:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="provincia" id="provincia-profesor" maxlength="150" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos profesionales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Fecha de alta:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="fecalta" id="fecha-alta-profesor" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">E-mail:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="email" id="email-profesor" maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="tlf" id="tlf-profesor" maxlength="20" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año promoción:</label>
                <div class="col-md-7">
                    <!-- PROMOCIONES CURSOS REGISTRADOS PREVIAMENTE -->
                    <select class="form-control" name="aniocurso" id="anio-curso-profesor" required>
                    <option> - Seleccione promoción - </option></select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Cursos a impartir:</label>
                <div class="col-md-7">
                    <!-- CURSOS REGISTRADOS PREVIAMENTE -->
                    <select multiple class="form-control" name="cursos" id="cursos-profesor" required>
                    </select>
                </div>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary  btn-close-modal" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="reg-profesor" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
</div>
</form>
    
    
 <!-- REGISTRAR ALUMNO -->
 <form id="form-reg-alumno">
 <div class="modal fade" id="modal-aniadir-alumno" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title text-xs-center font-weight-bold">Registrar alumno</h4>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nombrealumno" id="nombre-alumno" maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido1" id="apellido-1-alumno" maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido2" id="apellido-2-alumno" maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">NIF / NIE:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="nif" id="nifnie-alumno" maxlength="9" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">F. de nacimiento:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="fecna" id="fecha-nacimiento-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nacido en:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nacimiento" id="nacimiento-alumno"  maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nacionalidad:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nacionalidad" id="nacionalidad-alumno"  maxlength="150" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos de dirección </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Calle:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="calle" id="calle-alumno"  maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Código Postal:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="cp" id="cp-alumno"  maxlength="10" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Población:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="poblacion" id="poblacion-alumno"  maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Provincia:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="provincia" id="provincia-alumno"  maxlength="150" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos profesionales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Fecha de alta:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="fecalta" id="fecha-alta-alumno" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">E-mail:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="email" id="email-alumno"  maxlength="150" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="tlf" id="tlf-alumno"  maxlength="20" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año promoción:</label>
                <div class="col-md-7">
                    <!-- PROMOCIONES CURSOS REGISTRADOS PREVIAMENTE -->
                    <select class="form-control" id="anio-curso" name="aniocurso" required>
                    <option> - Seleccione promoción - </option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Selección de curso:</label>
                <div class="col-md-7">
                    <!-- CURSOS REGISTRADOS PREVIAMENTE -->
                    <select class="form-control" id="curso-alumno" name="curso" required>
                    </select>
                </div>
            </div>
            <div class="form-group contenedor-comentarios">
                <label class="col-md-3 col-form-label push-md-1">Comentarios:</label>
                    <div class="col-md-7">
                        <textarea class="form-control" name="comentarios" id="comentario-alumno" rows="7"  maxlength="300" required></textarea>
                    </div>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-close-modal" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="reg-alumno" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
</div>
</form>
    
<!-- REGISTRAR NOTICIARIO -->
<form id="form-reg-noticiario">
 <div class="modal fade" id="modal-aniadir-noticiario" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title text-xs-center font-weight-bold">Registrar noticiario</h4>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nombre-noticiario" id="nombre-noticiario"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido1" id="apellido-1-noticiario"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido2" id="apellido-2-noticiario"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">NIF/NIE:</label>
                <div class="col-md-7">
                    <input class="form-control" name="nif" type="text" id="nifnie-noticiario"  maxlength="9" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos profesionales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Fecha de alta:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="fecalta" id="fecha-alta-noticiario" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">E-mail:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="email" id="email-noticiario"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="tlf" id="tlf-noticiario"  maxlength="20" required>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="reg-noticiario"  class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>
</form>

<!-- REGISTRAR GESTOR -->
<form id="form-reg-gestor">
 <div class="modal fade" id="modal-aniadir-gestor" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title text-xs-center font-weight-bold">Registrar gestor</h4>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" name="nombre-gestor" type="text" id="nombre-gestor"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" name="apellido1" type="text" id="apellido-1-gestor"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" name="apellido2" type="text" id="apellido-2-gestor"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">NIF/NIE:</label>
                <div class="col-md-7">
                    <input class="form-control" name="nif" type="text" id="nifnie-gestor"  maxlength="9" required>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos profesionales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Fecha de alta:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="fecalta" id="fecha-alta-gestor" readonly>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">E-mail:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="email" id="email-gestor"  maxlength="100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="tlf" id="tlf-gestor"  maxlength="20" required>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="reg-gestor" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>
</form>
    
<!-- REGISTRAR CURSO -->
<form id="form-reg-curso">
 <div class="modal fade" id="modal-aniadir-curso" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-white">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="modal-title text-xs-center font-weight-bold">Registrar curso</h4>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos curso </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Tipo curso:</label>
                <div class="col-md-7">
                    <select class="form-control" id="curso" name="curso" required>
                        <option>[A1] - Nivel Básico - 1er Curso</option>
                        <option>[A2] - Nivel Básico - 2º Curso</option>
                        <option>[B1] - Nivel Intermedio - 3er Curso</option>
                        <option>[B2] - Nivel Avanzado - 4º Curso</option>
                        <option>[B2] - Nivel Avanzado - 5º Curso</option>
                        <option>[C1] - Nivel Avanzado - 6º Curso</option>
                        <option>[C2] - Nivel Avanzado - 7º Curso</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año inicio: </label>
                <div class="col-md-2">
                    <input class="form-control" name="anioinicio" type="number" id="anio-inicial-curso"  value="2000" min="2000" max="2100" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año fin: </label>
                <div class="col-md-2">
                    <input class="form-control" name="aniofin" type="number" id="anio-fin-curso"  value="2000" min="2000" max="2100" required>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" id="reg-curso" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>
</form>

<!-- MODAL SUCCESS / ERROR-->
<div id="modal-success" title="¡Usuario registrado!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-check text-success fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>¡Se ha registrado el usuario correctamente!</b> </p> </div>
	<div class="text-xs-center"> <p> <i class="fa fa-key fa-2x text-warning" aria-hidden="true"></i> <br/>
									 <b>¡No olvides darle los credenciales de acceso a la plataforma!</b>
								 </p> </div>
</div>

<div id="modal-error" title="¡Comprueba los datos!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-exclamation-triangle text-danger fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>Comprueba que no falta ningún dato.</b> </p> </div>
</div>

<div id="modal-existe" title="¡Usuario existente!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-exclamation-triangle text-danger fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>Ese usuario ya fue registrado en la Base de Datos.</b> </p> </div>
</div>

<div id="modal-existe-curso" title="¡Curso existente!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-exclamation-triangle text-danger fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>Ese curso, año fin e inicio ya fue registrado en la Base de Datos.</b> </p> </div>
</div>

<div id="modal-ok-curso" title="¡Curso registrado!" style="display: none">
	<div class="text-xs-center" style="margin-bottom:10px;"> 
		<i class="fa fa-check text-success fa-2x" aria-hidden="true"> </i>
	</div>
	<div class="text-xs-center"> <p> <b>¡Se ha registrado el curso correctamente!</b> </p> </div>
</div>

<div class="loader" style='display: none;'></div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>    
    <script src="../assets/js/script.js"></script>
    
    <script>
    
	    $(document).ready(function(){
	    	
	    	// Captura el número de incidencias por resolver entre alumnos y profesores. 
	    	$.ajax({
	    		type: "POST",
	    		dataType: "json",
	    		url: "../../Incidencias_sinresolver",    		
	    		success: function(resp){ 
	    			if(resp == "0"){
	    				$(".bola").css("display", "none");
	    			}else{
	    				$(".bola").css("display", "block");
	    				$(".bola #num-incidencias").text(resp);
	    			}
	    		}
	    	});
	    	
	    });
    
    </script>
    
</body>
</html>

<% } %>