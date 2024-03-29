package br.edu.les2019.view;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.edu.les2019.dao.ClientDAO;
import br.edu.les2019.dao.IDAO;
import br.edu.les2019.dao.RankingDAO;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Phone;
import br.edu.les2019.domain.Ranking;
import br.edu.les2019.result.Result;

public class ClientView implements IViewHelper 
{	Client client;
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	client = new Client();
		CreditCard card = new CreditCard();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		switch(request.getParameter("action"))
		{	case "save"://nome completo do cliente
				client.setName(request.getParameter("nome"));
				client.setSurname(request.getParameter("sobrenome"));
				//CPF
				client.setCpf(request.getParameter("cpf"));
				//GENERO
				client.setGenero(request.getParameter("genero"));
				//data de nascimento
				try {client.setBirthday(df.parse(request.getParameter("dtnasc")));} 
				catch (ParseException e) {System.out.println(e.getMessage());}
				//email
				client.setEmails(new ArrayList<>());
				client.getEmails().add(request.getParameter("email"));
				//telefone
				client.setPhone(new Phone());
				client.getPhone().setClient(client);
				client.getPhone().setType(request.getParameter("tipo"));
				client.getPhone().setDdd(request.getParameter("ddd"));
				client.getPhone().setNumber(request.getParameter("fone"));
				//cartão de credito
				client.setCards(new ArrayList<CreditCard>());
				card.setClient(client);
				card.setName(request.getParameter("cardName"));
				card.setNumber(request.getParameter("cardNumber"));
				card.setBanner(request.getParameter("banner"));
				card.setCode(request.getParameter("seg"));
				try {card.setDeadline(df.parse(request.getParameter("prazo")));}
				catch(ParseException e)	{System.out.println(e.getMessage());}
				client.getCards().add(card);
				/*client.setCard(new CreditCard());
				client.getCard().setClient(client);
				client.getCard().setName(request.getParameter("cardName"));
				client.getCard().setNumber(request.getParameter("cardNumber"));
				client.getCard().setBanner(request.getParameter("banner"));
				client.getCard().setCode(request.getParameter("seg"));*/
				//senha
				client.setPassword(request.getParameter("pass"));
				client.setPassword2(request.getParameter("pass2"));
				client.setStatus("ativado");
				break;
				
			case "login":
				client.setEmails(new ArrayList<String>());
				client.getEmails().add(request.getParameter("email"));
				client.setPassword(request.getParameter("senha"));
				break;
				
			case "update":
				client.setId(Integer.parseInt(request.getParameter("id")));
				client.setName(request.getParameter("nome"));
				client.setSurname(request.getParameter("sobrenome"));
				//CPF
				client.setCpf(request.getParameter("cpf"));
				//GENERO
				client.setGenero(request.getParameter("genero"));
				//data de nascimento
				try {client.setBirthday(df.parse(request.getParameter("dtnasc")));}
				catch (ParseException e) {System.out.println(e.getMessage());}
				//email
				client.setEmails(new ArrayList<>());
				client.getEmails().add(request.getParameter("email"));
				//telefone
				client.setPhone(new Phone());
				client.getPhone().setClient(client);
				client.getPhone().setType(request.getParameter("tipo"));
				client.getPhone().setDdd(request.getParameter("ddd"));
				client.getPhone().setNumber(request.getParameter("fone"));
				//cartão de credito
				client.setCards(new ArrayList<CreditCard>());
				card.setClient(client);
				card.setName(request.getParameter("cardName"));
				card.setNumber(request.getParameter("cardNumber"));
				card.setBanner(request.getParameter("banner"));
				card.setCode(request.getParameter("seg"));
			try {card.setDeadline(df.parse(request.getParameter("prazo")));} 
			catch (ParseException e) {System.out.println(e.getMessage());}
				client.getCards().add(card);
				/*client.setCard(new CreditCard());
				client.getCard().setClient(client);
				client.getCard().setName(request.getParameter("cardName"));
				client.getCard().setNumber(request.getParameter("cardNumber"));
				client.getCard().setBanner(request.getParameter("banner"));
				client.getCard().setCode(request.getParameter("seg"));*/
				break;
				
			case "search":
				if(!request.getParameter("id").equals(""))
				{client.setId(Integer.parseInt(request.getParameter("id")));}
				
				else client.setId(0);
				
				if(!request.getParameter("name").equals(""))
				{client.setName(request.getParameter("name"));}
				
				else client.setName("");
				
				if(!request.getParameter("surname").equals(""))
				{client.setSurname(request.getParameter("surname"));}
				
				else client.setSurname("");
				
				break;
				
			case "delete":
				client.setId(Integer.parseInt(request.getParameter("id")));
				break;
				
			case "updateKey":
				client.setEmails(new ArrayList<>());
				client.getEmails().add(request.getParameter("email"));
				client.setPassword(request.getParameter("senha"));
				client.setPassword2(request.getParameter("senha2"));
				IDAO dao = new ClientDAO();
				List<EntityDomain> entities = dao.search();
				if(entities != null && !entities.isEmpty())
				{	for(EntityDomain ed:entities)
					{	if(ed != null)
						{	Client cli = (Client)ed;
							if(cli.getEmails().get(0).equals(client.getEmails().get(0)))
							{	client.setId(cli.getId());
								break;
							}
						}
					}
				}
				break;
				
			case "active":
				client.setId(Integer.parseInt(request.getParameter("id")));
				if(request.getParameter("status").equalsIgnoreCase("ativado"))
				{client.setStatus("inativado");}
				
				else client.setStatus("ativado");
				
				break;
		}
		return client;
	}

	@Override public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException 
	{	RequestDispatcher rd = null;	//direciona os resultados para a página de gerenciamento de clientes
	
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)
				{	result.setMsg("Usuário cadastrado");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("login.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("cadastroUsuarios.jsp");
				}
				break;
			
			case "login":
				if(result.getMsg() == null)
				{	result.setMsg("Bem vindo");
					request.getSession().setAttribute("result", result);
					for(EntityDomain entity:result.getEntities())
					{	if(entity instanceof Client)
						{	if(entity.getId() == 1)
							{	result.getEntities().add(new RankingDAO().searchRank(new Ranking()));
								rd = request.getRequestDispatcher("inicialAdm.jsp");
								break;
							}
						
							else
							{	rd = request.getRequestDispatcher("meusCursos2.jsp");
								break;
							}
						}
					}
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("login.jsp");
				}
				break;
				
			case "update":
				if(result.getMsg() == null)
				{	result.setMsg("Dados alterados!");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("meusCursos2.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("alterarUsuario.jsp");
				}
				
				break;
				
			case "search":
				if(result.getMsg() == null)
				{result.setMsg("Resultado");}
				
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("gerenciarClientes.jsp");
				break;
				
			case "delete":
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("gerenciarClientes.jsp");
				break;
				
			case "updateKey":
				if(result.getMsg() == null)
				{	result.setMsg("Senha alterada");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("login.jsp");
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("alterar_senha.jsp");
				}
				
				break;
				
			case "active":
				Client client = null;
				for(EntityDomain ed:result.getEntities())
				{	if(ed instanceof Client)
					{	client = (Client)ed;
						break;
					}
				}
				
				if(result.getMsg() == null)
				{result.setMsg("Cliente " + client.getStatus());}
				
				request.getSession().setAttribute("result", result);
				rd = request.getRequestDispatcher("gerenciarClientes.jsp");
				break;
		}
		rd.forward(request, response);
	}
}
