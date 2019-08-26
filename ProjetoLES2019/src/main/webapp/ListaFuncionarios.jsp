<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--Importação de Lista e pacote onde estão as classes de dominio e controle-->
<%@ page import = "java.text.*" %>
<!--possibilita usar a tag core, que chama o looping forEach--> 
<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="UTF-8">
		<title>Funcionarios</title>
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
	    		$(".btn-excluir").on("click", function(e) 
	    		{	if (!confirmouSla) 
	    			{	e.preventDefault();
	    				confirmouSla = confirm("Tem certeza que deseja excluir?");
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
							<span class="icon-bar"></span>
						</button>
					</div>
					<!-- compatibilidade para dispositivos menores-->
					<div class="collapse navbar-collapse" id="barra-navegacao">
						<h2 class="barra">
							<b id=titulo>Sistema de Atendimento</b><br/>
							
						</h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="#">Funcionarios</a></li>
							<li><a class="barra-direita" href="#">Categorias</a></li>
							<li><a class="barra-direita" href="#">Chamados</a></li>
							<li><a class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form">
			<form action="MyServlet" method="get">
				<table align="center">
					<thead>
					<tr>
						<td class="formulario"><br/>
							<input type="number" name="matricula" placeholder="matrícula (Somente números)" 
								size="30" class="form-control"/>
						</td>
						<td class="formulario"><br/>
							<input type="text" name="nome" placeholder="Nome Completo" 
								size="30" class="form-control"/>
						</td>
						<td class="formulario"><br/>
							<input type="number" name="cpf" placeholder="Numero de CPF" max="11"
								size="30" class="form-control"/>
						</td>
						<td class="formulario"><br/>
							<input type="text" name="email" placeholder="e-mail" 
								size="30" class="form-control"/>
						</td>
					</tr>
					</thead>
					<tr>
						<td class="formulario">Contratado em:<br/>
							<input type="date" name="data" width="90px" class="form-control""/>
						</td>
						<td class="formulario"><br/>
							<select name="setor" id="setor" class="form-control">
								<option value = "0">Setor</option>
								<!-- <option value = "1">Recursos Humanos</option>
		                    	<option value = "2">Tecnologia da Informacao</option>
		                    	<option value = "3">Suprimentos</option>
		                    	<option value = "4">Marketing</option>
		                    	<option value = "5">Pos Venda</option>
		                    	<option value = "6">Engenharia</option> -->
							</select>
						</td>
						<td class="formulario"><br/>
							<select name="regional" id="regional" class="form-control">
		                    	<option value="0">Regional</option>
								<!-- <option value="1">Zona Sul</option>
		                    	<option value="2">Zona Leste</option>
		                    	<option value="3">Zona Norte</option>
		                    	<option value="4">Zona Oeste</option>
		                    	<option value="5">Mogi das Cruzes</option> -->
		                    </select>
						</td>
						<td class="formulario"><br/>
							<select name="cargo" id="cargo" class="form-control">
		                    	<option value="0">Cargo</option>
								<!-- <option value="1">Engenheiro</option>
		                    	<option value="2">Secretario</option>
		                    	<option value="3">Operador</option>
		                    	<option value="4">Desenvolvedor</option>
		                    	<option value="5">Analista</option> -->
		                    </select>
						</td>
					</tr>
				</table>
				<table align="center">
					<tr>
						<%	String user_email = "";
							int user_id = 0;
						 %>
						<td style="display:none;">
						<input type="hidden" id="cf" name="cf" 
														value=""/>
						<%out.print("<input type='hidden' id='cf1' name='cf1' value='"+user_id+"'/>"); %>
						</td>
						<td class="formulario"><br/>
							<button type="submit" name="funcionario" value="ConsultarFuncionario" 
								class="btn btn-primary form-control">Consultar</button>
						</td>
						<td class="formulario"><br/>
							<button type="submit" name="funcionario" value="FormularFuncionario" 
								class="btn btn-success form-control">Cadastrar</button>
						</td>
					</tr>
				</table>
			</div><br/>
			</form>
			<div>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<tr align="center">
						<td class="tabela"><b>Matricula</b></td>
						<td class="tabela"><b>Nome</b></td>
						<td class="tabela"><b>CPF</b></td>
						<td class="tabela"><b>Admissão</b></td>
						<td class="tabela"><b>Setor</b></td>
						<td class="tabela"><b>Cargo</b></td>
						<td class="tabela"><b>Regional</b></td>
						<td class="tabela"><b>E-mail</b></td>
						<td class="tabela"><b>Status</b></td>
						<td class="tabela"><b>Data do cadastro</b></td>
						<td class="tabela"><b>Excluir</b></td>
						<td class="tabela"><b>Editar</b></td>
						<td class="tabela"><b>Ativar/<br/>Inativar</b></td>
					</tr>
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
			    					<img src="imagens/Erinilson.png" class="img-circle">
			    					<br/>
			    					Erinilson<br/>
			    					Business<br/>
			    					Analisty
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
	</body>
</html>