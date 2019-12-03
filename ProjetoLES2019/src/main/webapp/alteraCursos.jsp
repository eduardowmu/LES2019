<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, br.edu.les2019.domain.*" %>
<%@ page import="java.util.*, br.edu.les2019.result.*" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Dados do Curso</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="CSS/principal.css" rel="stylesheet">
    </head>
	<body>
		<div>
    		<nav class="navbar navbar-fixed-top navbar-inverse navbar-solid">
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
						<h2 class="barra"><b id=titulo>Cadastrar Cursos</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAdm.jsp">Página Inicial</a></li>
							<li><a class="barra-direita" href="principal.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			<% 	Result result = (Result)session.getAttribute("result");
				Course course = null;
				if(result != null)
				{	if(result.getMsg() != null && (result.getMsg().contains("Categoria não definido") ||
						result.getMsg().contains("Curso sem grupo de precificação definido")))
					if(!result.getEntities().isEmpty() && result.getEntities() != null)
					{	for(EntityDomain e : result.getEntities())
						{	if(e instanceof Course)
							{	course = (Course)e;
								break;
							}
						}
					}
				}
			%>
			<fieldset>
				<legend>Dados do Cursos</legend>
				<form action="CourseServlet" method="post">
						<b>Dados do Curso</b><br/>
						<br/>
						Instrutor:
						<input type="hidden" name="id" id="id" value="<%	if(course != null)
																			{out.print(course.getId());}
																		%>"/>
						<input type="text" name="instrutor" id="instrutor" value="<%	if(course != null)
																						{out.print(course.getInstructor());}
																					%>" required/>
						<br/>
						Categoria:
						<select name="cat">
							<%	if(course != null)
								{	if(course.getCategoria().equals("Linguagem de Programação"))
									{	out.print("<option selected>Linguagem de Programação</option>" +
												  "<option>Hardware</option>" +
												  "<option>Software</option>");
									}
									
									else if(course.getCategoria().equals("Hardware"))
									{	out.print("<option>Linguagem de Programação</option>" +
											  	  "<option selected>Hardware</option>" +
											  	  "<option>Software</option>");
									}
								
									else if(course.getCategoria().equals("Software"))
									{	out.print("<option>Linguagem de Programação</option>" +
										  	  	  "<option>Hardware</option>" +
										  	  	  "<option selected>Software</option>");
									}
								}
								
								else
								{	out.print("<option>Linguagem de Programação</option>" +
												"<option>Hardware</option>" + 
												"<option>Software</option>");
								}
							%>
						</select>
						Titulo:
						<input type="text" name="titulo" id="titulo" value="<%	if(course != null)
																				{out.print(course.getName());}
																			%>" required/>
						Descrição:
						<input type="text" name="descricao" id="descricao" value="<%	if(course != null)
																						{out.print(course.getDescricao());}
																					%>" required/>
						<br/>
						Valor:
						<input type="number" id="valor" name="valor" value="<%	if(course != null)
																				{out.print(course.getPrice());}
																			%>" required/>
						Grupo de Precificação:
						<select name="grupo">
							<%	if(course != null)
								{	if(course.getGrupoP().equals("x1.15"))
									{	out.print("<option selected>x1.15</option>" + 
													"<option>x1.25</option>" + 
													"<option>x1.50</option>");
									}
								
									else if(course.getGrupoP().equals("x1.25"))
									{	out.print("<option>x1.15</option>" + 
											"<option selected>x1.25</option>" + 
											"<option>x1.50</option>");
									}
								
									else if(course.getGrupoP().equals("x1.50"))
									{	out.print("<option>x1.15</option>" + 
											"<option>x1.25</option>" + 
											"<option selected>x1.50</option>");
									}
								}
							
								else
								{	out.print("<option>x1.15</option>" + 
												"<option>x1.25</option>" +
												"<option>x1.50</option>");
								}
							%>
						<select/>
						<button type="submit" name="action" id="action" class="btn btn-primary" value="update">
							Salvar
						</button>
				</form>
			</fieldset>
		</div>
		<div id="rodape2" align="bottom">
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
                                    <li class="item-rede-social"><a href="https://www.linkedin.com/in/sergio-paulo-ferreira-24760724/">
                                        <img src="imagens/sergio.jpg" class="img-circle">
                                        <br/>
                                        Sergio
                                    </a></li><li class="item-rede-social"><a href="https://www.linkedin.com/in/emurakoshi/">
                                        <img src="imagens/eu.png" class="img-circle">
                                        <br/>
                                        Eduardo
                                    </a></li>
                                </ul>
                        </div>
			    	</div>
			    	<div align="center"><p id="copy">&copy; 2019 - FATEC - Mogi das Cruzes</p></div>
			    </div>
			</footer>
	    </div>
	</body>
</html>