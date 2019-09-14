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
		<title>Meu Carrinho</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="CSS/cadastro.css" rel="stylesheet">
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
	    <script type="text/javascript" src="JS/script2.js"></script>
	    <script type="text/javascript" src="JS/script3.js"></script>
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
						<h2 class="barra"><b id=titulo>Meu Carrinho</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="principal.html">Página Inicial</a></li>
							<li><a class="barra-direita" href="#">Contato</a></li>
							<li><a class="barra-direita" href="#">Empresa</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div style="padding-top:200px;">
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>Cod. Produto</th>
						<th>Descrição do Produto</th>
						<th>Preço Unit</th>
						<th>Valores</th>
						<th>Ação</th>
					</tr>
				</thead>
				<tbody>
					<tr class="odd gradeX">
						<td>AAAAAAA</td>
						<td>Angular</td>
						<td class="center">R$ 50,00</td>
						<td class="center">R$ 50,00</td>
						<td class="center">
							<button type="submit" class="btn btn-danger"
								id="action" name="action" value="delete">
								Trocar
							</button>
						</td>
					</tr>
					
					<tr>
						<td></td>
						<td></td>
						<td>Subtotal R$</td>
						<td>
							<input type="number" id="subTotal" name="subTotal" value="50" 
								disabled="disabled"/>
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td>Total R$</td>
						<td>
							<input type="number" id="total" name="total" value="50"
								disabled="disabled"/>
						</td>
						<td>
							<button type="button" class="btn btn-warning" onclick="resetarTotal()">
								Reiniciar Total
							</button>
						</td>
					</tr>
				</tbody>
			</table>
			<table align="center">
				<tr>
					<td>
						<input type="text" id="cupom1" name="cupom1" class="cupom form-control"
							placeholder="Código do 1º cupom"/>
					</td>
					<td>
						<input type="text" id="cupom2" name="cupom2" class="cupom form-control" 
							placeholder="Código do 2º cupom"/>
					</td>
					<td>
						<button type="button" class="btn btn-primary form-control" 
							onclick="calcularTotal()">Add Cupom
						</button>
					</td>
				</tr>
				<tr>
					<td>
						<a  class="btn btn-warning form-control" 
							href="cursos_compra.jsp">Continuar Comprando
						</a>
					</td>
					<td>
						<a class="btn btn-success form-control" href="pagamento.jsp">Finalizar</a>
					</td>
				</tr>
			</table>
			
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