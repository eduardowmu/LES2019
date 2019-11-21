<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--Importação de Lista e pacote onde estão as classes de dominio e controle-->
<%@ page import = "java.text.*" %>
<%@ page import="java.util.*, br.edu.les2019.domain.*" %>
<%@ page import="java.util.*, br.edu.les2019.result.*" %>
<!--possibilita usar a tag core, que chama o looping forEach--> 
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<title>Gerenciar Cupons</title>
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
							<b id=titulo>Gerenciar Cupons</b><br/>
							
						</h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAdm.jsp">| Pagina Inicial |</a></li>
							<li><a class="barra-direita" href="criarCupons.jsp">| Criar Cupom Promocional |</a></li>
							<li><a name="cupons" class="barra-direita" href="gerCuponsPendentes.jsp">| Gerar Cupons Pendentes |</a></li>
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form">
			<form action="CupomServlet" method="post">
				<%	Result result = (Result)session.getAttribute("result");
					Client client = null;
					if(result != null)
					{	if(client != null)
						{	for(EntityDomain ed:result.getEntities())
							{	if(ed instanceof Client)
								{	if(ed.getId() == 1)
									{	client = (Client)ed;
										break;
									}
								}
							}
						}
					}
				%>
				<table align="center">
					<thead>
					<tr>
						<td class="formulario"><br/>
							<input type="text" id="code" name="code" placeholder="Código do cupom" 
								size="30" class="form-control"/>
						</td>
						<td class="formulario"><br/>
							<label>Tipo de Cupom:</label>
							<select name="categoria" id="categoria">
								<option></option>
								<option>Troca</option>
								<option>Promocional</option>
							</select>
						</td>
					</tr>
					</thead>
				</table>
				<table align="center">
					<tr>
						<td class="formulario"><br/>
							<button type="submit" name="action" id="search" value="search" 
								class="btn btn-primary form-control">Consultar</button>
						</td>
					</tr>
				</table>
			</div><br/>
			</form>
			<div>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<tr align="center">
						<td class="tabela"><b>Código</b></td>
						<td class="tabela"><b>Cliente</b></td>
						<td class="tabela"><b>Valor</b></td>
						<td class="tabela"><b>Tipo</b></td>
						<td class="tabela"><b>Status</b></td>
						<td class="tabela"><b>Motivo</b></td>
						<td class="tabela"><b>Aprovar</b></td>
						<td class="tabela"><b>Reprovar</b></td>
					</tr>
					<%	StringBuilder sb = new StringBuilder();
						if(result != null)
						{	for(EntityDomain e:result.getEntities())
							{	if(e instanceof Client)
								{	if(e.getId() > 1)
									{	Client cli = (Client)e;
										for(Cupom cupom:cli.getCupons())
										{	if(cupom != null)
											{	sb.append("<form action='MyServlet2' method='post'>");
												sb.append("<tr align='center'><td class='tabela'>");
												sb.append(cupom.getCodigo() + "<input type='hidden' name='cupom_id' value='");
												sb.append(cupom.getCodigo() + "'/></td>");
												sb.append("<td class='tabela'>" + cli.getName());
												sb.append("<input type='hidden' name='cli_id' value='" + cli.getId() + "'/>");
												sb.append("<input type='hidden' name='cli_name' value='" + cli.getName() + "'/></td>");
												sb.append("<td class='tabela'>" + cupom.getValue());
												sb.append("<input type='hidden' name='cupom_valor' value='" + cupom.getValue() + "'/></td>");
												sb.append("<td class='tabela'>" + cupom.getTipo());
												sb.append("<input type='hidden' name='cupom_tipo' value='" + cupom.getTipo() + "'/></td>");
												sb.append("<td class='tabela'>" + cupom.getStatus());
												sb.append("<input type='hidden' name='cupom_status' value='" + cupom.getStatus() + "'/></td>");
												if(cupom.getMotivo() != null)	{sb.append("<td class='tabela'>"+cupom.getMotivo().getText()+"</td>");}
												
												else {sb.append("<td class='tabela'></td>");}
												
												if(cupom.getStatus().equalsIgnoreCase("pendente"))
												{	sb.append("<td class='tabela'><button type='submit' name='action' value='aprovarCupom' class='btn btn-link acao'>");
													sb.append("<img src='imagens/joia.png'/></button></td>");
													sb.append("<td class='tabela'><button type='submit' name='action' value='reprovarCupom' class='btn btn-link acao'>");
													sb.append("<img src='imagens/nao_joia.png'/></button></td></tr></form>");
												}
												
												else	
												{	sb.append("<td class='tabela'><img src='imagens/joia.png'/></td>");
													sb.append("<td class='tabela'><img src='imagens/nao_joia.png'/></td></tr></form>");
												}
											}
										}
									}
								} 
							}
							out.print(sb);
						}
					%>
				<!-- <tr>
						<td class="linha" align="center">CT000000101</td>
						<td class="linha" align="center">R$ 30,00</td>
						<td class="linha" align="center">31/12/2019</td>
						<td class="linha" align="center">Troca</td>
					</tr>
					<tr>
						<td class="linha" align="center">CT000000102</td>
						<td class="linha" align="center">R$ 20,00</td>
						<td class="linha" align="center">31/12/2019</td>
						<td class="linha" align="center">Troca</td>
					</tr>
					<tr>
						<td class="linha" align="center">CP000000101</td>
						<td class="linha" align="center">R$ 5,00</td>
						<td class="linha" align="center">31/12/2019</td>
						<td class="linha" align="center">Promocional</td>
					</tr>
					<tr>
						<td class="linha" align="center">CP000000102</td>
						<td class="linha" align="center">R$ 10,00</td>
						<td class="linha" align="center">31/12/2019</td>
						<td class="linha" align="center">Promocional</td>
					</tr> -->
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