<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <title>Adicionar Cart�o</title>
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
						<h2 class="barra"><b id=titulo>Cadastro de Cart�o</b></h2>
						<!-- barra do link abaixo a direita. -->
						<ul class="nav navbar-nav navbar-right">
							<li><a class="barra-direita" href="inicialAluno.jsp">Pagina Inicial</a></li>
							<li><a class="barra-direita" href="principal.html">Sair</a></li>
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
                <h2 style="text-align: center">Cadastro de Novo Cart�o</h2>
                 <!-- wizard -->
                <div class="row-fluid section">
                     <!-- block -->
                    <div class="block">
                        <div class="navbar navbar-inner block-header">                          
                        </div>
                        <div class="block-content collapse in">
                            <div class="span12">
                                <fieldset>
                                            <form class="form-horizontal">
                                                <div class="control-group">
                                                  <label class="control-label" for="focusedInput">Bandeira</label>
                                                  <div class="controls">
                                                    <select>
                                                      <option>VISA</option>
                                                      <option>Mastercard</option>
                                                    </select>
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                  <label class="control-label" for="focusedInput">N�mero</label>
                                                  <div class="controls">
                                                    <input class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                  <label class="control-label" for="focusedInput">C�digo de Verifica��o</label>
                                                  <div class="controls">
                                                    <input class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                  </div>
                                                </div>
                                                <div class="control-group">
                                                  <label class="control-label" for="focusedInput">Dt Vencimento</label>
                                                  <div class="controls">
                                                    <input class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                  </div>
                                                </div>                                              
                                                <div class="control-group">
                                                  <label class="control-label" for="focusedInput">Nome do Titular</label>
                                                  <div class="controls">
                                                    <input class="input-xlarge focused" id="focusedInput" type="text" value="">
                                                  </div>
                                                </div>                                               
                                                <div class="form-actions">
                                                    <button type="submit" class="btn btn-primary">Salvar</button>
                                                    <button type="button" class="btn">Cancelar</button>
                                                </div>                                              
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
			    				<li class="item"><a href="#">Portf�lio</a></li>
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
			    					S�rgio<br/>
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