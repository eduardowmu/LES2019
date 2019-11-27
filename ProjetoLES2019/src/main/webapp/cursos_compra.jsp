<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,br.edu.les2019.result.*" %>
<%@ page import = "java.util.*,br.edu.les2019.domain.*" %>
<%@ page import = "java.text.*"%>
<!--possibilita usar a tag core, que chama o looping forEach--> 
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<title>Courses</title>
		<!-- Bootstrap -->
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements
    	     and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via
	         file://-->
	    <!--[if lt IE 9]>
	    <script src=
	      "https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js">
	    </script>
	    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js">
	    </script>
	    <![endif]-->
	    <script
		  src="https://code.jquery.com/jquery-3.4.1.min.js"
		  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		  crossorigin="anonymous">
	    </script>
	   	<link href="CSS/cursos.css" rel="stylesheet">
	</head>
	<body>
		<div>
    		<nav class="navbar navbar-fixed-top navbar-inverse navbar-transparente">
				<div class="container">
					<!-- Estrutura de Header -->
					<div class="navbar-header">
						<!-- na classe foi inserido o mesmo nome dado a
							classe da <div></div> para linkar as listas
							ao botão -->
						<button type="button" class="navbar-toggle collapsed" 
							data-toggle="collapse" data-target="#barra-navegacao">
							<!-- botão que aparece quando a tela fica menor
								de forma que não fique visível alguns componentes -->
							<span class="sr-only">Alternar navegação</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<!-- compatibilidade para dispositivos menores-->
					<div class="collapse navbar-collapse" id="barra-navegacao">
						<h2 class="barra"><b id=titulo>Cursos</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="meusCursos2.jsp">| Paginal Inicial |</a></li>
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			<%	Result result = (Result)session.getAttribute("result");
				Client client = null;
				if(result != null)
				{	if(result.getEntities() != null &&
						!result.getEntities().isEmpty())
					{	for(EntityDomain ed:result.getEntities())
						{	if(ed instanceof Client)
							{	client = (Client)ed;
								break;
							}
						}
					}
				}
			%>
			<fieldset>
				<legend>Cursos Disponíveis</legend>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<thead>
						<tr>
							<td class="tabela">Curso</td>
							<td class="tabela">Titulo</td>
							<td class="tabela">Valor (R$)</td>
						</tr>
						<%	if(result != null && client != null)
							{	int i = 0;
								NumberFormat nf = new DecimalFormat("0.00");
								for(EntityDomain ed:result.getEntities())
								{	if(ed instanceof Course)
									{	Course course = (Course)ed;
										out.print("<form action='MyServlet2' method='get'>" +
													"<input type='hidden' id='clientID' name='clientID' value='" + client.getId() + "'/>" +
											 		"<input type='hidden' id='courseID' name='courseID' value='" + ed.getId() + "'/>" +
												 	"<tr><td class='linha' align='center'>" +
													  		"<button type='submit' class='btn btn-link' name='action' id='"+i+"' value='viewItem'>" + 
													 			"<img src='" + ed.getPhoto() + "' width='50px' height='50'/>" +
													  		"</button></td>" +
														"<td class='linha' align='center'>" + ed.getName() + "</td>" +
														"<td class='linha' align='center'>" + 
															nf.format(course.getTotalPrice(course.getPrice(), course.getGrupoP())) + 
														"</td>" +
													"</tr>" + 
												  "</form>");
										i++;
									}
								}
							}
						%>
						<!-- <tr>
							<td class="video">
								<a href="carrinho.html">
								<a href="curso_informacao.jsp" name="angular_info">
									<img src="imagens/angular.PNG" width="250px"/>
									Angular<br/>R$ 50,00
								</a>
							</td>
							<td class="video">
								<a href="curso_informacao2.jsp">
									<img src="imagens/engenharia.PNG" width="250px"/>
									Curso Básico de Python<br/>R$ 25,00
								</a>
							</td>
							<td class="video">
								<a href="curso_informacao3.jsp">
									<img src="imagens/tortoise.PNG" width="250px"/>
									Curso de Orientação a Objetos com Java<br/>R$ 60,00
								</a>
							</td>
							<td class="video">
								<a href="curso_informacao4.jsp">
									<img src="imagens/project.PNG" width="250px"/>
									Curso Completo de Photoshop<br/>R$ 35,00
								</a>
							</td>
						</tr>
						<tr>
							<td class="video">
								<a  href="#">
									<img src="imagens/segurança.PNG" width="250px"/>
									Segurança da Informação<br/>R$ 10,00
								</a>
							</td>
							<td class="video">
								<a href="#">
									<img src="imagens/mean.PNG" width="250px"/>
									Curso de CRUD Mean<br/>R$ 10,00
								</a>
							</td>
							<td class="video">
								<a href="#">
									<img src="imagens/Csharp.PNG" width="250px"/>
									Cursod e POO com C#<br/>R$ 10,00
								</a>
							</td>
							<td class="video">
								<a href="#">
									<img src="imagens/sql.PNG" width="250px"/>
									SQL Server<br/>R$ 10,00
								</a>
							</td>
						</tr> -->
					</thead>
				</table>
			</fieldset>
		</div>
		<div id="rodape2">
	    	<footer id="rodape">
			    <div class="container">
			    	<div class="row">
			    		<div class="col-md-2">
			    			<h4>Company</h4>
			    			<ul class="nav">
			    				<li class="item"><a href="#">Sobre</a></li>
			    				<li class="item"><a href="#">Empregos</a></li>
			    				<li class="item"><a href="#">Imprensa</a></li>
			    			</ul>
			    		</div>
			    		<div class="col-md-2">
			    			<h4>Comunidades</h4>
			    			<ul class="nav">
			    				<li class="item"><a href="#">Artistas</a></li>
			    				<li class="item"><a href="#">Desenvolvedores</a></li>
			    				<li class="item"><a href="#">Portfólio</a></li>
			    			</ul>
			    		</div>
			    		<div class="col-md-4">
			    			<ul class="nav">
			    				<li class="item-rede-social"><a href="https://www.linkedin.com/school/fatec-mogi-das-cruzes/about/">
			    					<img src="imagens/linkedin.png" class="img-circle">
			    				</a></li>
			    				<li class="item-rede-social"><a href="https://www.linkedin.com/in/junior-cesar-57710a133/">
			    					<img src="imagens/sergio.jpg" class="img-circle">
			    					<br/>
			    					Sérgio<br/>
			    					Ferreira<br/>
			    				</a></li><li class="item-rede-social"><a href="https://www.linkedin.com/in/emurakoshi/">
			    					<img src="imagens/eu.png" class="img-circle">
			    					<br/>
			    					Eduardo<br/>
			    					Full Stack<br/>
			    					developer
			    				</a></li>
			    			</ul>
			    		</div>
			    	</div>
			    	<div align="center"><p id="copy">&copy; 2019 - Fatec de Mogi das Cruzes</p></div>
			    </div>
			</footer>
	    </div>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>