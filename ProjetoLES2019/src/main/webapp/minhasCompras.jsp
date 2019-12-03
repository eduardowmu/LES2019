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
		<title>Minhas Compras</title>
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
	    	/*$(document).ready(function()
	    	{	confirmouSla = false;
	    		$(".btn-troca").on("click", function(e) 
	    		{	if (!confirmouSla) 
	    			{	e.preventDefault();
	    				if(document.getElementById('motivo').value != '')
	    				{	confirmouSla = confirm("Tem certeza que deseja gerar um cupom de troca?");
		    				if(confirmouSla) {$(this).click();}
	    				}
	    				
	    				else alert('Inserir um motivo para solicitação de cupom de troca');
	    			} 
	    		});
	    	});*/
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
						<h3 class="barra">
							<b id=titulo>Minhas Compras</b>
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
						</h3>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="alterarUsuario.jsp">| Dados Pessoais |</a></li>
							<li><a class="barra-direita" href="alterarSenha.html">| Alterar Senha |</a></li>
							<li><a class="barra-direita" href="meusCupons.jsp">| Meus Cupons |</a></li>
							<li><a class="barra-direita" href="cursos_compra.jsp">| Comprar Cursos |</a></li>
							<li><a class="barra-direita" href="transacoes.jsp">| Histórico de Transações |</a></li>
							<!-- <li><a class="barra-direita" href="meuCarrinho.jsp">| Meu Carrinho |</a></li> -->
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul><br><br>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form">
			<%	if(client != null)
				{out.print("<input type='hidden' name='clientID' value='"+client.getId()+"'/>");}
			%>
			<div id="tabela">
				<table class="table table-striped table-bordered table-hover table-condensed">
					<tr align="center">
						<td class="tabela"><b>Código</b></td>
						<td class="tabela"><b>Cursos</b></td>
						<td class="tabela"><b>Valor (R$)</b></td>
						<td class="tabela"><b>status</b></td>
						<td class="tabela"><b>Solicitar Troca</b></td>
					</tr>
				<%	if(result != null)
					{	if(client != null)
						{	List<Course> courses = new ArrayList<>();
							if(client.getSales() != null && !client.getSales().isEmpty())
							{	StringBuilder sb = new StringBuilder();
								NumberFormat nf = new DecimalFormat("0.00");
								for(Sale sale:client.getSales())
								{	sb.append("<form action='CupomServlet' method='post'>");
										sb.append("<input type='hidden' id='cliID' name='cliID' value="+client.getId()+"/>");
										sb.append("<input type='hidden' name='saleID' value='"+sale.getId()+"'/>");
										sb.append("<input type='hidden' name='total' value='"+sale.getTotal()+"'/>");
										sb.append("<tr align='center'>");
											sb.append("<td class='linha'>" + sale.getCode() + "</td>");
											sb.append("<td class='linha'>");
												for(Item item:sale.getListItem())
												{sb.append(item.getCourse().getName()+"<br>");}
											sb.append("</td>");
											sb.append("<td class='linha'>" + nf.format(sale.getTotal()) + "</td>");
											sb.append("<td class='linha'>" + sale.getSaleStatus() + "</td>");
											sb.append("<td class='linha' align='center'>");
											sb.append("<input type='text' name='motivo' id='motivo' placeholder='Motivo da troca'/>");
											sb.append("<button type='submit' id='action' name='action' class='btn btn-link btn-troca form-control' "+
												"value='save'>");
											sb.append("<img src='imagens/troca.png'></button></td><tr/></form>");
								}
								out.print(sb);
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
			    				<li class="item-rede-social"><a href="https://www.linkedin.com/in/sergio-paulo-ferreira-24760724/">
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