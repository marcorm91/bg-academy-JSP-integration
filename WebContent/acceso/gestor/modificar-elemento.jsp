<%@ page contentType="text/html; charset=UTF-8" %>

<% Object[] datos_gest = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es gestor...
	if(session.getAttribute("log") == null || datos_gest[3] != "G"){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar Elementos - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-gest-modificar">

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
                                <i class="fa fa-edit fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Editar Elemento </span>
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
                            <a class="nav-link" href="/Logout" title="Salir">
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
                <h1><a href="../principal-gestor.jsp">Panel Principal</a> / Modificar Elemento</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> ¿Qué desea modificar? </h2>
                    
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-briefcase fa-4x" aria-hidden="true" data-toggle="modal" 
                                   id="modificar-profesor"></i> <p> Modificar <br/> Profesor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-graduation-cap fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="modificar-alumno"></i> <p> Modificar <br/> Alumno </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-newspaper-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="modificar-noticiario"></i> <p> Modificar <br/> Noticiario </p>
                            </div>
                        </div>
                        <div class="row">                       
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-user-o fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="modificar-gestor"></i> <p> Modificar <br/> Gestor </p>
                            </div>
                            <div class="col-md-4 col-xs-12">
                                <i class="fa fa-book fa-4x" aria-hidden="true" data-toggle="modal"
                                   id="modificar-curso"></i> <p> Modificar <br/> Curso </p>
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
    
 <!------- SUBPANELES DE BÚSQUEDA ------->
    
 <!-- Subpanel profesor -->
 <div id="subpanel-modificar-profesor">
    <div class="container">
        <div class="row menu-busqueda">
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-search fa-1x" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Palabra clave">
                </div>
            </div>
            
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-list fa-1x" aria-hidden="true"></i></span>
                       <select class="form-control">
                            <option>- Seleccione curso -</option>
                            <option value="a1">A1 - Nivel Básico</option>
                            <option value="s2">A2 - Nivel Básico</option>
                            <option value="b1">B1 - Nivel Intermedio</option>
                            <option value="b2-1">B2/1 - Nivel Avanzado</option>
                            <option value="b2-2">B2/2 - Nivel Avanzado</option>
                            <option value="c1">C1 - Nivel Avanzado</option>
                            <option value="c2">C2 - Nivel Avanzado</option>
                       </select>
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
                      <th>Modificar</th>
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
                     <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>32345654A</td>
                      <td>antonio@gmail.com</td>
                      <td>A1 - Nivel Básico, <br/> B2/1 - Nivel Intermedio</td>
                    <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Adelina</td>
                      <td>Gutiérrez</td>
                      <td>López</td>
                      <td>35656677Z</td>
                      <td>adelina@gmail.com</td>
                      <td>C1 - Nivel Avanzado</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
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
                 <a href="modificar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel alumno -->
<div id="subpanel-modificar-alumno">
    <div class="container">
        <div class="row menu-busqueda">
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-search fa-1x" aria-hidden="true"></i></span>
                        <input type="text" class="form-control" placeholder="Palabra clave">
                </div>
            </div>
            
            <div class="col-md-3 col-xs-12">
                <div class="input-group">
                    <span class="input-group-addon"> <i class="fa fa-list fa-1x" aria-hidden="true"></i></span>
                       <select class="form-control">
                            <option>- Seleccione curso -</option>
                            <option value="a1">A1 - Nivel Básico</option>
                            <option value="s2">A2 - Nivel Básico</option>
                            <option value="b1">B1 - Nivel Intermedio</option>
                            <option value="b2-1">B2/1 - Nivel Avanzado</option>
                            <option value="b2-2">B2/2 - Nivel Avanzado</option>
                            <option value="c1">C1 - Nivel Avanzado</option>
                            <option value="c2">C2 - Nivel Avanzado</option>
                       </select>
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
                      <th>Curso asignado</th>
                      <th>Modificar</th>
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
                      <td>B1 - Nivel Intermedio</td>
                     <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>32345654A</td>
                      <td>antonio@gmail.com</td>
                      <td>A1 - Nivel Básico</td>
                    <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>3</td>
                      <td>Adelina</td>
                      <td>Gutiérrez</td>
                      <td>López</td>
                      <td>35656677Z</td>
                      <td>adelina@gmail.com</td>
                      <td>C1 - Nivel Avanzado</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
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
                 <a href="modificar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel noticiario -->
<div id="subpanel-modificar-noticiario">
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
                      <th>Modificar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>Martín</td>
                      <td>marco@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>antonio@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
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
                 <a href="modificar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
    
<!-- Subpanel curso -->
<div id="subpanel-modificar-curso">
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
                      <th>Año inicio</th>
                      <th>Año fin</th>
                      <th>Curso</th>
                      <th>Alumnos inscritos</th>
                      <th>Modificar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>2011</td>
                      <td>2012</td>
                      <td>[A1] - Nivel Básico - 1er Curso</td>
                      <td> 12 </td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>2011</td>
                      <td>2012</td>
                      <td>[B2] - Nivel Avanzado - 4º Curso</td>
                      <td> 8 </td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
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
                 <a href="modificar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
            </div>
        </div>
    </div>
</div>
<!-- Subpanel noticiario -->
<div id="subpanel-modificar-gestor">
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
                      <th>Modificar</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>Marco</td>
                      <td>Romero</td>
                      <td>Martín</td>
                      <td>marco@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>Antonio</td>
                      <td>Guzmán</td>
                      <td>Martínez</td>
                      <td>antonio@gmail.com</td>
                      <td class="tabla-info"><a href="#"><i class="fa fa-pencil" aria-hidden="true"></i></a></td>
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
                 <a href="modificar-elemento.jsp"> <button class="btn btn-primary"> Volver </button> </a>
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