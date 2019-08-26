<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!--possibilita usar a tag core, que chama o looping forEach--> 
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Courses</title>
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
	    <link href="CSS/cadastro.css" rel="stylesheet">
	    <script>
	    	function alerta() {alert("Novo curso criado com sucesso!");}
	    </script>
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
						<h2 class="barra"><b id=titulo>Cursos On-Line</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="#">Login</a></li>
							<li><a class="barra-direita" href="#">Contato</a></li>
							<li><a class="barra-direita" href="#">Empresa</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			<fieldset>
				<legend>Cadastro de curso</legend>
				<form action="MyServlet" method="get">
					<img src=""/>
					<table>
						<tr>
							<td><b>Imagem: </b>
								<input type="file" id="img-curso" name="img-curso" 
									class="form-control"/>
							</td>
							<td>
								<button type="submit" id="envio" name="envio" 
									class="btn btn-primary form-control">
									Enviar
								</button>
							</td>
						</tr>
					</table>
				</form>
				<form action="MyServlet" method="post">
					<table>
						<tr class="dados">
							<td>
								<input type="text" id="titulo" name="titulo" class="dados form-control"
									placeholder="Título do curso" size="43"/>
							</td>
						</tr>
						<tr class="dados">
							<td>
								<input type="text" id="descricao" name="descricao" class="dados form-control"
									placeholder="Descrição" size="43"/>
							</td>
						</tr>
						<tr class="dados">
							<td>
								<input type="text" id="instrutor" name="instrutor" class="dados form-control"
									placeholder="Nome do instrutor" size="43"/>
							</td>
						</tr>
					</table>
					<table align="center">
						<tr class="dados">
							<td><b>Categoria:</b> 
								<select>
									<option>Programação</option>
									<option>Desenvolvimento</option>
									<option>IoT</option>
									<option>Sistemas</option>
									<option>Segurança</option>
									<option>Redes</option>
								</select>
							</td>
							<td><b>Valor(R$):</b> 
								<select>
									<option>R$10,00</option>
									<option>R$20,00</option>
									<option>R$30,00</option>
									<option>R$40,00</option>
									<option>R$50,00</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								<a class="btn btn-primary form-control" 
									id="salvar" name="salvar" onclick="alerta()" width="50px" href="lista.jsp">
									Salvar <img src="imagens/Save_37110.png"/>
								</a>
							</td>
						</tr>
					</table>
				</form>
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
			    				<li class="item-rede-social"><a href="https://www.linkedin.com/in/junior-cesar-57710a133/">
			    					<img src="imagens/sergio.jpg" class="img-circle">
			    					<br/>
			    					Sérgio<br/>
			    					Ferreira<br/>
			    				</a></li><li class="item-rede-social"><a href="https://www.linkedin.com/in/emurakoshi/">
			    					<img src="imagens/eu.png" class="img-circle">
			    					<br/>
			    					Eduardo<br/>
			    					Murakoshi
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