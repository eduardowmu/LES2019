<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
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
	    <link href="CSS/FuncForm.css" rel="stylesheet">
    </head>
    <body>
    	<!-- Barras de Menu -->
    	<div>
    		<nav class="navbar navbar-fixed-top navbar-inverse navbar-transparente">
				<div class="container">
					<!-- Estrutura de Header -->
					<div class="navbar-header">
						<!-- na classe foi inserido o mesmo nome dado a
							classe da <div></div> para linkar as listas ao botão -->
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
							<li><a class="barra-direita" href="CadFunc.jsp">Funcionarios</a></li>
							<li><a class="barra-direita" href="#">Categorias</a></li>
							<li><a class="barra-direita" href="#">Chamados</a></li>
							<li><a class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
    	<!-- Formulário -->
    	<div id="form" align="center">
    		<fieldset>
    			<legend><i><b>Cadastro de Funcionários</b></i></legend>
		        <form action="MyServlet" method="post">
		        	<input type="hidden" id="cf" name="cf" 
													value=""/>
					<table>
		                <thead>
		                <tr>
		                    <td><input type="text" name="nome" id="nome" class="form-control" 
		                    	size="50" placeholder="Nome completo" required 
		                    	value=""/>
		                    </td>
		                    <td><input type="number" name="cpf" id="cpf" class="form-control" 
		                    	size="50" placeholder="Número de CPF" required 
		                    	value=""/>
		                    </td>
		                    <td><input type="email" name="email" id="email" placeholder="e-mail de cobrança" 
		                         size="50" class="form-control" required 
		                    	value=""/>
		                    </td>
		                </tr>
		                <tr>
		                    <td align="center">Regional:<br/>
		                    	<select name="regional" id="regional" class="form-control">
		                    		
		                    	</select>
		                    </td>
		                    <td align="center">Setor:<br/>
		                    	<select name="setor" id="setor" class="form-control">
		                    		
		                    	</select>
		                    </td>
		                    <td align="center">Cargo:<br/>
								<select name="cargo" id="cargo" class="form-control">
		                    		
		                    	</select>
							</td>
		                </tr>
		                <tr>
							<td align="center">Senha:<br/>
								<input type="password" name="senha1" id="senha1" 
									placeholder="8 dig., 1 Caracter especial, 1 letra maicuscula e minuscula" 
									required class="form-control" 
			                    	value=""/>
							</td>
							<td><br/>
								<input type="password" name="senha2" id="senha2" placeholder="Repita a senha" 
									 required class="form-control" 
			                    	value=""/>
							</td>
							<td align="center">Contratado em:<br/>
		                    	<input type="date" name="data" id="data" class="form-control" 
		                    		placeholder="Contratado em" required 
			                    	value=""/>
		                    </td>
						</tr>
						<tr>
							<td><input type="hidden" class="form-control"/></td>
		                    <td align="center"><br/>
		                    	<button type="submit" class="btn btn-primary form-control" name="funcionario" 
		                    		value="CadastrarFuncionario"><img src="imagens/Save_37110.png"/> Cadastrar</button>
		                    </td>
		                </tr>
		            </table>
				</form>
			</fieldset>
		</div>
		<!-- RODAPÉ DA PÁGINA -->
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
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<!-- Include all compiled plugins (below), or include individual files as needed -->
		<script src="bootstrap/js/bootstrap.min.js"></script>
    </body>
</html>