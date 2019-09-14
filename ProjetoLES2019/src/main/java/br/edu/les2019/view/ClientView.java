package br.edu.les2019.view;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import br.edu.les2019.domain.Client;
import br.edu.les2019.domain.CreditCard;
import br.edu.les2019.domain.EntityDomain;
import br.edu.les2019.domain.Phone;
import br.edu.les2019.result.Result;

public class ClientView implements IViewHelper 
{	Client client;
	@Override public EntityDomain getEntity(HttpServletRequest request) 
	{	client = new Client();
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
				client.setCard(new CreditCard());
				client.getCard().setClient(client);
				client.getCard().setName(request.getParameter("cardName"));
				client.getCard().setNumber(request.getParameter("cardNumber"));
				client.getCard().setBanner(request.getParameter("banner"));
				client.getCard().setCode(request.getParameter("seg"));
				//senha
				client.setPassword(request.getParameter("pass"));
				client.setPassword2(request.getParameter("pass2"));
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
				client.setCard(new CreditCard());
				client.getCard().setClient(client);
				client.getCard().setName(request.getParameter("cardName"));
				client.getCard().setNumber(request.getParameter("cardNumber"));
				client.getCard().setBanner(request.getParameter("banner"));
				client.getCard().setCode(request.getParameter("seg"));
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
		}
		return client;
	}

	@Override public void setView(Result result, HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException 
	{	RequestDispatcher rd = null;	//direciona os resultados para a página 
										//de gerenciamento de clientes
	
		switch(request.getParameter("action"))
		{	case "save":
				if(result.getMsg() == null)
				{	result.setMsg("Usuário cadastrado");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("loginAluno.html");
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
							{	rd = request.getRequestDispatcher("inicialAdm.jsp");
								break;
							}
							else
							{	rd = request.getRequestDispatcher("inicialAluno.jsp");
								break;
							}
						}
					}
				}
				
				else
				{	request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("loginAluno.html");
				}
				break;
				
			case "update":
				if(result.getMsg() == null)
				{	result.setMsg("Dados alterados!");
					request.getSession().setAttribute("result", result);
					rd = request.getRequestDispatcher("inicialAluno.jsp");
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
				rd = request.getRequestDispatcher("principal.html");
				break;
		}
		rd.forward(request, response);
	}
}
