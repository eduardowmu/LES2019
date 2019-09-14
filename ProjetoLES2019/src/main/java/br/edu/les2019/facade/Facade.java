package br.edu.les2019.facade;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import br.edu.les2019.dao.CardDAO;
import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.CourseDAO;
import br.edu.les2019.dao.EmailDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.PhoneDAO;
import br.edu.les2019.dao.VideoDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.Course;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.User;
import br.edu.les2019.domain.Video;
import br.edu.les2019.result.Result;
import br.edu.les2019.strategy.ConfirmaSenhas;
import br.edu.les2019.strategy.IStrategy;
import br.edu.les2019.strategy.ValidadorCPF;
import br.edu.les2019.strategy.ValidadorCartao;
import br.edu.les2019.strategy.ValidadorCategoria;
import br.edu.les2019.strategy.ValidadorDados;
import br.edu.les2019.strategy.ValidadorEmail;
import br.edu.les2019.strategy.ValidadorExistencia;
import br.edu.les2019.strategy.ValidadorGrupo;
import br.edu.les2019.strategy.ValidadorImagem;
import br.edu.les2019.strategy.ValidadorLogin;
import br.edu.les2019.strategy.ValidadorPhone;
import br.edu.les2019.strategy.ValidadorSenha;
import br.edu.les2019.strategy.ValidarCurso;

public class Facade implements IFacade
{	Map<String, IDAO> daos;//map of DAOs
	//Business Rules maps
	Map<String, Map<String, List<IStrategy>>> busRules;
	//result of each events
	Result result;
	public Facade()//instantiating each maps type
	{	daos = new HashMap<String, IDAO>();
		busRules = new HashMap<String, Map<String, List<IStrategy>>>();
		
		//instantiating all DAO's type
		ClientDAO cdao = new ClientDAO();
		CourseDAO codao = new CourseDAO();
		VideoDAO vdao = new VideoDAO();
		
		//mapping each DAO's type
		daos.put(Client.class.getName(), cdao);
		daos.put(Course.class.getName(), codao);
		daos.put(Video.class.getName(), vdao);
		
		//instantiating each Strategies for clients
		ValidadorDados vdd = new ValidadorDados();
		ValidadorCPF vcpf = new ValidadorCPF();
		ValidadorEmail vemail = new ValidadorEmail();
		ValidadorExistencia vex = new ValidadorExistencia();
		ValidadorImagem vi = new ValidadorImagem();
		ValidadorCartao vc = new ValidadorCartao();
		ValidadorPhone vp = new ValidadorPhone();
		ConfirmaSenhas cs = new ConfirmaSenhas();
		ValidadorSenha vs = new ValidadorSenha();
		ValidadorLogin vl = new ValidadorLogin();
		//strategies for courses
		ValidadorCategoria vcat = new ValidadorCategoria();
		ValidadorGrupo vgrupo = new ValidadorGrupo();
		ValidarCurso vcurso = new ValidarCurso();
		
		
		//listas de todas as regras para clientes
		List<IStrategy> rnSalvarClient = new ArrayList<>();
		List<IStrategy> rnAlterarClient = new ArrayList<>();
		List<IStrategy> rnAtivarClient = new ArrayList<>();
		List<IStrategy> rnConsultarClient = new ArrayList<>();
		List<IStrategy> rnDeletarClient = new ArrayList<>();
		List<IStrategy> rnLogin = new ArrayList<>();
		
		//regras para salvar cliente
		rnSalvarClient.add(vdd);
		rnSalvarClient.add(vcpf);
		rnSalvarClient.add(vemail);
		rnSalvarClient.add(vex);
		//rnSalvarClient.add(vi);
		rnSalvarClient.add(vc);
		rnSalvarClient.add(vp);
		rnSalvarClient.add(cs);
		rnSalvarClient.add(vs);
		
		//regras para validar o login do cliente
		rnLogin.add(vemail);
		rnLogin.add(vs);
		rnLogin.add(vl);
		
		//regras para alterar dados do cliente
		rnAlterarClient.add(vdd);
		rnAlterarClient.add(vcpf);
		rnAlterarClient.add(vemail);
		rnAlterarClient.add(vc);
		rnAlterarClient.add(vp);
		
		//regras para pesquisar clientes
		
		
		//regras para deletar clientes
		
		
		//mapeamento de todas as regras para o cliente
		Map<String, List<IStrategy>> regrasClient = 
				new HashMap<String, List<IStrategy>>();
				
		//Cada chave (KEY) desse Map é o valor ("value") armazenadas nas tags 
		//<input type="submit"/> das páginas HTML, e os valores são as regras de negócios
		//para cada evento
		regrasClient.put("save", rnSalvarClient);
		regrasClient.put("login", rnLogin);
		regrasClient.put("update", rnAlterarClient);
				
		
		//Lista de regras para cursos
		List<IStrategy> rnSalvarCurso = new ArrayList<>();
		List<IStrategy> rnAlterarCurso = new ArrayList<>();
		List<IStrategy> rnConsultarCurso = new ArrayList<>();
		List<IStrategy> rnDeletarCurso = new ArrayList<>();
		
		//regras para salvar curso
		rnSalvarCurso.add(vcat);
		rnSalvarCurso.add(vgrupo);
		rnSalvarCurso.add(vex);
		
		//regras para alterar curso
		rnAlterarCurso.add(vcat);
		rnAlterarCurso.add(vgrupo);
		
		//regras para buscar curso
		rnConsultarCurso.add(vcurso);
		
		//mapeamento de todas as regras para o cliente
		Map<String, List<IStrategy>> regrasCourse = 
			new HashMap<String, List<IStrategy>>();
		
		//para cada evento associado a Cursos
		regrasCourse.put("save", rnSalvarCurso);
		regrasCourse.put("update", rnAlterarCurso);
		regrasCourse.put("delete", rnDeletarCurso);
		regrasCourse.put("search", rnConsultarCurso);
		
		/*Adiciona o mapa com as regras indexadas pelas operações no mapa 
		geral indexado pelo nome da entidade*/
		busRules.put(Client.class.getName(), regrasClient);
		busRules.put(Course.class.getName(), regrasCourse);
	}
	
	//execução das regras de negócio
	private String executeRules(EntityDomain entidade, String operacao)
	{	StringBuilder msg = new StringBuilder();
		//busca as Stragegies do evento desejado
		Map<String, List<IStrategy>> regrasOperacao = 
			busRules.get(entidade.getClass().getName());
		//se a lista não estiver vazia
		if(regrasOperacao != null)//atribui a uma outra lista, inserindo apenas as regras
		{	List<IStrategy> regras = regrasOperacao.get(operacao);
			if(regrasOperacao.get(operacao) !=  null)//se não estiver vazia
			{	for(IStrategy validador : regras)//looping por todas as regras para validação
				{	if(validador.process(entidade) != null)//se o retorno for diferente de nulo
					{msg.append(validador.process(entidade));}//significa que houve algum erro da familia 400
				}
			}
		}
		if(msg.length() > 0) return msg.toString();
		
		else return null;
	}

	@Override public Result save(EntityDomain ed)
	{	result = new Result();
		List<EntityDomain> entities = new ArrayList<>();
		if(this.executeRules(ed, "save") == null)
		{	IDAO dao = daos.get(ed.getClass().getName());
			try	
			{	dao.save(ed);
				for(EntityDomain e:dao.search())
				{	if(ed.getId() == e.getId())
					{ed.setRegistry(e.getRegistry());}
				}
			}
			catch(Exception e)
			{	System.out.println(e.getMessage());
				result.setMsg("Estamos com um problema, "
					+ "mas em breve será resolvido");
			}
		}
		else result.setMsg(this.executeRules(ed, "save"));
		//adiciona a entidade salva na lista de entidades a
		//ser enviado para a página destino
		entities.add(ed);
		result.setEntities(entities);
		return result;
	}
	
	@Override public Result update(EntityDomain ed) 
	{	result = new Result();
		List<EntityDomain> entities = new ArrayList<>();
		entities.add(ed);
		if(this.executeRules(ed, "update") == null)
		{	IDAO dao = daos.get(ed.getClass().getName());
			try	
			{	dao.update(ed);
				for(EntityDomain e:dao.search())
				{	if(ed.getId() == e.getId())
					{ed.setRegistry(e.getRegistry());}
				}
			}
			catch(Exception e)
			{	System.out.println(e.getMessage());
				result.setMsg("Estamos com um problema, "
					+ "mas em breve será resolvido");
			}
		}
		else result.setMsg(this.executeRules(ed, "update"));
		result.setEntities(entities);
		return result;
	}
	
	@Override public Result delete(EntityDomain ed) 
	{	result = new Result();
		if(this.executeRules(ed, "delete") == null)
		{	IDAO dao = daos.get(ed.getClass().getName());
			if(ed instanceof Client)
			{	PhoneDAO pdao = new PhoneDAO();
				pdao.delete2(ed);
				EmailDAO edao = new EmailDAO();
				edao.delete2(ed);
				CardDAO cdao = new CardDAO();
				cdao.delete2(ed);
			}
			
			try	{dao.delete(ed);}
			catch(Exception e)
			{	System.out.println(e.getMessage());
				result.setMsg("Estamos com um problema, "
					+ "mas em breve será resolvido");
			}
		}
		else result.setMsg(this.executeRules(ed, "delete"));
		return result;
	}
	
	@Override public Result search(EntityDomain ed) 
	{	result = new Result();
		//entities.add(ed);
		if(this.executeRules(ed, "search") == null)
		{	IDAO dao = daos.get(ed.getClass().getName());
			try	
			{	List<EntityDomain> entities = dao.search(ed);
				result.setEntities(entities);
			}
			catch(Exception e)
			{	System.out.println(e.getMessage());
				result.setMsg("Estamos com um problema, "
					+ "mas em breve será resolvido");
			}
		}
		else result.setMsg(this.executeRules(ed, "search"));
		return result;
	}
	
	@Override public Result login(EntityDomain ed) 
	{	result = new Result();
		//Client client = (Client)ed;
		List<EntityDomain> entities = new ArrayList<>();
		/*if(this.executeRules(client, "login") == null)
		{	IDAO dao = daos.get(ed.getClass().getName());
			try
			{	for(EntityDomain entity:dao.search())
				{	Client cli = (Client)entity;
					if(cli.getEmails() != null)
					{	if(cli.getEmails().get(0).equals(client.getEmails().get(0)) &&
							cli.getPassword().equals(client.getPassword()))
						{	client = cli;
							break;
						}
					}
				}
			}
			catch(Exception e)	{System.out.println(e.getMessage());}
			this.addUser(entities, client);
			entities.add(client);
			result.setEntities(entities);
		}
		
		else result.setMsg(this.executeRules(ed, "login"));*/
		return result;
	}
	
	private void addUser(List<EntityDomain> entities, EntityDomain entity)
	{	if(entity instanceof Client)
		{	Client client = (Client)entity;
			User user = new User();
			user.setId(client.getId());
			user.setName(client.getEmails().get(0));
			client.setUser(user);
			entities.add(client.getUser());
		}
	}

	@Override public Result show(EntityDomain ed) 
	{	result = new Result();
		IDAO dao = daos.get(ed.getClass().getName());
		result.setMsg("Dados do curso");
		result.setEntities(dao.search(ed));
		return result;
	}
}