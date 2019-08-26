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
		<title>Gerenciar Clientes</title>
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
						<h2 class="barra"><b id=titulo>Gerenciar Clientes</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAdm.jsp">| P�gina Inicial |</a></li>
							<li><a class="barra-direita" href="#">| Pesquisar Clientes |</a></li>
							<li><a class="barra-direita" href="principal.html">| Sair |</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			<%	Result result = (Result)session.getAttribute("result");
				DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
			%>
			<form action="ClientServlet" method="post">
				<fieldset>
					<legend>Visualiza��o Geral</legend>
					<table>
						<tr>
							<td>
								<input type="number" name="id" id="id" placeholder="C�digo do cliente"/>
							</td>
							<td>
								<input type="text" name="name" id="name" placeholder="Nome do cliente"/>
							</td>
							<td>
								<input type="text" name="surname" id="surname" placeholder="Sobrenome do cliente"/>
							</td>
						</tr>
						<tr>
							<button type="submit" name="action" id="action" value="search">Buscar</button>
						</tr>
					</table>
					<table id="stusuarios" width = "600px" border="1px" align="center">
						<tr align="center">
							<td class="tabela"><b>Id</b></td>
							<td class="tabela"><b>Nome</b></td>
							<td class="tabela"><b>Sobrenome</b></td>
							<td class="tabela"><b>CPF</b></td>
							<td class="tabela"><b>Genero</b></td>
							<td class="tabela"><b>Telefone</b></td>
							<td class="tabela"><b>Data de Nascimento</b></td>
							<td class="tabela"><b>E-mail</b></td>
							<td class="tabela"><b>Ativar/Inativar</b></td>
						</tr>
							<%	if(result!=null)
								{	for(EntityDomain ed:result.getEntities())
									{	if(ed instanceof Client)
										{	Client client = (Client)ed;
											System.out.println(client.getId());
											out.print("<tr align='center'><td class='tabela'>"+client.getId()+"</td>"+
													  "<td class='tabela'>"+client.getName()+"</td>"+
													  "<td class='tabela'>"+client.getSurname()+"</td>"+
													  "<td class='tabela'>"+client.getCpf()+"</td>"+
													  "<td class='tabela'>"+client.getGenero()+"</td>"+
													  "<td class='tabela'>"+client.getPhone().toString()+"</td>"+
													  "<td class='tabela'>"+df.format(client.getBirthday())+"</td>"+
													  "<td class='tabela'>"+client.getEmails().get(0)+"</td>"+
													  "<td class='tabela'><img src='imagens/disable_remove_delete_exit_close_11881.png'/></td></tr>");
										}
									}
								}
							%>
					</table>
				</fieldset>
			</form>
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