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
	    <link href="CSS/principal.css" rel="stylesheet">
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
							<li><a class="barra-direita" href="#">Login</a></li>
							<li><a class="barra-direita" href="#">Contato</a></li>
							<li><a class="barra-direita" href="#">Empresa</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
		<div id="form" class="container-fluid" style="width: 1400px">
        <div class="row-fluid">
            
            
            <div class="span9" id="content">
                  <!-- morris stacked chart -->
                <h2>Pagamento</h2>
                 <!-- wizard -->
                <div class="row-fluid section">
                     <!-- block -->
                    <div class="block">
                        <div class="navbar navbar-inner block-header">
                            
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <div id="rootwizard">
                                    <div class="navbar">
                                      <div class="navbar-inner">
                                        <div class="container">
                                    <ul>
                                        <li><a href="#tab3" data-toggle="tab">Pedido</a></li>
                                        <li><a href="#tab4" data-toggle="tab">Forma de Pagamento</a></li>
                                        <li><a href="#tab5" data-toggle="tab">Finalizar Compra</a></li>
                                    </ul>
                                     </div>
                                      </div>
                                    </div>
                                    <div id="bar" class="progress progress-striped active">
                                      <div class="bar"></div>
                                    </div>
                                    <div class="tab-content">
                                        <div class="tab-pane" id="tab1">
                                            <form class="form-horizontal">
                                              <fieldset>
                                                <div class="control-group">
                                                  <label class="control-label">Nome</label>
                                                  <div class="controls">
                                                    <span class="input-xlarge uneditable-input">João da Silva</span>
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Sexo</label>
                                                    <div class="controls">
                                                        <span class="input-xlarge uneditable-input">Masculino</span>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">RG</label>
                                                    <div class="controls">
                                                        <span class="input-xlarge uneditable-input">11.111.111-1</span>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">CPF</label>
                                                    <div class="controls">
                                                        <span class="input-xlarge uneditable-input">111.111.111-11</span>
                                                    </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Email</label>
                                                    <div class="controls">
                                                        <span class="input-xlarge uneditable-input">eduardo@gmail.com</span>
                                                    </div>
                                                </div>                                                
                                              </fieldset>                                               
                                            </form>
                                        </div>
                                          <div class="tab-pane" id="tab3">
                                           <form class="form-horizontal">
                                              <fieldset>
                                              	<legend><h2>Pedido 00000115</h2></legend>
                                              	<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                            <thead>
                                                <tr>
                                                    <th>Cod. Produto</th>
                                                    <th>Descrição do Produto</th>
                                                    <th>Preço Unit</th>
                                                    <th>Subtotal</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr class="odd gradeX">
                                                    <td>XXXXXXX</td>
                                                    <td>Angular - Introdução</td>
                                                    <td class="center">R$ 50,00</td>
                                                    <td class="center">R$ 50,00</td>
                                                </tr>
                                                <tr class="odd gradeX">
                                                    <td>XXXXXXX</td>
                                                    <td>Curso Básico de Python</td>
                                                    <td class="center">R$ 25,00</td>
                                                    <td class="center">R$ 25,00</td>

                                                </tr>
                                                <tr class="odd gradeX">
                                                    <td>XXXXXXX</td>
                                                    <td>Curso Orientação a Objetos com Java</td>
                                                    <td class="center">R$ 60,00</td>
                                                    <td class="center">R$ 60,00</td>

                                                </tr>
                                                <tr class="odd gradeX">
                                                    <td>XXXXXXX</td>
                                                    <td>Curso Completo de Photoshop</td>
                                                    <td class="center">R$ 35,00</td>
                                                    <td class="center">R$ 35,00</td>

                                                </tr>
                                            </tbody>
									   </table>
                                        </fieldset><br /><br /><br /><br /><br />
                                        <div id="bottom-cart">
                                            <div id="product" style="margin-left: 500px; margin-top: 80px">
                                                <table >
	                                                <tr>
	                                                	<td><h4>Total do Pedido</h4></td>
	                                                </tr>
	                                                <tr>
	                                                	<td><p>Subtotal: R$ 170,00</p></td>
	                                                </tr>
	                                                <tr>
	                                                	<td><p>Desconto: R$ 0,00</p></td>
	                                                </tr>
	                                                <tr>
	                                                	<td><p>Cupom: CT000000101: R$ -30,00</p></td>
	                                                </tr>
	                                                <tr>
	                                                	<td>
		                                                	<p><strong>
		                                                		Total:    <span style="font-size: 20px">R$ 140,00</span>
		                                                	</strong></p>
	                                                	</td>
	                                                </tr>
                                                </table>
											</div>
                                        </div>
                                    </form>
                                </div>
                                        <div class="tab-pane" id="tab4">
                                            <form class="form-horizontal" action="">
                                                
                                                <fieldset>
                                                <div class="control-group">
                                                  <label class="control-label">Total: R$</label>
                                                  <div class="controls">
                                                    <input id="id_total" value="140.00" readonly>
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                    <div class="controls">
                                                        <p><input  style="width: 40px" id="id_qtde" type="number" min="1" max="12" value="1" onclick="calcular_parcelas()">
                                                            <span> x </span>
                                                            <strong>R$ <span id="id_parcelas"></span></strong>
                                                            
                                                        </p>
                                                    </div>
                                                </div>
                                            </fieldset><br/><br/>
                                                
                                              <div id="menu-boleto" style ="display: none">
                                            <fieldset>
                                                <legend>Boleto</legend>
                                                <div class="controls">
                                                    <input placeholder="adicione CPF (Somente numeros)">
                                                </div>
                                            </fieldset>
                                            
                                        </div>
                                          
                                                
                                                  
                                        <div id="menu-cartao">       
                                            
                                            
                                            <fieldset>
                                              <legend>Cartão de Crédito Principal</legend>
                                                <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
                                                <thead>
                                                <tr>
                                                    <th>Bandeira</th>
                                                    <th>Nr do cartão</th>
                                                    <th>Valor da Parcela (R$)</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr class="odd gradeX">
                                                    <td><img src="imagens/master.png" alt="" /></td>
                                                    <td>1234-5678-9012-3456</td>
                                                    <td class="center">
                                                    	<input type="text" id="id_valor_parcela">
                                                    	<input type="button" id="ajustar" class="btn btn-warning" type="button" onclick="atualizar_parcelas()" value="Ajustar"/>
                                                    	<button type="button" class="btn btn-success" id="save2" onclick="alertaSalvo()">Salvar</button>
                              						</td>

                                                </tr>
                                                </tbody>
                                                </table>    
                                                <div>
                                                    <input type="button" value="Outros Cartões" id="outros" onclick="add_cartao()">
                                                    <!-- <input style="margin-left: 400px" type="button" onclick="atualizar_parcelas()" value="Ajustar"/> -->
                                                </div>
                                                
                                                
                                        </fieldset>
                                            <br>
                                            <br>  
                                        <div id="novo-cartao" style="display: none"><br/><br/>
                                            
                                        <fieldset padding="200px">
                                            <legend>Outros Cartões Cadastrados<a href="addCartao.jsp" style="margin-left: 100px; font-size: 15px">adicionar novo cartão</a></legend>
                                            <table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="tabela-cartoes">
										<thead>
											<tr>
												<th>Bandeira</th>
												<th>Nr do cartão</th>
												<th>Dt Venc.</th>
												<th>Nome do Titular</th>
                                                <th>Incluir</th>
												<th>Ação</th>
											</tr>
										</thead>
										<tbody>
											<tr class="odd gradeX">
                                                <td><img src="imagens/master.png" alt="" /></td>
												<td class="center">####-####-####-1234</td>
												<td class="center">05/22</td>
                                                <td class="center">Eduardo W Murakoshi</td>
                                                <td class="center"><input type="checkbox"></td>
                                                <td>
                                                    <button class="btn btn-warning btn-mini">Editar</button>
                                                    <button class="btn btn-danger btn-mini" value="Excluir" onclick="deleteRow(this)">Excluir</button>
                                                </td>
											</tr>
											<tr class="odd gradeX">
                                                <td><img src="imagens/visa.png" alt="" /></td>
                                                <td class="center">####-####-####-9012</td>
												<td class="center">05/20</td>
                                                <td class="center">Eduardo W Murakoshi</td>
                                                <td class="center"><input type="checkbox"></td>
                                                <td>
                                                    <button class="btn btn-warning btn-mini">Editar</button>
                                                    <button class="btn btn-danger btn-mini" value="Excluir" onclick="deleteRow(this)">Excluir</button>
                                                </td>
                                            </tr>
                                            <tr class="odd gradeX">
                                                <td><img src="imagens/visa.png" alt="" /></td>
                                                <td class="center">####-####-####-3456</td>
												<td class="center">05/25</td>
                                                <td class="center">Eduardo W Murakoshi</td>
                                                <td class="center"><input type="checkbox" name="card"></td>
                                                <td>
                                                    <button class="btn btn-warning btn-mini">Editar</button>
                                                    <button class="btn btn-danger btn-mini" value="Excluir" onclick="deleteRow(this)">Excluir</button>
                                                </td>
                                            </tr>
										</tbody>
									</table>
										<p style="text-align: right">
                                            
                                            <button type="button" class="btn btn-success" id="save" onclick="alertaSalvo()">Salvar</button>
										</p>
                                            
                                        </fieldset>
                                                      
                                            
                                        
                                        </div>
                                            </div>          
                                                
                                            </form>
                                        </div>
                                        <div class="tab-pane" id="tab5">
                                            <form class="form-horizontal">
                                              <fieldset>
                                                  <div class="control-group">
                                                  <label class="control-label">Código do Pedido</label>
                                                  <div class="controls">
                                                    <span class="input-xlarge uneditable-input">00000115</span>
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                    <label class="control-label">Data do Pedido</label>
                                                    <div class="controls">
                                                        <span class="input-xlarge uneditable-input">12/08/2019</span>
                                                    </div>
                                                </div>
                                                  <div class="control-group">
                                                  <label class="control-label">Total</label>
                                                  <div class="controls">
                                                    <span class="input-xlarge uneditable-input">R$ 140,00</span>
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                  <label class="control-label">Email para envio:</label>
                                                  <div class="controls">
                                                    <span class="input-xlarge uneditable-input">
                                                    	<input type="email" id="email" name="email"/>
                                                    </span>
                                                  </div>
                                                </div>
                                                
                                                <p style="text-align: center">
                                                     <a href="inicialAluno.jsp" id="compra" style="color: white" 
                                                     	onclick="alerta()" class="btn btn-success btn-large">
                                                      	Finalizar Compra
                                                     </a>
                                                  </p>
                                              </fieldset>
                                                
                                            </form>
                                        </div>
                                        
                                        
                                        
                                        <ul class="pager wizard">
                                            <li class="previous first" style="display:none;"><a href="javascript:void(0);">Primeiro</a></li>
                                            <li class="next last" style="display:none;"><a href="javascript:void(0);">Último</a></li>
                                            <li class="next finish" style="display:none;"><a href="javascript:;">Fim</a></li>
                                        </ul>
                                    </div>  
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>
            <!-- /wizard -->


            </div>
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
	    function mudarPgto(button) { 
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
	    }
	</script>
    
    <script>
        function menu_enderecos(){
            document.getElementById("menu-lista-endereco").style.display = "inline";
        }
    </script>
    
    <script>
        function add_cartao(){
            document.getElementById("novo-cartao").style.display = "inline";
        }
    </script>
    
    <script>
        function calcular_parcelas(){
            var myTotal = document.getElementById('id_total').value; 
            var myQtde = document.getElementById('id_qtde').value;
            var myResult = myTotal/myQtde;
            document.getElementById('id_parcelas').innerHTML = myResult.toFixed(2);
        }
        window.load = calcular_parcelas();
    </script>
    
    <script>
        function atualizar_parcelas(){
            var valorParcela = document.getElementById('id_parcelas').innerText;
            document.getElementById('id_valor_parcela').value = valorParcela;
        }
        window.load = atualizar_parcelas();
    </script>
    
    <script>
jQuery(document).ready(function() {   
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
    });
    </script>
	</body>
</html>