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
    <meta charset="utf-8" />
    <title>Adicionar Cartão</title>
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
    <link href="CSS/principal.css" rel="stylesheet">
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
						<h2 class="barra"><b id=titulo>Cadastro de Cartão</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="meusCursos2.jsp">Pagina Inicial</a></li>
							<li><a class="barra-direita" href="login.jsp">Sair</a></li>
						</ul>
					</div>
				</div>
			</nav>
    	</div>
    	<div id="form" class="container-fluid">
        <div class="row-fluid">
            <!--/span-->
            <div class="span9" id="content" style="margin-left: 150px">
                  <!-- morris stacked chart -->
                <h2 style="text-align: center">Cadastro de Novo Cartão</h2>
                 <!-- wizard -->
                <div class="row-fluid section">
                     <!-- block -->
                    <div class="block">
                        <div class="navbar navbar-inner block-header">                          
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <fieldset>
                                            <form action="CardServlet" method="post" class="form-horizontal">
                                            	<%	Result result = (Result)session.getAttribute("result");	%>
                                                <table align="center">
                                                	<tr>
                                                		<td>
			                                                <div class="control-group">
			                                                  <label class="control-label" for="focusedInput">Bandeira</label>
			                                                  <div class="controls">
			                                                    <select name="bandeira">
			                                                      <option>VISA</option>
			                                                      <option>Mastercard</option>
			                                                    </select>
			                                                  </div>
			                                                </div>
		                                                </td>
		                                                <td>
			                                                <div class="control-group">
			                                                  <label class="control-label" for="focusedInput">Número</label>
			                                                  <div class="controls">
			                                                    <input class="input-xlarge focused" name="numero" type="number" required>
			                                                  </div>
			                                                </div>
		                                                </td>
		                                                <td>
			                                                <div class="control-group">
			                                                  <label class="control-label" for="focusedInput">Código de Verificação</label>
			                                                  <div class="controls">
			                                                    <input class="input-xlarge focused" name="code" id="focusedInput" 
			                                                    	type="number" required>
			                                                  </div>
			                                                </div>
		                                                </td>
	                                                </tr>
	                                                <tr>
	                                                	<td>
			                                                <div class="control-group">
			                                                  <label class="control-label" for="focusedInput">Dt Vencimento</label>
			                                                  <div class="controls">
			                                                    <input class="input-xlarge focused" name="vencimento" id="focusedInput" 
			                                                    	type="date" required>
			                                                  </div>
			                                                </div>  
		                                                </td>
		                                                <td>                                            
			                                                <div class="control-group">
			                                                  <label class="control-label" for="focusedInput">Nome do Titular</label>
			                                                  <div class="controls">
			                                                    <input class="input-xlarge focused" name="titular" id="focusedInput" 
			                                                    	type="text" required>
			                                                  </div>
			                                                </div>
		                                                </td>
		                                                <td>                                              
			                                                <div class="form-actions">
			                                                    <button type="submit" class="btn btn-primary" name="action" id="salvar" value="save">
			                                                    	Salvar</button>
			                                                    <a href="pagamento2.jsp">Cancelar</a>
			                                                </div>
		                                                </td>
	                                                </tr>
                                                </table>                                            
                                            </form>
                                    </fieldset>
                            </div>
                        </div>
                    </div>
                    <!-- /block -->
                </div>
            <!-- /wizard -->
            </div>
        </div>
        <hr>
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