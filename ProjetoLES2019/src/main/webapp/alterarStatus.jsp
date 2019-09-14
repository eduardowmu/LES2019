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
		<title>Alterar Status</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="CSS/ListaFuncionarios.css" rel="stylesheet">
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
						<h2 class="barra"><b id=titulo>Alterar Status</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAdm.jsp">Página Inicial</a></li>
							<li><a class="barra-direita" href="loginAdm.html">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			<fieldset>
				<%	Result result = (Result)session.getAttribute("result");
					Client client = null;
					if(result != null && result.getEntities() != null)
					{	for(EntityDomain ed:result.getEntities())
						{	if(ed instanceof Client)
							{	client = (Client)ed;
								break;
							}
						}
					}
				%>
				<legend>Dados do Pedido</legend>
				<form action="ClientServlet" method="post">
						<b>Número:  </b>00000115
						<!-- <input type="text" name="nome" value="<% if(client != null)	
																 {out.print(client.getName());}
																%>" required/> -->
						<br/>
						<b>Valor Total:  </b>R$ 80,00
						<!-- <input type="text" name="sobrenome" value="<% if(client != null)	
							 										  {out.print(client.getSurname());}
																	%>" required/> -->
						<br/>
						<b>Data de Realização:  </b>09/09/2019
						<!-- <input type="text" name="cpf" value="<% if(client != null)	
							 									{out.print(client.getCpf());}
															 %>" required/> -->
						<br/>
						<b>Pagamento:</b>Aprovado
						<br/>
						<b>Status de Entrega: </b>
						<select name="banner">
							<option><!--<%	if(client == null || client.getCard().getBanner().equals("Entregue"))	
				 			 			{out.print("selected");} 
				 			 		%>-->Entregue</option>
							<option> <!--<%	if(client != null && client.getCard().getBanner().equals("Cancelado"))	
				 			 			{out.print("selected");} 
				 			 		%>-->Cancelado</option>
						</select>
						<br/><br/>
						<a name="action" id="action" class="btn btn-primary" value="save" href='gerenciarPedidos2.jsp'>
							Atualizar Status
						</a>
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