<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,br.edu.les2019.result.*" %>
<%@ page import = "java.util.*,br.edu.les2019.domain.*" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Página Inicial - Aluno</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	    <link href="CSS/loginAluno.css" rel="stylesheet">
	</head>
	<body>
		<div>
		<%	Result result = (Result)session.getAttribute("result"); %>
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
						<h2 class="barra"><b id=titulo><%	if(result != null && (result.getMsg().contains("Bem vindo") ||
																result.getMsg().contains("Dados alterados")))
															{	out.print(result.getMsg());
																for(EntityDomain ed:result.getEntities())
																{	if(ed instanceof Client)
																	{	out.print(" " + ed.getName());
																		break;
																	}
																}
															}
														%></b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="principal.html">Página Inicial</a></li>
							<li><a name="cursos" class="barra-direita" href="cursos_compra.jsp">Cursos</a></li>
							<li><a name="logout" class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="left">
			<form action="ClientServlet" method="post">
				<input type="hidden" name="id" id="id" value="<%	if(result != null)
																	{	for(EntityDomain ed:result.getEntities())
																		{	if(ed instanceof User)
																			{	out.print(ed.getId());
																				break;
																			}
																		}
																	}
																%>"/>
				<fieldset>
					<legend>Acesso Rápido</legend>
					<table>
						<tr>
							<td>
								<a class="btn btn-primary form-control" href="alterarUsuario.jsp">
									Dados Pessoais
								</a>
							</td>
							<td align="center">
								<button type="submit" class="btn btn-primary form-control" name="action" id="action"
									value="delete" onclick="delete()">Encerrar Conta
								</button>
							</td>
						</tr>
						<tr>
							<td>
								<a name="curso" class="btn btn-primary form-control" value="meusCursos" href="meusCursos.jsp">
								Meus Cursos</a>
							</td>
							<td align="center">
								<a class="btn btn-primary form-control" id="logout" href="principal.html">
								Sair</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a class="btn btn-primary form-control" value="LogarFuncionario" href="alterarSenha.html">
									Alterar Senha</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a class="btn btn-primary form-control" id="carrinho" href="meusCupons.jsp">
									Meus Cupons</a>
							</td>
						</tr>
						<tr>
							<td align="center">
								<a class="btn btn-primary form-control" id="transacoes" href="transacoes.html">
								Histórico de Transações</a>
							</td>
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