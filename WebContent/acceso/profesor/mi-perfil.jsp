<%@ page contentType="text/html; charset=UTF-8" %>

<%
//	 DATOS RELEVANTES PARA IMPRIMIR POR PANTALLA
// 	 datos[0] = "iduser";
// 	 datos[1] = "tipouser";
// 	 datos[2] = "nombre";
// 	 datos[3] = "apellido1";
// 	 datos[4] = "apellido2";
// 	 datos[5] = "usuario";
// 	 datos[6] = "pass";
// 	 datos[7] = "fnac";
// 	 datos[8] = "nif";
// 	 datos[9] = "nacimiento";
// 	 datos[10] = "calle";
// 	 datos[11] = "cp";
// 	 datos[12] = "provincia";
// 	 datos[13] = "poblacion";
// 	 datos[14] = "fecalta";
// 	 datos[15] = "email";
// 	 datos[16] = "tlf";
// 	 datos[17] = "anioprom";
// 	 datos[18] = "asignimp";	
%>

<% Object[] datos_prof = (Object []) session.getAttribute("identificacion"); %>

<% 
	// Si la session es nula (sin identificación previa) ó el tipo de user no es profesor...
	if(session.getAttribute("log") == null || !datos_prof[1].equals("P")){  
		response.sendRedirect("error.jsp");
	} else{
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi Perfil - Big Ben Academy</title>
    <link rel="stylesheet" href="../../assets/css/bootstrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../assets/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../../assets/fonts/font-awesome/css/font-awesome.min.css">
	<link rel="shortcut icon" href="../assets/imagenes/favicon.ico">
    <link rel="stylesheet" href="../assets/css/estilos.css">
</head>
    
<body>
    
<div id="bg-academy-principal-prof-miperfil">

    <header id="cabeceraPrincipal">
        <nav class="navbar navbar-light bg-faded">

            <button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#nav-content" id="boton-collapse" aria-expanded="false">
                <i class="fa fa-bars" aria-hidden="true"></i>
            </button>

            <div class="collapse navbar-toggleable-xs" id="nav-content">
                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../principal-profesor.jsp" title="Ir a Panel Principal" >
                                <i class="fa fa-home fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Panel Principal </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./cursos.jsp" title="Ir a Mis Cursos Asignados">
                                <i class="fa fa-folder-open-o fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Cursos Asignados </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="./reg-incidencia.jsp" title="Ir a Registrar Incidencia">
                                <i class="fa fa-pencil fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Registrar Incidencia </span>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a class="nav-link" href="./ver-incidencias.jsp" title="Ir a Ver Incidencias">
                                <i class="fa fa-wrench fa-2x" aria-hidden="true"></i>
                                <span class="hidden-sm-up"> Ir a Ver Incidencias </span>
                            </a>
                        </li>    
                         <li class="nav-item">
                            <a class="nav-link" href="./mi-perfil.jsp" title="Ir a Mi Perfil">
                                <i class="fa fa-user-circle fa-2x btn-select" aria-hidden="true"></i>
                                <span class="hidden-sm-up btn-select"> Ir a Mi Perfil </span>
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
                                <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_prof[2]); %> </span>
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
                    <span id="quien" title="Ir a Mi Perfil"> <% out.print(datos_prof[2]); %> </span>
                    <a href="/Logout"> <span id="desconectar">(Desconectar)</span></a>
                </span> 
            </div>
        
            <div class="panel-principal text-xs-center">
                <img src="../../assets/imagenes/logo.png">
                <h1><a href="../principal-profesor.jsp">Panel Principal</a> / Mi Perfil</h1>
                <hr/>
                <div class="panel-opciones">
                    
                    <h2> Mi Perfil </h2>
                    
                    <div class="container-fluid">
                        
                            <div class="form-group row">
                                <div class="col-xs-12 imagen-perfil">
                                    <img src="../../assets/imagenes/foto-de-perfil.jpg" class="img-circle">
                                </div>
                                <label class="col-xs-12 resolucion-imagen">Resolución de imagen recomendada: 440x615</label>
                                <input type="file" id="img-modificar-gest-perfil" class="col-xs-12 text-xs-center">
                            </div>
                        
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">ID de usuario: </label>
                                <div class="col-md-3 col-xs-12">
                                    <input class="form-control" type="text" id="id-modificar-alumn-perfil" disabled>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Fecha de alta: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" id="alta-modificar-alumn-perfil" disabled>
                                </div>
                            </div>
                        <hr/>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nombre: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="nombre-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 1: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="ape1-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Apellido 2: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="ape2-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">E-mail: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="email-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Población: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="poblacion-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Calle / Vía / Avda: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="calle-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Código postal: </label>
                                <div class="col-md-3 col-xs-12">
                                    <input class="form-control" id="cp-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nacido en: </label>
                                <div class="col-md-9 col-xs-12">
                                    <input class="form-control" id="nacido-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Nacionalidad: </label>
                                <div class="col-md-6 col-xs-12">
                                    <input class="form-control" id="nacionalidad-modificar-alumn-perfil">
                                </div>
                            </div>
                        
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">F. de nacimiento: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" id="fnac-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label class="col-md-3 col-xs-12 col-form-label text-xs-left">Teléfono: </label>
                                <div class="col-md-4 col-xs-12">
                                    <input class="form-control" id="tlf-modificar-alumn-perfil">
                                </div>
                            </div>
                            <div class="form-group row btn-enviar">
                                <div class="col-xs-12">
                                    <button type="button" class="btn btn-primary">Volver</button>
                                    <button type="button" class="btn btn-primary">Modificar</button>
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
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" integrity="sha384-Plbmg8JY28KFelvJVai01l8WyZzrYWG825m+cZ0eDDS1f7d/js6ikvy1+X+guPIB" crossorigin="anonymous"></script>
    <script src="../../assets/js/jquery-3.1.1.min.js"></script>
    <script src="../../assets/js/bootstrap.min.js"></script>
    <script src="../../assets/js/jquery-ui.js"></script>
    <script src="../assets/js/script.js"></script>
    
</body>
</html>

<% } %>