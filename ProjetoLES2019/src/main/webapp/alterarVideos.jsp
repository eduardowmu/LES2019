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
		<title>Cadastrar Cursos</title>
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
							ao bot�o -->
						<button type="button" class="navbar-toggle collapsed" 
							data-toggle="collapse" data-target="#barra-navegacao">
							<!-- bot�o que aparece quando a tela fica menor
								de forma que n�o fique vis�vel alguns componentes -->
							<span class="sr-only">Alternar navega��o</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<!-- compatibilidade para dispositivos menores-->
					<div class="collapse navbar-collapse" id="barra-navegacao">
						<h2 class="barra"><b id=titulo>Altera��o de Videos</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAdm.jsp">P�gina Inicial</a></li>
							<li><a class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			<% 	Result result = (Result)session.getAttribute("result");
				Video video = null;
				if(result != null)
				{	if(!result.getEntities().isEmpty() && result.getEntities() != null)
					{	for(EntityDomain e : result.getEntities())
						{	if(e instanceof Video)
							{	video = (Video)e;
								break;
							}
						}
					}
				}
			%>
			<fieldset>
				<legend>Altera��o de Videos</legend>
				<form action="VideoServlet" method="post">
						<input type="hidden" name="video_id" value="<%	if(video != null)
																		{out.print(video.getId());}
																		%>"/>
																		
						<input type="hidden" name="curso_id" value="<%	if(video != null)
																		{out.print(video.getCourse().getId());}
																		%>"/>
						
						Titulo:
						<input type="text" name="titulo" id="titulo" value="<%	if(video != null)
																				{out.print(video.getTitle());}
																			%>" required/>
						Descri��o:
						<input type="text" name="descricao" id="descricao" value="<%if(video != null)
																					{out.print(video.getDescription());}
																					%>" />
						<br/>
						Dura��o:
						<input type="number" id="tempo" name="tempo" value="<%	if(video != null)
																				{out.print(video.getTime());}
																			%>" required/>
						<br/>
						Frame:
						<input type="text" name="frame" id="frame" value="<%	if(video != null)
																				{out.print(video.getLink());}
																			%>" required/>
						
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
			    				<li class="item"><a href="#">Portf�lio</a></li>
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