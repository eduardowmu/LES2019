<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, br.edu.les2019.domain.*" %>
<%@ page import="java.util.*, br.edu.les2019.result.*" %>
<%@ page import="java.text.*"%>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Página Inicial - Administrador</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="CSS/principal.css" rel="stylesheet">
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
		  /*google.charts.load('current', {'packages':['corechart']});
		  google.charts.setOnLoadCallback(drawChart);
		  google.charts.setOnLoadCallback(drawChart2);
		  function drawChart() {
			var data = google.visualization.arrayToDataTable([
			  ['Mês', 'Receitas (R$)', 'Despesas (R$)'],
			  ['JAN',  15000,      7000],
			  ['FEV',  11700,      7600],
			  ['MAR',  7000,       7120],
			  ['ABR',  10300,      7400],
			  ['MAI',  12000,      7000],
			  ['JUN',  11700,      7600],
			  ['JUL',  7600,       7120],
			  ['AGO',  10300,      7400],
			]);
	
			var options = {
			  title: 'Performance da Empresa - 2019',
			  curveType: 'function',
			  width:500,
			  height:500,
			  legend: { position: 'bottom' }
			};
	
			var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
	
			chart.draw(data, options);
		  }*/
		</script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript">
		  // Carrega a API de Visualização e o pacote base de gráficos.
		  /*google.charts.load('current', {'packages':['corechart']});
		  // Define uma chamada para rodar quando a API de visualização é carregada.
		  google.charts.setOnLoadCallback(drawChart2);
		  // Função que cria e preenche os dados da tabela, instancia o gráfico, passa os dados e desenha.
		  function drawChart2() {
			// Cria a tabela de dados.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Segmento');
			data.addColumn('number', 'Qtde Vendida');
			data.addRows([
			  ['Linguagem de Programação', 47],
			  ['WebDesign', 35],
			  ['Hardware', 15],
			]);
	
			// Define opções do gráfico
			var options = {'title':'Participação nas Vendas por Segmento',
						   'width':500,
						   'height':500};
	
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_pizza'));
			chart.draw(data, options);
		  }
	
			 chart.draw(data, options);*/
		</script>
		<style>
		#curve_chart{
			float: left;
		}
	
		#chart_pizza{
			float: left;
		}
		</style>
	</head>
	<body>
		<div id="form">
			<% Result result = (Result)session.getAttribute("result"); %>
    		<nav class="navbar navbar-fixed-top navbar-inverse navbar-solid">
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
						<h2 class="barra"><b id=titulo>Bem Vindo<br /> <%	if(result != null/* && (result.getMsg().contains("Bem vindo") ||
																		result.getMsg().contains("Dados alterados"))*/)
																	{	//out.print(result.getMsg());
																		for(EntityDomain ed:result.getEntities())
																		{	if(ed instanceof Client)
																			{	if(ed.getId() == 1)
																				{	out.print(" " + ed.getName());
																					break;
																				}
																			}
																		}
																	} %></b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="ListaCursos.jsp"> | Gerenciar Cursos |</a></li>
							<li><a name ="gerpedidos" class="barra-direita" href="gerenciarVendas.jsp"> | Gerenciar Vendas |</a></li>
							<!-- <li><a name ="gertrocacancel" class="barra-direita" href="gerTrocaCancel.jsp"> | Gerenciar Trocas/Cancelamentos |</a></li> -->
							<li><a class="barra-direita" href="gerenciarCupons.jsp">| Gerenciar Cupons |</a></li>
							<li><a class="barra-direita" href="gerenciarClientes.jsp">| Gerenciar Clientes |</a></li>
							<li><a class="barra-direita" href="gerarRelatorios.jsp">| Gerar Relatórios |</a></li>
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
			<%		DateFormat df = new SimpleDateFormat("dd/MM/yyyy");%>
			<table id="stusuarios" width = "600px" border="1px" align="center"
					 class="table table-striped table-bordered table-hover table-condensed">
					<tr align="center">
						<td class="tabela"><b>Classificação</b></td>
						<td class="tabela"><b>Id</b></td>
						<td class="tabela"><b>Cliente</b></td>
						<td class="tabela"><b>Total R$</b></td>
					</tr>
					<%	StringBuilder sb = new StringBuilder();
						if(result!=null)
						{	for(EntityDomain ed:result.getEntities())
							{	if(ed instanceof Ranking)
								{	Ranking rank = (Ranking)ed;
									NumberFormat nf = new DecimalFormat("0.00");
									//System.out.println(client.getId());
									if(rank != null)
									{	for(int i = 0; i < rank.getClients().size(); i++)
										{	sb.append("<tr align='center'><td class='tabela'>"+(i+1)+"º</td>");
											sb.append("<td class='tabela'>"+rank.getCodes().get(i)+"</td>");
											sb.append("<td class='tabela'>"+rank.getClients().get(i)+"</td>");
											sb.append("<td class='tabela'>"+nf.format(rank.getValues().get(i))+"</td></tr>");
										}
										break;
									}
								}
							}
							out.print(sb);
						}
					%>
					</table>
		<div id="left"></div>
		<div id="right"></div>
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