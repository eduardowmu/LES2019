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
		<title>ULearn</title>
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
	    	function alerta()
	    	{alert("Curso Ativado com sucesso!");
	    		
	    	}
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
							<b id=titulo>ULearn Cursos em TI</b><br/>
							
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
							<input type="text" id="nome" name="nome" placeholder="Nome do curso" 
								size="30" class="form-control"/>
						</td>
						<td class="formulario"><br/>
							<input type="text" name="instrutor" placeholder="Nome do instrutor" max="11"
								size="30" class="form-control"/>
						</td>
						<td class="formulario"><br/>
							<label>Categoria:</label>
							<select>
								<option>Programação</option>
								<option>Desenvolvimento</option>
								<option>IoT</option>
								<option>Sistemas</option>
								<option>Segurança</option>
								<option>Redes</option>
							</select>
						</td>
					</tr>
					</thead>
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
					</tr>
				</table>
			</div><br/>
			</form>
			<div>
				<table class="table table-striped table-bordered table-hover table-condensed">
					<tr align="center">
						<td class="tabela"><b>Curso</b></td>
						<td class="tabela"><b>Nome</b></td>
						<td class="tabela"><b>Duração (horas)</b></td>
						<td class="tabela"><b>Categoria</b></td>
						<td class="tabela"><b></b>Instrutor</td>
						<td class="tabela"><b>Qtd Alunos</b></td>
						<td class="tabela"><b>Valor</b></td>
						<td class="tabela"><b>E-mail instrutor</b></td>
						<td class="tabela"><b>Data do cadastro</b></td>
						<td class="tabela"><b>Status</b></td>
						<td class="tabela"><b>Ativar/Inativar Curso</b></td>
						<td class="tabela"><b>Add Videos</b></td>
					</tr>
					<tr>
						<td class="linha" align="center">
							<img src="imagens/angular.PNG" class="form-control">
						</td>
						<td class="linha" align="center">Angular</td>
						<td class="linha" align="center">100</td>
						<td class="linha" align="center">Programação</td>
						<td class="linha" align="center">Loiane Groner</td>
						<td class="linha" align="center">1000</td>
						<td class="linha" align="center">R$ 10,00</td>
						<td class="linha" align="center">loiane.groner@gmail.com</td>
						<td class="linha" align="center">10/10/2015</td>
						<td class="linha" align="center">Inativo</td>
						<td align="center">
							<a name="ativar" onclick="alerta()" href="lista2.jsp"><img src='imagens/disable_remove_delete_exit_close_11881.png'/></a>
						</td>
						<td align="center"><a name="addVideo" href="videos.jsp"><img src='imagens/addProj.jpg'/></a></td>
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