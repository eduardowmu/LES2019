<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*, br.edu.les2019.domain.*" %>
<%@ page import="java.util.*, br.edu.les2019.result.*" %>
<%@ page import = "java.text.*"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<meta name="robots" content="noindex, nofollow">
  		<meta name="googlebot" content="noindex, nofollow">
		<title>Gerar Relat�rios</title>
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link href="CSS/principal.css" rel="stylesheet">
		
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
		<script type="text/javascript" src="jQuery.js"></script>
    	
    	<script type="text/javascript">
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawSale);
		
		//google.charts.setOnLoadCallback(drawBasic);
		  
		  var queryObject3="";
		  var queryObjectLen3="";
		  $.ajax({
            type : 'GET',
            url : 'api3.jsp',
            dataType:'json',
            success : function(data) {
                queryObject3 = eval('(' + JSON.stringify(data) + ')');
                queryObjectLen3 = queryObject3.empdetails.length;
            },
                error : function(xhr, type) {
                //alert('server error occoured');
            }
        });
	  
	  // Fun��o que cria e preenche os dados da tabela, instancia o gr�fico, passa os dados e desenha.
	  function drawSale() {
        	
        // Cria a tabela de dados.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Data');
		data.addColumn('number', 'Venda');
		data.addColumn('number', 'Custo');
		for(var i=0;i<queryObjectLen3;i++)
		{	var venda = parseFloat(queryObject3.empdetails[i].Venda);
			var custo = parseFloat(queryObject3.empdetails[i].Custo);
			var time = queryObject3.empdetails[i].Data;
			
			data.addRows([
				  [time, venda, custo]
				]);
		}
		/*
		// Define op��es do gr�fico
		var options = {'title':'Grafico de Venda e custo',
					   'width':500,
					   'height':500,
					   legend: { position: 'bottom' }
					   };*/
		
		var options = {
		          title: 'Company Performance',
		          curveType: 'function',
		          legend: { position: 'bottom' }
		        };

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.LineChart(document.getElementById('chart_sale'));
		chart.draw(data, options);
	  }
		</script>
		
		<script type="text/javascript">
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawCourse);
		
		//google.charts.setOnLoadCallback(drawBasic);
		  
		  var queryObject4="";
		  var queryObjectLen4="";
		  $.ajax({
            type : 'GET',
            url : 'api4.jsp',
            dataType:'json',
            success : function(data) {
                queryObject4 = eval('(' + JSON.stringify(data) + ')');
                queryObjectLen4 = queryObject4.empdetails.length;
            },
                error : function(xhr, type) {
                //alert('server error occoured');
            }
        });
	  
	  // Fun��o que cria e preenche os dados da tabela, instancia o gr�fico, passa os dados e desenha.
	  function drawCourse() {
        	
        // Cria a tabela de dados.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Curso');
		data.addColumn('number', 'Qtd');
		for(var i=0;i<queryObjectLen4;i++)
		{	var cur = queryObject4.empdetails[i].Curso;
			var qtd = parseInt(queryObject4.empdetails[i].Qtd);
			
			data.addRows([
				  [cur, qtd]
				]);
		}
		
		// Define op��es do gr�fico
		var options = {'title':'Quantidade de Cupons de troca - Por Curso',
					   'width':500,
					   'height':500,
					   legend: { position: 'bottom' }
					   };

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_course'));
		chart.draw(data, options);
	  }
		</script>
    	
		<script type="text/javascript">
		
			google.charts.load('current', {'packages':['corechart']});
			google.charts.setOnLoadCallback(drawChart);
			
			  
			  var queryObject="";
			  var queryObjectLen="";
			  $.ajax({
	            type : 'GET',
	            url : 'api.jsp',
	            dataType:'json',
	            success : function(data) {
	                queryObject = eval('(' + JSON.stringify(data) + ')');
	                queryObjectLen = queryObject.empdetails.length;
	            },
	                error : function(xhr, type) {
	                //alert('server error occoured');
	            }
	        });
		  
		  // Fun��o que cria e preenche os dados da tabela, instancia o gr�fico, passa os dados e desenha.
		  function drawChart() {
	        	
	        // Cria a tabela de dados.
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Categoria');
			data.addColumn('number', 'Quantidade');
			for(var i=0;i<queryObjectLen;i++)
			{	var cat = queryObject.empdetails[i].Categoria;
				var valor = parseInt(queryObject.empdetails[i].Quantidade);
				
				data.addRows([
					  [cat, valor]
					]);
			}
			
			// Define op��es do gr�fico
			var options = {'title':'Cursos vendidos em % - Por Categoria',
						   'width':500,
						   'height':500,
						   legend: { position: 'bottom' }
						   };
	
			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_pizza'));
			chart.draw(data, options);
		}
		  //chart.draw(data, options);
		</script>
		
		<script type="text/javascript">
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawBasic);
		
		  var queryObject2="";
		  var queryObjectLen2="";
		  $.ajax({
            type : 'GET',
            url : 'api2.jsp',
            dataType:'json',
            success : function(data) {
                queryObject2 = eval('(' + JSON.stringify(data) + ')');
                queryObjectLen2 = queryObject2.empdetails.length;
            },
                error : function(xhr, type) {
                //alert('server error occoured');
            }
        });
	  
	  // Fun��o que cria e preenche os dados da tabela, instancia o gr�fico, passa os dados e desenha.
	  function drawBasic() {
        	
        // Cria a tabela de dados.
		var data = new google.visualization.DataTable();
		data.addColumn('string', 'Status');
		data.addColumn('number', 'Quantidade');
		for(var i=0;i<queryObjectLen2;i++)
		{	var sts = queryObject2.empdetails[i].Status;
			var valor = parseInt(queryObject2.empdetails[i].Quantidade);
			
			data.addRows([
				  [sts, valor]
				]);
		}
		
		

		// Define op��es do gr�fico
		var options = {'title':'Quantidade de solicita��o de cupons de troca - Por status',
					   'width':500,
					   'height':500,
					   legend: { position: 'bottom' }
					   };

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	  }
		</script>
		

		
		<script type="text/javascript">
		
			$(document).ready(function(){
				// Third load 
	            drawSale();
	            
	         	// Set interval to call the drawChart again
	            setInterval(drawSale, 1000);
	            
	            //fourth load
	            drawCourse();
	            
	         	// Set interval to call the drawChart again
	            setInterval(drawCourse, 1000);
				
				// First load the chart once 
		        drawChart();
		        // Set interval to call the drawChart again
		        setInterval(drawChart, 1000);
		        
				// Second load the chart once 
	            drawBasic();
	            // Set interval to call the drawChart again
	            setInterval(drawBasic, 1000);
	            
	            
	        });
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
			
    		<nav class="navbar navbar-fixed-top navbar-inverse navbar-solid">
				<div class="container">
					<!-- Estrutura de Header -->
					<div class="navbar-header">
						<!-- na classe foi inserido o mesmo nome dado a
							classe da <div></div> para linkar as listas
							ao bot�o -->
						<button type="button" class="navbar-toggle collapsed" 
							data-toggle="collapse" data-target="#barra-navegacao">
							<!-- bot�o que aparece quando a tela fica menor
								de forma que n�o fique vis�vel alguns componentes -->
							<span class="sr-only">Alternar navega��o</span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
					</div>
					<!-- compatibilidade para dispositivos menores-->
					<div class="collapse navbar-collapse" id="barra-navegacao">
						<h2 class="barra"><b id=titulo>Gerar Relat�rios</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="cadastroCursos.jsp"> | Gerenciar Cursos |</a></li>
							<li><a name ="gerpedidos" class="barra-direita" href="gerenciarVendas.jsp"> | Gerenciar Vendas |</a></li>
							<li><a name ="gertrocacancel" class="barra-direita" href="gerTrocaCancel.jsp"> | Gerenciar Trocas/Cancelamentos |</a></li>
							<li><a class="barra-direita" href="gerenciarCupons.jsp"> | Gerenciar Cupons |</a></li>
							<li><a class="barra-direita" href="gerenciarClientes.jsp"> | Gerenciar Clientes |</a></li>
							<li><a class="barra-direita" href="#">| Gerar Relat�rios |</a></li>
							<li><a class="barra-direita" href="login.jsp">| Sair |</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" align="center">
			
			<form action="ReportServlet" method="get">
			<% Result result = (Result)session.getAttribute("result");
				ReportCoursesSold rcs = null;
				Client client = null;
				DateFormat df = new SimpleDateFormat();
				StringBuilder sb = new StringBuilder();
				if(result != null)
				{	for(EntityDomain ed:result.getEntities())
					{	if(ed instanceof Client)
						{	client = (Client)ed;
							break;
						}
					}
				}
			%>
		    <center>
		    	<label> Data de In�cio</label>
		    	<input type="hidden" id="clientID" name="clientID" value="<%if(client != null)
																	    	{client.getId();}
		    																%>"/>
		    	<input type="date" name="txtDataInicio">
		    
		    	<label> Data de Fim</label>
		    	<input type="date" name="txtDataFim">
		    	<input type="hidden" id="FormName" name="FormName" value="" />
		    	<button class="btn mosh-btn mt-50" id="action" name="action" value="search">
									Enviar</button>
		    </center>
		    
			<fieldset>
				<legend>GR�FICOS</legend>
				<table align="center">
					<!-- <tr><td><div id="chart_div"></div></td></tr> -->
					<tr><td><div id="chart_sale" style="width:900px; height:500px"></div></td></tr>
					<tr><td><div id="chart_course"></div></td></tr>
					<tr><td><div id="chart_pizza"></div></td></tr>
					<tr><td><div id="chart_div"></div></td></tr>
				</table>
				
   				
   				<!-- <div id="bar_chart"></div>  -->
			</fieldset>
			</form>
		</div>
		<div id="left"></div>
		<div id="right"></div>
		<!-- <div id="rodape2">
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
			    				<li class="item"><a href="#">Portf�lio</a></li>
			    			</ul>
			    		</div>
			    		<div class="col-md-4">
                                <ul class="nav">
                                    <li class="item-rede-social"><a href="https://www.linkedin.com/school/fatec-mogi-das-cruzes/about/">
                                        <img src="imagens/linkedin.png" class="img-circle">
                                    </a></li>
                                    <li class="item-rede-social"><a href="https://www.linkedin.com/in/sergio-paulo-ferreira-24760724/">
                                        <img src="imagens/Sergio.png" class="img-circle">
                                        <br/>
                                        Sergio<br/>
                                        Business Analyst
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
			    	<div align="center"><p id="copy">&copy; 2019 - FATEC - Mogi das Cruzes</p></div>
			    </div>
			</footer>
	    </div> -->
	</body>
</html>