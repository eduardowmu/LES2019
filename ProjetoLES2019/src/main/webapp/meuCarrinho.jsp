<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,br.edu.les2019.result.*" %>
<%@ page import = "java.util.*,br.edu.les2019.domain.*" %>
<%@ page import = "java.text.DecimalFormat.*"%>
<%@ page import = "java.text.DecimalFormatSymbols.*"%>
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
	    <!-- <script type="text/javascript" src="JS/script2.js"></script>
	    <script type="text/javascript" src="JS/script3.js"></script> -->
	    <script type="text/javascript">
	    	function calcularTotal()
	    	{	var cupomNumero = document.getElementById("cupom").value;
	    		var valorCupom = document.getElementById(cupomNumero).value;
		    	var total = document.getElementById("total").value;
		        var total2;
		    	
		        if(parseInt(cupomNumero) > 0)
		        {	total2 = total - valorCupom;
			    	if(total2 > 0)
		        	{	document.getElementById("Total").value = total2.toFixed(2);
			    		document.getElementById("total").value = total2.toFixed(2);
			    	}
			    	
			    	else	{alert("Não poderá comprar sem custo");}
			    }
		    }
	    	//window.load = calcularTotal();
	    </script>
	    <script type="text/javascript">
	    	function resetarTotal()
	    	{	var subtotal = document.getElementById("subtotal").value;
	    		var subT = document.getElementById("sub").value;
	    		document.getElementById("Total").value = subtotal;
	    		document.getElementById("total").value = subT;
	    	}
	    	//window.load = resetarTotal();
	    </script>
	    <script>
	    	$(document).ready(function()
	    	{	$(".btn-delete").on("click", function(e) 
	    		{	e.preventDefault();
    				if(document.getElementById('cupomID').value > 0)
	    			{	var confirmouSla = confirm("Tem certeza que deseja retirar do carrinho?");
			    		if(confirmouSla) {$(this).click();}
		    		}
	    		});
	    	});
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
						<h2 class="barra"><b id=titulo>Meu Carrinho</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="meusCursos.jsp">Página Inicial</a></li>
							<li><a class="barra-direita" href="#">Contato</a></li>
							<li><a class="barra-direita" href="#">Empresa</a></li>
							<li><a class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div style="padding-top:200px;">
		<form action="MyServlet2" method="get">
			<%	Result result = (Result)session.getAttribute("result");
				Client client = null;
				ShopCar scar = null;
				Course course = null;
				double total = 0;
				if(result != null)
				{	for(EntityDomain ed:result.getEntities())
					{	if(ed instanceof ShopCar)
						{scar = (ShopCar)ed;}
						else if(ed instanceof Client)
						{client = (Client)ed;}
					}
				}
			%>
			<input type="hidden" id="clientID" name="clientID" value="<%	if(client != null)	
																			{out.print(client.getId());}
																		%>"/>
			<table cellpadding="0" cellspacing="0" border="0"
				class="table table-striped table-bordered" id="example">
				<thead>
					<tr>
						<th>Cod. Produto</th>
						<th>Titulo</th>
						<th>Preço Unit</th>
						<th>Ação</th>
					</tr>
				</thead>
				<tbody>
					<%	StringBuilder sb = new StringBuilder();
						if(scar != null)
						{	if(scar.getCourses() != null && !scar.getCourses().isEmpty())
							{	int i = 0;
								for(EntityDomain ed:scar.getCourses())
								{	course = (Course)ed;
									String code = "";
									code += String.valueOf(client.getId());
									code += "-";
									code += String.valueOf(course.getId());
									out.print("<tr class='odd gradeX'>" + 
													"<input type='hidden' name='code"+i+"' id='code' value='"+ code +"'/>" +
													"<td class='center'>" + code + "</td>" + 
													"<td class='center'>" + course.getName() + "</td>" +
													"<td class='center'>" + course.RealFormat(course.getPrice()) + "</td>" +
													"<td class='center'>" +
														"<input type='checkbox' name='courseID' value='"+course.getId()+"'/>" +
													"</td>" +
											 "</tr>");
									i++;
								}
								out.print("<input type='hidden' name='qtd_itens' value='"+i+"'/>");
							}
						}
					%>
					<tr>
						<td></td>
						<td>Subtotal R$</td>
						<td>
							<input type="text" id="subtotal" name="subtotal" value="<%	if(scar != null)
																						{	if(scar.getCourses() != null && 
																								!scar.getCourses().isEmpty())
																							{	Course c = null;
																								for(EntityDomain e:scar.getCourses())
																								{	c = (Course)e;
																									total += c.getPrice();
																								}
																								out.print(c.RealFormat(total));
																							}
																						}
																					%>"disabled="disabled"/>
							<input type="hidden" id="sub" name="sub" value="<%out.print(total);%>"/>
						</td>
						<td><button type="submit" name="action" class="btn btn-danger btn-delete" value="deleteItem">Retirar</button></td>
					</tr>
					<tr>
						<td></td>
						<td>Total R$</td>
						<td>
							<input type="text" id="Total" value="<%	if(course != null)
																	{out.print(course.RealFormat(total));}
																	%>" disabled="disabled"/>
							<input type="hidden" name="total" id="total" value="<%out.print(total);%>"/>
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
						<select class="cupom form-control" id="cupom">
							<option value="0">Selecione Cupom</option>
							<%	if(client.getCupons() != null && !client.getCupons().isEmpty())
								{	for(int i = 0; i < client.getCupons().size(); i++)
									{	if(client.getCupons().get(i) != null && 
											client.getCupons().get(i).getStatus().equals("aprovado"))
										{	out.print("<option value='"+(i+1)+"'>");
											out.print(client.getCupons().get(i).getCodigo());
											out.print("</option>");
										}
									}
								}
							%>
						</select>
						<%	for(int j = 0; j < client.getCupons().size(); j++)
							{out.print("<input type='hidden' id='"+(j+1)+"' value='"+client.getCupons().get(j).getValue()+"'/>");}	 
						%>
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
						<button type="submit" class="btn btn-success form-control" 
							name="action" id="finalizar" value="viewSale">Finalizar
						</button>
					</td>
				</tr>
			</table>
		</form>
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