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
	    <link href="CSS/pagamento.css" rel="stylesheet">
	    <script>
	    	function alerta()
	    	{alert("Parabéns seu curso foi comprado com sucesso");}
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
			<form action="MyServlet" method="post">
				<fieldset>
					<legend>Falta pouco para iniciar seu novo curso</legend>
					<table>
						<tr>
							<td>
								<label>Cartão de Crédito:</label>
								<input type="radio" id="cartao" name="cartao" value="principal" checked/>
								<label>Principal</label>
								<input type="radio" id="cartao" name="cartao" value="outro"/>
								<label>Outro</label><br/>
								<label>Bandeira:</label>
								<input type="radio" id="bandeira" name="bandeira" value="visa" checked/>
								<img src="imagens/visa.png"/>
								<input type="radio" id="bandeira" name="bandeira" value="master"/>
								<img src="imagens/master.png"/>
								<input type="number" id="numero" name="numero" class="form-control" 
									placeholder="Digite os 16 números do cartão"/>
								<input type="text" id="nome" name="nome" class="form-control"
									placeholder="Nome do proprietário no cartão"/>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td>
								<input type="radio" id="pagamento" name="pagamento" value="a vista" checked/>
								<label>a vista</label>
								<input type="radio" id="pagamento" name="pagamento" value="a prazo"/>
								<label>a prazo</label><br/>
								<input type="radio" id="duasX" name="duasX" value="2"/><label>2x</label>
								<input type="radio" id="tresX" name="tresX" value="3"/><label>3x</label>
								<input type="radio" id="quatroX" name="quatroX" value="4"/><label>4x</label>
							</td>
							<td><a name="pagar" class="btn btn-primary form-control" onclick="alerta()" href="inicialAluno.html">Finalizar</a></td>
						</tr>
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