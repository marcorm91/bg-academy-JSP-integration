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
    <title>Ver Incidencias - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-incidencias">

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
                                <i class="fa fa-plus fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Añadir Elemento </span>
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
                                <i class="fa fa-commenting fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Ver Incidencias de Profesores y Alumnos </span>
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
                            <a class="nav-link" href="/Logout" title="Salir">
                                <i class="fa fa-sign-out fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Salir </span>
                            </a>
                        </li>
                        <li class="nav-item hidden-md-down" id="conectadoComo">  
                            <span class="nav-link">
                                Conectado como 
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[2]); %> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_gest[2]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Buscar Incidencia</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> ¿Qué tipo de incidencia desea buscar? </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-briefcase fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="incidencias-profesor"></i> <p> Incidencias de <br/> Profesor </p>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="incidencias-alumno"></i> <p> Incidencias de <br/> Alumno </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-xs-12">
                                <a href="../principal-gestor.jsp"> <i class="fa fa-arrow-left fa-4x" aria-hidden="true"></i>  </a>
                                <p> Volver </p>
                            </div>
                        </div>
                    </div> 
                </div>
            </div>
    </div>
    
 <!------- SUBPANELES DE INCIDENCIAS ------->
    
 <!-- Subpanel incidencias profesor -->
 <div id="subpanel-incidencia-profesor">
    <div class="container">
        <div class="row menu-busqueda">
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-search fa-1x" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Palabra clave">
                </div>
            </div>
                        
            <div class="col-md-2">
                <button type="button" class="btn btn-primary">Buscar</button>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12">
                <table class="table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>NIF/NIE</th>
                      <th>E-mail</th>
                      <th>Curso/s asignado/s</th>
                      <th>Ver incidencia</th>
                      <th>Resolución</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>Martín</td>
                      <td>43323456W</td>
                      <td>marco@gmail.com</td>
                      <td>B1 - Nivel Intermedio, <br/> B2/1 - Nivel Intermedio</td>
                     <td class="tabla-incidencia-ver"><a href="#"><i class="fa fa-bolt" aria-hidden="true"></i></a></td>
                     <td class="tabla-incidencia-resolucion"><i class="fa fa-thumbs-up" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>32345654A</td>
                      <td>antonio@gmail.com</td>
                      <td>A1 - Nivel Básico, <br/> B2/1 - Nivel Intermedio</td>
                      <td class="tabla-incidencia-ver"><a href="#"><i class="fa fa-bolt" aria-hidden="true"></i></a></td>
                      <td class="tabla-incidencia-resolucion"><i class="fa fa-thumbs-up" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Adelina</td>
                      <td>Gutiérrez</td>
                      <td>López</td>
                      <td>35656677Z</td>
                      <td>adelina@gmail.com</td>
                      <td>C1 - Nivel Avanzado</td>
                      <td class="tabla-incidencia-ver"><a href="#"><i class="fa fa-bolt" aria-hidden="true"></i></a></td>
                      <td class="tabla-incidencia-resolucion"><i class="fa fa-thumbs-down" aria-hidden="true"></i></td>
                    </tr>
                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center paginacion-busq">
                <nav>
                    <ul class="pagination">
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Anterior</span>
                          </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Siguiente</span>
                          </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="ver-incidencias.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel incidencias alumno -->
<div id="subpanel-incidencia-alumno">
    <div class="container">
        <div class="row menu-busqueda">
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-search fa-1x" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Palabra clave">
                </div>
            </div>
                    
            <div class="col-md-2">
                <button type="button" class="btn btn-primary">Buscar</button>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12">
                <table class="table">
                  <thead>
                    <tr>
                      <th>ID</th>
                      <th>Nombre</th>
                      <th>Apellido 1</th>
                      <th>Apellido 2</th>
                      <th>E-mail</th>
                      <th>Curso asignado</th>
                      <th>Ver incidencia</th>
                      <th>Resolución</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>Martín</td>
                      <td>marco@gmail.com</td>
                      <td>B1 - Nivel Intermedio</td>
                      <td class="tabla-incidencia-ver"><a href="#"><i class="fa fa-bolt" aria-hidden="true"></i></a></td>
                      <td class="tabla-incidencia-resolucion"><i class="fa fa-thumbs-up" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>antonio@gmail.com</td>
                      <td>A1 - Nivel Básico</td>
                      <td class="tabla-incidencia-ver"><a href="#"><i class="fa fa-bolt" aria-hidden="true"></i></a></td>
                      <td class="tabla-incidencia-resolucion"><i class="fa fa-thumbs-up" aria-hidden="true"></i></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Adelina</td>
                      <td>Gutiérrez</td>
                      <td>López</td>
                      <td>adelina@gmail.com</td>
                      <td>C1 - Nivel Avanzado</td>
                      <td class="tabla-incidencia-ver"><a href="#"><i class="fa fa-bolt" aria-hidden="true"></i></a></td>
                      <td class="tabla-incidencia-resolucion"><i class="fa fa-thumbs-down" aria-hidden="true"></i></td>
                    </tr>
                  </tbody>
                </table> 
            </div>
        </div>
        
        <div class="row paginacion-busq">
            <div class="col-xs-12 text-xs-center">
                <nav>
                    <ul class="pagination">
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                            <span class="sr-only">Anterior</span>
                          </a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                          <a class="page-link" href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                            <span class="sr-only">Siguiente</span>
                          </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
        
        <div class="row">
            <div class="col-xs-12 text-xs-center btn-atras">
                 <a href="ver-incidencias.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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


    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    
</body>
</html>

<% } %>