<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,br.edu.les2019.result.*" %>
<%@ page import = "java.util.*,br.edu.les2019.domain.*" %>
<%@ page import = "java.text.DecimalFormat.*"%>
<%@ page import = "java.text.DecimalFormatSymbols.*"%>
<%@ page import = "java.text.*"%>
<!--possibilita usar a tag core, que chama o looping forEach--> 
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<title>Meus Cursos</title>
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
		  crossorigin="anonymous"></script>
	   	<script>
	    	$(document).ready(function()
	    	{	confirmouSla = false;
	    		$(".btn-troca").on("click", function(e) 
	    		{	if (!confirmouSla) 
	    			{	e.preventDefault();
	    				confirmouSla = confirm("Tem certeza que deseja gerar um cupom de troca?");
		    			if(confirmouSla) {$(this).click();}
	    			} 
	    		});
	    	});
	    </script>
	    <link href="CSS/ListaFuncionarios.css" rel="stylesheet">
	    <script src="scripts.js"></script>
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
						<h2 class="barra">
							<b id=titulo>Meus Cursos</b>
							<%	Result result = (Result)session.getAttribute("result");
							Client client = null;
							if(result != null)
							{	for(EntityDomain ed:result.getEntities())
								{	if(ed instanceof Client)
									{	client = (Client)ed;
										out.print("<br/>" +client.getName());
									}
								}
							}
						%>
						</h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="alterarUsuario.jsp">| Dados Pessoais |</a></li>
							<li><a class="barra-direita" href="alterarSenha.html">| Alterar Senha |</a></li>
							<li><a class="barra-direita" href="meusCupons.jsp">| Meus Cupons |</a></li>
							<li><a class="barra-direita" href="cursos_compra.jsp">| Comprar Cursos |</a></li>
							<li><a class="barra-direita" href="transacoes.jsp">| Histórico de Transações |</a></li>
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul><br><br>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form">
			<form action="CourseServlet" method="get">
				<%	if(client != null)
					{out.print("<input type='hidden' name='clientID' value='"+client.getId()+"'/>");}
				%>
				<table align="center">
					<thead>
					<tr>
						<td class="formulario"><br/>
							<!-- <input type="text" id="nome" name="nome" placeholder="Nome do curso" 
								size="30" class="form-control"/> -->
						</td>
						<td class="formulario"><br/>
							<!-- <input type="text" name="instrutor" placeholder="Nome do instrutor" max="11"
								size="30" class="form-control"/> -->
						</td>
						<td class="formulario"><br/>
							<!-- <label>Categoria:</label>
							<select name="categoria" id="categoria">
								<option></option>
								<option>Programação</option>
								<option>Desenvolvimento</option>
								<option>IoT</option>
								<option>Sistemas</option>
								<option>Segurança</option>
								<option>Redes</option>
							</select> -->
						</td>
					</tr>
					</thead>
				</table>
				<table align="center">
					<tr>
						<td class="formulario"><br/>
							<!-- <button type="submit" name="action" id="action" value="search" 
								class="btn btn-primary form-control">Consultar</button> -->
						</td>
					</tr>
				</table>
			</div><br/>
			</form>
			<div id="tabela">
				<table class="table table-striped table-bordered table-hover table-condensed">
					<tr align="center">
						<td class="tabela"><b>Nome</b></td>
						<td class="tabela"><b>Categoria</b></td>
						<td class="tabela"><b>Instrutor</b></td>
						<td class="tabela"><b>Valor</b></td>
						<td class="tabela"><b>Assistir Videos</b></td>
						<td class="tabela"><b>Realizar Prova</b></td>
						<td class="tabela"><b>Solicitar Certificado</b></td>
						<td class="tabela"><b>Solicitar Troca</b></td>
					</tr>
				<%	if(result != null)
					{	if(client != null)
						{	if(client.getSales() != null && !client.getSales().isEmpty())
							{	for(Sale sale:client.getSales())
								{	for(Item item:sale.getListItem())
									{	out.print("<form action='MyServlet2' method='post'>"+
														"<input type='hidden' id='cliID' name='cliID' value="+client.getId()+"/>" + 
														"<tr align='center'>" +
															"<input type='hidden' name='item_id' value='"+item.getId()+"'/>" +
															"<input type='hidden' name='item_code' value='"+item.getCode()+"'/>" +
															"<input type='hidden' name='sale_id' value='"+sale.getId()+"'/>" +
															"<input type='hidden' name='course_id' value='"+item.getCourse().getId()+"'/>" +
															"<input type='hidden' name='course_name' value='"+item.getCourse().getName()+"'/>" +
															"<td class='linha'>" + 
																item.getCourse().getName() + "</td>" +
															"<input type='hidden' name='categoria' value='"+item.getCourse().getCategoria()+"'/>" +
															"<td class='linha'>" + 
																item.getCourse().getCategoria() + "</td>" +
															"<input type='hidden' name='categoria' value='"+item.getCourse().getInstructor()+"'/>" +
															"<td class='linha'>" + 
																item.getCourse().getInstructor() + "</td>" +
															"<input type='hidden' name='valor' value='"+item.getCourse().getPrice()+"'/>" +
															"<td class='linha'> R$" + 
																item.getCourse().RealFormat(item.getCourse().getPrice()) + "</td>" +
															"<input type='hidden' name='valor' value='"+item.getCourse().getPrice()+"'/>" +
															"<td class='linha'><a href='videos.jsp'><img src='imagens/video.png'></a></td>" +
															"<td class='linha'><a href='#'><img src='imagens/prova.png'></a></td>" + 
															"<td class='linha' align='center'><a href='#'><img src='imagens/diploma.png'></a></td>" +
															"<td class='linha' align='center'>" +
																"<button type='submit' id='action' name='action' class='btn btn-link btn-troca form-control' value='gerarCupom'>" +
																	"<img src='imagens/troca.png'></button></td>" +
														"<tr/></form>");
									}
								}
							}
						}
					}
				%>
				</table>
		</div>
		<div id="rodape2">
	    	<footer id="rodape">
			    <div class="container">
			    	<div class="row">
			    		<div class="col-md-2">
			    			<h4>A Empresa</h4>
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
			    					Sergio
			    				</a></li><li class="item-rede-social"><a href="https://www.linkedin.com/in/emurakoshi/">
			    					<img src="imagens/eu.png" class="img-circle">
			    					<br/>
			    					Eduardo<br/>
			    				</a></li>
			    			</ul>
			    		</div>
			    	</div>
			    	<div align="center"><p id="copy">&copy; 2019 - Fatec de Mogi das Cruzes</p></div>
			    </div>
			</footer>
	    </div>
	</body>
</html>