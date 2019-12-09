<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, br.edu.les2019.domain.*" %>
<%@ page import="java.util.*, br.edu.les2019.result.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Gerenciar Videos</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="CSS/gerenciarClientes.css" rel="stylesheet">
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
						<h2 class="barra"><b id=titulo>Gerenciar Videos</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAdm.jsp">| Página Inicial |</a></li>
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form">
			<%	Result result = (Result)session.getAttribute("result");
				Course course = null;
				if(result != null)
				{	if(result.getEntities() != null && !result.getEntities().isEmpty())
					{	for(EntityDomain ed:result.getEntities())
						{	if(ed instanceof Course)
							{course = (Course)ed;}
						}
					}
				}
			%>
			<table align="center">
				<tr>
					<td class="formulario"><br/>
						<a name="novo" href="cadastroVideos.jsp" 
							class="btn btn-primary form-control">Novo Video</a>
					</td>
				</tr>
			</table>
		</div><br/>
		<div>
			<table id="stuvideo" width = "600px" border="1px" align="center"
				 class="table table-striped table-bordered table-hover table-condensed">
			<tr align="center">
				<td class="tabela"><b>Codigo</b></td>
				<td class="tabela"><b>Titulo Video</b></td>
				<td class="tabela"><b>Duração</b></td>
				<td class="tabela"><b>Descrição</b></td>
				<td class="tabela"><b>Alterar</b></td>
				<td class="tabela"><b>Deletar</b></td>
			</tr>
			<%	if(course != null)
				{	for(Video video:course.getVideos())
					{	out.print("<form action='VideoServlet' method='post'><tr>" + 
							"<input type='hidden' name='codigo' value='"+course.getId()+"'/>"+
							"<input type='hidden' name='video_id' value='"+video.getId()+"'/>"+
							"<input type='hidden' name='titulo' value='"+video.getTitle()+"'/>"+
							"<input type='hidden' name='tempo' value='"+video.getTime()+"'/>"+
							"<input type='hidden' name='descricao' value='"+video.getDescription()+"'/>"+
							"<td class='linha' align='center'>"+video.getId()+"</td>"+
							"<td class='linha' align='center'>"+video.getTitle()+"</td>"+
							"<td class='linha' align='center'>"+video.getTime()+"</td>"+
							"<td class='linha' align='center'>"+video.getDescription()+"</td>"+
							"<td class='linha' align='center'>"+
								"<button type='submit' id='action' name='action' value='show'><img src='imagens/edit_pencil_6320.png'></button></td>"+
							"<td class='linha' align='center'>"+
								"<button type='submit' class='btn-excluir' name='action' id='action' value='delete'>"+
									"<img src='imagens/seo-social-web-network-internet_262_icon-icons.com_61518.png'>"+
								"</button></td>"+
					  "</tr></form>");
					}
				}
			%>
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