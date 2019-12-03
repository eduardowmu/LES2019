<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,br.edu.les2019.result.*" %>
<%@ page import = "java.util.*,br.edu.les2019.domain.*" %>
<%@ page import = "java.text.DecimalFormat.*"%>
<%@ page import = "java.text.DecimalFormatSymbols.*"%>
<%@ page import = "java.text.*"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pt-br">
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Pagamento</title>
		<!-- Bootstrap -->
    	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="assets/styles.css" rel="stylesheet" media="screen">
		<link href="css2/style.css" rel="stylesheet" type="text/css" media="all"/>
		<link href="css2/slider.css" rel="stylesheet" type="text/css" media="all"/>
		<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
		<link href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">
		<script type="text/javascript" src="js2/jquery-1.7.2.min.js"></script> 
		<script type="text/javascript" src="js2/move-top.js"></script>
		<script type="text/javascript" src="js2/easing.js"></script>
		<script src="js2/easyResponsiveTabs.js" type="text/javascript"></script>
		<script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
	    <script src="vendors/modernizr-2.6.2-respond-1.1.0.min.js"></script>
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
	    	
	    	function alertaSalvo()
	    	{alert("Forma de pagamento Selecionada. Pode finalizar a compra.");}
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
							<li><a class="barra-direita" href="#">Contato</a></li>
							<li><a class="barra-direita" href="#">Empresa</a></li>
							<li><a class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
    	<div id="pedido">
    		<%	Result result = (Result)session.getAttribute("result"); 
				if(result.getMsg() != null &&
					(result.getMsg().contains("A soma das parcelas não totalizam o preço de venda") ||
					result.getMsg().contains("Não foi possível salvar este e-mail")))
				{out.print("<div class='alert alert-info' align='center'>" + result.getMsg() + "</div>");}
    		%>
    		<form action="SaleServlet" method="post">
    			<%	Client client = null;
    				Course course = null;
    				Sale sale = null;
    				Item item = null;
    				if(result != null)
    				{	for(EntityDomain ed:result.getEntities())
	    				{	if(ed instanceof Sale)
		    				{	sale = (Sale)ed;
		    					client = sale.getClient();
		    					out.print("<input type='hidden' name='qtd_itens' value='"+sale.getListItem().size()+"'/>");
		    					for(int i = 0; i < sale.getListItem().size(); i++)
		    					{	course = sale.getListItem().get(i).getCourse();
		    						out.print("<input type='hidden' name='courseID"+i+"' value='"+course.getId()+"'/>");
		    						item = sale.getListItem().get(i);
		    						out.print("<input type='hidden' name='itemID"+i+"' value='"+item.getId()+"'/>");
		    						out.print("<input type='hidden' name='itemCode"+i+"' value='"+item.getCode()+"' />");
		    						out.print("<input type='hidden' name='itemPreco"+i+"' value='"+item.getCourse().getTotalPrice(item.getCourse().getPrice(), item.getCourse().getGrupoP())+"' />");
		    					}
		    					break;
		    				}
	    				}
    				}
    			%>
    			<fieldset>
    				<input type="hidden" id="clientID" name="clientID" value="<%if(client != null)	out.print(client.getId());%>"/>
    				<legend>Pedido Nº <%	String pedido = "";
    										if(sale != null) 
    										{	pedido = String.valueOf(client.getId());
    											for(int i = 0; i < sale.getListItem().size(); i++)
    											{pedido += sale.getListItem().get(i).getCourse().getId();}
    											out.print(pedido);
    										}
    								  %>
    				</legend>
    				<input type="hidden" id="pedido" name="pedido" value="<%	if(!pedido.equals(""))
															    				{out.print(pedido);}
    																		%>"/>
    				<table>
    					<tr>
    						<tr>
	                        	<td><h4>Total do Pedido</h4></td>
	                        </tr>
	                        <tr>
	                        	<td>Total: R$
	                        		<input type="text" value="<%	if(sale != null)
															        {out.print(sale.RealFormat(sale.getTotal()));}
	                        									%>" disabled="disabled"/><br/><br/>
	                        		<input type="hidden" name="total" id="total" value="<%	if(sale != null)
																					        {out.print(sale.getTotal());}
							                        									%>"/>
	                        		<input style="width: 40px" id="id_qtde" name="id_qtde" type="number" min="1" max="3" value="1" 
	                        			onclick="calcular_parcelas()">
	                        		<span> x </span>
                                    <strong>R$ <span id="id_parcelas"></span></strong>
                                '</td>
	                        </tr>
	                    </tr>
    				</table>
    				<legend>Cartão de Crédito Principal</legend>
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                       	<tr class="odd gradeX">
                           	<th>Bandeira</th>
                               <th>Nr do cartão</th>
                               <th>Valor da Parcela (R$)</th>
                           </tr>
                           <tr class="odd gradeX">
                               <td>
                               		<%	if(client != null)
	                               		{	if(client.getCards().get(0) != null)
		                               		{	if(client.getCards().get(0).getBanner().equalsIgnoreCase("master"))
			                               		{out.print("<img src='imagens/master.png' height='40px' width='60px'/>");}
		                               		
		                               			else	out.print("<img src='imagens/visa.png' height='40px' width='60px'/>");
			                               	}
                               			}
                               		%>
                               </td>
                               <td class="center">
                               	   <input type="hidden" name="cardNumber" id="cardNumber" 
                               	   		value="<%	if(client != null && client.getCards().get(0) != null)
                               	   					{String.valueOf(client.getCards().get(0).getNumber());}
                               	   				%>"/>
                               	   <input type="text" disabled="disabled" size="22"
                               	   		value="<%	String code = "";
                               	   					if(client != null && client.getCards().get(0) != null)
													{	for(int i = 0; i < client.getCards().get(0).getNumber().length(); i++)
														{	if(i > 11)	
															{code += String.valueOf(client.getCards().get(0).getNumber().charAt(i));}
															
															else	code += "X";
															if((i+1)%4 == 0 && i < client.getCards().get(0).getNumber().length())	
															{code += " - ";}
														}
														out.print(code);
                               	   					}
                               	   				%>"/>
                               </td>
                               <td class="center">
                               	<input type="text" id="id_valor_parcela" name="id_valor_parcela">
                                   <input type="button" class="btn btn-warning" type="button" id="ajustar" onclick="atualizar_parcelas()" value="Ajustar"/>
                                   <button type="button" class="btn btn-success" onclick="alertaSalvo()">Salvar</button>
                             	</td>
						</tr>
                    </table>    
                    <legend>Outros Cartões Cadastrados</legend>
                    <a href="addCartoes.jsp" style="margin-left: 100px; font-size: 15px">adicionar novo cartão</a><br/>
                    <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="tabela-cartoes">
                    	<tr class="odd gradeX">
                    		<th class="center">Bandeira</th>
							<th class="center">Nr do cartão</th>
							<th class="center">Dt Venc.</th>
							<th class="center">Nome do Titular</th>
							<th class="center">Valor</th>
                            <th class="center">Incluir</th>
							<!-- <th class="center">Ação</th>  -->
                    	</tr>
                    	<%	int k = 0;
            				if(client != null)
	                    	{	DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
	                    		for(int i = 0; i < client.getCards().size(); i++)
		                    	{	if(i > 0)
			                    	{	out.print("<input type='hidden' id='cardID"+i+"' name='cardID"+i+
			                    			"' value='"+client.getCards().get(k).getId()+"'/>");
		                    			out.print("<tr><td class='center'>");
		                    			if(client.getCards().get(i) != null)
		                    			{	if(client.getCards().get(i).getBanner().equalsIgnoreCase("master"))
		                    				{out.print("<img src='imagens/master.png'/></td>");}
	                    					
		                    				else out.print("<img src='imagens/visa.png'/></td>");
		                    				String number = "";
		                    				for(int j = 0; j < client.getCards().get(i).getNumber().length(); j++)
		                    				{	if(j < 12)	number += "X";
		                    					else	number += String.valueOf(client.getCards().get(i).getNumber().charAt(j));
		                    					if((j+1)%4 == 0)	{number += " - ";}
		                    				}
				                    		out.print("<td class='center'><input type='text' value='" + number + 
				                    				"' disabled='disabled' size='22'/></td>");
				                    		out.print("<input type='hidden' name='cardNumber"+i+
				                    				"' value='"+client.getCards().get(i).getNumber()+"'/>");
				                    		out.print("<td class='center'>" + 
				                    			df.format(client.getCards().get(i).getDeadline()) + "</td>");
				                    		
				                    		out.print("<td class='center'>" + 
					                    		client.getCards().get(i).getName() + "</td>");
				                    		
				                    		out.print("<td class='center'>" + 
						                    			"<input type='text' id='"+client.getCards().get(i).getId()+"' name='cardValor"+i+"' value='0.00'/>" + 
				                    				  "</td>");
					                    		
				                    		out.print("<td class='center'>" +
				                    						"<input type='checkbox' id='selCARD"+i+"' name='selCARD"+i+"' class='selCARD' value='" +
				                    							client.getCards().get(i).getId() + "' onclick='setValue()' /></td></tr>");
				                    		k++;
				                    	}
			                    	}
		                    	}
	                    		out.print("<input type='hidden' id='qtd_card' name='qtd_card' value='"+k+"'/>");
                    		}
                    	%>
                    </table>
                    <input type="hidden" name="qtd_card" value="<%	out.print(k); %>"/>
                    <input type="email" name="email" placeholder="e-mail para envio"/><br /><br />
                    <button type="submit" class="btn btn-success" name="action" id="fechar" value="save">
                    	Fechar compra
                    </button>
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
		<!--/.fluid-container-->
    <link href="vendors/datepicker.css" rel="stylesheet" media="screen">
    <link href="vendors/uniform.default.css" rel="stylesheet" media="screen">
    <link href="vendors/chosen.min.css" rel="stylesheet" media="screen">

    <link href="vendors/wysiwyg/bootstrap-wysihtml5.css" rel="stylesheet" media="screen">

    <script src="vendors/jquery-1.9.1.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <script src="vendors/jquery.uniform.min.js"></script>
    <script src="vendors/chosen.jquery.min.js"></script>
    <script src="vendors/bootstrap-datepicker.js"></script>

    <script src="vendors/wysiwyg/wysihtml5-0.3.0.js"></script>
    <script src="vendors/wysiwyg/bootstrap-wysihtml5.js"></script>

    <script src="vendors/wizard/jquery.bootstrap.wizard.min.js"></script>

<script type="text/javascript" src="vendors/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="assets/form-validation.js"></script>

<script src="assets/scripts.js"></script>
    
    <script>
	    /*function mudarPgto(button) { 
	        if (button.checked && button.id === "button-boleto") {
	            document.getElementById("menu-boleto").style.display = "inline";
	            document.getElementById("menu-cartao").style.display = "none";
	            document.getElementById("button-boleto").checked=true;
	            document.getElementById("button-cartao").checked=false;
	            
	            
	        }if (button.checked && button.id === "button-cartao") {
	            document.getElementById("menu-boleto").style.display = "none";
	            document.getElementById("menu-cartao").style.display = "inline";
	            document.getElementById("button-boleto").checked=false;
	            document.getElementById("button-cartao").checked=true;
	            
	        }
	    }*/
	</script>
    
    <script>
        function setValue()
        {	var total = document.getElementById("total").value;
        	var cardP = document.getElementById("id_valor_parcela").value;
        	var cardS = total - cardP;
        	var idBox = document.getElementsByClassName("selCARD");
        	var i;
        	var k;
        	var id;
        	for(i = 0; i < idBox.length; i++)
        	{	if(idBox[i].type == "checkbox" && idBox[i].checked)
        		{ 	k = i+1;
        			id = document.getElementById("selCARD"+k).value;
        			break;
        		}
        	}
        	if(cardS > 0)
        	{document.getElementById(id).value = cardS.toFixed(2);}
        }
        //window.load = setValue();
    	/*function menu_enderecos(){
            document.getElementById("menu-lista-endereco").style.display = "inline";
        }*/
    </script>
    
    <script>
        /*function add_cartao(){
            document.getElementById("novo-cartao").style.display = "inline";
        }*/
    </script>
    
    <script>
        /*function calcular_parcelas(){
            var myTotal = document.getElementById('id_total').value; 
            var myQtde = document.getElementById('id_qtde').value;
            var myResult = myTotal/myQtde;
            document.getElementById('id_parcelas').innerHTML = myResult.toFixed(2);
        }
        window.load = calcular_parcelas();*/
    </script>
    
    <script>
        function atualizar_parcelas()
        {	var total = document.getElementById("total").value;
        	var valorParcela = document.getElementById("id_qtde").value;
        	var total2 = total/valorParcela;
            document.getElementById("id_valor_parcela").value = total2.toFixed(2);
        }
        window.load = atualizar_parcelas();
    </script>
    
    <script>
/*jQuery(document).ready(function() {   
   FormValidation.init();
});


    $(function() {
        $(".datepicker").datepicker();
        $(".uniform_on").uniform();
        $(".chzn-select").chosen();
        $('.textarea').wysihtml5();

        $('#rootwizard').bootstrapWizard({onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index+1;
            var $percent = ($current/$total) * 100;
            $('#rootwizard').find('.bar').css({width:$percent+'%'});
            // If it's the last tab then hide the last button and show the finish instead
            if($current >= $total) {
                $('#rootwizard').find('.pager .next').hide();
                $('#rootwizard').find('.pager .finish').show();
                $('#rootwizard').find('.pager .finish').removeClass('disabled');
            } else {
                $('#rootwizard').find('.pager .next').show();
                $('#rootwizard').find('.pager .finish').hide();
            }
        }});
        $('#rootwizard .finish').click(function() {
            alert('Finished!, Starting over!');
            $('#rootwizard').find("a[href*='tab1']").trigger('click');
        });
    });*/
    </script>
	</body>
</html>