<%@ page contentType="text/html; charset=UTF-8" %>




<% if(session.getAttribute("log") == null){  
	response.sendRedirect("error.jsp");
} else{
%>

<% Object[] datos_gest = (Object []) session.getAttribute("identificacion"); %>

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
                            <a class="nav-link" href="../../index.jsp" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                        <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[1]); %> </span>
                                <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[1]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
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
                                   data-target="#modal-aniadir-profesor"></i> <p> Registrar <br/> Profesor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   data-target="#modal-aniadir-alumno"></i> <p> Registrar <br/> Alumno </p>
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
 <form id="form-reg-profesor" action="/Regprofesor" method="post">
 <div class="modal fade" id="modal-aniadir-profesor" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row text-xs-center">
                <h5>REGISTRAR PROFESOR</h5>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nombre-profesor" id="nombre-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido1" id="apellido-1-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido2" id="apellido-2-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">NIF / NIE:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="nif" id="nifnie-profesor" required>
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
                    <input class="form-control" type="text" name="nacimiento" id="nacimiento-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nacionalidad:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nacionalidad" id="nacionalidad-profesor" required>
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
                    <input class="form-control" type="text" name="calle" id="calle-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Código Postal:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="cp" id="cp-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Población:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="poblacion" id="poblacion-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Provincia:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="provincia" id="provincia-profesor" required>
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
                    <input class="form-control" type="text" name="email" id="email-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="tlf" id="tlf-profesor" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año promoción:</label>
                <div class="col-md-7">
                    <!-- PROMOCIONES CURSOS REGISTRADOS PREVIAMENTE -->
                    <select class="form-control" name="anio-curso" id="anio-curso" required>
                        <option>2011 - 2012</option>
                        <option>2012 - 2013</option>
                        <option>2013 - 2014</option>
                        <option>2014 - 2015</option>
                        <option>2015 - 2016</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Cursos a impartir:</label>
                <div class="col-md-7">
                    <!-- CURSOS REGISTRADOS PREVIAMENTE -->
                    <select multiple class="form-control" name="cursos" id="cursos-profesor" required>
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
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
</div>
</form>
    
    
 <!-- REGISTRAR ALUMNO -->
  <form id="form-reg-alumno" action="/Regalumno" method="post">
 <div class="modal fade" id="modal-aniadir-alumno" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row text-xs-center">
                <h5>REGISTRAR ALUMNO</h5>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nombre-alumno" id="nombre-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido1" id="apellido-1-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="apellido2" id="apellido-2-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">NIF / NIE:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="nif" id="nifnie-alumno" required>
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
                    <input class="form-control" type="text" name="nacimiento" id="nacimiento-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nacionalidad:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="nacionalidad" id="nacionalidad-alumno" required>
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
                    <input class="form-control" type="text" name="calle" id="calle-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Código Postal:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="cp" id="cp-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Población:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="poblacion" id="poblacion-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Provincia:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" name="provincia" id="provincia-alumno" required>
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
                    <input class="form-control" type="text" name="email" id="email-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" name="tlf" id="tlf-alumno" required>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año promoción:</label>
                <div class="col-md-7">
                    <!-- PROMOCIONES CURSOS REGISTRADOS PREVIAMENTE -->
                    <select class="form-control" id="anio-curso" name="anio-curso" required>
                        <option>2011 - 2012</option>
                        <option>2012 - 2013</option>
                        <option>2013 - 2014</option>
                        <option>2014 - 2015</option>
                        <option>2015 - 2016</option>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Selección de curso:</label>
                <div class="col-md-7">
                    <!-- CURSOS REGISTRADOS PREVIAMENTE -->
                    <select class="form-control" id="curso-alumno" name="curso" required>
                        <option>[A1] - Nivel Básico - 1er Curso</option>
                        <option>[A2] - Nivel Básico - 2º Curso </option>
                        <option>[B1] - Nivel Intermedio - 3er Curso</option>
                        <option>[B2] - Nivel Avanzado - 4º Curso</option>
                        <option>[B2] - Nivel Avanzado - 5º Curso</option>
                        <option>[C1] - Nivel Avanzado - 6º Curso</option>
                        <option>[C2] - Nivel Avanzado - 7º Curso</option>
                    </select>
                </div>
            </div>
            <div class="form-group contenedor-comentarios">
                <label class="col-md-3 col-form-label push-md-1">Comentarios:</label>
                    <div class="col-md-7">
                        <textarea class="form-control" name="comentarios" id="comentario-alumno" rows="7" required></textarea>
                    </div>
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
</div>
</form>
    
<!-- REGISTRAR NOTICIARIO -->
 <div class="modal fade" id="modal-aniadir-noticiario" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row text-xs-center">
                <h5>REGISTRAR NOTICIARIO</h5>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="nombre-noticiario">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="apellido-1-noticiario">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="apellido-2-noticiario">
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
                    <input class="form-control" type="text" id="fecha-alta-noticiario" disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">E-mail:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="email-noticiario">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" id="tlf-noticiario">
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>

<!-- REGISTRAR GESTOR -->
 <div class="modal fade" id="modal-aniadir-gestor" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row text-xs-center">
                <h5>REGISTRAR GESTOR</h5>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos personales </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Nombre:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="nombre-gestor">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 1:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="apellido-1-gestor">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Apellido 2:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="apellido-2-gestor">
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
                    <input class="form-control" type="text" id="fecha-alta-gestor" disabled>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">E-mail:</label>
                <div class="col-md-7">
                    <input class="form-control" type="text" id="email-gestor">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Teléfono:</label>
                <div class="col-md-4">
                    <input class="form-control" type="text" id="tlf-gestor">
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>
    
<!-- REGISTRAR CURSO -->
 <div class="modal fade" id="modal-aniadir-curso" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container">
            <div class="row text-xs-center">
                <h5>REGISTRAR CURSO</h5>
            </div>
            <div class="row">
                <div class="col-xs-12">
                    <h6> Datos curso </h6>
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Tipo curso:</label>
                <div class="col-md-7">
                    <select class="form-control" id="curso-alumno">
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
                    <input class="form-control" type="text" id="anio-inicial-curso">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-md-3 col-form-label push-md-1">Año fin: </label>
                <div class="col-md-2">
                    <input class="form-control" type="text" id="anio-fin-curso">
                </div>
            </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary">Registrar</button>
      </div>
    </div>
  </div>
 </div>  
</div>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>    
    <script src="../assets/js/script.js"></script>
    
</body>
</html>

<% } %>